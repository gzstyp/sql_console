select name,GROUP_CONCAT(profession) profession,GROUP_CONCAT(profession_total) profession_total from (
    select sa.name,sd.name profession,lt.profession_total from (
    select city_id,profession,count(profession) profession_total from bs_employee
    group by profession,city_id ORDER BY profession ASC) lt
left join sys_area sa on sa.kid = lt.city_id
left join sys_dict sd on sd.KID = lt.profession) gt group by name;


select area,GROUP_CONCAT(site_type) site_type,GROUP_CONCAT(type_total) type_total from (select sd.NAME site_type,lt.type_total,sa.name area from (
    select site_type,city_id,count(site_type) type_total from bs_environment group by site_type,city_id ORDER BY site_type ASC) lt
left join sys_dict sd on sd.KID = lt.site_type
left join sys_area sa on sa.KID = lt.city_id) gt group by area;





















