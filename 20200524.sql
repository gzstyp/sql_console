
SELECT lt.menu_id FROM (
SELECT srm.menu_id,srm.role_id FROM sys_role_menu srm WHERE srm.role_id = '000000000c9ac38fffffffffb8ae4eb3') lt
LEFT JOIN sys_user_role sur ON lt.role_id = sur.role_id
union
select menu_id from sys_user_menu sum WHERE user_id = 'ffffffffbd471a55ffffffff976c6d1b'
;

SELECT sm.permission FROM (SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
WHERE SUR.USER_ID = 'ffffffffbd471a55ffffffff976c6d1b'
UNION
SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on sm.kid = lt.menu_id
where sm.pid = 'ffffffff8c468a55ffffffff8f59d635';

-- 开发模式
SELECT sm.permission,sm.url FROM (SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
WHERE SUR.USER_ID = 'ffffffffbd471a55ffffffff976c6d1b'
UNION
SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on sm.kid = lt.menu_id
left join sys_menu smu on smu.url = 'user/listData' and smu.kid = sm.kid;
-- 生产模式
select sm.permission from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on sm.kid = lt.menu_id
left join sys_menu smu on smu.url = 'user/listdata' and smu.kid = sm.kid
where sm.permission is not null;
-- ok
select sm.permission
from (
select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b')lt,sys_menu sm where lt.menu_id = sm.kid
;

-- 用where代替 left join -ok
select lt.permission from (select sm.pid,sm.permission
from (
select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b')lt,sys_menu sm where lt.menu_id = sm.kid
) lt,sys_menu sm where sm.pid = lt.pid and sm.url = 'user/listdata'
;
-- 用 left join -ok
select lt.permission from (select sm.pid,sm.permission
from (
select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b')lt,sys_menu sm where lt.menu_id = sm.kid
) lt left join sys_menu sm on sm.pid = lt.pid where sm.url = 'user/listdata'
;
-- 用 left join -ok
select lt.permission from (select sm.pid,sm.permission
from (
select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b')lt,sys_menu sm where lt.menu_id = sm.kid
) lt left join sys_menu sm on sm.pid = lt.pid where sm.url = 'user/listdata'
;

































select sm.pid,sm.permission from (
select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b')lt,sys_menu sm where lt.menu_id = sm.kid
;

select * from (select lt.menu_id from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on lt.menu_id = sm.kid) lt
union
select * from (select lt.menu_id from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
right join sys_menu sm on lt.menu_id = sm.kid) rt;


select * from (select lt.menu_id from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on lt.menu_id = sm.kid) lt order by menu_id ;

-- ok
select lt.kid from (select sm.kid from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
right join sys_menu sm on lt.menu_id = sm.kid where lt.menu_id is null) lt;

-- 待优化
select lt.permission from (select lt.pid,lt.permission from (select sm.pid,sm.permission from (select srm.menu_id from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
where sur.user_id = 'ffffffffbd471a55ffffffff976c6d1b'
union
select menu_id from sys_user_menu sum where user_id = 'ffffffffbd471a55ffffffff976c6d1b') lt
right join sys_menu sm on lt.menu_id = sm.kid where lt.menu_id is null) lt) lt
left join sys_menu sm on sm.pid = lt.pid where sm.url = 'user/listdata'
;
/*

 SELECT LT.permission FROM (SELECT SM.PID,SM.PERMISSION
        FROM (
        SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
        LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
        WHERE SUR.USER_ID = #{userId}
        UNION
        SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = #{userId})LT,SYS_MENU SM WHERE LT.MENU_ID = SM.KID
        ) LT,SYS_MENU SM WHERE SM.PID = LT.PID AND SM.URL = #{url}

 */
-- 已优化 -- ok,  MySQL之full outer join用法
SELECT LT.permission FROM (SELECT SM.PID,SM.PERMISSION FROM (SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
WHERE SUR.USER_ID = 'ffffffffbd471a55ffffffff976c6d1b'
UNION
SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = 'ffffffffbd471a55ffffffff976c6d1b') LT
RIGHT JOIN SYS_MENU SM ON LT.MENU_ID = SM.KID WHERE LT.MENU_ID IS NULL)LT
LEFT JOIN SYS_MENU SM ON SM.PID = LT.PID WHERE SM.URL = 'user/listdata';

 SELECT LT.permission FROM (SELECT SM.PID,SM.PERMISSION
        FROM (
        SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
        LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
        WHERE SUR.USER_ID = 'ffffffffbd471a55ffffffff976c6d1b'
        UNION
        SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = 'ffffffffbd471a55ffffffff976c6d1b')LT,SYS_MENU SM WHERE LT.MENU_ID = SM.KID
        ) LT,SYS_MENU SM WHERE SM.PID = LT.PID AND SM.URL = 'user/listdata';


;


select
            td.kid,
            td.falg,
            td.invoices_code,
            td.item_code,
            td.item_name,
            td.item_total,
            td.item_storage_code,
            sp.point
        from task_detail td
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where td.status = 1 and td.falg = 0
