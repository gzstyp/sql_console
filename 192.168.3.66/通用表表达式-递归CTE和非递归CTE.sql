-- with 子句
-- 派生表
select * from (select 1 ) as dt;

-- 通用表表达式:使用with,给它定义一个(变量或表达式)名称,然后在后面使用它,即 select * from 该名称

with dt as (select 1) select * from dt;

-- 引用前面定义的变量,可以理解为编程功能的扩展
with cte1(id) as (select 1),cte2(kid) as (select id+1 from cte1) -- 直接引用前面定义好的变量 cte1表名.id是字段名,也就是前面的通用表定义好了之后,可直接在后面使用(的字段),
-- 当然也可以定义cte3或一直定义下去；完成定义之后再使用他们,可以重复使用前面已定义好的内容字段
select * from cte1 join cte2 -- 交叉连接,即笛卡尔集

-- 使用,其中 cte 是定义了一个表的名称,v是表cte的字段名
with recursive cte(v) as -- cte 是定义了一个表的名称,v是字段名
	(
		select 1 -- 递归的初始化
		UNION all -- 开始我们的递归
		select v+1 from cte where v < 5 -- 查询条件,v是字段名,提现了递归调用的概念
	)
select * from cte;-- cte 是表的名称

select kid, name,pid from sys_menu;

with recursive employee_paths(id,name,path) as (
    select id,name cast(id as char(200))-- 初始化
    from sys_menu where pid = '88888888888888888888888888888888'
    union all

)

