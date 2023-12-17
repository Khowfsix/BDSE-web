from django.shortcuts import render
import cx_Oracle

connection = None
employeeTableName = "NHANVIEN"
departmentTableName = "PHONGBAN"
schema_name = "EMPLOYEEADMIN"


# Create your views here.


def loginPage(request):
    return render(request, template_name="login.html")


def login(request):
    # Kết nối đến cơ sở dữ liệu Oracle
    global connection
    username = request.POST.get("username")
    password = request.POST.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")


def logout():
    global connection
    connection.close()


def listEmployee(request):
    # Truy vấn bảng từ schema khác
    query = f"SELECT * FROM {schema_name}.{employeeTableName}"

    # Thực thi truy vấn
    cursor = connection.cursor()
    cursor.execute(query)

    # Lấy kết quả
    columns = [col[0] for col in cursor.description]  # Lấy tên cột
    data = [dict(zip(columns, row)) for row in cursor.fetchall()]  # Dữ liệu từ truy vấn

    # Đóng cursor và kết nối sau khi hoàn thành
    cursor.close()

    # Truyền dữ liệu vào template và render
    return render(request, "../static/employees.html", {"data": data})


def addEmployee(request):
    return render(request, "../static/employees.html")


def updateEmployee(request):
    return render(request, "../static/employees.html")


def deleteEmployee(request):
    return render(request, "../static/employees.html")


def getDepartment(request):
    return render(request, "../static/department.html")
