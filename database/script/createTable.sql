/************ T?o b?ng NhanVien**************/
create table nhanvien (
    manhanvien varchar(128) not null,
    ten varchar(255) not null,
    ngaysinh date not null,
    email varchar(255) not null,
    phongban int not null,
    luong decimal(10, 2) not null,
    masothue varchar(13) not null,
    primary key ( manhanvien )
);




/************ T?o b?ng PhongBan**************/

create table phongban (
    maphongban int not null,
    tenphongban varchar(255) not null,
    truongphong varchar(128),
    primary key ( maphongban )
);




/************ T?o khóa ngo?i**************/

alter table nhanvien
    add foreign key ( phongban )
        references phongban ( maphongban );

alter table phongban
    add foreign key ( truongphong )
        references nhanvien ( manhanvien );




/************ T?o role**************/

create role nhanvien;

create role truongphong;

grant select on nhanvien to nhanvien;

grant select on phongban to nhanvien;

grant select on nhanvien to truongphong;

grant select on phongban to truongphong;



/************ Thêm d? li?u**************/

insert into phongban (
    maphongban,
    tenphongban
) values (
    '0',
    'IT'
);

insert into phongban (
    maphongban,
    tenphongban
) values (
    '1',
    'K? toán'
);

insert into phongban (
    maphongban,
    tenphongban
) values (
    '2',
    'Nhân s?'
);

insert into phongban (
    maphongban,
    tenphongban
) values (
    '3',
    'Ch?m sóc khách hàng'
);

alter session set nls_date_format = 'YYYY-MM-DD';

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV338154900',
    'Tr?n Ph?m Hoàng Anh Vân',
    '1987-11-14',
    'nhanvienNV338154900@example.com',
    2,
    27500000,
    '5963326094'
);

create user nv338154900 identified by nv338154900;

grant
    create session
to nv338154900;

grant nhanvien to nv338154900;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV492295580',
    'Ph?m Nguy?n Ph?m Hoài Nguy?n',
    '1993-10-18',
    'nhanvienNV492295580@example.com',
    1,
    27750000,
    '6159981643'
);

create user nv492295580 identified by nv492295580;

grant
    create session
to nv492295580;

grant nhanvien to nv492295580;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1307956643',
    'T? T? Phan Mai H?ng Ng?c',
    '1987-10-17',
    'nhanvienNV1307956643@example.com',
    2,
    25750000,
    '7007487013'
);

create user nv1307956643 identified by nv1307956643;

grant
    create session
to nv1307956643;

grant nhanvien to nv1307956643;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1353831851',
    'Lý Lý Bích Châu',
    '1998-06-08',
    'nhanvienNV1353831851@example.com',
    2,
    6250000,
    '6686972339'
);

create user nv1353831851 identified by nv1353831851;

grant
    create session
to nv1353831851;

grant nhanvien to nv1353831851;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1714673075',
    'T? Tr?n Ng?c Anh H?nh',
    '1999-07-19',
    'nhanvienNV1714673075@example.com',
    1,
    28250000,
    '1579389260'
);

create user nv1714673075 identified by nv1714673075;

grant
    create session
to nv1714673075;

grant truongphong to nv1714673075;

update phongban
set
    truongphong = 'NV1714673075'
where maphongban = 1;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1750980027',
    'Tr?n Hoàng Mai Mai Châu',
    '1991-12-14',
    'nhanvienNV1750980027@example.com',
    0,
    15250000,
    '8070292713'
);

create user nv1750980027 identified by nv1750980027;

grant
    create session
to nv1750980027;

grant nhanvien to nv1750980027;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV407754180',
    'Phan Ph?m Tr?n H?ng Hoài Ng?c Vân',
    '1993-06-11',
    'nhanvienNV407754180@example.com',
    1,
    4250000,
    '9823128816'
);

create user nv407754180 identified by nv407754180;

grant
    create session
to nv407754180;

grant nhanvien to nv407754180;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1675824739',
    'Nguy?n Mai Bích Mai',
    '2002-05-07',
    'nhanvienNV1675824739@example.com',
    3,
    31750000,
    '1633450629'
);

create user nv1675824739 identified by nv1675824739;

grant
    create session
to nv1675824739;

grant nhanvien to nv1675824739;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1714490987',
    'Nguy?n Nguy?n Lý Mai H?nh',
    '1991-10-10',
    'nhanvienNV1714490987@example.com',
    0,
    43250000,
    '6171152801'
);

create user nv1714490987 identified by nv1714490987;

grant
    create session
to nv1714490987;

grant truongphong to nv1714490987;

update phongban
set
    truongphong = 'NV1714490987'
where maphongban = 0;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV880479859',
    'Lý T? H?ng Anh Mai Vân',
    '1983-04-26',
    'nhanvienNV880479859@example.com',
    1,
    11750000,
    '3425757894'
);

create user nv880479859 identified by nv880479859;

grant
    create session
to nv880479859;

grant nhanvien to nv880479859;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV425135740',
    'Nguy?n Ng?c H?ng Bích B?o',
    '1995-03-04',
    'nhanvienNV425135740@example.com',
    0,
    30250000,
    '7079545102'
);

create user nv425135740 identified by nv425135740;

grant
    create session
to nv425135740;

grant nhanvien to nv425135740;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1733627523',
    'Phan Phan Hoàng M?',
    '1987-02-22',
    'nhanvienNV1733627523@example.com',
    2,
    41250000,
    '6746379261'
);

create user nv1733627523 identified by nv1733627523;

grant
    create session
to nv1733627523;

grant truongphong to nv1733627523;

update phongban
set
    truongphong = 'NV1733627523'
where maphongban = 2;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1765346955',
    'Phan T? H?ng Ti?n B?o',
    '1985-01-19',
    'nhanvienNV1765346955@example.com',
    2,
    29500000,
    '7532615970'
);

create user nv1765346955 identified by nv1765346955;

grant
    create session
to nv1765346955;

grant nhanvien to nv1765346955;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV943656595',
    'Tr?n H?ng H?ng Hà',
    '1994-04-04',
    'nhanvienNV943656595@example.com',
    2,
    36000000,
    '7937680590'
);

create user nv943656595 identified by nv943656595;

grant
    create session
to nv943656595;

grant nhanvien to nv943656595;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1043664539',
    'Ph?m Tr?n H?ng H?ng D?ng',
    '1995-10-31',
    'nhanvienNV1043664539@example.com',
    3,
    33000000,
    '2531829212'
);

create user nv1043664539 identified by nv1043664539;

grant
    create session
to nv1043664539;

grant nhanvien to nv1043664539;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2099449507',
    'Nguy?n Phan T? Mai Ti?n Nguy?n',
    '1987-06-26',
    'nhanvienNV2099449507@example.com',
    0,
    17250000,
    '4033037298'
);

create user nv2099449507 identified by nv2099449507;

grant
    create session
to nv2099449507;

grant nhanvien to nv2099449507;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1599409835',
    'Phan Ph?m Tr?n Bích H?nh',
    '1991-10-10',
    'nhanvienNV1599409835@example.com',
    3,
    19250000,
    '9069697972'
);

create user nv1599409835 identified by nv1599409835;

grant
    create session
to nv1599409835;

grant nhanvien to nv1599409835;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1087311539',
    'Ph?m Hoàng Ti?n Nguy?n',
    '1997-01-08',
    'nhanvienNV1087311539@example.com',
    0,
    9000000,
    '2515042640'
);

create user nv1087311539 identified by nv1087311539;

grant
    create session
to nv1087311539;

grant nhanvien to nv1087311539;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV231018172',
    'Phan Bích Ng?c Hoài D?ng',
    '1991-10-10',
    'nhanvienNV231018172@example.com',
    3,
    29250000,
    '7497949732'
);

create user nv231018172 identified by nv231018172;

grant
    create session
to nv231018172;

grant truongphong to nv231018172;

update phongban
set
    truongphong = 'NV231018172'
where maphongban = 3;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1530334915',
    'T? Mai Mai Anh Th?',
    '1982-04-17',
    'nhanvienNV1530334915@example.com',
    2,
    16500000,
    '5708325249'
);

create user nv1530334915 identified by nv1530334915;

grant
    create session
to nv1530334915;

grant nhanvien to nv1530334915;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV760628931',
    'T? Phan Mai Ti?n Th?',
    '1985-01-05',
    'nhanvienNV760628931@example.com',
    0,
    9750000,
    '3624749042'
);

create user nv760628931 identified by nv760628931;

grant
    create session
to nv760628931;

grant nhanvien to nv760628931;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV351160012',
    'T? Bích H?ng Bích Mai',
    '1998-01-04',
    'nhanvienNV351160012@example.com',
    3,
    8250000,
    '3319607429'
);

create user nv351160012 identified by nv351160012;

grant
    create session
to nv351160012;

grant nhanvien to nv351160012;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV357844692',
    'Lý Tr?n Ng?c Ti?n Ngân',
    '1995-12-03',
    'nhanvienNV357844692@example.com',
    2,
    17250000,
    '3104499663'
);

create user nv357844692 identified by nv357844692;

grant
    create session
to nv357844692;

grant nhanvien to nv357844692;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1245464283',
    'Phan Tr?n Ti?n Hoài Bích Phát',
    '1999-06-29',
    'nhanvienNV1245464283@example.com',
    3,
    16500000,
    '4762457512'
);

create user nv1245464283 identified by nv1245464283;

grant
    create session
to nv1245464283;

grant nhanvien to nv1245464283;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1381648099',
    'Phan Ng?c Bích Vân',
    '2002-09-17',
    'nhanvienNV1381648099@example.com',
    0,
    10500000,
    '3502055951'
);

create user nv1381648099 identified by nv1381648099;

grant
    create session
to nv1381648099;

grant nhanvien to nv1381648099;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV181683948',
    'Lý Ph?m Bích Hoài M?',
    '1982-10-07',
    'nhanvienNV181683948@example.com',
    3,
    21750000,
    '7724509029'
);

create user nv181683948 identified by nv181683948;

grant
    create session
to nv181683948;

grant nhanvien to nv181683948;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1555842803',
    'Tr?n Hoài Ng?c',
    '1981-12-29',
    'nhanvienNV1555842803@example.com',
    1,
    20250000,
    '9257717202'
);

create user nv1555842803 identified by nv1555842803;

grant
    create session
to nv1555842803;

grant nhanvien to nv1555842803;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1142703867',
    'Ph?m Lý Nguy?n Mai Bích Nguy?n',
    '1991-10-10',
    'nhanvienNV1142703867@example.com',
    2,
    26500000,
    '5942938917'
);

create user nv1142703867 identified by nv1142703867;

grant
    create session
to nv1142703867;

grant nhanvien to nv1142703867;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1348617987',
    'T? Ph?m Bích Hoài Vân',
    '1999-11-21',
    'nhanvienNV1348617987@example.com',
    1,
    8500000,
    '1862807894'
);

create user nv1348617987 identified by nv1348617987;

grant
    create session
to nv1348617987;

grant nhanvien to nv1348617987;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1529497355',
    'Phan Phan Anh H?ng Ti?n Vân',
    '1994-09-13',
    'nhanvienNV1529497355@example.com',
    0,
    11250000,
    '9761437182'
);

create user nv1529497355 identified by nv1529497355;

grant
    create session
to nv1529497355;

grant nhanvien to nv1529497355;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1850361619',
    'Tr?n Nguy?n H?ng Ngân',
    '1994-09-11',
    'nhanvienNV1850361619@example.com',
    2,
    7250000,
    '7988467650'
);

create user nv1850361619 identified by nv1850361619;

grant
    create session
to nv1850361619;

grant nhanvien to nv1850361619;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV702564123',
    'Nguy?n T? Ng?c Hoàng Ngân',
    '1997-06-15',
    'nhanvienNV702564123@example.com',
    2,
    17250000,
    '3022199410'
);

create user nv702564123 identified by nv702564123;

grant
    create session
to nv702564123;

grant nhanvien to nv702564123;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1875003171',
    'Ph?m Anh Ng?c Vân',
    '1986-12-25',
    'nhanvienNV1875003171@example.com',
    3,
    30750000,
    '289763643'
);

create user nv1875003171 identified by nv1875003171;

grant
    create session
to nv1875003171;

grant nhanvien to nv1875003171;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1311917867',
    'Phan Tr?n Phan Anh Anh Phát',
    '1985-04-14',
    'nhanvienNV1311917867@example.com',
    1,
    17000000,
    '4842566305'
);

create user nv1311917867 identified by nv1311917867;

grant
    create session
to nv1311917867;

grant nhanvien to nv1311917867;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2057535387',
    'Nguy?n Anh Phát',
    '1999-09-29',
    'nhanvienNV2057535387@example.com',
    0,
    36250000,
    '8566271023'
);

create user nv2057535387 identified by nv2057535387;

grant
    create session
to nv2057535387;

grant nhanvien to nv2057535387;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1574535075',
    'Nguy?n H?ng Hoàng Hoàng Phú',
    '1985-04-29',
    'nhanvienNV1574535075@example.com',
    3,
    18750000,
    '8117780951'
);

create user nv1574535075 identified by nv1574535075;

grant
    create session
to nv1574535075;

grant nhanvien to nv1574535075;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1593540523',
    'T? Ti?n M?',
    '1986-11-19',
    'nhanvienNV1593540523@example.com',
    2,
    14000000,
    '4778336682'
);

create user nv1593540523 identified by nv1593540523;

grant
    create session
to nv1593540523;

grant nhanvien to nv1593540523;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1210548147',
    'Ph?m Lý Nguy?n Anh Hoài Hà',
    '1989-12-21',
    'nhanvienNV1210548147@example.com',
    0,
    16000000,
    '871544330'
);

create user nv1210548147 identified by nv1210548147;

grant
    create session
to nv1210548147;

grant nhanvien to nv1210548147;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1524858811',
    'Lý Ph?m Hoàng Bích Bích M?',
    '1991-04-11',
    'nhanvienNV1524858811@example.com',
    0,
    16500000,
    '5536722723'
);

create user nv1524858811 identified by nv1524858811;

grant
    create session
to nv1524858811;

grant nhanvien to nv1524858811;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV550862787',
    'Phan Phan Ti?n Châu',
    '1994-03-25',
    'nhanvienNV550862787@example.com',
    0,
    23500000,
    '3338465896'
);

create user nv550862787 identified by nv550862787;

grant
    create session
to nv550862787;

grant nhanvien to nv550862787;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2034728907',
    'Lý H?ng D?ng',
    '1995-12-29',
    'nhanvienNV2034728907@example.com',
    1,
    35000000,
    '1567879831'
);

create user nv2034728907 identified by nv2034728907;

grant
    create session
to nv2034728907;

grant nhanvien to nv2034728907;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV662798291',
    'Tr?n Ph?m H?ng Bích B?o',
    '1987-04-19',
    'nhanvienNV662798291@example.com',
    0,
    34750000,
    '9452777947'
);

create user nv662798291 identified by nv662798291;

grant
    create session
to nv662798291;

grant nhanvien to nv662798291;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1647149019',
    'T? Hoài B?o',
    '1998-08-27',
    'nhanvienNV1647149019@example.com',
    0,
    5500000,
    '7844992238'
);

create user nv1647149019 identified by nv1647149019;

grant
    create session
to nv1647149019;

grant nhanvien to nv1647149019;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1689878499',
    'Ph?m Lý Tr?n Ti?n Ti?n Anh Th?',
    '1991-10-10',
    'nhanvienNV1689878499@example.com',
    0,
    22250000,
    '1291211218'
);

create user nv1689878499 identified by nv1689878499;

grant
    create session
to nv1689878499;

grant nhanvien to nv1689878499;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV587956203',
    'Ph?m Phan Ng?c Mai',
    '1983-05-10',
    'nhanvienNV587956203@example.com',
    1,
    32750000,
    '3481190494'
);

create user nv587956203 identified by nv587956203;

grant
    create session
to nv587956203;

grant nhanvien to nv587956203;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV320700404',
    'Lý H?ng Ngân',
    '1991-10-10',
    'nhanvienNV320700404@example.com',
    1,
    4500000,
    '4676370634'
);

create user nv320700404 identified by nv320700404;

grant
    create session
to nv320700404;

grant nhanvien to nv320700404;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1112637435',
    'T? Anh Anh Ti?n D?ng',
    '1995-08-02',
    'nhanvienNV1112637435@example.com',
    2,
    24500000,
    '6371658604'
);

create user nv1112637435 identified by nv1112637435;

grant
    create session
to nv1112637435;

grant nhanvien to nv1112637435;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1294958595',
    'Tr?n Bích M?',
    '1990-07-05',
    'nhanvienNV1294958595@example.com',
    1,
    3750000,
    '2715739371'
);

create user nv1294958595 identified by nv1294958595;

grant
    create session
to nv1294958595;

grant nhanvien to nv1294958595;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV448313140',
    'T? Mai H?ng Phát',
    '1990-08-16',
    'nhanvienNV448313140@example.com',
    3,
    3750000,
    '6931942769'
);

create user nv448313140 identified by nv448313140;

grant
    create session
to nv448313140;

grant nhanvien to nv448313140;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1305524027',
    'Ph?m Nguy?n Anh Mai',
    '1991-10-10',
    'nhanvienNV1305524027@example.com',
    2,
    26000000,
    '2313320265'
);

create user nv1305524027 identified by nv1305524027;

grant
    create session
to nv1305524027;

grant nhanvien to nv1305524027;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1328592707',
    'T? Bích Hoàng Mai',
    '1994-02-02',
    'nhanvienNV1328592707@example.com',
    3,
    6000000,
    '7471318389'
);

create user nv1328592707 identified by nv1328592707;

grant
    create session
to nv1328592707;

grant nhanvien to nv1328592707;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV551728971',
    'Tr?n Phan Phan Ti?n Hà',
    '1991-10-10',
    'nhanvienNV551728971@example.com',
    2,
    20500000,
    '1234281380'
);

create user nv551728971 identified by nv551728971;

grant
    create session
to nv551728971;

grant nhanvien to nv551728971;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1871624019',
    'Phan Hoàng H?nh',
    '2001-03-27',
    'nhanvienNV1871624019@example.com',
    0,
    31750000,
    '6011745237'
);

create user nv1871624019 identified by nv1871624019;

grant
    create session
to nv1871624019;

grant nhanvien to nv1871624019;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV800896859',
    'Phan Nguy?n Nguy?n Hoài Ngân',
    '1991-10-10',
    'nhanvienNV800896859@example.com',
    0,
    10750000,
    '8444250751'
);

create user nv800896859 identified by nv800896859;

grant
    create session
to nv800896859;

grant nhanvien to nv800896859;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV300988260',
    'Phan Lý T? Hoài Ti?n Hoài Ng?c',
    '1993-03-27',
    'nhanvienNV300988260@example.com',
    1,
    14750000,
    '6744482558'
);

create user nv300988260 identified by nv300988260;

grant
    create session
to nv300988260;

grant nhanvien to nv300988260;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV65451884',
    'Nguy?n Hoàng Anh Ti?n D?ng',
    '1994-05-13',
    'nhanvienNV65451884@example.com',
    0,
    9000000,
    '6628208833'
);

create user nv65451884 identified by nv65451884;

grant
    create session
to nv65451884;

grant nhanvien to nv65451884;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2093528947',
    'Tr?n Ph?m Hoài H?ng Bích Nguy?n',
    '1999-12-03',
    'nhanvienNV2093528947@example.com',
    2,
    10750000,
    '268655479'
);

create user nv2093528947 identified by nv2093528947;

grant
    create session
to nv2093528947;

grant nhanvien to nv2093528947;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1521268603',
    'Lý Ng?c Phú',
    '2002-07-03',
    'nhanvienNV1521268603@example.com',
    0,
    19000000,
    '9938418103'
);

create user nv1521268603 identified by nv1521268603;

grant
    create session
to nv1521268603;

grant nhanvien to nv1521268603;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV15120260',
    'Nguy?n Lý Hoàng Th?',
    '1982-04-26',
    'nhanvienNV15120260@example.com',
    2,
    6750000,
    '6339019208'
);

create user nv15120260 identified by nv15120260;

grant
    create session
to nv15120260;

grant nhanvien to nv15120260;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV588035979',
    'Phan T? Ng?c Ng?c Mai Phú',
    '1999-10-02',
    'nhanvienNV588035979@example.com',
    3,
    32500000,
    '1161574016'
);

create user nv588035979 identified by nv588035979;

grant
    create session
to nv588035979;

grant nhanvien to nv588035979;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1417197459',
    'Lý Ng?c Hoàng Mai Ng?c',
    '1991-12-05',
    'nhanvienNV1417197459@example.com',
    0,
    7000000,
    '9011469222'
);

create user nv1417197459 identified by nv1417197459;

grant
    create session
to nv1417197459;

grant nhanvien to nv1417197459;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2116728731',
    'Lý Anh Ng?c Mai Ngân',
    '1994-04-05',
    'nhanvienNV2116728731@example.com',
    3,
    32000000,
    '5561551408'
);

create user nv2116728731 identified by nv2116728731;

grant
    create session
to nv2116728731;

grant nhanvien to nv2116728731;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV245675940',
    'T? Hoàng D?ng',
    '1997-06-13',
    'nhanvienNV245675940@example.com',
    2,
    17750000,
    '5637765818'
);

create user nv245675940 identified by nv245675940;

grant
    create session
to nv245675940;

grant nhanvien to nv245675940;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV712161195',
    'Nguy?n Tr?n Ph?m H?ng Phát',
    '1991-10-10',
    'nhanvienNV712161195@example.com',
    1,
    17250000,
    '2072878594'
);

create user nv712161195 identified by nv712161195;

grant
    create session
to nv712161195;

grant nhanvien to nv712161195;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV822342427',
    'Phan Ph?m Ti?n Mai',
    '1990-07-26',
    'nhanvienNV822342427@example.com',
    0,
    35500000,
    '813412206'
);

create user nv822342427 identified by nv822342427;

grant
    create session
to nv822342427;

grant nhanvien to nv822342427;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1138225955',
    'T? T? T? Mai Mai',
    '1991-10-10',
    'nhanvienNV1138225955@example.com',
    3,
    36000000,
    '3504028460'
);

create user nv1138225955 identified by nv1138225955;

grant
    create session
to nv1138225955;

grant nhanvien to nv1138225955;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV409727788',
    'Ph?m Mai H?ng Ngân',
    '1991-10-10',
    'nhanvienNV409727788@example.com',
    1,
    35500000,
    '8420164472'
);

create user nv409727788 identified by nv409727788;

grant
    create session
to nv409727788;

grant nhanvien to nv409727788;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1944318771',
    'Nguy?n Nguy?n Ti?n H?ng Bích Th?',
    '1985-12-13',
    'nhanvienNV1944318771@example.com',
    3,
    12750000,
    '8774493690'
);

create user nv1944318771 identified by nv1944318771;

grant
    create session
to nv1944318771;

grant nhanvien to nv1944318771;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2140140347',
    'Phan Ti?n Hoàng D?ng',
    '1986-10-25',
    'nhanvienNV2140140347@example.com',
    2,
    27250000,
    '6890530262'
);

create user nv2140140347 identified by nv2140140347;

grant
    create session
to nv2140140347;

grant nhanvien to nv2140140347;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2008019779',
    'Lý Tr?n Anh Bích Anh Ng?c',
    '1986-10-30',
    'nhanvienNV2008019779@example.com',
    0,
    4250000,
    '4120895968'
);

create user nv2008019779 identified by nv2008019779;

grant
    create session
to nv2008019779;

grant nhanvien to nv2008019779;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1470755659',
    'Phan Phan Mai Mai Ng?c',
    '1991-10-10',
    'nhanvienNV1470755659@example.com',
    3,
    4000000,
    '168162734'
);

create user nv1470755659 identified by nv1470755659;

grant
    create session
to nv1470755659;

grant nhanvien to nv1470755659;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1609298771',
    'T? Nguy?n Nguy?n Anh Ti?n H?ng D?ng',
    '1986-03-09',
    'nhanvienNV1609298771@example.com',
    2,
    37250000,
    '5026227853'
);

create user nv1609298771 identified by nv1609298771;

grant
    create session
to nv1609298771;

grant nhanvien to nv1609298771;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1672999771',
    'Phan H?ng Ti?n H?ng Vân',
    '1999-06-08',
    'nhanvienNV1672999771@example.com',
    0,
    16500000,
    '5265833290'
);

create user nv1672999771 identified by nv1672999771;

grant
    create session
to nv1672999771;

grant nhanvien to nv1672999771;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1976169315',
    'Lý T? Bích Ti?n H?ng M?',
    '1997-04-06',
    'nhanvienNV1976169315@example.com',
    3,
    19250000,
    '2737678830'
);

create user nv1976169315 identified by nv1976169315;

grant
    create session
to nv1976169315;

grant nhanvien to nv1976169315;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1053029227',
    'Nguy?n Tr?n Ng?c Mai',
    '1987-03-24',
    'nhanvienNV1053029227@example.com',
    1,
    17000000,
    '8322461391'
);

create user nv1053029227 identified by nv1053029227;

grant
    create session
to nv1053029227;

grant nhanvien to nv1053029227;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV464122740',
    'Lý Tr?n Bích Nguy?n',
    '1991-10-10',
    'nhanvienNV464122740@example.com',
    3,
    16750000,
    '5397255029'
);

create user nv464122740 identified by nv464122740;

grant
    create session
to nv464122740;

grant nhanvien to nv464122740;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV517993339',
    'Phan Lý Tr?n Bích Mai',
    '1986-04-30',
    'nhanvienNV517993339@example.com',
    1,
    24250000,
    '4748623042'
);

create user nv517993339 identified by nv517993339;

grant
    create session
to nv517993339;

grant nhanvien to nv517993339;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1172566915',
    'Ph?m Lý Hoài H?ng Bích D?ng',
    '1991-10-10',
    'nhanvienNV1172566915@example.com',
    0,
    30750000,
    '3696122485'
);

create user nv1172566915 identified by nv1172566915;

grant
    create session
to nv1172566915;

grant nhanvien to nv1172566915;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV567093531',
    'T? Hoàng Phát',
    '1991-10-10',
    'nhanvienNV567093531@example.com',
    3,
    11500000,
    '3468617888'
);

create user nv567093531 identified by nv567093531;

grant
    create session
to nv567093531;

grant nhanvien to nv567093531;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1917135139',
    'Lý T? H?ng Anh Phú',
    '1985-07-11',
    'nhanvienNV1917135139@example.com',
    3,
    30250000,
    '2849135582'
);

create user nv1917135139 identified by nv1917135139;

grant
    create session
to nv1917135139;

grant nhanvien to nv1917135139;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV650717483',
    'Lý Tr?n Phan Hoài Ng?c',
    '1990-11-03',
    'nhanvienNV650717483@example.com',
    1,
    30000000,
    '4689781231'
);

create user nv650717483 identified by nv650717483;

grant
    create session
to nv650717483;

grant nhanvien to nv650717483;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV29174068',
    'Tr?n Lý Hoàng Anh Ngân',
    '1982-09-29',
    'nhanvienNV29174068@example.com',
    2,
    19750000,
    '3280969527'
);

create user nv29174068 identified by nv29174068;

grant
    create session
to nv29174068;

grant nhanvien to nv29174068;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV331032892',
    'Phan Tr?n Nguy?n Hoài Phát',
    '1991-10-10',
    'nhanvienNV331032892@example.com',
    2,
    19250000,
    '6712949182'
);

create user nv331032892 identified by nv331032892;

grant
    create session
to nv331032892;

grant nhanvien to nv331032892;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV449653060',
    'Nguy?n Lý Bích Nguy?n',
    '1986-10-09',
    'nhanvienNV449653060@example.com',
    1,
    13250000,
    '7548039726'
);

create user nv449653060 identified by nv449653060;

grant
    create session
to nv449653060;

grant nhanvien to nv449653060;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1836394827',
    'Lý Nguy?n Anh Phú',
    '1989-12-10',
    'nhanvienNV1836394827@example.com',
    0,
    34500000,
    '688267696'
);

create user nv1836394827 identified by nv1836394827;

grant
    create session
to nv1836394827;

grant nhanvien to nv1836394827;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV679422291',
    'Tr?n Nguy?n Lý Hoài Hoài Hoài H?nh',
    '1982-09-30',
    'nhanvienNV679422291@example.com',
    2,
    17750000,
    '1022409364'
);

create user nv679422291 identified by nv679422291;

grant
    create session
to nv679422291;

grant nhanvien to nv679422291;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV726346075',
    'Phan Ph?m Ph?m Hoàng Phú',
    '1993-05-09',
    'nhanvienNV726346075@example.com',
    1,
    34500000,
    '6004789205'
);

create user nv726346075 identified by nv726346075;

grant
    create session
to nv726346075;

grant nhanvien to nv726346075;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1910188387',
    'Phan Ph?m Ng?c Vân',
    '1989-06-21',
    'nhanvienNV1910188387@example.com',
    3,
    16500000,
    '760336106'
);

create user nv1910188387 identified by nv1910188387;

grant
    create session
to nv1910188387;

grant nhanvien to nv1910188387;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1169893739',
    'Nguy?n T? Ng?c Vân',
    '1991-10-10',
    'nhanvienNV1169893739@example.com',
    3,
    18000000,
    '4520325907'
);

create user nv1169893739 identified by nv1169893739;

grant
    create session
to nv1169893739;

grant nhanvien to nv1169893739;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV584001907',
    'Phan Nguy?n H?ng Hoàng Anh B?o',
    '1991-10-10',
    'nhanvienNV584001907@example.com',
    1,
    8500000,
    '6951297324'
);

create user nv584001907 identified by nv584001907;

grant
    create session
to nv584001907;

grant nhanvien to nv584001907;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2047158651',
    'T? Ti?n Mai Ng?c Phát',
    '1991-10-10',
    'nhanvienNV2047158651@example.com',
    2,
    23750000,
    '6032405831'
);

create user nv2047158651 identified by nv2047158651;

grant
    create session
to nv2047158651;

grant nhanvien to nv2047158651;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1164913027',
    'Nguy?n Hoàng H?ng M?',
    '1986-10-15',
    'nhanvienNV1164913027@example.com',
    0,
    14000000,
    '1984372423'
);

create user nv1164913027 identified by nv1164913027;

grant
    create session
to nv1164913027;

grant nhanvien to nv1164913027;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV329671036',
    'Phan Lý Tr?n Mai Hoài H?nh',
    '1991-09-14',
    'nhanvienNV329671036@example.com',
    1,
    13250000,
    '8340935607'
);

create user nv329671036 identified by nv329671036;

grant
    create session
to nv329671036;

grant nhanvien to nv329671036;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV2094948739',
    'Tr?n Phan Tr?n Hoàng Nguy?n',
    '1995-02-07',
    'nhanvienNV2094948739@example.com',
    2,
    5000000,
    '495341872'
);

create user nv2094948739 identified by nv2094948739;

grant
    create session
to nv2094948739;

grant nhanvien to nv2094948739;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV954229131',
    'Tr?n Ng?c Ng?c Mai Châu',
    '1989-08-21',
    'nhanvienNV954229131@example.com',
    2,
    31750000,
    '7495744711'
);

create user nv954229131 identified by nv954229131;

grant
    create session
to nv954229131;

grant nhanvien to nv954229131;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV1642881427',
    'Lý Nguy?n Mai Mai',
    '1991-10-10',
    'nhanvienNV1642881427@example.com',
    3,
    33250000,
    '1308448720'
);

create user nv1642881427 identified by nv1642881427;

grant
    create session
to nv1642881427;

grant nhanvien to nv1642881427;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV187326876',
    'Nguy?n Ng?c B?o',
    '1986-03-24',
    'nhanvienNV187326876@example.com',
    3,
    10250000,
    '2596955639'
);

create user nv187326876 identified by nv187326876;

grant
    create session
to nv187326876;

grant nhanvien to nv187326876;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV902717859',
    'Ph?m Lý Hoàng Ng?c Ng?c',
    '1985-09-04',
    'nhanvienNV902717859@example.com',
    0,
    13000000,
    '9136731278'
);

create user nv902717859 identified by nv902717859;

grant
    create session
to nv902717859;

grant nhanvien to nv902717859;

insert into nhanvien (
    manhanvien,
    ten,
    ngaysinh,
    email,
    phongban,
    luong,
    masothue
) values (
    'NV507273644',
    'Lý Bích Hà',
    '1991-10-10',
    'nhanvienNV507273644@example.com',
    2,
    30500000,
    '4717724469'
);

create user nv507273644 identified by nv507273644;

grant
    create session
to nv507273644;

grant nhanvien to nv507273644;

select * from nhanvien;
select * from phongban;