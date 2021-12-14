
-- 能实现,但是太慢了!!! ----------------------------------------------------------------------

select kid,name,(select count(sa.kid) from sys_area sa where sa.pid = s.kid) total,level from sys_area s where pid = 0 ORDER BY kid;

select  a.*,(select case when count(1)>0 then 'true' else 'false' end  from sys_area b where a.kid=b.pid
) as  isParent from sys_area a where a.pid=52 ORDER BY a.kid ASC

-- 能实现,但是太慢了!!! ----------------------------------------------------------------------

-- 速度明显快了很多!!!----------------------------------------------------------------------

select    
	a.kid,
	a.name,
	a.pid,
	a.type,
	a.level,case when isParent>0 then 'true' else 'false' end isParent from 
(select  
	a.kid,
	a.name,
	a.pid,
	a.type,
	a.level,
count(b.kid) as isParent from sys_area a left join 
sys_area b on a.kid=b.pid
where a.pid=310114103000  group by a.kid,
a.name,
a.pid,
a.type,
a.level) a

select kid,name,pid,level,case when isParent > 0 then 'true' else 'false' end isParent from
(
    select a.kid,a.name,a.pid,a.level,count(b.kid) as isParent from sys_area a
    left join
    sys_area b on a.kid = b.pid where a.pid = 0 group by a.kid,a.name,a.pid,a.level
)
a ORDER BY a.kid ASC;



-- final-原理是仅需判断是否还有子菜单即可
梁林写的-推荐,创建索引后这个更快,参考执行计划得出结论!!!
select s.kid,s.name,s.pid,s.level,case when count(sa.kid) > 0 then 'true' else 'false' end isParent from sys_area s
left join
sys_area sa on s.kid = sa.pid where s.pid = 0 group by s.kid,s.name,s.pid,s.level ORDER BY s.kid ASC;
-- 速度明显快了很多!!!----------------------------------------------------------------------

我自己写的
select saa.kid,saa.name,saa.pid,saa.level,gt.total,if(gt.total > 0,'true','false') isParent from sys_area saa
left join (select pid,count(pid)total from sys_area group by pid) gt on gt.pid = saa.kid
where saa.pid = 0;
