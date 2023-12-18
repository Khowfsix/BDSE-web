create or replace function employeeadmin_nhanvien_select (
    p_schema in varchar2 default null,
    p_object in varchar2 default null
) return varchar2
    authid definer
as
    truongphong varchar2(100);
    phongban int;
begin
    begin
        execute immediate 'SELECT truongphong FROM employeeadmin.phongban WHERE UPPER(truongphong) = USER AND ROWNUM = 1'
        into truongphong;
        return '1=1';
    exception
        when no_data_found then
            begin
                execute immediate 'SELECT phongban FROM employeeadmin.nhanvien WHERE UPPER(manhanvien) = USER AND ROWNUM = 1'
                into phongban;
                if phongban = 2 then
                    return 'phongban != ' ||
                    to_char(phongban) || ' OR manhanvien = USER';
                else
                    return 'manhanvien = USER';
                end if;

            exception
                when others then
                    return '0 = 1';
            end;
        when others then
            return '0 = 1';
    end;
end;
/

begin
    dbms_rls.add_policy(
        object_schema => 'EMPLOYEEADMIN',
        object_name => 'NHANVIEN',
                        policy_name => 'NHANVIEN_SELECT',
                        function_schema => 'SEC_MGR',
                        policy_function => 'EMPLOYEEADMIN_NHANVIEN_SELECT',
                        statement_types => 'SELECT',
                        enable => true,
                        sec_relevant_cols => 'LUONG',
                        sec_relevant_cols_opt => dbms_rls.all_rows
    );
end;
/