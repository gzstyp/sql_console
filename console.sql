
-- 查询是否还有子页面
select sub.kids,sm.name,s.name pName,sm.subset,sm.pid,sm.permission,sm.category,sm.icon_style,sm.url,sm.type,sm.order_by from sys_menu sm
left join sys_menu s on s.kid = sm.pid
left join (select GROUP_CONCAT(kid) kids,pid from sys_menu where type = 1 group by pid) sub on sub.pid = sm.kid

-- 优化后
select sub.pid subId,sm.name,s.name pName,sm.subset,sm.pid,sm.permission,sm.category,sm.icon_style,sm.url,sm.type,sm.order_by from sys_menu sm
left join sys_menu s on s.kid = sm.pid
left join (select pid from sys_menu where type = 1 group by pid) sub on sub.pid = sm.kid


select GROUP_CONCAT(kid) kids,pid from sys_menu group by pid


