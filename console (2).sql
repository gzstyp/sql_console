select permission from sys_menu where pid = 'ffffffffe56e8ef0ffffffff912af74a';

select tb.permission from (
				select sur.user_id,sm.permission,sm.pid from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        inner join sys_menu sm on sm.kid = srm.menu_id
        union
        select sum.user_id,sm.permission,sm.pid from sys_user_menu sum
        left join sys_menu sm on sm.kid = sum.menu_id) tb where tb.user_id = 'ffffffffab9fc98dffffffff8b642b39' and tb.pid = 'ffffffffe56e8ef0ffffffff912af74a'
;

select tbl.permission dom,tbr.permission exist from (select sm.permission from sys_menu sm where pid = 'ffffffffe56e8ef0ffffffff912af74a') tbl
left join (
    select tb.permission from (
		select sur.user_id,sm.permission,sm.pid from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        inner join sys_menu sm on sm.kid = srm.menu_id
        union
        select sum.user_id,sm.permission,sm.pid from sys_user_menu sum
        left join sys_menu sm on sm.kid = sum.menu_id) tb where tb.user_id = 'ffffffffab9fc98dffffffff8b642b39' and tb.pid = 'ffffffffe56e8ef0ffffffff912af74a') tbr
on tbl.permission = tbr.permission
