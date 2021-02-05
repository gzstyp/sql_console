
表1 全省食品、外环境（含包装）及相关从业人员监测情况 

食品样本_外环境样子_从业人员咽拭子

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
left join sys_area sa on lt.city_id = sa.kid) lt group by name,type) gt group by name