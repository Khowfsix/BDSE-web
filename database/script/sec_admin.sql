execute sa_components.create_level(
    'ACCESS_NHANVIEN',
    2000,
                           'P',
                           'PUBLIC'
);

execute sa_components.create_level(
    'ACCESS_NHANVIEN',
    4000,
                           'C',
                           'CONFIDENTIAL'
);

execute sa_components.create_level(
    'ACCESS_NHANVIEN',
    6000,
                           'S',
                           'SENSITIVE'
);

execute sa_components.create_level(
    'ACCESS_NHANVIEN',
    8000,
                           'HS',
                           'HIGHLY_SENSITIVE'
);

execute sa_components.create_group(
    'ACCESS_NHANVIEN',
    10,
                           'HR',
                           'HUMAN_RESOURCE',
                           null
);

execute sa_components.create_group(
    'ACCESS_NHANVIEN',
    20,
                           'IT',
                           'INFORMATION_TECHNOLOGY',
                           null
);

execute sa_components.create_group(
    'ACCESS_NHANVIEN',
    30,
                           'AT',
                           'ACCOUNTANT',
                           null
);

execute sa_components.create_group(
    'ACCESS_NHANVIEN',
    40,
                           'CS',
                           'CUSTOMER_SERVICE',
                           null
);

execute sa_label_admin.create_label(
    'ACCESS_NHANVIEN',
    2010,
                            'C::HR'
);

execute sa_label_admin.create_label(
    'ACCESS_NHANVIEN',
    2020,
                            'C::IT'
);

execute sa_label_admin.create_label(
    'ACCESS_NHANVIEN',
    2030,
                            'C::AT'
);

execute sa_label_admin.create_label(
    'ACCESS_NHANVIEN',
    2040,
                            'C::CS'
);

begin
    sa_policy_admin.apply_table_policy(
        policy_name => 'ACCESS_NHANVIEN',
        schema_name => 'EMPLOYEEADMIN',
                                       table_name => 'NHANVIEN',
                                       table_options => 'HIDE,NO_CONTROL'
    );
end;
/

update employeeadmin.nhanvien
set
    ols_column_employee = char_to_label(
        'ACCESS_NHANVIEN', 'C::HR'
    )
where phongban = 2;

update employeeadmin.nhanvien
set
    ols_column_employee = char_to_label(
        'ACCESS_NHANVIEN', 'C::IT'
    )
where phongban = 0;

update employeeadmin.nhanvien
set
    ols_column_employee = char_to_label(
        'ACCESS_NHANVIEN', 'C::AT'
    )
where phongban = 1;

update employeeadmin.nhanvien
set
    ols_column_employee = char_to_label(
        'ACCESS_NHANVIEN', 'C::CS'
    )
where phongban = 3;

begin
    sa_policy_admin.remove_table_policy(
        policy_name => 'ACCESS_NHANVIEN',
        schema_name => 'EMPLOYEEADMIN',
                                        table_name => 'NHANVIEN'
    );

    sa_policy_admin.apply_table_policy(
        policy_name => 'ACCESS_NHANVIEN',
        schema_name => 'EMPLOYEEADMIN',
                                       table_name => 'NHANVIEN',
                                       table_options => 'HIDE,READ_CONTROL,WRITE_CONTROL,CHECK_CONTROL'
    );

end;
/

begin
    sa_user_admin.set_user_privs(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'SEC_ADMIN',
                                 privileges => 'FULL'
    );
end;
/

begin
    sa_user_admin.set_user_privs(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'SEC_MGR',
                                 privileges => 'FULL'
    );
end;
/

begin
    sa_user_admin.set_user_privs(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'BACKUP_MGR',
                                 privileges => 'FULL'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'NV338154900',
                                  max_read_label => 'C::IT,AT,CS,HR',
                                  max_write_label => 'C::IT,AT,CS',
                                  min_write_label => 'C',
                                  def_label => 'C::IT,AT,CS,HR'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => ' NV1733627523',
                                  max_read_label => 'C::IT,AT,CS,HR',
                                  max_write_label => 'C::IT,AT,CS,HR',
                                  min_write_label => 'C',
                                  def_label => 'C::IT,AT,CS,HR'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'NV1750980027',
                                  max_read_label => 'C::IT',
                                  max_write_label => 'C::',
                                  min_write_label => 'C',
                                  def_label => 'C::IT'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'NV492295580',
                                  max_read_label => 'C::AT,IT,CS,HR',
                                  max_write_label => 'C::',
                                  min_write_label => 'C',
                                  def_label => 'C::AT,IT,CS,HR'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'NV1714673075',
                                  max_read_label => 'C::AT,IT,CS,HR',
                                  max_write_label => 'C::',
                                  min_write_label => 'C',
                                  def_label => 'C::AT,IT,CS,HR'
    );
end;
/

begin
    sa_user_admin.set_user_labels(
        policy_name => 'ACCESS_NHANVIEN',
        user_name => 'NV1675824739',
                                  max_read_label => 'C::CS',
                                  max_write_label => 'C::',
                                  min_write_label => 'C',
                                  def_label => 'C::CS'
    );
end;
/

create or replace function sec_admin.gen_nhanvien_label (
    phongban int
) return lbacsys.lbac_label as
    i_label varchar2(80);
begin
    i_label := 'C::';
    case phongban
        when 0 then
            i_label := i_label || 'IT';
        when 1 then
            i_label := i_label || 'AT';
        when 2 then
            i_label := i_label || 'HR';
        when 3 then
            i_label := i_label || 'CS';
        else
            i_label := 'Invalid Day';
    end case;

    return to_lbac_data_label(
        'ACCESS_NHANVIEN',
        i_label
    );
end;
/

grant execute on sec_admin.gen_nhanvien_label to lbacsys;

begin
    sa_policy_admin.remove_table_policy(
        policy_name => 'ACCESS_NHANVIEN',
        schema_name => 'EMPLOYEEADMIN',
                                        table_name => 'NHANVIEN',
                                        drop_column => false
    );

    sa_policy_admin.apply_table_policy(
        policy_name => 'ACCESS_NHANVIEN',
        schema_name => 'EMPLOYEEADMIN',
                                       table_name => 'NHANVIEN',
                                       table_options => 'HIDE,READ_CONTROL,WRITE_CONTROL,CHECK_CONTROL',
                                       label_function => 'sec_admin.gen_nhanvien_label 
     (:new.phongban)',
                                       predicate => null
    );

end;
/