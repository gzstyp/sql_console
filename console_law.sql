

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

select sur.logintime,uio.type,uio.real_name,uio.phone,uio.address from sys_user sur
left join user_info uio on uio.user_id = sur.kid
where sur.kid = 'ffffffffddf9f1ffffffffff88888888' LIMIT 1;

SELECT sur.kid,sur.password,sur.enabled,sur.error_count,
       DATE_FORMAT(sur.logintime,'%Y-%m-%d %H:%i:%S') logintime,(sur.logintime = sur.add_date) first,DATE_FORMAT(sur.error_time,'%Y-%m-%d %H:%i:%S') error_time,(NOW() - sur.error_time) error,uio.type,uio.real_name,uio.phone,uio.address
FROM sys_user sur left join user_info uio on uio.user_id = sur.kid WHERE user_name = '13765121695' LIMIT 1;



select uio.real_name,uio.phone,uio.address FROM sys_user sur left join user_info uio on uio.user_id = sur.kid WHERE sur.kid = '000000003f751760ffffffffd3b64bae' LIMIT 1;






select sm.kid,sm.name,sm.pid,sm.url,sm.icon_style,sm.subset from sys_user_role sur
    left join sys_role_menu srm on srm.role_id = sur.role_id
    inner join sys_menu sm on sm.kid = srm.menu_id
    where sur.user_id = '0000000044d398bc000000000c8e20f1'
    AND sm.TYPE = 1 ORDER BY ORDER_BY;


select sum.user_id,sum.menu_id from sys_user_menu sum;


select sm.kid,sur.user_id from sys_user_role sur
    left join sys_role_menu srm on srm.role_id = sur.role_id
    inner join sys_menu sm on sm.kid = srm.menu_id
union all
select sum.menu_id,sum.user_id from sys_user_menu sum;
-- 0000000044d398bc000000000c8e20f1

SELECT kid,name,pid,url,icon_style,subset FROM SYS_MENU SM,
    (SELECT MENU_ID FROM SYS_USER_MENU WHERE USER_ID = 'ffffffffddf9f1ffffffffff88888888'
    UNION
    SELECT srmu.menu_id FROM sys_user_role sure
    left join sys_role_menu srmu on srmu.role_id = sure.role_id
    WHERE USER_ID = 'ffffffffddf9f1ffffffffff88888888' and srmu.menu_id is not null
    ) TB WHERE SM.KID = TB.MENU_ID AND TYPE = 1 ORDER BY ORDER_BY;


select sr.role_flag from sys_user_role sur
    left join sys_role sr on sr.kid = sur.role_id where sur.user_id = '0000000044d398bc000000000c8e20f1'
    union all
    select sm.permission from (select lr.kid from (select sm.kid from (
    SELECT srmu.menu_id FROM sys_user_role sure
    left join sys_role_menu srmu on srmu.role_id = sure.role_id where sure.USER_ID = '0000000044d398bc000000000c8e20f1' and srmu.menu_id is not null
    union
    select menu_id from sys_user_menu where user_id = '0000000044d398bc000000000c8e20f1') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
      (select kid from sys_menu where pid = (
    select kid from sys_menu where url = 'user/add')
    union
    select kid from sys_menu where pid = (
    select pid from sys_menu where url = 'user/add')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid;



select url from (
select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
) sm on sm.kid = srm.menu_id where sur.user_id = '0000000044d398bc000000000c8e20f1' and sm.url = 'user/listData') t
union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id ='0000000044d398bc000000000c8e20f1' and smu.url = 'user/listData'
;


update lawyer set province_id = 0
where user_id = '' LIMIT 1;


SELECT REPLACE(UUID(),'-','')ID FROM DUAL;
-- lr.skilled_domain,sdn.name skilledDomainName




SELECT
      lr.auth_status,lr.real_name,lr.practice_code,
      lr.province_id,lr.province_name,
      lr.city_id,lr.city_name,
      lr.county_id,lr.county_name,
      lr.practice_date,lr.law_office,lr.post_type,pte.name postTypeName,lr.law_papers,
      lr.details
    FROM lawyer lr
    left join sys_dict pte on lr.post_type = pte.KID
    left join (select GROUP_CONCAT(domain_id)domain_id,GROUP_CONCAT(sdn.name) skilledDomainName,user_id from skilled_domain
    inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
    where user_id = 'ffffffffc58f34e7000000005115aa35' group by user_id) dn on dn.user_id = lr.user_id
    where lr.user_id = 'ffffffffc58f34e7000000005115aa35' limit 1
;

select browse from knowledge where kid = '000000002ac5a51fffffffffe212983a';

update knowledge set browse = browse+1 where kid = '000000002ac5a51fffffffffe212983a' limit 1


SELECT
      ke.kid,
      ke.title,
      sdt.name domainName,
      ke.details,
      ke.browse,
       ct.kid collect,
      DATE_FORMAT(ke.add_date,'%Y-%m-%d')add_date,
      ifnull(uio.real_name,'管理员') author
    FROM KNOWLEDGE ke
    left join sys_dict sdt on sdt.kid = ke.domain_id
    left join user_info uio on uio.user_id = ke.user_id
    left join collect ct on ct.knowledge_id = ke.kid and ct.user_id = 'ffffffffc58f34e7000000005115aa350'
    where ke.kid = '000000001c252ca1ffffffffa5bccaee'

select url from (select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
          inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
          union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
          ) sm on sm.kid = srm.menu_id where sur.user_id ='ffffffffddf9f1ffffffffff88888888' and sm.url = 'user/listData') t
          union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/listData' LIMIT 1


select sr.role_flag from sys_user_role sur
            left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' union all
            select sm.url from (select lr.kid from (select sm.kid from (select distinct srm.menu_id from sys_role_menu srm where srm.role_id in (
            select sr.kid from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888') union
            select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
            (select kid from sys_menu where pid = (select kid from sys_menu where url = 'user/listData') union
            select kid from sys_menu where pid = ( select pid from sys_menu where url = 'user/listData')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid

-- 职位，擅长领域
SELECT
      lr.auth_status,lr.real_name,lr.practice_code,
      lr.province_id,lr.province_name,
      lr.city_id,lr.city_name,
      lr.county_id,lr.county_name,
      lr.practice_date,
       lr.law_office,
       pte.name postTypeName,
       lr.law_papers,
       dn.domainName,
       dn.domain_id,
      lr.details
    FROM lawyer lr
    left join sys_dict pte on lr.post_type = pte.KID and pte.PID = 'fffffffff9783046000000007dd17692'
    left join (select GROUP_CONCAT(domain_id)domain_id,GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
    inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
    where user_id = 'ffffffffc58f34e7000000005115aa35' and sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id) dn on dn.user_id = lr.user_id
    where lr.user_id = 'ffffffffc58f34e7000000005115aa35' limit 1;

select * from sys_dict pte where PID = 'ffffffff9de10ca0ffffffffcc40c8bc';

select * from sys_dict pte where PID = '0000000051f9d61affffffff8405fc42';

SELECT * FROM sys_area WHERE pid = 0;


select url from (select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
      inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/add')
      union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/add')
      ) sm on sm.kid = srm.menu_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' and sm.url = 'user/add') t
union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/add' LIMIT 1


select sr.role_flag from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'
      union all select sm.permission from (select lr.kid from (select sm.kid from (SELECT srmu.menu_id FROM sys_user_role sure
      left join sys_role_menu srmu on srmu.role_id = sure.role_id where sure.USER_ID = 'ffffffffddf9f1ffffffffff88888888' and srmu.menu_id is not null
      union select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
      (select kid from sys_menu where pid = (select kid from sys_menu where url = 'user/add')
      union select kid from sys_menu where pid = (select pid from sys_menu where url = 'user/add')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid;

select url from (select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
      inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/adde')
      union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/adde')
      ) sm on sm.kid = srm.menu_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' and sm.url = 'user/adde') t
      union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/add' LIMIT 1

select sr.role_flag from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' 
      union all select sm.permission from (select lr.kid from (select sm.kid from (SELECT srmu.menu_id FROM sys_user_role sure
      left join sys_role_menu srmu on srmu.role_id = sure.role_id where sure.USER_ID = '0000000044d398bc000000000c8e20f1' and srmu.menu_id is not null
      union select menu_id from sys_user_menu where user_id = '0000000044d398bc000000000c8e20f1') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
      (select kid from sys_menu where pid = (select kid from sys_menu where url = 'user/add')
      union select kid from sys_menu where pid = (select pid from sys_menu where url = 'user/add')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid;


select kid,pid permission from sys_menu where url = 'user/listData';

select sm.kid,sm.permission from sys_menu smu
left join sys_menu sm on sm.pid = smu.pid
where smu.url = 'user/listData';



select sr.role_flag from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = '0000000044d398bc000000000c8e20f1'
union all select tr.permission from (select sm.kid from (SELECT srmu.menu_id FROM sys_user_role sure
left join sys_role_menu srmu on srmu.role_id = sure.role_id where sure.USER_ID = '0000000044d398bc000000000c8e20f1' and srmu.menu_id is not null
union select menu_id from sys_user_menu where user_id = '0000000044d398bc000000000c8e20f1') ltb,sys_menu sm where sm.kid = ltb.menu_id) tl,(select sm.kid,sm.permission from sys_menu smu
left join sys_menu sm on sm.pid = smu.pid where smu.url = 'user/listData') tr where tl.kid = tr.kid;


select t0.url from (select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
      inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
      union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
      ) sm on sm.kid = srm.menu_id where sur.user_id = '0000000044d398bc000000000c8e20f1' and sm.url = 'user/listData') t0
      union all select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = '0000000044d398bc000000000c8e20f1' and smu.url = 'user/listData' LIMIT 1














