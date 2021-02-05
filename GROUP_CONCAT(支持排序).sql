-- 未带省市区,GROUP_CONCAT(支持排序)
select type,GROUP_CONCAT(sampling_date ORDER BY sampling_date ASC)sampling_date,GROUP_CONCAT(total)total from (select type,sampling_date,total from (SELECT sampling_date,count(kid) total,'外环境' type FROM bs_environment where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date
union all
SELECT sampling_date,count(kid) total,'从业人员' type FROM bs_employee where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date
union all
select crowd_date,sum(sampling_total) total,'核酸日报' type from bs_crowd_total where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(crowd_date)
group by crowd_date) lt order by type) lt group by type;

-- 带省市县，ok
select type,sampling_date,sum(total) total from (select type,sampling_date,total,province_id,city_id,county_id from (SELECT sampling_date,count(kid) total,'外环境' type,province_id,city_id,county_id FROM bs_environment where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date,province_id,city_id,county_id
union all
SELECT sampling_date,count(kid) total,'从业人员' type,province_id,city_id,county_id FROM bs_employee where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date,province_id,city_id,county_id
union all
select crowd_date,sum(sampling_total) total,'核酸日报' type,province_id,city_id,county_id from bs_crowd_total where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(crowd_date)
group by crowd_date,province_id,city_id,county_id) lt group by type,sampling_date,total,province_id,city_id,county_id) lt
where province_id = 52 and city_id = 520100000000 group by type,sampling_date order by type;

-- 带省市县,final
select type,GROUP_CONCAT(sampling_date ORDER BY sampling_date ASC)sampling_date,GROUP_CONCAT(total)total from (select type,sampling_date,sum(total) total from (select type,sampling_date,total,province_id,city_id,county_id from (SELECT sampling_date,count(kid) total,'外环境' type,province_id,city_id,county_id FROM bs_environment where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date,province_id,city_id,county_id
union all
SELECT sampling_date,count(kid) total,'从业人员' type,province_id,city_id,county_id FROM bs_employee where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(sampling_date)
group by sampling_date,province_id,city_id,county_id
union all
select crowd_date,sum(sampling_total) total,'核酸日报' type,province_id,city_id,county_id from bs_crowd_total where DATE_SUB(CURDATE(),INTERVAL 7 DAY) < date(crowd_date)
group by crowd_date,province_id,city_id,county_id) lt group by type,sampling_date,total,province_id,city_id,county_id) lt
where province_id = 52 and city_id = 520100000000 group by type,sampling_date) lt group by type;