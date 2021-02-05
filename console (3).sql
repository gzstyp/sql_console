select `su`.`kid` AS `kid`, `sup`.`user_password` AS `user_password`, `su`.`user_name` AS `user_name`
from (`sys_user` `su`
     join `sys_user_password` `sup`)
where (`su`.`kid` = `sup`.`user_id`);











