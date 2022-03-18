# 香港身份证识别


## 描述
香港身份证识别

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/hkIdcardRecognition
```



### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `cardType`        | string   | Y        | 新老版式，取值【“v2003”，“v2018”】, 若未知传"v2018"          |

### 返回实体

| 参数名称   | 参数类型 | 参数说明         |
| :--------- | :------- | :--------------- |
| `code`     | int      | 返回code码0:成功 |
| `msg`      | string   | msg              |
| `serialNo` | string   | 交互的流水号     |
| `data`     | `Object` | 识别结果         |

字段data的内容说明：

| 参数名称     | 参数类型 | 参数说明                                  |
| :----------- | :------- | :---------------------------------------- |
| cardType     | String   | 证件版式，【"v2003"， "v2018"， "other"】 |
| `id`         | String   | 身份证号                                  |
| `name`       | String   | 姓名                                      |
| `enName`     | String   | 英文名                                    |
| `commercial` | String   | comercial code                            |
| sex          | String   | 性别                                      |
| `symbols`    | String   | symbols code                              |
| `birth`      | String   | 出生日期                                  |
| `issue`      | String   | 签发日期                                  |
| `register`   | String   | 注册日期                                  |
| isValid      | String   | 校验字段 "Y" / "N"                        |



### 请求参数示例

```
{
 	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx", 
    "cardType": "v2018",
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": "",
        "imgType": "COM"
    },
    "serialNo": "12092873283-2313"
}
```



### 返回样例

```
{
    "code": 0,
    "data": {
        "birth": "01-01-1988",
        "cardType": "v2018",
        "commercial": "394725355174",
        "enName": "SAN, Chi Nan",
        "id": "C668668(E)",
        "isValid": "N",
        "issue": "(01-99)",
        "name": "中智能",
        "register": "15-09-18",
        "sex": "F",
        "symbols": "***AZ"
    },
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "timestamp": 1646188619374
}
```