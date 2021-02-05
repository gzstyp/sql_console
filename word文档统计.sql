select county_id,profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' and province_id = 52 group by profession,county_id;

-- 咽拭子样本的区域
select t.*,sa.name from (select county_id,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by county_id ) t
left join sys_area sa on sa.kid = t.county_id;


-- 咽拭子样本的工种
select profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by profession;

select t.*,sd.NAME from (select profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by profession) t
left join sys_dict sd on sd.kid = t.profession;


select county_id,profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by county_id,profession;

select sd.NAME from bs_employee bee left join sys_dict sd on sd.KID = bee.profession group by sd.NAME;


select lt.county_id,lt.profession,lt.total,sa.name,sd.NAME from (select county_id,profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by county_id,profession)lt
left join sys_area sa on sa.kid = lt.county_id
left join sys_dict sd on sd.kid = lt.profession;

-- 从业人员检测-ok
select areaName,group_concat(NAME) profession,group_concat(total) num,SUM(lt.total) total from (select sa.name areaName,sd.NAME,lt.total from (select county_id,profession,count(kid) total from bs_employee where sample_type = '000000002984f53dffffffffed100cb4' group by county_id,profession)lt
left join sys_area sa on sa.kid = lt.county_id
left join sys_dict sd on sd.kid = lt.profession) lt group by areaName order by areaName;







