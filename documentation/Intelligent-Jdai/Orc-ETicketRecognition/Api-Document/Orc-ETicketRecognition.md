# 电子汇票


## 描述
电子汇票

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/eETicketRecognition
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
|`ticketFrontInfo`|ElectronicExchangeTicketFrontInfo|N|电子汇票识别结果|

## 

字段ElectronicExchangeTicketFrontInfo的内容说明：

| 参数名称             | 参数类型   | 是否必填 | 参数说明             |
| :------------------- | :--------- | :------- | :------------------- |
| 参数名称             | 参数类型   | 是否必填 | 参数说明             |
| `issueDate`          | TextArea   | N        | `出票日期`           |
| maturityDate         | TextArea   | N        | `汇票到期日`         |
| billNo               | TextArea   | N        | `票据号码`           |
| `billAmt`            | `TextArea` | N        | `票据金额`           |
| drawerAccount        | TextArea   | N        | `开票人账号`         |
| drawerName           | TextArea   | N        | `开票人全称`         |
| drawerBank           | TextArea   | N        | `开票人开户行号`     |
| drawerBankName       | TextArea   | N        | `开票人开户行`       |
| payeeName            | TextArea   | N        | `收款人全称`         |
| payeeAccount         | TextArea   | N        | `收款人账号`         |
| payeeBank            | TextArea   | N        | `收款人开户行号`     |
| payeeBankName        | TextArea   | N        | `收款人开户银行`     |
| accepterAccount      | TextArea   | N        | `承兑人账号`         |
| accepterName         | TextArea   | N        | `承兑人全称`         |
| accepterBank         | TextArea   | N        | `承兑人开户行行号`   |
| accepterBankName     | TextArea   | N        | `承兑行开户行名称`   |
| accepterDrawerCommit | TextArea   | N        | `承兑信息出票人承诺` |
| accepterCommit       | TextArea   | N        | `承兑信息承兑人承诺` |
| businessContract     | TextArea   | N        | `交易合同号`         |
| allow                | TextArea   | N        | `能否转让`           |
| extended             | TextArea   | N        | `扩展参数`           |

TextArea类型说明

| 参数名称      | 参数类型  | 是否必填 | 参数说明                                                  |
| :------------ | :-------- | :------- | :-------------------------------------------------------- |
| area          | Rectangle | N        | 文本坐标，x，y为起始点坐标，width和height为矩形框的宽和高 |
| `probability` | `Double`  | N        | `暂未使用，可忽略`                                        |
| `text`        | string    | N        | `文本识别结果`                                            |

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
	},
	"imageType": "jpg"
}
```

## 返回样例

```json
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "ticketFrontInfo": {
        "accepterBank": {
            "area": {
                "height": 15,
                "width": 87,
                "x": 471,
                "y": 291
            },
            "text": "402473701210"
        },
        "accepterBankName": {
            "area": {
                "height": 20,
                "width": 175,
                "x": 471,
                "y": 313
            },
            "text": "山东沂水农村商业银行营业部"
        },
        "billAmt": {
            "area": {
                "height": 24,
                "width": 59,
                "x": 155,
                "y": 255
            },
            "text": "10000.0"
        },
        "billNo": {
            "area": {
                "height": 19,
                "width": 271,
                "x": 467,
                "y": 134
            },
            "text": "1403337000102014122"
        },
        "drawerBankName": {
            "area": {
                "height": 20,
                "width": 175,
                "x": 115,
                "y": 205
            },
            "text": "山东沂水农村商业银行营业部"
        },
        "drawerName": {
            "area": {
                "height": 20,
                "width": 223,
                "x": 55,
                "y": 156
            },
            "text": "浙程代农业开发有限公司"
        },
        "extended": {},
        "issueDate": {
            "area": {
                "height": 19,
                "width": 183,
                "x": 15,
                "y": 111
            },
            "text": "2014-12-25"
        },
        "payeeBankName": {
            "area": {
                "height": 19,
                "width": 175,
                "x": 471,
                "y": 205
            },
            "text": "中国建设银行罗庄区支行"
        },
        "payeeName": {
            "area": {
                "height": 19,
                "width": 199,
                "x": 407,
                "y": 157
            },
            "text": "临沂贸易有限公司"
        }
    },
    "timestamp": 1618381882201
}
```

