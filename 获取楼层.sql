select fc.kid,fc.floorId,fc.code,fc.cameraId,lt.label ,lt.name from FLOOR_HUMITURE fc
left join floor fr on fr.kid = fc.floorId
left join (select fa.kid value,CONCAT(fr.name,as_.name) label,fr.name from floor_area fa
left join areas as_ on as_.kid = fa.areaId
left join floor fr on fr.kid = fa.floorId) lt on lt.value = fc.floorId;

select lt.label,group_concat(fc.cameraId) cameraIds from FLOOR_HUMITURE fc
left join floor fr on fr.kid = fc.floorId
left join (select fa.kid value,CONCAT(fr.name,as_.name) label from floor_area fa
left join areas as_ on as_.kid = fa.areaId
left join floor fr on fr.kid = fa.floorId) lt on lt.value = fc.floorId
group by lt.label
;

select floorId,target_code,target_label from (SELECT
            fc.floorId,
            group_concat(fc.target_code ORDER BY fc.target_code ASC) target_code,
            group_concat(fc.target_label ORDER BY fc.target_label ASC) target_label
		FROM FLOOR_CODE fc
        left join floor fr on fr.kid = fc.floorId
group by fc.floorId) fce;



select fr.kid,glt.code,glt.cameraId,glt.names,fr.name,fr.url,lt.kids,hs.humitures,fce.target_code,fce.target_label
        from (select lt.floorId,GROUP_CONCAT(fa.kid) kids from (select floorId from floor_area group by floorId)lt
        left join floor_area fa on fa.floorId = lt.floorId group by lt.floorId) lt
        left join floor fr on fr.kid = lt.floorId
        left join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId,group_concat(camera_name) names from floor_camera group by floorId) glt on glt.floorId = fr.kid
        left join (
            select faa.floorId,group_concat(ijt.cameraId) humitures from floor_area faa
        inner join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId from floor_humiture group by floorId) ijt on ijt.floorId = faa.kid
        group by faa.floorId
            ) hs on hs.floorId = fr.kid
        left join (SELECT
            fc.floorId,
            group_concat(fc.target_code ORDER BY fc.target_code ASC) target_code,
            group_concat(fc.target_label ORDER BY fc.target_label ASC) target_label
		FROM FLOOR_CODE fc
        left join floor fr on fr.kid = fc.floorId
        group by fc.floorId) fce on fce.floorId = lt.floorId
        order by fr.sort;

select floorId,group_concat(cameraId) ids from floor_humiture group by floorId;

select fr.name,fr.code,group_concat(lt.cameraId) ids
from (select fhe.cameraId,faa.floorId from floor_humiture fhe
left join floor_area faa on faa.kid = fhe.floorId) lt
left join floor fr on fr.kid = lt.floorId
group by fr.name,fr.code order by fr.sort;


select floorCode,group_concat(ids) ids from (select left(code,2) floorCode,ids from (
select fr.code,group_concat(lt.cameraId) ids
from (select fhe.cameraId,faa.floorId from floor_humiture fhe
left join floor_area faa on faa.kid = fhe.floorId) lt
left join floor fr on fr.kid = lt.floorId
group by fr.name,fr.code order by fr.sort
) gt) lt group by floorCode