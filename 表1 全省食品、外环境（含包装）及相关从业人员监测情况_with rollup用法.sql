
-- --------------------------------------表1 全省食品、外环境（含包装）及相关从业人员监测情况--------------------------------------
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

-- 结果,entrance进口;domestic国产;risk中高风险地区
name	  entrance	  domestic	 risk
贵阳市	  92	      298	     17
毕节市	  1	          3	         0
六盘水市  0     	  2	         0
	      93	      303	     17

-------------------------------------------------------华丽的分隔线-------------------------------------------------------

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
-- 结果
name	     entrance	              total
贵阳市	     国产,进口,中高风险地区	  298,92,17
毕节市	     国产,进口,中高风险地区	  3,1,0
六盘水市	 国产,中高风险地区	      2,0
