
SELECT lt.menu_id FROM (
SELECT srm.menu_id,srm.role_id FROM sys_role_menu srm WHERE srm.role_id = '000000000c9ac38fffffffffb8ae4eb3') lt
LEFT JOIN sys_user_role sur ON lt.role_id = sur.role_id
union
select menu_id from sys_user_menu sum WHERE user_id = 'ffffffffbd471a55ffffffff976c6d1b'
;

SELECT sm.permission FROM (SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
WHERE SUR.USER_ID = 'ffffffffbd471a55ffffffff976c6d1b'
UNION
SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = 'ffffffffbd471a55ffffffff976c6d1b') lt
left join sys_menu sm on sm.kid = lt.menu_id