-- 区域日报,区域，一个是日期

select
    crowdType,
    crowdName,
    nameCounty,
    sampling,
    detection,
    masculine
from (
    select
        bcte.name crowdType,
        bcd.name crowdName,
        county.name nameCounty,
        SUM(sampling_total) sampling,
        SUM(detection_total) detection,
        SUM(masculine_total) masculine
    from bs_crowd_total bct
    left join bs_crowd bcd on bcd.kid = bct.crowd_id
    left join bs_crowd_type bcte on bcte.kid = bct.crowd_type_id
    left join sys_area county on county.kid = bct.county_id
    where flag = 1 AND crowd_date = '2020-12-18' -- 不需要传入 county_id 匹配查询
group by bcte.name,bcd.name,nameCounty) sx;

-- final
select
    nameCounty,
    group_concat(concat(crowdName,crowdType)) as crowdName,
    group_concat(crowdType) as crowdType,
    group_concat(sampling) as sampling,
    group_concat(detection) as detection,
    group_concat(masculine) as masculine,
    SUM(sampling) totalSampling,
    SUM(detection) totalDetection,
    SUM(masculine) totalMasculine
from (
    select
        bcte.name crowdType,
        bcd.name crowdName,
        county.name nameCounty,
        SUM(sampling_total) sampling,
        SUM(detection_total) detection,
        SUM(masculine_total) masculine
    from bs_crowd_total bct
    left join bs_crowd bcd on bcd.kid = bct.crowd_id
    left join bs_crowd_type bcte on bcte.kid = bct.crowd_type_id
    left join sys_area county on county.kid = bct.county_id
    where flag = 1 AND crowd_date = '2020-12-18' -- 不需要传入 county_id 匹配查询
group by bcte.name,bcd.name,nameCounty) sx group by nameCounty;






select name from sys_area where pid = 520300000000 and  name != '市辖区' and level = 3



select lt.permission,sm.url from (select sm.pid,sm.permission,sm.url
        from (
        select srm.menu_id from sys_user_role sur
        left join sys_role_menu srm on srm.role_id = sur.role_id
        where sur.user_id = 'ffffffff80b5f243000000003f3ea7e3'
        union
        select menu_id from sys_user_menu sum where user_id = 'ffffffff80b5f243000000003f3ea7e3')lt,
             sys_menu sm where lt.menu_id = sm.kid
        ) lt,sys_menu sm
where sm.pid = lt.pid and sm.url = 'areaday/queryareaselect';








