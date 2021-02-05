<!-- 获取当前登录id的所有权限 -->
SELECT SM.permission FROM (SELECT SRM.MENU_ID FROM SYS_USER_ROLE SUR
LEFT JOIN SYS_ROLE_MENU SRM ON SRM.ROLE_ID = SUR.ROLE_ID
WHERE SUR.USER_ID = #{userId}
UNION
SELECT MENU_ID FROM SYS_USER_MENU SUM WHERE USER_ID = #{userId}) LT
LEFT JOIN SYS_MENU SM ON SM.KID = LT.MENU_ID
LEFT JOIN SYS_MENU SMU ON SMU.URL = #{url} AND SMU.KID = SM.KID
WHERE SM.PERMISSION IS NOT NULL

SELECT su.id,su.username,su.password,lt.roles FROM (
    SELECT ur.user_id,GROUP_CONCAT(sr.role_name) roles from sys_role sr,user_role ur WHERE ur.user_id = #{userId} AND sr.kid = ur.role_id GROUP BY ur.user_id
) lt , sys_user su WHERE su.id = lt.user_id