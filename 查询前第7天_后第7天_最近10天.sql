
https://www.cnblogs.com/awzf/p/9987526.html

-- 7天之前
select DATE_FORMAT(DATE_SUB(NOW(),INTERVAL 7 DAY),'%Y-%m-%d') subday7;
-- 7天之后
select DATE_FORMAT(DATE_ADD(SYSDATE(),INTERVAL 7 DAY),'%Y-%m-%d') addday7;

-- 近10天的信息记录
SELECT kid,sampling_date,result,DATE_SUB(CURDATE(),INTERVAL 10 DAY) t,CURDATE() now
FROM bs_environment where DATE_SUB(CURDATE(),INTERVAL 10 DAY) <= date(sampling_date) order by sampling_date;