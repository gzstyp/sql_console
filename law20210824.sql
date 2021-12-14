
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

update knowledge set browse = browse+1 where kid = '000000002ac5a51fffffffffe212983a' limit 1;


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
    where ke.kid = '000000001c252ca1ffffffffa5bccaee';

select url from (select sm.url from sys_user_role sur left join sys_role_menu srm on srm.role_id = sur.role_id
          inner join (select kid,url from sys_menu sm where pid = (select kid from sys_menu where url = 'user/listData')
          union all select kid,url from sys_menu mu where pid = (select pid from sys_menu where url = 'user/listData')
          ) sm on sm.kid = srm.menu_id where sur.user_id ='ffffffffddf9f1ffffffffff88888888' and sm.url = 'user/listData') t
          union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/listData' LIMIT 1;


select sr.role_flag from sys_user_role sur
            left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888' union all
            select sm.url from (select lr.kid from (select sm.kid from (select distinct srm.menu_id from sys_role_menu srm where srm.role_id in (
            select sr.kid from sys_user_role sur left join sys_role sr on sr.kid = sur.role_id where sur.user_id = 'ffffffffddf9f1ffffffffff88888888') union
            select menu_id from sys_user_menu where user_id = 'ffffffffddf9f1ffffffffff88888888') ltb,sys_menu sm where sm.kid = ltb.menu_id) lt,
            (select kid from sys_menu where pid = (select kid from sys_menu where url = 'user/listData') union
            select kid from sys_menu where pid = ( select pid from sys_menu where url = 'user/listData')) lr where lr.kid =lt.kid) ilt,sys_menu sm where sm.kid = ilt.kid;

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
union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/add' LIMIT 1;


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
      union select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = 'ffffffffddf9f1ffffffffff88888888' and smu.url = 'user/add' LIMIT 1;

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
      union all select smu.url from sys_user_menu sum,sys_menu smu where smu.kid = sum.menu_id and sum.user_id = '0000000044d398bc000000000c8e20f1' and smu.url = 'user/listData' LIMIT 1;


select fw.kid,uio.real_name,uio.portrait,fw.add_date
from follow fw
left join user_info uio on fw.follow_id = uio.user_id and fw.user_id = ''
where fw.user_id = '';



select ct.kid,ct.add_date,ke.title,ifnull(uio.real_name,'管理员') author
from collect ct
left join knowledge ke on ke.kid = ct.knowledge_id and ct.user_id = ''
left join user_info uio on uio.user_id = ke.user_id
where ct.user_id = '';


select
        uio.user_id userId,
        lr.real_name,
        uio.portrait,
        pte.name postTypeName,
        dn.domainName,
        lr.practice_date,
        lr.law_office,
        lr.province_name,
        lr.city_name,
        lr.county_name
    from user_info uio
    inner join lawyer lr on uio.user_id = lr.user_id and lr.auth_status = 2
    left join sys_dict pte on lr.post_type = pte.KID and pte.pid = 'fffffffff9783046000000007dd17692'
    left join (select GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
    inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
    where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' and sdn.KID = '000000001255c3d4ffffffff86f9b7c4' group by user_id) dn on dn.user_id = lr.user_id

    where lr.auth_status = 2 and dn.domainName is not null;

-- 获取律师列表
select
pte.name postTypeName,
dns.domainName,
uio.portrait,
lr.user_id userId,
lr.real_name,
lr.practice_date,
lr.law_office,
lr.province_name,
lr.city_name,
lr.county_name
from lawyer lr
inner join user_info uio on uio.user_id = lr.user_id and lr.auth_status = 2
left join sys_dict pte on lr.post_type = pte.KID and pte.pid = 'fffffffff9783046000000007dd17692'
left join (select GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id) dns on dns.user_id = lr.user_id
left join (select GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' and sdn.KID = '000000001255c3d4ffffffff86f9b7c4' group by user_id) dn on dn.user_id = lr.user_id
where dn.domainName is not null;



-- update people s, city c set s.city_name = c.name where s.city_code = c.code;

update user_info uio,lawyer lr set uio.real_name = lr.real_name,uio.type = 2 where uio.user_id = lr.user_id and uio.user_id = 'ffffffffc745cd46ffffffff86c56a3e';

delete from legal_case where user_id = '';

delete from tableAs using legal_case tableAs
inner join my_case mce on mce.case_id = tableAs.kid
where tableAs.user_id = '';

delete from tableAs using my_case tableAs
inner join legal_case lce on lce.kid = tableAs.case_id
where lce.user_id = '1';







select
lr.user_id,
lr.user_id userId,
pte.name postTypeName,
lt.domainName,
lt.domainIds,
fw.follow_id follow,
lr.real_name,
lr.practice_code,
lr.practice_date,
lr.law_office,
lr.law_papers,
lr.post_type,
lr.details
from lawyer lr
left join sys_dict pte on lr.post_type = pte.KID and pte.pid = 'fffffffff9783046000000007dd17692'
left join (select GROUP_CONCAT(sdn.name) domainName,GROUP_CONCAT(sdn.kid) domainIds,user_id from skilled_domain
inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id
) lt on lt.user_id = lr.user_id
left join follow fw on fw.user_id = 'loginId'
where lr.user_id = 'ffffffff9f8ab50affffffffafb94c1e';



select
      lr.user_id,
      lr.user_id userId,
      pte.name postTypeName,
      lt.domainName,
      lt.domainIds,
      fw.follow_id follow,
      lr.real_name,
      lr.practice_code,
      lr.practice_date,
      lr.law_office,
      lr.law_papers,
      lr.post_type,
      lr.details
    from lawyer lr
    left join sys_dict pte on lr.post_type = pte.KID and pte.pid = 'fffffffff9783046000000007dd17692'
    left join (select GROUP_CONCAT(sdn.name) domainName,GROUP_CONCAT(sdn.kid) domainIds,user_id from skilled_domain
    inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
    where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id
    ) lt on lt.user_id = lr.user_id
    left join follow fw on fw.user_id = ''
    where lr.user_id = '#{userId}';


select ct.kid,ct.add_date,ke.title,ifnull(uio.real_name,'管理员') author
    from collect ct
    left join knowledge ke on ke.kid = ct.knowledge_id and ct.user_id = 'ffffffff9f8ab50affffffffafb94c1e'
    left join user_info uio on uio.user_id = ke.user_id
    where ct.user_id = 'ffffffff9f8ab50affffffffafb94c1e';



select t.kid, title, date, portrait, details, flag from (select lr.user_id kid,lr.real_name title,DATE_FORMAT(lr.practice_date,'%Y-%m-%d') date,uio.portrait,lt.domainName details,1 flag from lawyer lr
left join user_info uio on uio.user_id = lr.user_id and lr.auth_status = 2
left join (select GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id
) lt on lt.user_id = lr.user_id where auth_status = 2
union all
select ke.kid,ke.title,DATE_FORMAT(ke.add_date,'%Y-%m-%d') date,uio.portrait,left(ke.details,30),2 flag from knowledge ke
left join user_info uio on uio.user_id = ke.user_id) t where t.title like '民%' order by date desc;


SELECT
ay.kid,
ay.user_id,
ay.province_name,
ay.city_name,
ay.county_name,
sd.NAME domainName,
ay.details,
gt.reply,
DATE_FORMAT(ay.add_date,'%Y-%m-%d %H:%i:%s')add_date
FROM ADVISORY ay
left join sys_dict sd on ay.domain_id = sd.KID
left join (select count(1) reply,advisory_id from advisory_reply group by advisory_id) gt on gt.advisory_id = ay.kid;

SELECT
      ay.kid mid,
      ar.kid rid,
      DATE_FORMAT(ay.add_date,'%Y-%m-%d %H:%i:%s')add_date,
      DATE_FORMAT(ar.add_date,'%Y-%m-%d %H:%i:%s') reply_date,
      ay.city_name,
      ay.county_name,
      ay.details,
      sd.NAME domainName,
      gt.reply,
      ar.details replyDetails,
      ay.display,
      ar.display replyDisplay,
      ar.user_id replyUserId,
      ar.advisory_id,
      ay.province_name
    FROM ADVISORY ay
    left join sys_dict sd on ay.domain_id = sd.KID
    left join (select count(1) reply,advisory_id from advisory_reply group by advisory_id) gt on gt.advisory_id = ay.kid
    left join advisory_reply ar on ar.advisory_id = ay.kid;

select
uio.portrait,
lr.real_name,
lr.province_name,
lr.city_name,
lr.county_name,
lr.practice_date,
lr.law_office,
lt.domainName
from lawyer lr
inner join user_info uio on uio.user_id = lr.user_id and lr.auth_status = 2
left join (select GROUP_CONCAT(sdn.name) domainName,user_id from skilled_domain
    inner join sys_dict sdn on sdn.KID = skilled_domain.domain_id
    where sdn.PID = 'ffffffff9de10ca0ffffffffcc40c8bc' group by user_id
) lt on lt.user_id = lr.user_id;

select
uio.portrait,
lr.real_name,
lr.province_name,
lr.city_name,
lr.county_name,
lr.practice_date,
lr.law_office
from lawyer lr
inner join user_info uio on uio.user_id = lr.user_id and lr.auth_status = 2;

SELECT
ay.kid mid,
ar.kid rid,
DATE_FORMAT(ay.add_date,'%Y-%m-%d %H:%i:%s')add_date,
DATE_FORMAT(ar.add_date,'%Y-%m-%d %H:%i:%s') reply_date,
ay.city_name,
ay.domain_id,
ay.county_name,
ay.details,
sd.NAME domainName,
gt.reply,
ar.details replyDetails,
ay.display,
ar.display replyDisplay,
ar.user_id replyUserId,
ar.advisory_id,
ay.province_name,
uio.portrait,
uio.real_name,
uio.type
FROM ADVISORY ay
left join sys_dict sd on ay.domain_id = sd.KID
left join (select count(1) reply,advisory_id from advisory_reply group by advisory_id) gt on gt.advisory_id = ay.kid
left join advisory_reply ar on ar.advisory_id = ay.kid
left join user_info uio on uio.user_id = ar.user_id;


UPDATE LAWYER_CARD set status = 'ffffffff90ab143affffffffa39c06de' WHERE user_id = '' LIMIT 1;


select kid VALUE,name LABEL from sys_dict where PID = 'ffffffff8775e3c3000000007f0a1d1d' order by SORT;

select sur.user_name from sys_user sur,LEGAL_CASE lc where lc.kid = '000000002753e348ffffffffa3f90ea4' and sur.kid = lc.user_id LIMIT 1;
;


SELECT
im.kid,
im.title,
im.flag,
im.url,
im.details,
if(ir.kid,0,1) unread,
DATE_FORMAT(im.add_date,'%Y-%m-%d %H:%i:%s') add_date
FROM inform im
left join inform_read ir on im.kid = ir.inform_id
WHERE im.flag = 1
order by im.add_date desc;


delete from tableAs using  legal_case_accept tableAs
left join legal_case lce on lce.kid = tableAs.case_id;

select case_id from legal_case_status order by add_date desc limit 1;

select case_id,max(add_date) as add_date from legal_case_status group by case_id;

select
DATE_FORMAT(lc.add_date,'%Y-%m-%d %H:%i:%s')add_date,
lc.city_name,
lc.county_name,
lc.details,
lc.price,
lc.domain_id,
dn.NAME domainName,
lc.province_name,
lcs.status,
ss.NAME statusName,
lc.title,
uio.real_name,
uio.portrait
FROM LEGAL_CASE lc
left join (select case_id,max(add_date) as add_date from legal_case_status group by case_id) gt on gt.case_id = lc.kid
left join legal_case_status lcs on lcs.case_id = gt.case_id and lcs.add_date = gt.add_date
left join sys_dict ss on ss.KID = lcs.status
left join sys_dict dn on dn.KID = lc.domain_id
left join user_info uio on uio.user_id = lc.user_id
WHERE lc.kid = 2 LIMIT 1;

select
      lt.add_date accept_date,
      lc.kid,
      lc.domain_id,
      dn.NAME domainName,
      ss.NAME statusName,
      uio.portrait,
      uio.real_name,
      lc.title,
      lc.price,
      lc.user_id,
      lc.details,
      lc.province_id,
      lc.province_name,
      lc.city_id,
      lc.city_name,
      lc.county_id,
      lc.county_name,
      lc.add_date publish_date
    from (select case_id,add_date from my_case where user_id = '000000000c549031000000003cb1e3eb'
    union
    select kid,add_date from legal_case where user_id = '000000000c549031000000003cb1e3eb'
    ) lt,legal_case lc
    left join (select case_id,max(add_date) as add_date from legal_case_status group by case_id) gt on gt.case_id = lc.kid
    left join legal_case_status lcs on lcs.case_id = gt.case_id and lcs.add_date = gt.add_date
    left join sys_dict ss on ss.KID = lcs.status
    left join sys_dict dn on dn.KID = lc.domain_id
    left join user_info uio on uio.user_id = lc.user_id
    where lc.kid = lt.case_id;


select
lca.kid,
lca.user_id,
uio.real_name,
uio.portrait,
DATE_FORMAT(lca.add_date,'%Y-%m-%d %H:%i:%s')add_date
from legal_case_accept lca
left join user_info uio on uio.user_id = lca.user_id
where lca.case_id = '';

select kid from legal_case where kid = '' and user_id = '' limit 1;



select lt.kid,lt.unread,lt.details,DATE_FORMAT(lt.add_date,'%Y-%m-%d %H:%i:%s')add_date,'3' split from (select lcs.kid,lcs.case_id,lcs.details,lcs.unread,lcs.add_date
from (select case_id,max(add_date) as add_date from legal_case_status group by case_id) gt,legal_case_status lcs where gt.case_id = lcs.case_id and gt.add_date = lcs.add_date) lt,legal_case lc
where lc.kid = lt.case_id and lc.user_id = '';


update partner_auth set unread = 0 where kid = '' and user_id = '' limit 1;

UPDATE enterprise_auth set unread = 0 where user_id = '' and kid = '' limit 1;

select unread,details,DATE_FORMAT(add_date,'%Y-%m-%d %H:%i:%s')add_date from enterprise_auth where kid = '' limit 1;


select
      lt.add_date accept_date,
      lc.kid,
      lc.domain_id,
      dn.NAME domainName,
      ss.NAME statusName,
      uio.portrait,
      uio.real_name,
      lc.title,
      lc.price,
      lc.user_id,
      lc.details,
      lc.province_id,
      lc.province_name,
      lc.city_id,
      lc.city_name,
      lc.county_id,
      lc.county_name,
      lc.add_date publish_date
    from (select case_id,add_date from my_case where user_id = 'ffffffffb54754beffffffffca64bee7'
    union
    select kid,add_date from legal_case where user_id = 'ffffffffb54754beffffffffca64bee7'
    ) lt,legal_case lc
    left join (select case_id,max(add_date) as add_date from legal_case_status group by case_id) gt on gt.case_id = lc.kid
    left join legal_case_status lcs on lcs.case_id = gt.case_id and lcs.add_date = gt.add_date
    left join sys_dict ss on ss.KID = lcs.status
    left join sys_dict dn on dn.KID = lc.domain_id
    left join user_info uio on uio.user_id = lc.user_id
    where lc.kid = lt.case_id;


select lt.add_date accept_date,
       lc.kid,
       lc.domain_id,
       dn.NAME domainName,
       ss.NAME statusName,
       lcs.status,
       uio.portrait,
       uio.real_name,
       lc.title,
       lc.price,
       lc.user_id,
       lc.details,
       lc.province_id,
       lc.province_name,
       lc.city_id,
       lc.city_name,
       lc.county_id,
       lc.county_name,
       lc.add_date publish_date
from (select case_id, add_date from my_case where user_id = 'ffffffffb54754beffffffffca64bee7' union select kid, add_date from legal_case where user_id ='ffffffffb54754beffffffffca64bee7') lt,
     legal_case lc
     left join (select case_id, max(add_date) as add_date from legal_case_status group by case_id) gt on gt.case_id = lc.kid
     left join legal_case_status lcs on lcs.case_id = gt.case_id and lcs.add_date = gt.add_date
     left join sys_dict ss on ss.KID = lcs.status
     left join sys_dict dn on dn.KID = lc.domain_id
     left join user_info uio on uio.user_id = lc.user_id
where lc.kid = lt.case_id
  AND lcs.status is not null
  and lcs.status != '000000000f25bf9400000000574aa78a'
LIMIT 1,10;






select lc.title,lc.details,uio.real_name caseUser,lr.real_name lawyer,at.charge,at.bailor,at.telephone,DATE_FORMAT(at.date,'%Y-%m-%d') date,at.remark
      from agreement at
      inner join legal_case lc on lc.kid = at.case_id
      left join user_info uio on uio.user_id = at.case_user_id
      left join lawyer lr on lr.user_id = at.user_id

;

select
lc.code,
sd.name status,
ct.name,
ct.quota,
ct.card,
DATE_FORMAT(lc.add_date,'%Y-%m-%d')add_date
from lawyer_card lc
left join card_type ct on ct.kid = lc.card_type
left join sys_dict sd on sd.kid = lc.status
where lc.user_id = 'ffffffff8452a69800000000326c3510'
;



select lcs.case_id,lcs.status,sdt.NAME statusName,lcs.unread,lcs.details,DATE_FORMAT(lcs.add_date,'%Y-%m-%d %H:%i:%s')add_date from legal_case_status lcs
    -- inner join my_case mc on mc.case_id = lcs.case_id and mc.user_id = #{loginId}
    -- inner join legal_case lc on lc.kid = lcs.case_id and lc.user_id = #{userId}
    left join sys_dict sdt on sdt.kid = lcs.status
    where lcs.kid = 'ffffffff8452a69800000000326c3510' limit 1

;


select im.kid,ir.user_id from inform im
left join inform_read ir on im.kid = ir.inform_id
where ir.user_id = 'ffffffffcdd39bcbffffffffb2185d25'
;

SELECT
sum(CASE WHEN ir.kid is NULL THEN 1 ELSE 0 END) total
FROM inform im
left join inform_read ir on im.kid = ir.inform_id and ir.user_id = 'ffffffffdb000b80ffffffffc8571676'
limit 1;


-- 先查询通过我的邀请码注册的用户
select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40';

-- 通过我下级的邀请码注册的用户
select su.kid,t.kid from (select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
left join share se on se.user_id = t.kid
left join sys_user su on su.invitation_code = se.code
where su.kid is not null;

-- 查询我的分享团队
select su.kid,1 'level' from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40'
union all
select su.kid,2 'level' from (select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
left join share se on se.user_id = t.kid
left join sys_user su on su.invitation_code = se.code
where su.kid is not null;

-- 查询我的分享团队-数据
select t.kid,t.level,uio.sex,uio.type,uio.real_name,uio.portrait from (select su.kid,1 'level' from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40'
union all
select su.kid,2 'level' from (select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
left join share se on se.user_id = t.kid
left join sys_user su on su.invitation_code = se.code
where su.kid is not null) t
left join user_info uio on uio.user_id = t.kid 
;

select t.kid,t.level,t.user_name,uio.sex,uio.type,uio.real_name,uio.portrait from (select su.kid,su.user_name,1 'level' from sys_user sur
    left join share se on se.user_id = sur.kid
    left join sys_user su on su.invitation_code = se.code
    where sur.kid = 'ffffffffcbd18a010000000075afbe40'
    union all
    select su.kid,su.user_name,2 'level' from (select su.kid from sys_user sur
    left join share se on se.user_id = sur.kid
    left join sys_user su on su.invitation_code = se.code
    where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
    left join share se on se.user_id = t.kid
    left join sys_user su on su.invitation_code = se.code
    where su.kid is not null) t
    left join user_info uio on uio.user_id = t.kid
;

-- 查询我的分享团队-总条数
select count(t.kid) total from(select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40'
union all
select su.kid from (select su.kid from sys_user sur
left join share se on se.user_id = sur.kid
left join sys_user su on su.invitation_code = se.code
where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
left join share se on se.user_id = t.kid
left join sys_user su on su.invitation_code = se.code
where su.kid is not null) t limit 1
;
-- 案件类型,案件发布人信息，案件金额，title，发布日期，发布人的联系电话

select
lce.kid,
sd.NAME domainName,
lce.user_id,
sur.user_name,
lce.price,
lce.title,
DATE_FORMAT(lce.add_date,'%Y-%m-%d')add_date
from legal_case_accept lca
left join legal_case lce on lce.kid = lca.case_id
left join sys_dict sd on sd.KID = lce.domain_id
left join sys_user sur on sur.kid = lce.user_id
where lca.user_id = '' and lca.prefix = 1
;

select t.kid,t.level,t.user_name telephone,DATE_FORMAT(t.add_date,'%Y-%m-%d')add_date,uio.sex,uio.type,uio.real_name,uio.portrait
    from (select su.kid,su.user_name,su.add_date,1 'level' from sys_user sur
    left join share se on se.user_id = sur.kid
    left join sys_user su on su.invitation_code = se.code
    where sur.kid = 'ffffffffcbd18a010000000075afbe40'
    union all
    select su.kid,su.user_name,su.add_date,2 'level' from (select su.kid from sys_user sur
    left join share se on se.user_id = sur.kid
    left join sys_user su on su.invitation_code = se.code
    where sur.kid = 'ffffffffcbd18a010000000075afbe40') t
    left join share se on se.user_id = t.kid
    left join sys_user su on su.invitation_code = se.code
    where su.kid is not null) t
    left join user_info uio on uio.user_id = t.kid
order by t.add_date desc
;
-- final

select
    reg_date,
    GROUP_CONCAT(type,':',total) type,
    GROUP_CONCAT(total) total
from (select
    case uio.type
    when 1 then '普通用户'
    when 2 then '律师用户'
    when 3 then '企业用户'
    else '未知身份'
    end type,
    DATE_FORMAT(sur.add_date,'%Y-%m-%d') reg_date,
    count(sur.add_date) total
from sys_user sur
left join user_info uio on sur.kid = uio.user_id
where sur.type != 1 and DATE_SUB(CURDATE(), INTERVAL 1 MONTH) <= date(sur.add_date) group by reg_date,uio.type) t group by reg_date order by reg_date desc
;

select lcs.case_id,lcs.status,lcs.unread,lcs.details from legal_case_status lcs ;


select status_kid,
       GROUP_CONCAT(kid ORDER BY add_date DESC separator 'status_kid') kid,
       GROUP_CONCAT(details ORDER BY add_date DESC) details,
       GROUP_CONCAT(add_date ORDER BY add_date DESC) add_date
from case_status_details  group by status_kid
;

select kid,details,DATE_FORMAT(add_date,'%Y-%m-%d %H:%i')add_date from case_status_details where status_kid = '6630cbf010fe11ec920800163e0b465d' order by add_date desc
;

select kid bailor,user_name phone,uio.real_name,uio.portrait from sys_user su
left join user_info uio on uio.user_id = su.kid
where user_name = '' limit 1
;


-- 我的案件被哪些律师委托了
SELECT lr.* from (SELECT mc.user_id FROM my_case mc WHERE mc.case_id in
(SELECT kid FROM legal_case WHERE user_id = 'ffffffffcdd39bcbffffffffb2185d25') ) t
LEFT JOIN lawyer lr on lr.user_id = t.user_id
ORDER BY lr.user_id ;

-- 我的案件被哪些律师委托了
SELECT lc.title,lr.real_name FROM legal_case lc
INNER JOIN my_case mc on mc.case_id = lc.kid
LEFT JOIN lawyer lr on lr.user_id = mc.user_id
WHERE lc.user_id = 'ffffffffcdd39bcbffffffffb2185d25' ORDER BY lc.user_id;


select * from legal_case_status where case_id;

delete from tableAs using legal_case_status tableAs
    inner join legal_case lce on lce.kid = tableAs.case_id
    where lce.user_id = '' and tableAs.case_id = ''
;

delete from legal_case_status where case_id = ''
;
delete from legal_case_accept where case_id = ''
;

insert into legal_relation(kid,case_id,user_id,execution,flag) VALUES ('',case_id,user_id,0,2)
;
select
      s.user_name lawyer_phone,
      DATE_FORMAT(lt.add_date,'%Y-%m-%d %H:%i:%s') accept_date,
      lt.self,
      lt.agreement,
      lt.execution,
      lc.kid,
      lc.domain_id,
      dn.NAME domainName,
      ss.NAME statusName,
      uio.portrait,
      uio.real_name,
      sur.user_name,
      lc.title,
      lc.price,
      lc.deleted,
      lc.user_id,
      lc.details,
      lc.province_id,
      lc.province_name,
      lc.city_id,
      lc.city_name,
      lc.county_id,
      lc.county_name,
      DATE_FORMAT(lc.add_date,'%Y-%m-%d %H:%i:%s') publish_date
    from (select case_id,add_date,0 self,agreement,1 execution from my_case where user_id = ''
    union
    select kid,add_date,1 self,0,1 execution from legal_case where user_id = ''
	union
    select lr.case_id,lc.add_date,0 self,0,lr.execution from legal_relation lr
    inner join legal_case lc on lc.kid = lr.case_id and lr.user_id = '' where lr.user_id = ''
    ) lt inner join legal_case lc on lt.case_id = lc.kid
    left join (select case_id,max(add_date) as add_date from legal_case_status group by case_id) gt on gt.case_id = lc.kid
    left join legal_case_status lcs on lcs.case_id = gt.case_id and lcs.add_date = gt.add_date
    left join sys_dict ss on ss.KID = lcs.status
    left join sys_dict dn on dn.KID = lc.domain_id
    left join user_info uio on uio.user_id = lc.user_id
    left join sys_user sur on sur.kid = lc.user_id
    LEFT JOIN my_case mc on mc.case_id = lc.kid and mc.agreement = 1
    LEFT JOIN sys_user s on mc.user_id = s.kid
    where lc.kid = lt.case_id
;

select lr.case_id,lc.add_date,0 self,0 from legal_relation lr
inner join legal_case lc on lc.kid = lr.case_id and lr.user_id = '' where lr.user_id = ''

;

select lt.law_office,lr.total from (select l.law_office from lawyer l where l.user_id = 'ffffffffeb5c0f0bffffffff86e5c8b1' and l.execution = 1) lt
inner join (SELECT law_office,COUNT(law_office) total from lawyer GROUP BY law_office) lr on lr.law_office = lt.law_office

;

;

;
select attach_path as path,1 type from status_details_attach where details_kid = '#{kid}'
    union all
    select img_path,2 attach from status_details_img where details_kid = '#{kid}'
;
select kid,details,DATE_FORMAT(add_date,'%Y-%m-%d %H:%i')add_date from case_status_details where status_kid = 'fffffffff12fda320000000006bc3e4c' order by add_date desc
;
select csd.kid,csd.details,DATE_FORMAT(csd.add_date,'%Y-%m-%d %H:%i')add_date,lg.type,lg.path from case_status_details csd
left join (
select lg.type,lg.details_kid,GROUP_CONCAT(lg.path) path from (select attach_path as path,1 type,details_kid from status_details_attach where details_kid = 'fffffffff12fda320000000006bc3e4c'
union all
select img_path,2 attach,details_kid from status_details_img where details_kid = 'fffffffff12fda320000000006bc3e4c') lg
GROUP BY lg.type,lg.details_kid
) lg on lg.details_kid = csd.kid

where status_kid = 'fffffffff12fda320000000006bc3e4c' order by add_date desc
;

SELECT kid,name from sys_dict WHERE PID = 'ffffffffa36e353300000000124597bd' and KID != '000000007405fdbb0000000004aeecd1' and DELETED = 0 ORDER BY SORT ASC

-- todo SELECT device_flag,COUNT(device_flag) total from monitor_value GROUP BY device_flag with rollup HAVING total > 1
;

select DATE_FORMAT(add_date,'%Y-%m-%d') date,COUNT(add_date) total from statistics where tabs = 1 group by date;



;
INSERT INTO statistics ( kid, tabs, device_id, platform, model, user_id )
VALUES (
        'ffffffffa8f3fb6a000000007d78bb84', 1, 84513222, 'android', 'huawei', '000000000c549031000000003cb1e3eb'
       )
;
select sur.user_name from sys_user sur
                        inner join
                        LEGAL_CASE lc on sur.kid = lc.user_id
where lc.kid = '00000000384ddc1f000000002c8c50ff' LIMIT 1
;
;
;
;
;

select
sur.kid,
sur.user_name,
concat(lr.province_name,lr.city_name,lr.county_name) addr_lawyer,
concat(ee.province_name,ee.city_name,ee.county_name) addr_enterprise,
DATE_FORMAT(sur.add_date,'%Y-%m-%d') add_date,
sur.enabled,
sur.wx_openid status,
ee.user_id enterprise,
lr.user_id lawyer,
concat(uio.province_name,uio.city_name,uio.county_name) address,
pr.user_id partner
FROM SYS_USER sur
left join user_info uio on uio.user_id = sur.kid
left join enterprise ee on ee.user_id = sur.kid and ee.auth_status = 2
left join lawyer lr on lr.user_id = sur.kid and lr.auth_status = 2

left join partner pr on pr.user_id = sur.kid and pr.auth_status = 2
where sur.type = 2
and pr.user_id is not null
and uio.type = 3
;
;
select user_id from skilled_domain sdn group by user_id
;
;

;
;
select sdn.user_id,sdn.domain_id from skilled_domain sdn
where sdn.user_id = 'ffffffffb3ee70eb00000000195cea7f' and domain_id = 'ffffffffbcdd7d6affffffff8bc1348b'
group by sdn.user_id,sdn.domain_id
;

SELECT
    ss.kid,
    ss.template_code,
    ste.template_name,
    ss.total,
    if(sur.user_name = 'admin','管理员',sur.user_name) user_name,
    DATE_FORMAT(ss.add_time,'%Y-%m-%d %H:%i:%s')add_time
FROM SMS ss
INNER JOIN sys_user sur on sur.kid = ss.user_id
left join sms_template ste on ste.template_code = ss.template_code

;
;
SELECT COUNT(1) TOTAL FROM SMS ss WHERE DATE_FORMAT(ss.add_time,'%Y-%m-%d %H:%i') >= '2021-11-12 15:57:00' LIMIT 1
;

;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;
;

;
;
;
;
;
;

;
;
;
;
;
;
;
;

;
;
;
;
;

;
;
;
;
;
;
;
;
;
;
;
;
;
;

;
;
;
;
;
;
;
















































