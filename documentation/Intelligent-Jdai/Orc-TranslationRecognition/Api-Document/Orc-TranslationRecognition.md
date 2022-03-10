# 拍照翻译


## 描述
拍照翻译

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/maskInsurance
```

### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   | Y        | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `srcLang`         | String   | Y        | 源语言种类 Afrikaans (af), Amharic (am), Arabic (ar), Asturian (ast), Azerbaijani (az), Bashkir (ba), Belarusian (be), Bulgarian (bg), Bengali (bn), Breton (br), Bosnian (bs), Catalan; Valencian (ca), Cebuano (ceb), Czech (cs), Welsh (cy), Danish (da), German (de), Greeek (el), English (en), Spanish (es), Estonian (et), Persian (fa), Fulah (ff), Finnish (fi), French (fr), Western Frisian (fy), Irish (ga), Gaelic; Scottish Gaelic (gd), Galician (gl), Gujarati (gu), Hausa (ha), Hebrew (he), Hindi (hi), Croatian (hr), Haitian; Haitian Creole (ht), Hungarian (hu), Armenian (hy), Indonesian (id), Igbo (ig), Iloko (ilo), Icelandic (is), Italian (it), Japanese (ja), Javanese (jv), Georgian (ka), Kazakh (kk), Central Khmer (km), Kannada (kn), Korean (ko), Luxembourgish; Letzeburgesch (lb), Ganda (lg), Lingala (ln), Lao (lo), Lithuanian (lt), Latvian (lv), Malagasy (mg), Macedonian (mk), Malayalam (ml), Mongolian (mn), Marathi (mr), Malay (ms), Burmese (my), Nepali (ne), Dutch; Flemish (nl), Norwegian (no), Northern Sotho (ns), Occitan (post 1500) (oc), Oriya (or), Panjabi; Punjabi (pa), Polish (pl), Pushto; Pashto (ps), Portuguese (pt), Romanian; Moldavian; Moldovan (ro), Russian (ru), Sindhi (sd), Sinhala; Sinhalese (si), Slovak (sk), Slovenian (sl), Somali (so), Albanian (sq), Serbian (sr), Swati (ss), Sundanese (su), Swedish (sv), Swahili (sw), Tamil (ta), Thai (th), Tagalog (tl), Tswana (tn), Turkish (tr), Ukrainian (uk), Urdu (ur), Uzbek (uz), Vietnamese (vi), Wolof (wo), Xhosa (xh), Yiddish (yi), Yoruba (yo), Chinese (zh), Zulu (zu)    括号内的为枚举项 |
| `tgtLang`         | String   | Y        | 同上                                                         |

###  返回实体

| 参数名称          | 参数类型                | 是否必填 | 参数说明         |
| :---------------- | :---------------------- | :------- | :--------------- |
| `code`            | int                     | Y        | 返回code码0:成功 |
| `msg`             | string                  | N        | msg              |
| `serialNo`        | string                  | N        | 交互的流水号     |
| `translationInfo` | `List<TranslationInfo>` | Y        | 翻译信息         |

字段TranslationInfo的内容说明：

| 参数名称       | 参数类型     | 是否必填 | 参数说明                                   |
| :------------- | :----------- | :------- | :----------------------------------------- |
| `id`           | `int`        | N        | `识别框编号 为每个检测到的框定义id`        |
| `text`         | String       | N        | `识别的文本行内容`                         |
| `boxesXy`      | List<String> | N        | `返回四个角点的坐标`                       |
| `translation`  | String       | N        | `识别文本行对应的翻译`                     |
| `detectStatus` | boolean      | N        | `文本框检测是否成功 true 成功  false 失败` |

请求参数示例

```
{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"imgType": "COM",
		"imgBase64":"",
		"encryptionType": "NON",
		"srcLang":"af",
		"tgtLang":"yo"
	}
}
```



### 返回样例

```
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "vehicleInvoiceInfo": [
			{
				"id": 1,
 				"text":"1I Page", 
 				"boxesXy": ["2021", "3230", "2155", "3237", "2152", "3282", "2019", "3276"], 
 				"translation":"1 of Page", 
 				"detectStatus": true
			},
   			{
				"id": 2,
 				"text":"元房等)，每月从该物业收到的收入以及物业的价值。", 
 				"boxesXy": ["228", "3087", "1184", "3093", "1183", "3138", "228", "3133"], 
 				"translation":"The income received from the property and the value of the property per month", 
 				"detectStatus": true
			}
			],
    "timestamp": 1618381882201
}
```

