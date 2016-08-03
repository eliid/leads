CREATE OR REPLACE procedure "PRO_GET_TASK_OVERTIME_INFO" is
  p_isExistsTask number; --�Ƿ������lm_timeout_task��
  p_count        number; --��������
  p_currentMonth varchar2(20); --��ǰ�·�
  p_start_time   date; --������ʼʱ��
  /*p_holiday       number;
  p_holiday_count number;*/
  p_error varchar2(1000);
begin
  p_currentMonth := to_char(sysdate, 'yyyy-mm');
  p_start_time   := sysdate;
  /*p_holiday       := 0;
  p_holiday_count := 0;*/
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
     where t.sysvar_code = 'timeout_task_holiday_count';*/
  for c in (select t.id,
                   t.allotdate,
                   t.client_name,
                   t.tel,
                   t.big_pid,
                   t.small_pid,
                   t.sid
              from lm_client t
             where (t.rank in ('A', 'B', 'D') or t.rank is null)
               and exists (select 1
                      from t_user_role a
                     where a.role_id = '2'
                       and a.user_id = t.sid)
               and t.allotdate is not null) loop
    --���������Ƿ���lm_timeout_task�д��� ����һ����
    select count(1)
      into p_isExistsTask
      from lm_timeout_task ltt
     where ltt.status = '0'
       and ltt.client_id = c.id
       and ltt.user_id = c.sid;
  
    --��������ڣ�����в������
    if p_isExistsTask = 0 then
    
      select count(*)
        into p_count
        from lm_clientrace lc
       where lc.t_id = c.id
         and lc.sid = c.sid;
    
      --�����һ�θ�������24Сʱ
      if p_count = 0 and
         ROUND(TO_NUMBER(sysdate - c.allotdate) * 24) >=
         24 + 24 * fun_get_holiday_count(c.allotdate, sysdate) then
        insert into lm_timeout_task
          (id,
           client_id,
           month,
           overtime_type,
           user_id,
           client_name,
           business_type,
           tel,
           allotdate)
          select s_timeout_task.nextval,
                 c.id,
                 to_char(sysdate, 'yyyy-mm'),
                 '1', --��ʱ����
                 c.sid,
                 c.client_name,
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.big_pid) || '-' ||
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.small_pid),
                 c.tel,
                 c.allotdate
            from dual;
        --������ֱ�
        insert into lm_task_score
          (id, client_id, user_id, month, overtime_type, score, score_type)
          select s_task_score.nextval,
                 c.id,
                 c.sid,
                 p_currentMonth,
                 '1',
                 -1,
                 '1'
            from dual;
      
        --���������û���
        merge into t_user_lock tul
        using (select c.sid, p_currentMonth currentMonth from dual) item
        on (tul.user_id = c.sid and tul.month = item.currentMonth)
        when matched then
          update set tul.lock_score = tul.lock_score - 1
        when not matched then
          insert
            (tul.id, tul.user_id, tul.month, tul.lock_score)
          values
            (s_user_lock.nextval, c.sid, p_currentMonth, -1);
      
        --����ڶ��θ�������72Сʱ
      elsif p_count = 1 and
            ROUND(TO_NUMBER(sysdate - c.allotdate) * 24) >=
            96 + 24 * fun_get_holiday_count(c.allotdate, sysdate) then
        insert into lm_timeout_task
          (id,
           client_id,
           month,
           overtime_type,
           user_id,
           client_name,
           business_type,
           tel,
           allotdate)
          select s_timeout_task.nextval,
                 c.id,
                 to_char(sysdate, 'yyyy-mm'),
                 '2', --��ʱ����
                 c.sid,
                 c.client_name,
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.big_pid) || '-' ||
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.small_pid),
                 c.tel,
                 c.allotdate
            from dual;
        --������ֱ�
        insert into lm_task_score
          (id, client_id, user_id, month, overtime_type, score, score_type)
          select s_task_score.nextval,
                 c.id,
                 c.sid,
                 p_currentMonth,
                 '2',
                 -1,
                 '1'
            from dual;
      
        --���������û���
        merge into t_user_lock tul
        using (select c.sid, p_currentMonth currentMonth from dual) item
        on (tul.user_id = c.sid and tul.month = item.currentMonth)
        when matched then
          update set tul.lock_score = tul.lock_score - 1
        when not matched then
          insert
            (tul.id, tul.user_id, tul.month, tul.lock_score)
          values
            (s_user_lock.nextval, c.sid, p_currentMonth, -1);
      
        --��������θ�������168Сʱ
      elsif p_count = 2 and
            ROUND(TO_NUMBER(sysdate - c.allotdate) * 24) >=
            192 + 24 * fun_get_holiday_count(c.allotdate, sysdate) then
        insert into lm_timeout_task
          (id,
           client_id,
           month,
           overtime_type,
           user_id,
           client_name,
           business_type,
           tel,
           allotdate)
          select s_timeout_task.nextval,
                 c.id,
                 to_char(sysdate, 'yyyy-mm'),
                 '3', --��ʱ����
                 c.sid,
                 c.client_name,
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.big_pid) || '-' ||
                 (select lc.title
                    from lm_category lc
                   where lc.id = c.small_pid),
                 c.tel,
                 c.allotdate
            from dual;
        --������ֱ�
        insert into lm_task_score
          (id, client_id, user_id, month, overtime_type, score, score_type)
          select s_task_score.nextval,
                 c.id,
                 c.sid,
                 p_currentMonth,
                 '3',
                 -1,
                 '1'
            from dual;
      
        --���������û���
        merge into t_user_lock tul
        using (select c.sid, p_currentMonth currentMonth from dual) item
        on (tul.user_id = c.sid and tul.month = item.currentMonth)
        when matched then
          update set tul.lock_score = tul.lock_score - 1
        when not matched then
          insert
            (tul.id, tul.user_id, tul.month, tul.lock_score)
          values
            (s_user_lock.nextval, c.sid, p_currentMonth, -1);
      end if;
    end if;
  end loop;
  /* --���ڼ��ռ�Ϊ 0
    update t_sysvar t
       set t.sysvar_value = '0'
     where t.sysvar_code = 'timeout_task_holiday_count'
       and t.sysvar_value <> '0';
  else
    update t_sysvar t
       set t.sysvar_value = t.sysvar_value + 1
     where t.sysvar_code = 'timeout_task_holiday_count'
       and not exists
     (select 1
              from t_batch_log bl
             where trunc(bl.bat_start_time) = trunc(sysdate)
               and bl.bat_name = 'pro_get_task_overtime_info');
  end if;*/

  commit;

  --�û���ǰ���ֵ���-20ʱ�������û�
  update t_user_lock tul
     set tul.lock_status = '1',
         tul.lock_time   = sysdate,
         tul.lock_times  = tul.lock_times + 1
   where tul.lock_score <= -50
     and tul.month = p_currentMonth
     and tul.unlock_time is null
     and tul.lock_status = '0';
  /* --�����������¼��
  if p_holiday = 0 then*/
  insert into t_batch_log
    select s_batch_log.nextval,
           'pro_get_task_overtime_info',
           '1',
           p_start_time,
           sysdate,
           '������ɹ�',
           sysdate
      from dual;
  /*  else
  
    insert into t_batch_log
      select s_batch_log.nextval,
             'pro_get_task_overtime_info',
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
    p_error := sqlerrm;
    rollback;
    insert into t_batch_log
      select s_batch_log.nextval,
             'pro_get_task_overtime_info',
             '0',
             p_start_time,
             sysdate,
             '������ʧ��' || dbms_utility.format_error_backtrace || p_error,
             sysdate
        from dual;
    commit;
end pro_get_task_overtime_info;

/
