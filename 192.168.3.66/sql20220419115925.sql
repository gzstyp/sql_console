
select se.user_id from sys_user sur inner join share se on sur.invitation_code = se.code
where sur.kid = '0000000042b9966b000000002f95e85f' limit 1;

SELECT srn.id,srn.value_right from sys_user sur
INNER JOIN `share` se on sur.invitation_code = se.`code`
INNER JOIN share_relation srn on srn.user_id = se.user_id
WHERE sur.kid = '0000000077c5b8fbffffffffef04fec9';

select srn.id,srn.value_right from (select se.user_id from sys_user sur,share se where se.code = sur.invitation_code and sur.kid = '0000000077c5b8fbffffffffef04fec9') lt
inner join share_relation srn on srn.user_id = lt.user_id;

-- 我的下一级用户的呢？ok
SELECT sur.kid,sur.user_name,sur.add_date from `share` se
LEFT JOIN sys_user sur on sur.invitation_code = se.`code`
WHERE se.user_id = 'ffffffffcec638b8ffffffffe70520b4';
-- 我的团队推广人数|查找某节点的所有子孙节点。-ok
select * from share_relation where value_left > 1 and value_right < 14 and grandfather = '0000000042b9966b000000002f95e85f' order by value_left;

-- 计算某节点所处层级-ok
SELECT count(1) as total FROM share_relation where value_left <= 7 and value_right >= 8 and grandfather = '00000000344af1fc00000000380e1d2d';

-- 获取族谱路径-不含自己
SELECT id,name,parent_id,value_left,value_right FROM share_relation where value_left < 7 and value_right > 8 and grandfather = '00000000344af1fc00000000380e1d2d' order by value_left ASC;

-- 获取族谱路径-含自己,有=号就包含自己
SELECT id,name,parent_id,value_left,value_right FROM share_relation where value_left <= 7 and value_right >= 8 and grandfather = '00000000344af1fc00000000380e1d2d' order by value_left ASC
