

select sr.role_flag from sys_user_role sur
    left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
    union all
    select sm.url from (select lr.kid from (select sm.kid from (select distinct srm.menu_id from sys_role_menu srm where srm.role_id in (
        select sr.kid from sys_user_role sur
        left join sys_role sr on sr.kid = sur.role_id
        where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
    )
    union
    select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
      (select kid from sys_menu where pid = (
    select kid from sys_menu where url = 'dictionary/listData')
    union
    select kid from sys_menu where pid = (
    select pid from sys_menu where url = 'dictionary/listData')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid;

-- 找到私有菜单,角色菜单
select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888';

select role_id from sys_user_role where user_id = 'ffffffffddf9f1ffffffffff88888888';

select menu.menu_id from (
select srm.menu_id from sys_role_menu srm,sys_user_role sur
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' and sur.role_id = srm.role_id
union
select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') menu;


select sm.kid,sm.url from sys_menu sm where pid = (select smu.pid from sys_menu smu where smu.url = 'dictionary/listData');

select lft.url from (
    select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
    union all
    select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
    ) lft,
(select menu.menu_id from (
select srm.menu_id from sys_role_menu srm,sys_user_role sur
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' and sur.role_id = srm.role_id union
select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') menu) lfr where lft.kid = lfr.menu_id and lft.url = 'user/listData'
;

select sr.role_flag from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
union all
select lft.permission from (
    select kid,permission from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
    union all
    select kid,permission from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
) lft,
(select menu.menu_id from (
select srm.menu_id from sys_role_menu srm,sys_user_role sur
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' and sur.role_id = srm.role_id union
select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') menu) lfr where lft.kid = lfr.menu_id
;
-- 账号所有的权限菜单,ok
select sm.url,sm.permission from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888';

select sm.kid,name,pid,url,icon_style,subset from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
AND sm.TYPE = 1 ORDER BY ORDER_BY;


select sr.role_flag from sys_user_role sur inner join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
union all
select sm.url from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join (
    select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/add')
    union all
    select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/add')
) sm on sm.kid = srm.menu_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888';








select sr.role_flag from sys_user_role sur inner join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
                union all select sm.permission from sys_user_role sur
                left join sys_role_menu srm on srm.role_id = sur.role_id
                inner join (select kid,permission from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
                union all select kid,permission from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
                ) sm on sm.kid = srm.menu_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888';



select sur.role_id,sre.role_flag from sys_user_role sur
inner join sys_role sre on sre.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888';




