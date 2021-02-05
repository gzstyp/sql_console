-- ------------------------------------------------------------思路是再分组--------------------------------------------------------------

select name,GROUP_CONCAT(profession) profession,GROUP_CONCAT(profession_total) profession_total from (
    select sa.name,sd.name profession,lt.profession_total from (
    select city_id,profession,count(profession) profession_total from bs_employee
    group by profession,city_id ORDER BY profession ASC) lt
left join sys_area sa on sa.kid = lt.city_id
left join sys_dict sd on sd.KID = lt.profession) gt group by name;


select area,GROUP_CONCAT(site_type) site_type,GROUP_CONCAT(type_total) type_total from (
    select sd.NAME site_type,lt.type_total,sa.name area from (
        select site_type,city_id,count(site_type) type_total from bs_environment group by site_type,city_id ORDER BY site_type ASC
    ) lt
left join sys_dict sd on sd.KID = lt.site_type
left join sys_area sa on sa.KID = lt.city_id) gt group by area;

-- 外环境类别
select sample_name from (select sample_type,sample_total,sd.NAME sample_name,sa.name area_name from (select sample_type,city_id,count(sample_type) sample_total
from bs_environment group by sample_type,city_id ORDER BY sample_type ASC) lt
left join sys_dict sd on sd.KID = lt.sample_type
left join sys_area sa on sa.KID = lt.city_id) lt group by sample_name;

-- 外环境样本监测情况-区分产品包装和其余外环境样本,其实是有很多分类的,但仅需分为两类,ok
SELECT area_name,GROUP_CONCAT(sample_total)sample_total,GROUP_CONCAT(sample_type) sample_type FROM
(select area_name,sample_type,SUM(sample_total) sample_total from (
    select sa.name area_name,sample_type,sample_total from (
    select CASE WHEN sample_type = '00000000606324b5ffffffffda634a10' -- 确定分类
    THEN '产品外包装样本'
    ELSE '其余外环境样本'
    END sample_type,city_id,count(sample_type) sample_total
from bs_environment group by sample_type,city_id ORDER BY sample_type ASC) oblt
left join sys_area sa on sa.KID = oblt.city_id) lt GROUP BY area_name,sample_type) gblt GROUP BY area_name;


select area,GROUP_CONCAT(site_type) site_type,GROUP_CONCAT(type_total) type_total from (select sd.NAME site_type,lt.type_total,sa.name area from (
            select site_type,city_id,count(site_type) type_total from bs_environment  group by site_type,city_id ORDER BY site_type ASC) lt
        left join sys_dict sd on sd.KID = lt.site_type
        left join sys_area sa on sa.KID = lt.city_id) gt group by area;

-- --------------------------------------------------------------------------------------

select entrance,area,count(entrance) total,SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area ORDER BY area DESC;
-- 分组了未sum()合计
select area,group_concat(entrance) entrance,group_concat(total) total,group_concat(risk) risk from (select entrance,area,total,SUM(CASE WHEN risk = 0 THEN 0 ELSE risk END) risk from (
    select entrance,
           area,count(entrance) total,
           SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area) fz group by entrance,area,total) ok group by area ORDER BY area DESC;
-- 分组了已sum()合计
select area,group_concat(entrance) entrance,group_concat(total) total,sum(risk) risk from (select entrance,area,total,SUM(CASE WHEN risk = 0 THEN 0 ELSE risk END) risk from (
    select entrance,
           area,count(entrance) total,
           SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area) fz group by entrance,area,total) ok group by area ORDER BY area DESC;

-- --------------------------------------------------------------------------------------



select name,entrance,count(risk) total,sum(risk) risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid) lt group by name,entrance,risk order by name DESC;

-- 再次分组!!!,order by 必须要放到最后面
select name,group_concat(entrance) entrance,group_concat(total) total,sum(risk) risk from (
    select entrance,name,count(entrance) total,SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (
    select bet.entrance,sa.name,risk from bs_environment bet
    left join bs_manage bme on bme.kid = bet.market_name
    left join sys_area sa on sa.kid = bet.city_id
    where risk = 1
    ) lt group by entrance,name
) gt group by name order by name DESC;
-- 再次分组!!!,order by 必须要放到最后面
select name,GROUP_CONCAT(entrance) entrance,GROUP_CONCAT(total) total,SUM(risk) risk from (
    select name,entrance,count(risk) total,sum(risk) risk from (
        select sa.name,bet.entrance,bme.risk from bs_environment bet
        left join bs_manage bme on bme.kid = bet.market_name
        left join sys_area sa on bet.city_id = sa.kid) lt group by name,entrance
) gt group by name order by name DESC;

-- 验证数据,OK
select count(city_id) t from (select city_id,sa.name,entrance,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) total where city_id = 520100000000 and risk = 1

-- 391,
-- risk=0,374
-- risk=1,17
-- entrance = 0,299
-- entrance = 1,92


select name,GROUP_CONCAT(entrance,',','中高风险地区') entrance,GROUP_CONCAT(total,',',risk) total from (select name,GROUP_CONCAT(entrance) entrance,GROUP_CONCAT(total) total,SUM(risk) risk from (
    select name,entrance,count(risk) total,sum(risk) risk from (
        select sa.name,
        CASE WHEN bet.entrance = 1
    THEN '进口'
    ELSE '国产'
    END entrance,
               bme.risk from bs_environment bet
        left join bs_manage bme on bme.kid = bet.market_name
        left join sys_area sa on bet.city_id = sa.kid) lt group by name,entrance
) gt group by name) tt group by name,total order by name DESC;


select kid from bs_environment where entrance = 1
union
select kid from bs_environment where entrance = 0
union
(
    select bet.kid from bs_environment bet
    left join bs_manage bme on bme.kid = bet.market_name
    where bet.entrance = 1 and risk = 1
)
union
(
    select bet.kid from bs_environment bet
    left join bs_manage bme on bme.kid = bet.market_name
    where bet.entrance = 0 and risk = 1
);
-- --------------------------------------表1 全省食品、外环境（含包装）及相关从业人员监测情况开始--------------------------------------
-- 步骤1
select sa.name,city_id,result,lt.type from (select bet.city_id,bet.result,'外环境样子' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'从业人员咽拭子' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid;

-- 步骤2
select name,
        sum(case when result = 2 then 1 else 0 end) negative,
		sum(case when result = 3 then 1 else 0 end) positive,
        type from (
    select sa.name,result,lt.type from (select bet.city_id,bet.result,'外环境样子' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'从业人员咽拭子' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid) lt group by name,type;

-- 步骤3
select name,group_concat(type) type,group_concat(negative) negative,group_concat(positive) positive from (select name,
        sum(case when result = 2 then 1 else 0 end) negative,
		sum(case when result = 3 then 1 else 0 end) positive,
        type from (
    select sa.name,result,lt.type from (select bet.city_id,bet.result,'外环境样子' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'从业人员咽拭子' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid) lt group by name,type order by type DESC) gt group by name;

-- 上面看错了，看成 阴性 和 阳性!!!，下面才是 检测份数 	阳性份数
-- 步骤1
select sa.name,
       sum(case when result != 1 then 1 else 0 end) total,
		sum(case when result = 3 then 1 else 0 end) positive,
       lt.type from (select bet.city_id,bet.result,2 type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,3 type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid group by sa.name,lt.type;
-- 步骤2,final,其中type=2是外环境样子;type=3是从业人员咽拭子;
select name,group_concat(total) total,group_concat(positive) positive,group_concat(type) type from (select sa.name,
        sum(case when result != 1 then 1 else 0 end) total,
	    sum(case when result = 3 then 1 else 0 end) positive,
        lt.type from (
            select bet.city_id,bet.result,2 type from bs_environment bet where result != 1 and flag = 1
            union all
            select bee.city_id,bee.result,3 type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid group by sa.name,lt.type order by lt.type) gt group by name order by name ASC;


















-- --------------------------------------表1 全省食品、外环境（含包装）及相关从业人员监测情况结束--------------------------------------

-- ****************************表3 不同来源食品监测情况开始****************************
-- 步骤1
select name,entrance,risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt;

-- 步骤2
select name,
        sum(case when entrance = 1 then 1 else 0 end) entrance,
	    sum(case when entrance = 0 then 1 else 0 end) domestic,
        sum(case when risk = 1 then 1 else 0 end) risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt group by name;

-- 步骤3
select name,entrance,domestic,risk from (select name,
        sum(case when entrance = 1 then 1 else 0 end) entrance,
	    sum(case when entrance = 0 then 1 else 0 end) domestic,
        sum(case when risk = 1 then 1 else 0 end) risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt group by name with rollup) gt order by name DESC;

-- 步骤3另外一种写法
select name, GROUP_CONCAT(entrance, ',', '中高风险地区') entrance, GROUP_CONCAT(total, ',', risk) total
from (select name, GROUP_CONCAT(entrance) entrance, GROUP_CONCAT(total) total, SUM(risk) risk
    from (
        select name, entrance, count(risk) total, sum(risk) risk
            from (
                select sa.name,
                     CASE WHEN bet.entrance = 1 THEN '进口' ELSE '国产' END entrance,
                     bme.risk
                     from bs_environment bet
                         left join bs_manage bme on bme.kid = bet.market_name
                         left join sys_area sa on bet.city_id = sa.kid
                     where bet.flag = 1
                ) lt
            group by name, entrance
        ) gt
    group by name) tt
group by name, total
order by name DESC

-- ****************************表3 不同来源食品监测情况结束****************************














