# 不动产证识别


## 描述
不动产证识别ocr

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
| extended | Map | N | 附加信息, 特殊需求处理 |



### 返回实体

|名称|类型| 是否必填 |描述|
|---|---|---|---|
|**code**|int|| 返回code码,0:成功  |
|msg|string|  | msg                |
|**serialNo**|string|| 交互的流水号 |
|**data**|Object||识别结果|

## 字段data的内容说明

|名称|类型|是否必填|描述|
|---|---|---|---|
|  |  |  |  |


## 请求参数示例
```json
{
 	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx", 
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": "",
        "imgType": "COM"
    },
    "serialNo": "12092873283-2313"
}
```

## 返回样例

```json
{
    "code": 0,
    "msg": "成功"
}
```

