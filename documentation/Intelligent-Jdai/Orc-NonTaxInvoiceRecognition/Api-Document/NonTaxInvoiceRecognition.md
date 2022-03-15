# 中央非税发票（仅pdf版本）


## 描述
中央非税发票（仅pdf版本）

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

| 参数名称            | 参数类型            | 是否必填 | 参数说明         |
| :------------------ | :------------------ | :------- | :--------------- |
| `code`              | int                 | Y        | 返回code码0:成功 |
| `msg`               | string              | N        | msg              |
| `serialNo`          | string              | N        | 交互的流水号     |
| `nonTaxInvoiceInfo` | `NonTaxInvoiceInfo` | N        | 火车票识别结果   |

字段NonTaxInvoiceInfo的内容说明：

| 参数名称        | 参数类型       | 是否必填 | 参数说明         |
| :-------------- | :------------- | :------- | :--------------- |
| `invoiceCode`   | `String`       | N        | `票据代码`       |
| `invoiceNo`     | String         | N        | `票据号码`       |
| `payer`         | String         | N        | `交款人`         |
| `payee`         | String         | N        | `收款单位`       |
| `amount`        | String         | N        | `金额合计`       |
| `projectAmount` | `List<String>` | N        | `项目金额`       |
| `projectInfo`   | List<String>   | N        | `项目编码与名称` |



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
    "airplaneItineraryInfo": {         
            "invoiceCode": "票据代码",
             "invoiceNo": "票据号码", 
             "payer": "交款人", 
             "payee": "收款单位", 
             "amount": "金额合计", 
             "projectAmount": ["项目金额1", "项目金额2"], 
             "projectInfo": ["项目编码与名称1", "项目编码与名称2"]
            },
    "timestamp": 1618381882201
}
```

