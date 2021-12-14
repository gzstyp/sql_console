
with tags as (select user_id from legal_relation where case_id = '000000002471db050000000018e12c02')
select su.user_name from sys_user su
inner join tags on tags.user_id = su.kid;

with tags as (
    select lr.case_id,lc.add_date,if(mc.agreement is null,1,mc.agreement) agreement,0 execution,if(mc.user_id is null,lc.user_id,mc.user_id) userId
    from legal_relation lr
    inner join legal_case lc on lc.kid = lr.case_id and lr.user_id = 'ffffffffcdd39bcbffffffffb2185d25'
    LEFT JOIN my_case mc on mc.case_id = lr.case_id where lr.user_id = 'ffffffffcdd39bcbffffffffb2185d25' and lr.flag = 2
    union
    select lc.kid,lc.add_date,mc.agreement,1 execution,null from legal_case lc
    left join my_case mc on mc.case_id = lc.kid where lc.user_id = 'ffffffffcdd39bcbffffffffb2185d25'
)
select tags.* from legal_case lc
right join tags on tags.case_id = lc.kid