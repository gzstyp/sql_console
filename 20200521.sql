select  td.invoices_code,td.item_code,td.item_name,td.item_total,td.item_storage_code,sp.point from task_detail td left join
task  tk on tk.kid = td.task_id
left join storage_point sp on sp.item_storage_code = td.item_storage_code
for update;

select td.invoices_code,td.item_code,td.item_name,td.item_total,td.item_storage_code,sp.point from task_detail td
left join storage_point sp on sp.item_storage_code = td.item_storage_code;

select kid, invoices_code, type, total from task where status = 1;

select invoices_code, item_code, item_name, item_total, item_storage_code from task_detail where falg = 0 for update;


select * from (
    select
tk.kid,
tk.invoices_code,
tk.type,
tk.total,
tk.status,
td.invoices_code,
td.item_code,
td.item_name,
td.item_total,
td.item_storage_code,
sp.point
from task tk
left join task_detail td on tk.kid = td.task_id
left join storage_point sp on sp.item_storage_code = td.item_storage_code
where tk.status = 1 ) lt
left join
(select tdl.kid from task_detail tdl where tdl.item_code = '1024' and tdl.invoices_code = '8888888888' and tdl.status = 1 ) rt;














select      lt.task_id,
            lt.invoices_code,
            lt.item_code,
            lt.item_name,
            lt.item_total,
            lt.item_storage_code,
            lt.point,
            rt.kid userId
        from (
        select
               td.task_id,
            td.invoices_code,
            td.item_code,
            td.item_name,
            td.item_total,
            td.item_storage_code,
            td.kid flag,
            sp.point
        from task tk
        left join task_detail td on tk.kid = td.task_id
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where tk.status = 1) lt
        left join
        (select tdl.kid from task_detail tdl where tdl.item_code = '1024' and tdl.invoices_code = '8888888888' and tdl.status = 1) rt on lt.flag = rt.kid;


select


            td.task_id,
            td.invoices_code,
            td.item_code,
            td.item_name,
            td.item_total,
            td.item_storage_code,
            sp.point
        from task tk
        left join task_detail td on tk.kid = td.task_id
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where tk.status = 1;


select
       td.kid,
       td.invoices_code,
       td.item_code,
       td.item_name,
       td.item_total,
       td.item_storage_code,
       sp.point
from task_detail td
left join storage_point sp on sp.item_storage_code = td.item_storage_code
where td.status = 1 and td.falg = 0;

        select
            lt.task_id,
            lt.invoices_code,
            lt.item_code,
            lt.item_name,
            lt.item_total,
            lt.item_storage_code,
            lt.point,
            rt.kid userId
        from (
        select
            td.task_id,
            td.invoices_code,
            td.item_code,
            td.item_name,
            td.item_total,
            td.item_storage_code,
            td.kid flag,
            sp.point
        from task tk
        left join task_detail td on tk.kid = td.task_id
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where tk.status = 1) lt
        left join
        (select tdl.kid from task_detail tdl where tdl.item_code = '#{item_code}' and tdl.invoices_code = '#{invoices_code}'  and tdl.status = 1) rt;

;

select lt.kid,
       lt.invoices_code,
       lt.item_code,
       lt.item_name,
       lt.item_total,
       lt.item_storage_code,
       lt.point,
       rt.kid userId
           from (
    select
       td.kid,
       td.invoices_code,
       td.item_code,
       td.item_name,
       td.item_total,
       td.item_storage_code,
       sp.point
from task_detail td
left join storage_point sp on sp.item_storage_code = td.item_storage_code
where td.status = 1) lt
left join
(select tdl.kid from task_detail tdl where tdl.item_code = '1024' and tdl.invoices_code = '8888888888'  and tdl.status = 1 and tdl.falg = 1) rt on lt.kid = rt.kid



;












        select lt.kid,
           lt.invoices_code,
           lt.item_code,
           lt.item_name,
           lt.item_total,
           lt.item_storage_code,
           lt.point,
           rt.kid userId
        from (
        select
           td.kid,
           td.invoices_code,
           td.item_code,
           td.item_name,
           td.item_total,
           td.item_storage_code,
           sp.point
        from task_detail td
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where td.status = 1 and td.falg = 0) lt
        left join
        (select tdl.kid from task_detail tdl where tdl.item_code = 'IN202004130002' and tdl.invoices_code = 'WZ478455444001' and tdl.status = 1 and tdl.falg = 1) rt on lt.kid = rt.kid






select falg from task_detail where kid = 'fffffffffa1c4052000000007c98592b' LIMIT 1;

select
           td.kid,
           td.invoices_code,
           td.item_code,
           td.item_name,
           td.item_total,
           td.item_storage_code,
           sp.point
        from task_detail td
        left join storage_point sp on sp.item_storage_code = td.item_storage_code
        where td.status = 1 and td.falg = 0;


select lt.kid,
       lt.falg,
           lt.invoices_code,
           lt.item_code,
           lt.item_name,
           lt.item_total,
           lt.item_storage_code,
           lt.point,
           rt.kid userId
        from (
        select
           td.kid,
           td.falg,
           td.invoices_code,
           td.item_code,
           td.item_name,
           td.item_total,
           td.item_storage_code,
           sp.point
        from task_detail td
        left join storage_point sp on sp.item_storage_code = td.item_storage_code) lt
        left join
        (select tdl.kid from task_detail tdl where tdl.kid = 'ffffffff8e3783400000000028b582c4' and tdl.falg = 1) rt on lt.kid = rt.kid









