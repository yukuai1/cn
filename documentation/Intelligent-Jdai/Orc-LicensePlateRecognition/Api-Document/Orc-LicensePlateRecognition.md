# 车牌识别OCR


## 描述
车牌识别

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
| extMap | map | N | 附加信息, 特殊需求处理 |



### 返回实体

|名称|类型| 是否必填 |描述|
|---|---|---|---|
|**code**|int|Y| 返回code码,0:成功  |
|msg|string| N | msg                |
|**serialNo**|string|N| 交互的流水号 |
|**plateNo**|String|N|车牌号|



## 请求参数示例

```json
{
    "appAuthorityKey": "aKG/VUsDM7EjJIA7T7B8oA==",
    "appName": "JD_SFYL_OCR",
    "businessId": "JDD-OCR-TEST-PLAT",
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": "图片base64",
        "imgType": "LP",
        "valid": true
    },
    "imageType": "jpg",
    "serialNo": "1598547146344-172025157194-181093"
}
```

## 返回样例

```json
{
  "code": 0, 
  "msg": "成功", 
  "plateNo": "苏E·05EV8", 
  "serialNo": "1598547146344-172025157194-181093", 
  "timestamp": 1600085312210
}
```

