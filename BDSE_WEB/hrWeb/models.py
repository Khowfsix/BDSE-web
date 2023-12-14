from django.db import models

# Create your models here.


class NhanVien(models.Model):
    manhanvien = models.CharField(max_length=128, primary_key=True)
    ten = models.CharField(max_length=255)
    ngaysinh = models.DateField()
    email = models.CharField(max_length=255)
    phongban = models.IntegerField()
    luong = models.DecimalField(max_digits=10, decimal_places=2)
    masothue = models.CharField(max_length=13)

    class Meta:
        managed = False  # Django không cần quản lý việc tạo bảng này
        db_table = "NHANVIEN"  # Tên của bảng trong cơ sở dữ liệu Oracle


class PhongBan(models.Model):
    maphongban = models.IntegerField(primary_key=True)
    tenphongban = models.CharField(max_length=255)
    truongphong = models.CharField(max_length=128)

    class Meta:
        managed = False  # Django không cần quản lý việc tạo bảng này
        db_table = "PHONGBAN"  # Tên của bảng trong cơ sở dữ liệu Oracle
