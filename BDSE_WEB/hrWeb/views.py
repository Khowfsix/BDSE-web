from django.shortcuts import render, redirect
from django.contrib import messages
from django.http import HttpResponseRedirect
import cx_Oracle

employeeTableName = "NHANVIEN"
departmentTableName = "PHONGBAN"
schema_name = "EMPLOYEEADMIN"


# Create your views here.
def login(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")

        request.session["username"] = username
        request.session["password"] = password
        return redirect("/employees")
    else:
        return render(request, "login.html")


def logout(request):
    del request.session["username"]
    del request.session["password"]
    return render(request, template_name="login.html")


def listEmployee(request):
    # Truy vấn bảng từ schema khác
    query = "select n.manhanvien, n.ten, n.ngaysinh, n.email, p.tenphongban, n.luong, n.masothue from EMPLOYEEADMIN.nhanvien n join EMPLOYEEADMIN.phongban p on (n.phongban = p.maphongban) order by p.maphongban"
    username = request.session.get("username")
    password = request.session.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

    # Thực thi truy vấn
    cursor = connection.cursor()
    cursor.execute(query)

    # Lấy kết quả
    data = cursor.fetchall()

    # Đóng cursor và kết nối sau khi hoàn thành
    cursor.close()
    connection.close()

    return render(request, "employees.html", {"data": data})


def updateEmployee(request, id):
    username = request.session.get("username")
    password = request.session.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

    if request.method == "POST":
        name = request.POST["name"]
        email = request.POST["email"]
        birthdate = request.POST["birthdate"]

        try:
            query = f"UPDATE {schema_name}.{employeeTableName} SET ten='{name}', email='{email}', ngaysinh='{birthdate}' WHERE manhanvien='{id}'"
            cursor = connection.cursor()
            cursor.execute(query)
            connection.commit()  # Commit update vào cơ sở dữ liệu

            if cursor.rowcount > 0:
                messages.success(
                    request,
                    f"Cập nhật thành công: {cursor.rowcount} hàng được cập nhật",
                )
            else:
                messages.warning(request, "Không có hàng nào được cập nhật")
        except cx_Oracle.Error as error:
            connection.rollback()  # Rollback nếu có lỗi
            messages.error(request, f"Lỗi khi cập nhật: {error}")
        finally:
            if "connection" in locals():
                connection.close()
        return redirect("/employees")
    else:
        try:
            query = f"select * from {schema_name}.{employeeTableName} where manhanvien='{id}'"
            cursor = connection.cursor()
            cursor.execute(query)

            data = cursor.fetchall()
            print(data)

        except cx_Oracle.Error as error:
            messages.error(request, f"Lỗi khi truy vấn: {error}")
        finally:
            if "connection" in locals():
                connection.close()
        return render(request, "updateEmployee.html", {"id": id, "data": data[0]})


def deleteEmployee(request, id):
    username = request.session.get("username")
    password = request.session.get("password")
    connection = cx_Oracle.connect(f"{username}/{password}@localhost:1521/orclpdb")

    # Thực thi truy vấn
    try:
        cursor = connection.cursor()
        query = f"DELETE {schema_name}.{employeeTableName} WHERE manhanvien='{id}'"
        print(query)

        cursor.execute(query)
        connection.commit()  # Commit delete vào cơ sở dữ liệu

        if cursor.rowcount > 0:
            messages.success(
                request, f"Xóa thành công: {cursor.rowcount} hàng đã bị xóa"
            )
            print("delete ok")
        else:
            messages.warning(request, "Không có hàng nào được xóa")
    except cx_Oracle.Error as error:
        connection.rollback()  # Rollback nếu có lỗi
        messages.error(request, f"Lỗi khi xóa: {error}")
    finally:
        if "connection" in locals():
            connection.close()

    return redirect("/employees")


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
