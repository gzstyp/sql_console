select crowdName, group_concat(crowdType) crowdType, group_concat(masculine) masculine, group_concat(detection) detection, group_concat(sampling) sampling
from (select crowdName, crowdType, masculine, detection, sampling
      from (select lt.masculine, lt.detection, lt.sampling, bc.name crowdName, bct.name crowdType
            from (select crowd_type_id, crowd_id,
                         SUM(masculine_total) masculine,
                         SUM(detection_total) detection,
                         SUM(sampling_total) sampling
            from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id) lt
                 left join bs_crowd bc on bc.kid = lt.crowd_id
                 left join bs_crowd_type bct on bct.kid = lt.crowd_type_id) t
      order by crowdType ASC) gt
group by crowdName;
-- 按日期+分类统计
select lt.crowd_date,bc.name crowdName,bct.name crowdType,masculine,detection,sampling from (select
       crowd_type_id,
       crowd_id,
       crowd_date,
       SUM(masculine_total) masculine,
       SUM(detection_total) detection,
       SUM(sampling_total) sampling
from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id,crowd_date) lt
left join bs_crowd bc on bc.kid = lt.crowd_id
left join bs_crowd_type bct on bct.kid = lt.crowd_type_id;





-- 按日期+分类统计
select lt.crowd_date,bc.name crowdName,
       group_concat(bct.name) crowdType, group_concat(masculine) masculine, group_concat(detection) detection, group_concat(sampling) sampling
       from (
           select
           crowd_type_id,
           crowd_id,
           crowd_date,
           SUM(masculine_total) masculine,
           SUM(detection_total) detection,
           SUM(sampling_total) sampling
from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id,crowd_date) lt
left join bs_crowd bc on bc.kid = lt.crowd_id
left join bs_crowd_type bct on bct.kid = lt.crowd_type_id group by crowdName,crowd_date ORDER BY lt.crowd_date;


select crowd_date,
       group_concat(crowdName SEPARATOR '|') crowdName,
       group_concat(crowdType SEPARATOR '|') crowdType,
       group_concat(masculine SEPARATOR '|') masculine,
       group_concat(detection SEPARATOR '|') detection,
       group_concat(sampling SEPARATOR '|') sampling,
       group_concat(totalMasculine SEPARATOR '|') totalMasculine,
       group_concat(totalDetection SEPARATOR '|') totalDetection,
       group_concat(totalSampling SEPARATOR '|') totalSampling

from (select lt.crowd_date,bc.name crowdName,
       group_concat(bct.name) crowdType,
             group_concat(masculine) masculine,
             group_concat(detection) detection,
             group_concat(sampling) sampling,
             sum(masculine) totalMasculine,
           sum(detection) totalDetection,
           sum(sampling) totalSampling
       from (
           select
           crowd_type_id,
           crowd_id,
           crowd_date,
           SUM(masculine_total) masculine,
           SUM(detection_total) detection,
           SUM(sampling_total) sampling
from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id,crowd_date) lt
left join bs_crowd bc on bc.kid = lt.crowd_id
left join bs_crowd_type bct on bct.kid = lt.crowd_type_id group by crowdName,crowd_date) lt group by crowd_date ORDER BY crowd_date;


select lt.crowd_date,
       bc.name crowdName,
       group_concat(bct.name) crowdType,
       group_concat(sampling) sampling,
       group_concat(detection) detection,
       group_concat(masculine) masculine,
       sum(masculine) totalMasculine,
       sum(detection) totalDetection,
       sum(sampling) totalSampling
       from (
           select
           crowd_type_id,
           crowd_id,
           crowd_date,
           SUM(masculine_total) masculine,
           SUM(detection_total) detection,
           SUM(sampling_total) sampling
from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id,crowd_date) lt
left join bs_crowd bc on bc.kid = lt.crowd_id
left join bs_crowd_type bct on bct.kid = lt.crowd_type_id group by crowdName,crowd_date ORDER BY lt.crowd_date;


select
   crowd_date,
   SUM(masculine_total) masculine,
   SUM(detection_total) detection,
   SUM(sampling_total) sampling
from bs_crowd_total where flag = 1 group by crowd_type_id, crowd_id,crowd_date;

-- 1.1中高风险地区入黔返黔人员核酸检测统计汇总表_按日期+区域统计
select count(kid) total,
        sum(case when result = 1 then 1 else 0 end) weijiance,
        sum(case when result = 2 then 1 else 0 end) yinxing,
        sum(case when result = 3 then 1 else 0 end) yangxing
        from bs_employee bee where bee.flag = 1 and bee.county_id = 520111000000;

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
where bee.flag = 1 and bee.area_level = 3) lt group by name,sampling_date ORDER BY sampling_date ASC;

SELECT sampling_date,
       group_concat(name) name,
       group_concat(weijiance)weijiance,
       group_concat(yinxing) yinxing,
       group_concat(yangxing) yangxing,
       group_concat(total) total from (select
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
where bee.flag = 1 and bee.area_level = 3 and bee.county_id = 520111000000) lt group by name,sampling_date) lt group by sampling_date;

/*
 西秀区
花溪区
息烽县
开阳县
平坝区
南明区
凯里市
修文县
云岩区
乌当区
 */



