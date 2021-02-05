select kid,pid,name,IF(lt.menu_id is not null,'true','false') checked
        from (select sm.kid,sm.name,sm.pid,sm.order_by from sys_menu sm
        left join (select pid from sys_menu group by pid) sub on sub.pid = sm.kid) tb
        left join (select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') lt on lt.menu_id = tb.kid
        ORDER BY order_by;


;

select kid,name,IF(subId IS NOT NULL OR isParent = 1,1,0) isParent,IF(subId IS NOT NULL OR isParent = 1,'true','false') open,IF(lt.menu_id is not null,'true','false') checked
        from (select sm.kid,sm.name,sm.subset isParent,sub.pid subId,sm.pid,sm.order_by from sys_menu sm
        left join (select pid from sys_menu group by pid) sub on sub.pid = sm.kid) tb
        left join (select menu_id from sys_user_menu where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt on lt.menu_id = tb.kid
where tb.pid = '88888888888888888888888888888888' ORDER BY order_by
;
-- 查询所拥有的菜单

select permission from sys_menu where pid = 'ffffffff8c468a55ffffffff8f59d635';
select permission from (
        select sur.user_id,sm.permission,sm.pid from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        inner join sys_menu sm on sm.kid = srm.menu_id
        union
        select sum.user_id,sm.permission,sm.pid from sys_user_menu sum
        left join sys_menu sm on sm.kid = sum.menu_id) tb where user_id = 'ffffffffab9fc98dffffffff8b642b39'
;
select * from (select sur.user_id,sm.permission,sm.pid from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        inner join sys_menu sm on sm.kid = srm.menu_id
        union
        select sum.user_id,sm.permission,sm.pid from sys_user_menu sum
        left join sys_menu sm on sm.kid = sum.menu_id) tb where tb.user_id = 'ffffffffab9fc98dffffffff8b642b39' and tb.pid = 'ffffffff8c468a55ffffffff8f59d635'
