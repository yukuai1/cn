# 香港身份证质检防伪


## 描述
香港身份证质检防伪

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/maskInsurance
```



### 请求参数

| 参数名称            | 参数类型 | 是否必填 | 参数说明                                                     |
| :------------------ | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`          | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName             | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey`   | string   | Y        | 授权key, 申请分配                                            |
| `businessId`        | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`         | Object   | Y        | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `imageItemExposure` | Object   | N        | 曝光图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `extended`          | map      | N        | 附加信息, 特殊需求处理                                       |

### 返回实体

| 参数名称    | 参数类型  | 是否必填 | 参数说明                        |
| :---------- | :-------- | :------- | :------------------------------ |
| `code`      | int       |          | 返回code码0:成功                |
| `msg`       | string    |          | msg                             |
| `serialNo`  | string    |          | 交互的流水号                    |
| `data`      | Object    |          | 识别结果                        |
| `algResult` | `Boolean` |          | 防伪结果，true通过，false不通过 |

字段data的内容说明：

| 参数名称      | 参数类型 | 参数说明 |
| :------------ | :------- | :------- |
| `quality```   | Object   | ``       |
| `antiForgery` | `Object` |          |

字段quality的内容说明：

| 参数名称 | 参数类型 | 参数说明            |
| :------- | :------- | :------------------ |
| blur     | Float    | 证据模糊程度分数    |
| cover    | Float    | 防伪点/关键区域遮挡 |

字段antiForgery的内容说明：

| 参数名称      | 参数类型 | 参数说明                              |
| :------------ | :------- | :------------------------------------ |
| portraitBB    | Float    | `两个大人像防伪点分数`                |
| portraitBS    | `Float`  | `大小头像防伪点分数`                  |
| verify1       | Float    | 其他防伪点1分数                       |
| verify2       | Float    | 其他防伪点2分数                       |
| fakePortrait  | Float    | 防伪【头像贴图】分数,v2.1版本新增     |
| fakeMonocopy  | Float    | 防伪【是否复印件】分数,v2.1版本新增   |
| fakeColorcopy | Float    | 防伪【是否彩印】分数,v2.1版本新增     |
| fakeScreen    | Float    | 防伪【是否屏幕翻拍】分数,v2.1版本新增 |

### 请求参数示例

```
{
 	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx", 
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": "",
        "imgType": "COM"
    },
     "imageItemExposure": {
        "encryptionType": "NON",
        "imgBase64": "",
        "imgType": "COM"
    },
    "serialNo": "12092873283-2313"
}
```

### 返回样例

```
{
    "code": 0,
    "quality": {
        "blur": 0.1
    },
     "antiForgery": {
        "portraitBB": 0.1
    }, 
    "algResult":true,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "timestamp": 1646188619374
}
```



