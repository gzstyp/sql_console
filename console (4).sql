SELECT
SUM(if(a.`name`='社会福利养老机构工作人员',b.sampling_total,0)) as '社会福利养老机构工作人员采样数',
SUM(if(a.`name`='社会福利养老机构工作人员',b.detection_total,0)) as '社会福利养老机构工作人员检测数',
SUM(if(a.`name`='社会福利养老机构工作人员',b.masculine_total,0)) as '社会福利养老机构工作人员阳性数',
SUM(if(a.`name`='企业人员',b.sampling_total,0)) as '企业人员采样数',
SUM(if(a.`name`='企业人员',b.detection_total,0)) as '企业人员检测数',
SUM(if(a.`name`='企业人员',b.masculine_total,0)) as '企业人员阳性数',
SUM(if(a.`name`='陪护人员',b.sampling_total,0)) as '陪护人员采样数',
SUM(if(a.`name`='陪护人员',b.detection_total,0)) as '陪护人员检测数',
SUM(if(a.`name`='陪护人员',b.masculine_total,0)) as '陪护人员阳性数',

SUM(if(a.`name`='新住院病人',b.sampling_total,0)) as '新住院病人采样数',
SUM(if(a.`name`='新住院病人',b.detection_total,0)) as '新住院病人检测数',
SUM(if(a.`name`='新住院病人',b.masculine_total,0)) as '新住院病人阳性数',

SUM(if(a.`name`='其他人员',b.sampling_total,0)) as '其他人员采样数',
SUM(if(a.`name`='其他人员',b.detection_total,0)) as '其他人员检测数',
SUM(if(a.`name`='其他人员',b.masculine_total,0)) as '其他人员阳性数',

SUM(if(a.`name`='机关事业单位人员',b.sampling_total,0)) as '机关事业单位人员采样数',
SUM(if(a.`name`='机关事业单位人员',b.detection_total,0)) as '机关事业单位人员检测数',
SUM(if(a.`name`='机关事业单位人员',b.masculine_total,0)) as '机关事业单位人员阳性数',

SUM(if(a.`name`='发热门诊就诊患者',b.sampling_total,0)) as '发热门诊就诊患者采样数',
SUM(if(a.`name`='发热门诊就诊患者',b.detection_total,0)) as '发热门诊就诊患者检测数',
SUM(if(a.`name`='发热门诊就诊患者',b.masculine_total,0)) as '发热门诊就诊患者阳性数',

SUM(if(a.`name`='监所工作人员',b.sampling_total,0)) as '监所工作人员采样数',
SUM(if(a.`name`='监所工作人员',b.detection_total,0)) as '监所工作人员检测数',
SUM(if(a.`name`='监所工作人员',b.masculine_total,0)) as '监所工作人员阳性数',

SUM(if(a.`name`='境外入境人员',b.sampling_total,0)) as '境外入境人员采样数',
SUM(if(a.`name`='境外入境人员',b.detection_total,0)) as '境外入境人员检测数',
SUM(if(a.`name`='境外入境人员',b.masculine_total,0)) as '境外入境人员阳性数',

SUM(if(a.`name`='外省返黔师生',b.sampling_total,0)) as '外省返黔师生采样数',
SUM(if(a.`name`='外省返黔师生',b.detection_total,0)) as '外省返黔师生检测数',
SUM(if(a.`name`='外省返黔师生',b.masculine_total,0)) as '外省返黔师生阳性数',

SUM(if(a.`name`='其他人群',b.sampling_total,0)) as '其他人群采样数',
SUM(if(a.`name`='其他人群',b.detection_total,0)) as '其他人群检测数',
SUM(if(a.`name`='其他人群',b.masculine_total,0)) as '其他人群阳性数',

SUM(if(a.`name`='外省返黔师生',b.sampling_total,0)) as '外省返黔师生采样数',
SUM(if(a.`name`='外省返黔师生',b.detection_total,0)) as '外省返黔师生检测数',
SUM(if(a.`name`='外省返黔师生',b.masculine_total,0)) as '外省返黔师生阳性数',

SUM(if(a.`name`='中高风险地区来黔人员',b.sampling_total,0)) as '中高风险地区来黔人员采样数',
SUM(if(a.`name`='中高风险地区来黔人员',b.detection_total,0)) as '中高风险地区来黔人员检测数',
SUM(if(a.`name`='中高风险地区来黔人员',b.masculine_total,0)) as '中高风险地区来黔人员阳性数',

SUM(if(a.`name`='医疗机构工作人员',b.sampling_total,0)) as '医疗机构工作人员采样数',
SUM(if(a.`name`='医疗机构工作人员',b.detection_total,0)) as '医疗机构工作人员检测数',
SUM(if(a.`name`='医疗机构工作人员',b.masculine_total,0)) as '医疗机构工作人员阳性数',

SUM(if(a.`name`='密切接触者',b.sampling_total,0)) as '密切接触者采样数',
SUM(if(a.`name`='密切接触者',b.detection_total,0)) as '密切接触者员检测数',
SUM(if(a.`name`='密切接触者',b.masculine_total,0)) as '密切接触者员阳性数',

SUM(if(a.`name`='服务行业人员',b.sampling_total,0)) as '服务行业人员采样数',
SUM(if(a.`name`='服务行业人员',b.detection_total,0)) as '服务行业人员检测数',
SUM(if(a.`name`='服务行业人员',b.masculine_total,0)) as '服务行业人员阳性数',

SUM(if(b.crowd_id='ffffffffa04b32a6ffffffffba40ffff',b.sampling_total,0)) as '应检尽检采样数',
SUM(if(a.crowd_id='ffffffffa04b32a6ffffffffba40ffff',b.detection_total,0)) as '应检尽检检测数',
SUM(if(a.crowd_id='ffffffffa04b32a6ffffffffba40ffff',b.masculine_total,0)) as '应检尽检阳性数',

SUM(if(b.crowd_id='fffffffff051bf04ffffffffa2afffff',b.sampling_total,0)) as '愿检尽检采样数',
SUM(if(a.crowd_id='fffffffff051bf04ffffffffa2afffff',b.detection_total,0)) as '愿检尽检检测数',
SUM(if(a.crowd_id='fffffffff051bf04ffffffffa2afffff',b.masculine_total,0)) as '愿检尽检阳性数',

SUM(b.sampling_total) as '合计采样数',
SUM(b.detection_total) as '合计检测数',
SUM(b.masculine_total) as '合计阳性数'

 FROM  bs_crowd_type a
LEFT JOIN bs_crowd_total b on b.crowd_type_id=a.kid
and  b.crowd_date='2020-12-21';