
--------------------------------------------------------------˼·���ٷ���--------------------------------------------------------------

--ԭ����
select entrance,area,count(entrance) total,SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area ORDER BY area DESC;


-- �ٴη���!!!,order by ����Ҫ�ŵ������
select name,group_concat(entrance) entrance,group_concat(total) total,sum(risk) risk from (
    select entrance,name,count(entrance) total,SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from ( -- ��Ϊrisk�����������
    select bet.entrance,sa.name,risk from bs_environment bet
    left join bs_manage bme on bme.kid = bet.market_name
    left join sys_area sa on sa.kid = bet.city_id) lt group by entrance,name
) gt group by name order by name DESC;


-- �ٴη���!!!,order by ����Ҫ�ŵ������
select name,GROUP_CONCAT(entrance) entrance,GROUP_CONCAT(total) total,SUM(risk) risk from ( -- ��Ϊrisk�����������
        select name,entrance,count(risk) total,sum(risk) risk from (
            select sa.name,bet.entrance,bme.risk from bs_environment bet
            left join bs_manage bme on bme.kid = bet.market_name
            left join sys_area sa on bet.city_id = sa.kid) lt group by name,entrance
) gt group by name order by name DESC;

-- ������δsum()�ϼ�
select area,group_concat(entrance) entrance,group_concat(total) total,group_concat(risk) risk from (select entrance,area,total,SUM(CASE WHEN risk = 0 THEN 0 ELSE risk END) risk from (
    select entrance,
           area,count(entrance) total,
           SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area) fz group by entrance,area,total) ok group by area ORDER BY area DESC;
-- ��������sum()�ϼ�
select area,group_concat(entrance) entrance,group_concat(total) total,sum(risk) risk from (select entrance,area,total,SUM(CASE WHEN risk = 0 THEN 0 ELSE risk END) risk from (
    select entrance,
           area,count(entrance) total,
           SUM(CASE WHEN risk = 1 THEN 1 ELSE 0 END) risk from (select entrance,sa.name area,risk from (select bet.entrance,bet.city_id,risk from bs_environment bet
left join bs_manage bme on bme.kid = bet.market_name
) lt
left join sys_area sa on sa.KID = lt.city_id order by entrance DESC) lg group by entrance,area) fz group by entrance,area,total) ok group by area ORDER BY area DESC;

select name,GROUP_CONCAT(entrance,',','�и߷��յ���') entrance,GROUP_CONCAT(total,',',risk) total from (select name,GROUP_CONCAT(entrance) entrance,GROUP_CONCAT(total) total,SUM(risk) risk from (
        select name,entrance,count(risk) total,sum(risk) risk from (
        select sa.name,
        CASE WHEN bet.entrance = 1 THEN '����' ELSE '����' END entrance,
        bme.risk from bs_environment bet
        left join bs_manage bme on bme.kid = bet.market_name
        left join sys_area sa on bet.city_id = sa.kid
        <trim prefix="WHERE" prefixOverrides="AND">
            <if test="sampling_date_start != null">
                <![CDATA[ AND sampling_date >= #{sampling_date_start} ]]>
            </if>
            <if test="sampling_date_end != null">
                <![CDATA[ AND sampling_date <= #{sampling_date_end} ]]>
            </if>
        </trim>
        ) lt group by name,entrance
        ) gt group by name) tt group by name,total order by name DESC