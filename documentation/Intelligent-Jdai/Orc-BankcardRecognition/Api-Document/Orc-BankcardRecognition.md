# 银行卡识别（V2）


## 描述
银行卡识别（V2）

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/bankcardRecognition
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
| `token`           | String   | N        | 如果是银行卡SDK,则通过token串联流程                          |



### 返回实体

| 参数名称                                                     | 参数类型 | 是否必填 | 参数说明                    |
| :----------------------------------------------------------- | :------- | :------- | :-------------------------- |
| `code`                                                       | int      |          | 返回code码0:成功            |
| `msg`                                                        | string   |          | msg                         |
| `serialNo`                                                   | string   |          | 交互的流水号                |
| `````bankcardInfo`````                                       | String   |          | `识别结果```                |
| `--cardNumber```       | string   |          | `银行卡号码`  |          |          |                             |
| `--cardType`                                                 | string   |          | ```卡类型(借记卡,信用卡)``` |
| `--issuer```           | string   |          | `````发行机构 银行名称``` |          |          |                             |
| `--validDate```        | string   |          | `有效期`      |          |          |                             |
| `--owner```            | string   |          | `持卡人`      |          |          |                             |

### 请求参数示例

```
{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"encryptionType": "NON",
		"imgBase64": "base64"
	}
}
```



### 返回样例

```
{
  "bankcardInfo": {
    "cardNumber": "4367421147620083682", 
    "cardType": "借记卡", 
    "issuer": "中国建设银行", 
    "owner": "", 
    "validDate": ""
  }, 
  "code": 0, 
  "msg": "成功", 
  "serialNo": "1553592610027-010221165048-166635", 
  "timestamp": 1553592610037
}
```

