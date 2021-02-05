select crowdName,group_concat(crowdType)crowdType,group_concat(masculine)masculine,group_concat(detection)detection,group_concat(sampling)sampling from (
        select crowdName,crowdType,masculine,detection,sampling from (select lt.masculine,lt.detection,lt.sampling,bc.name crowdName,bct.name crowdType from (select crowd_type_id,crowd_id,
        SUM(masculine_total) masculine,
        SUM(detection_total) detection,
        SUM(sampling_total) sampling
        from bs_crowd_total
        where crowd_date = '2020-12-21'
        group by crowd_type_id,crowd_id) lt
        left join bs_crowd bc on bc.kid = lt.crowd_id
        left join bs_crowd_type bct on bct.kid = lt.crowd_type_id)t order by crowdType ASC) gt group by crowdName;


select STR_TO_DATE('2020-12-220','%Y-%m-%d') T from dual;

