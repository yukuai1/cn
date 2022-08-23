# 飞机行程票


## 描述
飞机行程票

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/airplaneItineraryRecognition
```



## 请求参数

|名称|类型|是否必需|参数说明|
|---|---|---|---|
| serialNo | string | N      | 请求流水号, 不传接口自动生成                                 |
| appName | string | Y | 授权appName, 申请分配 |
| appAuthorityKey | string | Y | 授权key, 申请分配 |
| businessId | string | Y | 业务id, 申请分配 |
| imageItem | Object | Y | 图片信息 |



### 返回实体

|名称|类型| 是否必填 |描述|
|---|---|---|---|
|**code**|int|Y| 返回code码,0:成功  |
|msg|string| N | msg                |
|**serialNo**|string|N| 交互的流水号 |
| `airplaneItineraryInfo` | `AirplaneItineraryInfo` | N        | 火车票识别结果    |

## 字段AirplaneItineraryInfo的内容说明

| 参数名称        | 参数类型 | 是否必填 | 参数说明       |
| :-------------- | :------- | :------- | :------------- |
| `userName`      | `String` | N        | `旅客姓名`     |
| `idNumber`      | String   | N        | `旅客身份证号` |
| `startTerminal` | String   | N        | `起始站`       |
| `endTerminal`   | String   | N        | `终点站`       |
| `fare`          | String   | N        | `票价`         |
| `ticketId`      | String   | N        | `票ID码`       |
| `cadFund`       | String   | N        | `民航发展基金` |
| `total`         | String   | N        | `合计`         |
| `eTicketNo`     | String   | N        | `电子客票号码` |
| `issuedBy`      | String   | N        | `填开单位`     |
| `dateOfIssue`   | String   | N        | `填开日期`     |


## 请求参数示例
```json
{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"imgType": "COM",
		"imgBase64":"",
		"encryptionType": "NON"
	}
}
```

## 返回样例

```json
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "airplaneItineraryInfo": {         
            "userName": "旅客姓名",
		    "idNumber": "旅客身份证号",
 		    "startTerminal": "起始站", 
 		    "endTerminal": "终点站", 
 		    "fare": "票价", 
 		    "ticketId": "票ID码", 
 		    "cadFund": "民航发展基金", 
 		    "total": "合计", 
 		    "eTicketNo": "电子客票号码", 
 		    "issuedBy": "填开单位",
  		    "dateOfIssue": "填开日期"
    },
    "timestamp": 1618381882201
}
```

