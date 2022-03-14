# pdf征信报告


## 描述
pdf征信报告

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
| eCreditReportInfo | ECreditReportInfo | N        | 征信报告识别结果 |

字段ECreditReportInfo的内容说明：

| 参数名称      | 参数类型                     | 是否必填 | 参数说明                     |
| :------------ | :--------------------------- | :------- | :--------------------------- |
| `excelBase64` | `String`                     | N        | `表格base64`                 |
| `textLines`   | List<ECreditReportTextLines> | N        | `非表格区域的文本行识别结果` |



字段ECreditReportTextLines的内容说明：

| 参数名称  | 参数类型      | 是否必填 | 参数说明       |
| :-------- | :------------ | :------- | :------------- |
| `bbox`    | `List<Float>` | N        | `检测坐标信息` |
| `content` | String        | N        | `文本内容`     |



**18.4.请求参数示例**

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
    "eCreditReportInfo": {         
			"excelBase64": "表格base64",
            "textLines": [
					{
						"bbox":[575.2999877929688, 1607.3125, 614.6920166015625, 1628.25],
						"content":"第1页"
					},
     				{
						"bbox":[479.4200134277344, 43.3125, 711.9931030273438, 64.25],
						"content":"登记编号： 00545956000068402412"
					},
				]
		},
    "timestamp": 1618381882201
}
```

