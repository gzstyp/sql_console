-- 确定表，确定连接条件，确定连接类型

select mv.location_id,mv.volume,mv.device_flag from monitor_value mv;

select mv.location_id,mv.volume,mv.device_flag,se.name siteName,ln.longs lng,ln.lat from monitor_value mv
left join location ln on ln.kid = mv.location_id
left join site se on se.kid = ln.site_id;

-- 首页的右边表格数据
select se.name siteName,mv.volume,mv.create_time from monitor_value mv
left join location ln on ln.kid = mv.location_id
left join site se on se.kid = ln.site_id
where ln.site_id = '' and ln.county_id in ('')
order by mv.create_time desc limit 100;


select location_id from monitor_value mv group by mv.location_id;


select se.kid from site se;

select ln.site_id,avg() from location ln group by ln.site_id;

select mv.volume,mv.device_flag,ln.kid,ln.site_id from location ln
left join monitor_value mv on mv.location_id = ln.kid;

select mv.volume,mv.location_id from monitor_value mv order by mv.create_time desc;

select lt.site_id from (select ln.site_id from monitor_value mv
left join location ln on ln.kid = mv.location_id
group by ln.site_id) lt;




select lt.location_id,max,mv.volume,ln.site_id,se.lng,se.lat from (
    select mv.location_id,max(mv.create_time) max from monitor_value mv group by mv.location_id) lt
left join monitor_value mv on mv.location_id = lt.location_id and lt.max = mv.create_time
left join location ln on ln.kid = mv.location_id
left join site se on se.kid = ln.site_id;

-- ok
select se.name siteName,avg(mv.volume) count,se.lng,se.lat from (
    select mv.location_id,max(mv.create_time) max from monitor_value mv group by mv.location_id) lt
left join monitor_value mv on mv.location_id = lt.location_id and lt.max = mv.create_time
left join location ln on ln.kid = mv.location_id
left join site se on se.kid = ln.site_id
where se.kid = '0000000049752e4bffffffffd59c6bab' and ln.county_id = '520102000000'
group by se.name,se.lng,se.lat having avg(mv.volume) >= 40 and avg(mv.volume) < 50 limit 30;


select s.kid,s.name,s.pid,case when count(sa.kid) > 0 then 'true' else 'false' end isParent from sys_dept s
    left join sys_dept sa on s.kid = sa.pid
    where s.pid = '0000000009d0922d000000000d08cbea' group by s.kid,s.name,s.pid ORDER BY S.kid ASC;


select ky,ve from params where ky in ('overproof','severityover','overbreak');

select GROUP_CONCAT(ky) ky,GROUP_CONCAT(ve) ve from params where ky in ('overproof','severityover');


