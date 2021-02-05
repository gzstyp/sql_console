
select kid,pid,name,IF(lt.menu_id is not null,'true','false') checked
        from (select sm.kid,sm.name,sm.subset isParent,sub.pid subId,sm.pid,sm.order_by from sys_menu sm
        left join (select pid from sys_menu group by pid) sub on sub.pid = sm.kid) tb
        left join (select menu_id from sys_user_menu where user_id ='') lt on lt.menu_id = tb.kid
        ORDER BY order_by;

select sm.kid,sm.name,sm.subset,sm.pid,sm.order_by from sys_menu sm;

select menu_id from sys_role_menu where role_id = 'fffffffffc2be16affffffff884319fc';
-- kid,pid,name,IF(lt.menu_id is not null,'true','false') checked

select sm.kid,sm.pid,sm.name,IF(lt.menu_id is not null,'true','false') checked from sys_menu sm
left join (select menu_id from sys_role_menu where role_id = 'fffffffffc2be16affffffff884319fc') lt on lt.menu_id = sm.kid
order by sm.order_by ASC;


select su.kid,su.user_name,DATE_FORMAT(su.add_date,'%Y-%m-%d %H:%i') add_date,su.enabled,DATE_FORMAT(su.logintime,'%Y-%m-%d %H:%i') logintime
        from sys_user su
;
select sur.user_id,sur.role_id,srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id;
