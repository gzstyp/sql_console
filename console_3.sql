update bs_environment be set result = CASE WHEN result = 2 THEN 2 ELSE 3 END where kid = '0000000077158d5fffffffffd6e8dbf9';

update bs_environment be set result = CASE  WHEN result = 2 THEN 2 ELSE be.result END,result = CASE  WHEN result = 2 THEN 2 ELSE be.result END;






update bs_environment be          set result = CASE  WHEN result = ? THEN ? ELSE be.result end;


update bs_environment be          set result = CASE  WHEN result = ? THEN ? ELSE be.result end,result = CASE WHEN result = ? THEN ? ELSE be.result end

update bs_environment be set result = CASE  WHEN result = ? THEN ? ELSE be.result end,
                             result = CASE  WHEN result = ? THEN ? ELSE be.result end,
                             result = CASE  WHEN result = ? THEN ? ELSE be.result end
where kid in (?,?,?)


update bs_environment be set result = 1 where kid = '';update bs_environment be set result = 1 where kid = ''


