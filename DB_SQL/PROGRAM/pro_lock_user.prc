CREATE OR REPLACE procedure pro_lock_user is
  p_start_time date := sysdate; -- ������ʼʱ��
  /*p_holiday       number := 0;
  p_holiday_count number := 0;*/
  p_error varchar2(1000);
begin
  /* --��ѯ�Ƿ�Ϊ�ڼ���
  select count(*)
    into p_holiday
    from t_holiday t
   where t.holiday = trunc(sysdate);
  
  if p_holiday = 0 then
    --��ѯ�ڼ��ռ���
    select to_number(t.sysvar_value)
      into p_holiday_count
      from t_sysvar t
     where t.sysvar_code = 'lock_user_holiday_count';*/

  --����ʱ���û���ǰ����С��0���ҽ���ʱ�䳬��48Сʱ�����û��ٴμ���
  update t_user_lock t
     set t.lock_status = '1',
         t.lock_time   = sysdate,
         t.unlock_time = null,
         t.unlock_user = null,
         t.lock_times  = t.lock_times + 1
   where t.month = to_char(sysdate, 'yyyy-mm')
     and t.lock_score < 0
     and round(to_number(sysdate - t.unlock_time) * 24) >=
         48 + 24 * fun_get_holiday_count(t.unlock_time, sysdate)
     and t.lock_status = '0';

  /* --���ڼ��ռ�Ϊ 0
    update t_sysvar t
       set t.sysvar_value = '0'
     where t.sysvar_code = 'lock_user_holiday_count'
       and t.sysvar_value <> '0';
  */
  --�����������¼��
  insert into t_batch_log
    select s_batch_log.nextval,
           'pro_lock_user',
           '1',
           p_start_time,
           sysdate,
           '������ɹ�',
           sysdate
      from dual;
  /*else
    update t_sysvar t
       set t.sysvar_value = t.sysvar_value + 1
     where t.sysvar_code = 'lock_user_holiday_count'
       and not exists
     (select 1
              from t_batch_log bl
             where trunc(bl.bat_start_time) = trunc(sysdate)
               and bl.bat_name = 'pro_lock_user');
  
    --�����������¼��
    insert into t_batch_log
      select s_batch_log.nextval,
             'pro_lock_user',
             '1',
             p_start_time,
             sysdate,
             '������ɹ�,����������ʱΪ�ڼ���',
             sysdate
        from dual;
  end if;*/

  commit;
exception
  when others then
    rollback;
    p_error := sqlerrm;
    --�����������¼��
    insert into t_batch_log
      select s_batch_log.nextval,
             'pro_lock_user',
             '0',
             p_start_time,
             sysdate,
             '������ʧ��' || dbms_utility.format_error_backtrace || p_error,
             sysdate
        from dual;
    commit;
end pro_lock_user;

/
