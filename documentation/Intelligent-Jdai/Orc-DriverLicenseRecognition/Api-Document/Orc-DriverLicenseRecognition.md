# 驾驶证识别


## 描述
驾驶证识别

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/driverLicenseRecognition
```



### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| `appName`         | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| ```imageItem```   | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `extMap`          | map      | N        | 附加信息, 特殊需求处理                                       |



### 返回实体

| 参数名称                    | 参数类型 | 是否必填 | 参数说明         |
| :-------------------------- | :------- | :------- | :--------------- |
| `code`                      | int      |          | 返回code码0:成功 |
| `msg`                       | string   |          | msg              |
| `serialNo`                  | string   |          | 交互的流水号     |
| `````driverLicenseInfo````` | String   |          | `识别结果```     |
| `--licenseNo`               | string   |          | `证号`           |
| `--name`                    | string   |          | `姓名`           |
| `--gender`                  | string   |          | `性别`           |
| `--nation`                  | string   |          | `国籍`           |
| `--address`                 | string   |          | `住址`           |
| `--birth`                   | string   |          | `生日`           |
| `--startDate`               | string   |          | `初次领证日期`   |
| `--classNo`                 | string   |          | `车型`           |
| `--issueDate`               | string   |          | `签发日期`       |
| `--expDate`                 | string   |          | `失效时间`       |
|                             |          |          |                  |
|                             |          |          |                  |

### 请求参数示例

```

{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"imgType": "DL",
		"encryptionType": "NON",
		"imageType": "jpg"
	}
}
```



### 返回样例

```
{
  "code": 0, 
  "driverLicenseInfo": {
    "address": "广东省潮州市湘桥区六亩村水闸路14号", 
    "birth": "1989-05-13", 
    "classNo": "C1", 
    "expDate": "6年", 
    "gender": "男", 
    "issueDate": "2011-05-19", 
    "licenseNo": "445102198905131752", 
    "name": "赖旭宇", 
    "nation": "中国", 
    "startDate": "2011-05-19"
  }, 
  "serialNo": "1550560993628-172025248021-173330", 
  "timestamp": 1550560993638
}
```