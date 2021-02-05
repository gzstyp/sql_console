
select sd.NAME,sd.KID from bs_environment bet
left join sys_dict sd on bet.sample_type = sd.KID
where sd.KID = '00000000606324b5ffffffffda634a10'