



create view view_user_login as
select `su`.`kid` AS `kid`, `su`.`user_name` AS `username`, `sup`.`user_password` AS `password`, `su`.`enabled` AS `enabled`
from (`authserver`.`sys_user` `su`
     join `authserver`.`sys_user_password` `sup`)
where (`su`.`kid` = `sup`.`user_id`);

