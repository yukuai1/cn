# 表格OCR


## 描述
表格ocr

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/maskInsurance
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
|**tableInfo**|TableInfo|N|烟草许可证识别结果|

## 字段**tableInfo**的内容说明

|名称|类型|是否必填|描述|
|---|---|---|---|
| excelBase64 | string | N | 表格excel的 base64编码 |




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
    "tableInfo": {
        "excelBase64":"excel的base64编码"
},
    "timestamp": 1618381882201
}
```

