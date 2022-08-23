# 烟草专卖证


## 描述
烟草专卖证

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/tobaccoLicenseRecognition
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

| 参数名称             | 参数类型             | 是否必填 | 参数说明             |
| :------------------- | :------------------- | :------- | :------------------- |
| `code`               | int                  | Y        | 返回code码0:成功     |
| `msg`                | string               | N        | msg                  |
| `serialNo`           | string               | N        | 交互的流水号         |
| `tobaccoLicenseInfo` | `TobaccoLicenseInfo` | N        | `烟草许可证识别结果` |

字段TobaccoLicenseInfo的内容说明：

| 参数名称            | 参数类型 | 是否必填 | 参数说明         |
| :------------------ | :------- | :------- | :--------------- |
| `number`            | String   | N        | `许可证号`       |
| `companyName`       | String   | N        | `企业名称`       |
| `name`              | String   | N        | `负责人`         |
| `companyType`       | `String` | N        | `企业类型`       |
| `address`           | String   | N        | `经营场所`       |
| `licenseScope`      | String   | N        | `许可范围`       |
| `supplyCompany`     | String   | N        | `供货单位`       |
| `startTime`         | String   | N        | `有效期起始时间` |
| `deadline`          | String   | N        | `有效期截止时间` |
| `issuingAuthority`  | String   | N        | `发证机关`       |
| `certificationTime` | String   | N        | `制证日期`       |
| `qrcode`            | String   | N        | `二维码解析信息` |



请求参数示例

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
    "tobaccoLicenseInfo": {
        "number":"450xxx",
		"companyName":"xxx烟草专卖局",
		"name":"xxxxx",
		"companyType":"xxxx",
 		"address":"xxxxxx家街133号",
		"licenseScope":"卷烟本店零售、雪茄烟本店零售",
		"supplyCompany":"'xxxxxx烟草公司桂林市公",
		"startTime":"2020年07月01日",
		"deadline":"2021年12月25日",
 		"issuingAuthority":"xxx烟草专卖局", 
 		"certificationTime":"2020年05月08日", 
 		"qrcode":"xxxx"
},
    "timestamp": 1618381882201
}
```