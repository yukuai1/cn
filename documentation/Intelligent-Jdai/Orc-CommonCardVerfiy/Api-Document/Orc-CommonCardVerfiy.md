# 通用卡证质检


## 描述
通用卡证质检

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
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `extended`        | map      | N        | 附加信息, 特殊需求处理                                       |

### 返回实体

| 参数名称    | 参数类型  | 是否必填 | 参数说明                        |
| :---------- | :-------- | :------- | :------------------------------ |
| `code`      | int       |          | 返回code码0:成功                |
| `msg`       | string    |          | msg                             |
| `serialNo`  | string    |          | 交互的流水号                    |
| `data`      | Object    |          | 得分                            |
| `algResult` | `Boolean` |          | 防伪结果，true通过，false不通过 |

字段data的内容说明：

| 参数名称       | 参数类型 | 参数说明                           |
| :------------- | :------- | :--------------------------------- |
| bbox           | Object   | 【"left", "top","width","height"】 |
| blur           | Float    | 质检【是否模糊】分数               |
| incompleteness | Float    | 身份证【是否残缺】分数             |
| fakePortrait   | Float    | 防伪【头像贴图】分数               |
| fakeMonocopy   | Float    | 防伪【是否复印件】分数             |
| fakeColorcopy  | Float    | 防伪【是否彩印】分数               |
| fakeScreen     | Float    | 防伪【是否屏幕翻拍】分数           |

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
    "serialNo": "12092873283-2313"
}
```

### 返回样例

```
{
    "code": 0,
    "data": {
        "blur": 0.1
    },
    "algResult":true,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "timestamp": 1646188619374
}
```

