# 火车票


## 描述
火车票

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

### 返回实体

| 参数名称          | 参数类型          | 是否必填 | 参数说明         |
| :---------------- | :---------------- | :------- | :--------------- |
| `code`            | int               | Y        | 返回code码0:成功 |
| `msg`             | string            | N        | msg              |
| `serialNo`        | string            | N        | 交互的流水号     |
| `trainTicketInfo` | `TrainTicketInfo` | N        | 火车票识别结果   |

字段TrainTicketInfo的内容说明：

| 参数名称       | 参数类型 | 是否必填 | 参数说明         |
| :------------- | :------- | :------- | :--------------- |
| `ticketDate`   | `String` | N        | `火车发车日期`   |
| `startStation` | String   | N        | `起始站`         |
| `trainId`      | String   | N        | `火车编号`       |
| `userIdNumber` | String   | N        | `乘车人身份证号` |
| `seatClass`    | String   | N        | `火车票座位类型` |
| `ticketId`     | String   | N        | `火车票ID码`     |
| `endStation`   | String   | N        | `终点站`         |
| `amount`       | String   | N        | `票价`           |
| `userName`     | String   | N        | `乘车人姓名`     |
| `seatNumber`   | String   | N        | `车厢号`         |



**请求参数示例**

```
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



### 返回样例

```
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "trainTicketInfo": {         
            "ticketDate": "火车发车日期",
		    "startStation": "起始站",
 		    "trainId": "火车编号", 
 		    "userIdNumber": "乘车人身份证号", 
 		    "seatClass": "火车票座位类型", 
 		    "ticketId": "火车票ID码", 
 		    "endStation": "终点站", 
 		    "amount": "票价", 
 		    "userName": "乘车人姓名", 
 		    "seatNumber": "车厢号"
   },
    "timestamp": 1618381882201
}
```