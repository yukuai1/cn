# 行驶证识别


## 描述
行驶证（增强版）

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/vehicleLicense
```



### 请求参数

| 参数名称   | 参数类型 | 是否必填 | 参数说明                                                     |
| :--------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo` | string   | N        | 请求流水号, 不传接口自动生成                                 |
| imageItem  | Object   |          | 图片信息                                                     |
| `extMap`   | map      | N        | 附加信息, 特殊需求处理                                       |
| cardType   | string   | N        | 取值【“primary”, "vice", "unknown"】注: 若行驶证主副页未知, 传"unknown"字段. |



### 返回实体

| 参数名称              | 参数类型 | 是否必填 | 参数说明                                    |
| :-------------------- | :------- | :------- | :------------------------------------------ |
| `code`                | int      |          | 返回code码0:成功                            |
| `msg`                 | string   |          | msg                                         |
| `serialNo`            | string   |          | 交互的流水号                                |
| ```recognitionInfo``` | String   |          | 识别结果                                |
| plateNo`           | string   |          | 号牌号码                                  |
| vehicleType`       | string   |          | 车辆类型                                  |
| owner                                  |string||所有人|
| address                                      |string||地址|
| model                                  |string||品牌型号|
| useCharacter                              |string||使用性质|
| engineNo                                  |string||发动机|
| vin                                |string||车辆识别|
| registerDate                                  |string||注册|
| issueDate                                  |string||发证时|
| cardType          | string   |          | 主页：“primary”,副页："vice", 或者"unknown" |



### 请求参数示例

```

{
	"cardType": "primary",
	"imageItem": {
		"encryptionType": "NON",
		"imgBase64": "base64"
	}
}
```



### 返回样例

```
{
  "code": 0, 
  "recognitionInfo": {
    "address": "更庆市蕴山县缜青北路543号21幢2单元2-1", 
    "engineNo": "U27374", 
    "issueDate": "2013-11-27", 
    "model": "大众牌FV7162FAAGG", 
    "owner": "段明亮", 
    "plateNo": "渝A618G6", 
    "registerDate": "2013-11-26", 
    "useCharacter": "非营运", 
    "vehicleType": "小型轿车", 
    "vin": "LFV2A2157D3164452",
	"cardType": "primary"
  }, 
  "serialNo": "1550560993628-172025248021-173330", 
  "timestamp": 1550560993638
}
```

