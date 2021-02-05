-- 用户角色
select sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888';

-- 用户权限(含用户菜单)
select sm.permission from (select distinct srm.menu_id from sys_role_menu srm where srm.role_id in (
select sr.kid from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
)) ltb,sys_menu sm where sm.kid = ltb.menu_id;
-- 用户的角色和用户权限
select sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
union all
select sm.permission from (select distinct srm.menu_id from sys_role_menu srm where srm.role_id in (
select sr.kid from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
)) ltb,sys_menu sm where sm.kid = ltb.menu_id;