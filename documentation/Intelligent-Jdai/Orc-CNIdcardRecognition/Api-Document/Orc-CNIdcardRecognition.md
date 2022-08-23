# 购车发票


## 描述
购车发票

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/idcardDetect
```

## 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| `appName`         | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `idcardItem`      | object   | Y        | 采集的图片列表[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `extMap`          | map      | N        | 附加信息, 特殊需求处理                                       |





## 返回实体

| 参数名称     | 参数类型 | 是否必填 | 参数说明                                                     |
| :----------- | :------- | :------- | :----------------------------------------------------------- |
| `code`       | int      |          | 返回code码0:成功                                             |
| `msg`        | string   |          | msg                                                          |
| `serialNo`   | string   |          | 交互的流水号                                                 |
| `idcardType` | enum     |          | `/** * 身份证检测结果(正面, 反面) */`` ``P("身份证正面"),N("身份证反面");``` |



## 请求参数示例

```
{
	"businessId": "XXX",
	"appName": "XXX",
	"appAuthorityKey": "XXX",
	"idcardType": "P",
	"idcardItem": {
		"imgBase64": "图片base64",
		"encryptionType": "NON"
	}
}
```



## 返回样例

```
{
	"code": 0,
	"idcardType": "N",
	"serialNo": "XXX",
	"timestamp": 1547524430503
}
```

