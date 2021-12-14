SELECT sampling_date,
            group_concat(name) name,
            group_concat(weijiance)weijiance,
            group_concat(yinxing) yinxing,
            group_concat(yangxing) yangxing,
            group_concat(total) total,
       sum(weijiance) totalWeijiance,
               sum(yinxing) totalYinxing,
               sum(yangxing) totalYangxing
       from (
                select
            name,
            sampling_date,
            sum(case when result = 1 then 1 else 0 end) weijiance,
            sum(case when result = 2 then 1 else 0 end) yinxing,
            sum(case when result = 3 then 1 else 0 end) yangxing,
            count(1) total from (select
            bee.result,
            sa.name,
            bee.sampling_date
        from bs_employee bee
        left join sys_area sa on sa.kid = bee.county_id
        where bee.flag = 1 and bee.area_level = 3 ) lt group by name,sampling_date) lt group by sampling_date;


select province_id,city_id,county_id from bs_crowd_total
left join sys_area province on province.kid




