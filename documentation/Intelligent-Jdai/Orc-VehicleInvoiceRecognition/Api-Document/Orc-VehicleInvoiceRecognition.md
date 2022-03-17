# 购车发票


## 描述
购车发票

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/vehicleInvoiceRecognition
```



### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   | Y        | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |

###  23.3.返回实体

| 参数名称             | 参数类型             | 是否必填 | 参数说明         |
| :------------------- | :------------------- | :------- | :--------------- |
| `code`               | int                  | Y        | 返回code码0:成功 |
| `msg`                | string               | N        | msg              |
| `serialNo`           | string               | N        | 交互的流水号     |
| `vehicleInvoiceInfo` | `VehicleInvoiceInfo` | Y        | 购车发票识别信息 |

字段VehicleInvoiceInfo的内容说明：

| 参数名称                   | 参数类型 | 是否必填 | 参数说明       |
| :------------------------- | :------- | :------- | :------------- |
| `totalAmount`              | `String` | N        | `价税合计`     |
| `engineNumber`             | String   | N        | `发动机号码`   |
| `address`                  | String   | N        | `地址`         |
| `salerName`                | String   | N        | `销货单位名称` |
| `invoiceNo`                | String   | N        | `发票号码`     |
| `brandModel`               | String   | N        | `厂牌型号`     |
| `vin`                      | String   | N        | `车辆识别代号` |
| `invoiceDate`              | String   | N        | `开票日期`     |
| `vehicleType`              | String   | N        | `车辆类型`     |
| `invoiceCode`              | String   | N        | `发票代码`     |
| `taxpayerIdentificationNo` | String   | N        | `纳税人识别号` |

**23.4.请求参数示例**

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



### 23.5.返回样例

```
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "vehicleInvoiceInfo": {
			"totalAmount":"价税合计",
 			"engineNumber":"发动机号码", 
 			"address":"地址", 
 			"salerName":"销货单位名称", 
 			"invoiceNo":"发票号码", 
 			"brandModel":"厂牌型号", 
 			"vin":"车辆识别代号", 
 			"invoiceDate":"开票日期", 
 			"vehicleType":"车辆类型", 
 			"invoiceCode":"发票代码", 
 			"taxpayerIdentificationNo":"纳税人识别号"
		},
    "timestamp": 1618381882201
}
```