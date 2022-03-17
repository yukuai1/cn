# 泰国身份证


## 描述
泰国身份证

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/thaiIdcardRecognition
```

### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `cardType`        | string   | N        | 正反面【“front”，“back”】, 若未知传"unknown"                 |

### 返回实体

| 参数名称   | 参数类型 | 是否必填 | 参数说明         |
| :--------- | :------- | :------- | :--------------- |
| `code`     | int      |          | 返回code码0:成功 |
| `msg`      | string   |          | msg              |
| `serialNo` | string   |          | 交互的流水号     |
| `data`     | `Object` |          | 识别结果         |

字段data的内容说明：

正面时data为：

| 参数名称       | 参数类型 | 参数说明                                   | 是否必填 |
| :------------- | :------- | :----------------------------------------- | :------- |
| cardType       | String   | 证件正反面，【"front"， "back"， "other"】 | ``       |
| `id`           | String   | 证件号码                                   |          |
| `thaiName`     | String   | 泰国姓名                                   |          |
| `thaiAddress`  | String   | 住址                                       |          |
| `engFirstName` | String   | 英文姓                                     |          |
| `engLastName`  | String   | 英文名称                                   |          |
| `engBirthDate` | String   | 出生日期                                   |          |
| `issueDate`    | String   | 发证日期                                   |          |
| `expiryDate`   | String   | 有效期                                     |          |

反面时data为：

| 参数名称       | 参数类型 | 参数说明                                   | 是否必填 |
| :------------- | :------- | :----------------------------------------- | :------- |
| cardType       | String   | 证件正反面，【"front"， "back"， "other"】 | ``       |
| `securityCode` | String   |                                            |          |

### 请求参数示例

```
{
 	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx", 
    "cardType": "front",
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
    "msg": "成功",
    "code": 0,
    "data": {
        "expiryDate": "19 Dec. 2022",
        "engLastName": "Panpun",
        "thaiName": "น.ส. จีระนันท์ พานพันธ์",
        "engBirthDate": "20 Dec. 1980",
        "cardType": "front",
        "thaiAddress": "137 หมู่ที่ 18 ต.ศรีสุข อ.กันทรวิชัยจ.มหาสารคาม",
        "engFirstName": "Miss Jeranan",
        "id": "3 4404 00493 30 7",
        "issueDate": "20 Dec. 2014"
    },
    "serialNo": "1598547146344-172025157194-181093",
    "timestamp": 1646705681424
}
```

