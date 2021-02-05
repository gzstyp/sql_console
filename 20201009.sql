
SELECT floorId FROM floor_humiture fh
left join floor_area fa on fh.floorId;

select fr.kid,glt.code,glt.cameraId,glt.names,fr.name,fr.url,lt.kids,hs.humitures
from (select lt.floorId,GROUP_CONCAT(fa.kid) kids from (select floorId from floor_area group by floorId)lt
left join floor_area fa on fa.floorId = lt.floorId group by lt.floorId) lt
left join floor fr on fr.kid = lt.floorId
left join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId,group_concat(camera_name) names from floor_camera group by floorId) glt on glt.floorId = fr.kid
left join (select faa.floorId,group_concat(ijt.cameraId) humitures from floor_area faa
inner join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId from floor_humiture group by floorId) ijt on ijt.floorId = faa.kid
group by faa.floorId) hs on hs.floorId = fr.kid
order by fr.sort;

select floorId,group_concat(code) code,group_concat(cameraId) cameraId from floor_humiture group by floorId;

select faa.floorId,ijt.cameraId from floor_area faa
inner join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId from floor_humiture group by floorId) ijt on ijt.floorId = faa.kid


select faa.floorId,group_concat(ijt.cameraId) humitures from floor_area faa
inner join (select floorId,group_concat(code) code,group_concat(cameraId) cameraId from floor_humiture group by floorId) ijt on ijt.floorId = faa.kid
group by faa.floorId