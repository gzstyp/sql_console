-- final version --角色菜单------------------开始
select sm.kid,sm.pid,sm.name,IF(lr.menu_id is not null,'true','false') checked from (select sm.kid,sm.pid from (
-- 登录人的菜单id开始
select srm.menu_id from sys_role_menu srm left join sys_user_role sur on sur.role_id = srm.role_id
where sur.user_id = 'ffffffffdf91b1290000000071f873b2'
union
select sum.menu_id  from sys_user_menu sum left join sys_menu sm on sm.kid = sum.menu_id
where sum.user_id = 'ffffffffdf91b1290000000071f873b2'
-- 登录人的菜单id结束
union
-- 角色的菜单id
select srm.menu_id from sys_role_menu srm,sys_menu sm where sm.kid = srm.menu_id and role_id = '000000007c14c586ffffffffdeb8c762'
) tb,sys_menu sm where sm.kid = tb.menu_id) lt
left join
(select srm.menu_id from sys_role_menu srm,sys_menu sm where sm.kid = srm.menu_id and role_id = '000000007c14c586ffffffffdeb8c762')lr on lr.menu_id = lt.kid
inner join sys_menu sm on sm.kid = lt.kid order by sm.order_by;
-- final version --角色菜单------------------结束

-- final version --私有菜单------------------开始
select sm.kid,sm.pid,sm.name,IF(lr.menu_id is not null,'true','false') checked from (select sm.kid,sm.pid from (
-- 登录人的菜单id开始
select srm.menu_id from sys_role_menu srm left join sys_user_role sur on sur.role_id = srm.role_id
where sur.user_id = 'ffffffffdf91b1290000000071f873b2'
union
select sum.menu_id  from sys_user_menu sum left join sys_menu sm on sm.kid = sum.menu_id
where sum.user_id = 'ffffffffdf91b1290000000071f873b2'
-- 登录人的菜单id结束
union
-- 用户的菜单id
select sum.menu_id from sys_user_menu sum,sys_menu sm where sm.kid = sum.menu_id and sum.user_id = '0000000064fe190dffffffff8c02b19c'
) tb,sys_menu sm where sm.kid = tb.menu_id) lt
left join
(select sum.menu_id from sys_user_menu sum,sys_menu sm where sm.kid = sum.menu_id and sum.user_id = '0000000064fe190dffffffff8c02b19c')lr on lr.menu_id = lt.kid
inner join sys_menu sm on sm.kid = lt.kid order by sm.order_by;
-- final version --私有菜单------------------结束
