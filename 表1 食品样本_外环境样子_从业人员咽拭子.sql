
��1 ȫʡʳƷ���⻷��������װ������ش�ҵ��Ա������ 

ʳƷ����_�⻷������_��ҵ��Ա������

-- ����1
select sa.name,city_id,result,lt.type from (select bet.city_id,bet.result,'�⻷������' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'��ҵ��Ա������' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid;

-- ����2
select name,
        sum(case when result = 2 then 1 else 0 end) negative,
		sum(case when result = 3 then 1 else 0 end) positive,
        type from (
    select sa.name,result,lt.type from (select bet.city_id,bet.result,'�⻷������' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'��ҵ��Ա������' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid) lt group by name,type;

-- ����3
select name,group_concat(type) type,group_concat(negative) negative,group_concat(positive) positive from (select name,
        sum(case when result = 2 then 1 else 0 end) negative,
		sum(case when result = 3 then 1 else 0 end) positive,
        type from (
    select sa.name,result,lt.type from (select bet.city_id,bet.result,'�⻷������' type from bs_environment bet where result != 1 and flag = 1
union all
select bee.city_id,bee.result,'��ҵ��Ա������' type from bs_employee bee where result != 1 and flag = 1) lt
left join sys_area sa on lt.city_id = sa.kid) lt group by name,type) gt group by name