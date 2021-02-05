
-- --------------------------------------��1 ȫʡʳƷ���⻷��������װ������ش�ҵ��Ա������--------------------------------------
-- ����1
select name,entrance,risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt;

-- ����2
select name,
    sum(case when entrance = 1 then 1 else 0 end) entrance,
	sum(case when entrance = 0 then 1 else 0 end) domestic,
    sum(case when risk = 1 then 1 else 0 end) risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt group by name;

-- ����3
select name,entrance,domestic,risk from (select name,
    sum(case when entrance = 1 then 1 else 0 end) entrance,
	sum(case when entrance = 0 then 1 else 0 end) domestic,
    sum(case when risk = 1 then 1 else 0 end) risk from (select sa.name,bet.entrance,bme.risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
left join sys_area sa on bet.city_id = sa.kid where bet.flag = 1) lt group by name with rollup) gt order by name DESC;

-- ���,entrance����;domestic����;risk�и߷��յ���
name	  entrance	  domestic	 risk
������	  92	      298	     17
�Ͻ���	  1	          3	         0
����ˮ��  0     	  2	         0
	      93	      303	     17

-------------------------------------------------------�����ķָ���-------------------------------------------------------

select name, GROUP_CONCAT(entrance, ',', '�и߷��յ���') entrance, GROUP_CONCAT(total, ',', risk) total
from (select name, GROUP_CONCAT(entrance) entrance, GROUP_CONCAT(total) total, SUM(risk) risk
    from (
        select name, entrance, count(risk) total, sum(risk) risk
            from (
                select sa.name,
                     CASE WHEN bet.entrance = 1 THEN '����' ELSE '����' END entrance,
                     bme.risk
                     from bs_environment bet
                         left join bs_manage bme on bme.kid = bet.market_name
                         left join sys_area sa on bet.city_id = sa.kid
                     where bet.flag = 1
                ) lt
            group by name, entrance
        ) gt
    group by name) tt
group by name, total
order by name DESC
-- ���
name	     entrance	              total
������	     ����,����,�и߷��յ���	  298,92,17
�Ͻ���	     ����,����,�и߷��յ���	  3,1,0
����ˮ��	 ����,�и߷��յ���	      2,0
