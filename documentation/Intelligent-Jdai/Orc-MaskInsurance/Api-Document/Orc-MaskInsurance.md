# 保险单隐私遮蔽


## 描述
保险单隐私遮蔽

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
| extended | map | N | [公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |





### 返回实体

|名称|类型|示例值|描述|
|---|---|---|---|
|**code**|int|| 返回code码   |
|msg|string|        | msg          |
|**serialNo**|string|| 交互的流水号 |
|**maskResult**|Map||结果|

## 字段maskResult的内容说明

|名称|类型|示例值|描述|
|---|---|---|---|
| mask_image | string |                  | `图片base64编码` |
| `phone_number` | List<Stirng> |                   | 手机号码         |
| id_number | List<Stirng> |  | 身份证号 |




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
    "maskResult": {
        "id_number": [
            "1234567890"
        ],
        "mask_image": "iVBORw0KGgoAAAANSUhEUgAAA...",
        "phone_number": [
            "1234567890",
            "1234567890"
        ]
    },
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "timestamp": 1618387383964
}
```

### 