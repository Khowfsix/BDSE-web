from django.shortcuts import render
from django.http import HttpResponseRedirect
import cx_Oracle

connection = None
employeeTableName = "NHANVIEN"
departmentTableName = "PHONGBAN"
schema_name = "EMPLOYEEADMIN"


# Create your views here.
def login(request):
    # Kết nối đến cơ sở dữ liệu Oracle
    global connection
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")
        if connection is not None:
            # Redirect to a success page or wherever you want
            request.session["username"] = username
            request.session["password"] = password
            return HttpResponseRedirect("/employees")
        else:
            # Return an 'invalid login' error message.
            return render(request, "login.html")
    else:
        return render(request, "login.html")


def logout(request):
    del request.session["username"]
    del request.session["password"]
    return render(request, template_name="login.html")


def listEmployee(request):
    # Truy vấn bảng từ schema khác
    query = "select n.manhanvien,n.ten,n.ngaysinh,n.email,p.tenphongban,n.luong,n.masothue from employeeadmin.nhanvien n join employeeadmin.phongban p on ( n.phongban = p.maphongban )"
    username = request.session.get("username")
    password = request.session.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

    # Thực thi truy vấn
    cursor = connection.cursor()
    cursor.execute(query)

    # Lấy kết quả
    columns = [col[0] for col in cursor.description]  # Lấy tên cột
    data = [dict(zip(columns, row)) for row in cursor.fetchall()]  # Dữ liệu từ truy vấn

    # Đóng cursor và kết nối sau khi hoàn thành
    cursor.close()

    # Truyền dữ liệu vào template và render
    return render(request, "employees.html", {"data": data, "message": "bruh"})


def updateEmployee(request):
    if request.method == "POST":
        username = request.session.get("username")
        password = request.session.get("password")
        connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

        # Thực thi truy vấn
        id = request.POST.get("id")
        query = f"SELECT * FROM {schema_name}.{employeeTableName}"
        cursor = connection.cursor()
        cursor.execute(query)
        cursor.close()

    return HttpResponseRedirect("/employees")


def deleteEmployee(request):
    # Truy vấn bảng từ schema khác
    if request.method == "POST":
        username = request.session.get("username")
        password = request.session.get("password")
        connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

        # Thực thi truy vấn
        id = request.POST.get("id")
        query = f"SELECT * FROM {schema_name}.{employeeTableName}"
        cursor = connection.cursor()
        cursor.execute(query)
        cursor.close()

    return HttpResponseRedirect("/employees")


def getDepartment(request):
    # Truy vấn bảng từ schema khác
    query = f"SELECT * FROM {schema_name}.{departmentTableName}"
    username = request.session.get("username")
    password = request.session.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

    # Thực thi truy vấn
    cursor = connection.cursor()
    cursor.execute(query)

    # Lấy kết quả
    columns = [col[0] for col in cursor.description]  # Lấy tên cột
    data = [dict(zip(columns, row)) for row in cursor.fetchall()]  # Dữ liệu từ truy vấn

    # Đóng cursor và kết nối sau khi hoàn thành
    cursor.close()

    # Truyền dữ liệu vào template và render
    return render(request, "department.html", {"data": data})
