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


with recursive t_paths(id,name,path) as -- 定义表名 t_paths,其3个字段id,name,path
(
	select kid,name,cast(kid as char(51200)) p_path from sys_menu WHERE pid = '88888888888888888888888888888888' -- 初始化数据,查询父级的数据
	union all
	select e.kid,e.name,CONCAT(ep.path,',',e.kid) from t_paths as ep join sys_menu as e on ep.id = e.pid -- 开始我们的递归
)
select id,name,path from t_paths ORDER BY path;

with recursive t_cte(n) as
(
    select 1
    UNION ALL
    select n + 1 from t_cte -- 出现死循环,默认限制是1000次循环
)
SELECT * from t_cte;

show variables like 'cte_max%';

-- 窗口函数|也叫分析函数

-- 使用聚合函数来统计
select country,sum(profit) as country_profit FROM sales GROUP BY country order by country;
/*
		Finland	1610.00
		India	1350.00
		USA	4505.00
*/
-- 使用窗口函数或分析函数来统计,它会保留原来的数据
-- 窗口函数|也叫分析函数,因为只做分析使用所以叫分析函数,是基于关键字 OVRE 也就是 基于什么样的分组来计算
SELECT year,country,product,profit,
SUM(profit) OVER (partition by country) as country_profit -- todo 基country,总和 sum函数,partition by是用于分区
from sales order by country,year,product,profit;

SELECT year,country,product,profit,
avg(profit) OVER (partition by country) as country_avg -- todo 基country,平均值 avg函数,partition by是用于分区
from sales order by country,year,product,profit;

-- 在整个数据集的排名
select val,row_number() over (order by val) as rowNumber from numbers; -- partition by 选填

-- 排名第一的值是多少
select val,first_value(val) over (order by val) as first from numbers;

select
   val, -- 原始数据
   last_value(val) over (order by val) as first, -- 排名当中的第1名
   lead(val,3) over (order by val) as ld -- 前面的函数,往前的函数的相对应第1名称
from numbers;

select val,ntile(4) over (order by val) from numbers;

# 1.递归，查询本级以及所有下级
WITH RECURSIVE temp as (
    SELECT t.* FROM t_dept t WHERE id = 0
    UNION ALL
    SELECT t.* FROM t_dept t INNER JOIN temp ON t.pid = temp.id
)
SELECT * FROM temp;

# 2.递归，查询所有下级
WITH RECURSIVE temp as (
    SELECT t.* FROM t_dept t WHERE id = 0 -- 指定父节点
    UNION ALL
    SELECT t.* FROM t_dept t INNER JOIN temp ON t.pid = temp.id
)
SELECT * FROM temp WHERE id != 0; -- 排除父节点

# 3.递归，查询本级及所有直属上级
WITH RECURSIVE temp as (
    SELECT t.* FROM t_dept t WHERE id = 8
    UNION ALL
    SELECT t.* FROM t_dept t INNER JOIN temp ON t.id = temp.pid
)
SELECT * FROM temp;

# 4.递归，查询所有直属上级，把本机的过滤掉即可
WITH RECURSIVE temp as (
    SELECT t.* FROM t_dept t WHERE id = 8 -- 指定本级
    UNION ALL
    SELECT t.* FROM t_dept t INNER JOIN temp ON t.id = temp.pid
)
SELECT * FROM temp  WHERE id != 8;-- 排除本级
