-- 查询是否含有子页面或子节点,用于ztree的菜单分配,原理是将 group by pid 再 left join 最后 IF
select kid, name,IF(subId IS NOT NULL OR isParent = 1,1,0) isParent,IF(lt.menu_id is not null,1,0) checked
from (select sm.kid,sm.name,sm.subset isParent,sub.pid subId,sm.pid,sm.order_by from sys_menu sm
left join (select pid from sys_menu group by pid) sub on sub.pid = sm.kid) tb
left join (select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c') lt on lt.menu_id = tb.kid
where tb.pid = 'ffffffffe56e8ef0ffffffff912af74a' ORDER BY order_by;

select kid,pid,name,IF(lt.menu_id is not null,'true',null) checked
from (select sm.kid,sm.name,sm.subset isParent,sub.pid subId,sm.pid,sm.order_by from sys_menu sm
left join (select pid from sys_menu group by pid) sub on sub.pid = sm.kid) tb
left join (select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c') lt on lt.menu_id = tb.kid
ORDER BY order_by;

-- 步骤1
select kid,name,isParent,sub.pid from (select kid,name,subset isParent from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) wclt
left join
(select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = wclt.kid;

-- 步骤2,ok
select kid,name,IF(sub.pid IS NOT NULL OR isParent = 1,1,0) isParent from (
select sm.kid,sm.name,sm.subset isParent from sys_menu sm,(
select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb where sm.kid = lb.menu_id) wclt
left join
(select sm.pid from sys_menu sm,(
select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = wclt.kid;

-- 正式步骤1
select sm.kid,sm.name,sm.subset from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id;
-- 正式步骤2
select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id;
-- 正式步骤3-分组
select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid;
-- 正式步骤4-合并数据
select lt.*,sub.pid subId from (select sm.kid,sm.name,sm.subset from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) lt
left join (select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = lt.kid;
-- 正式步骤5-优化中
select lt.kid,lt.name,lt.subset,sub.pid subId from (select sm.kid,sm.name,sm.subset from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) lt
left join (select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = lt.kid;
-- 正式步骤6-优化完成
select lt.kid,lt.name,IF(lt.subset = 1 or sub.pid is not null,1,0) aa,lt.subset,sub.pid subId from (select sm.kid,sm.name,sm.subset from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) lt
left join (select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = lt.kid;
-- 正式步骤7-准备上线
select lt.kid,lt.name,IF(lt.subset = 1 or sub.pid is not null,1,0) isParent from (select sm.kid,sm.name,sm.subset from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) lt
left join (select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = lt.kid;
-- 正式步骤8-正式上线+排序
select lt.kid,lt.name,IF(lt.subset = 1 or sub.pid is not null,1,0) isParent,lt.pid from (select sm.kid,sm.name,sm.subset,sm.order_by,sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id) lt
left join (select sm.pid from sys_menu sm,(select menu_id from sys_user_menu where user_id = '00000000387d2da50000000029a8b60c'
union
select menu_id from sys_role_menu where role_id in (select role_id from sys_user_role where user_id = '00000000387d2da50000000029a8b60c')
) lb
where sm.kid = lb.menu_id group by sm.pid) sub on sub.pid = lt.kid order by order_by ASC;













