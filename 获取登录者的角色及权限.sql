select sm.url,sm.permission,sr.role_flag from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        left join sys_menu sm on srm.menu_id = sm.kid
        left join sys_role sr on sur.role_id = sr.kid
        left join sys_user_menu sum on sum.menu_id = sm.kid
        where sur.user_id = '000000004a94b9beffffffffcc70d52e';

select user_id, menu_id,sm.permission from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id;

-- 查询用户的菜单
-- 私有菜单
select user_id, menu_id,sm.permission from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id;

-- 角色菜单
select sur.user_id,srm.menu_id from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id;

select * from (select sum.user_id,sum.menu_id,sm.permission from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id
union
select sur.user_id,srm.menu_id,sm.permission from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id) tb where user_id = '000000004a94b9beffffffffcc70d52e' ;


-- 开始优化,sm.url,sm.permission,sr.role_flag


select * from (
select sm.url,sur.user_id,srm.menu_id,sm.permission,sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id
union
select sm.url,sum.user_id,sum.menu_id,sm.permission,null from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id ) tb where user_id = 'ffffffffddf9f1ffffffffff88888888';

-- 正式上线.final
select distinct url,permission,role_flag from (
select sm.url,sur.user_id,sm.permission,sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id
union
select sm.url,sum.user_id,sm.permission,null from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id) tb where user_id = '000000004a94b9beffffffffcc70d52e';

-- ************************************final *****************************************
select url,permission from (
select sm.url,sur.user_id,sm.permission from sys_user_role sur
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id
union
select sm.url,sum.user_id,sm.permission from sys_user_menu sum
left join sys_menu sm on sm.kid = sum.menu_id) tb where user_id = '000000004a94b9beffffffffcc70d52e';

select sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
where sur.user_id = 'ffffffffddf9f1ffffffffff88888888'


-- *****************************************************************************

-- 获取菜单,1.从私有菜单;2.从角色菜单
-- 从私有菜单
select sm.url,sm.permission
from sys_user_menu sum,sys_menu sm where sum.user_id = '000000004a94b9beffffffffcc70d52e' and sm.kid = sum.menu_id
select sm.url,sur.user_id,sm.permission,sr.role_flag from sys_user_role sur
left join sys_role sr on sr.kid = sur.role_id
left join sys_role_menu srm on srm.role_id = sur.role_id
inner join sys_menu sm on sm.kid = srm.menu_id;



CREATE USER 'fwtai'@'192.168.0.%' IDENTIFIED WITH caching_sha2_password BY 'rootFwtai' PASSWORD EXPIRE NEVER;

GRANT REPLICATION SLAVE ON *.* TO 'fwtai'@'192.168.0.%';

flush privileges;

CHANGE MASTER TO master_host='192.168.0.168',master_port=12587, master_log_file='mysql-bin.000001', master_log_pos=155,master_user='fwtai',master_password='rootFwtai';


CHANGE MASTER TO master_host='192.168.0.168',master_port=12587, master_log_file='mysql-bin.000001', master_log_pos=792,master_user='fwtai',master_password='rootFwtai' get_master_public_key=1;

