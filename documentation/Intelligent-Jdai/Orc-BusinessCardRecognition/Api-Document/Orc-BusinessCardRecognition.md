# 名片


## 描述
名片

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

| 参数名称           | 参数类型           | 是否必填 | 参数说明         |
| :----------------- | :----------------- | :------- | :--------------- |
| `code`             | int                | Y        | 返回code码0:成功 |
| `msg`              | string             | N        | msg              |
| `serialNo`         | string             | N        | 交互的流水号     |
| `businessCardInfo` | `BusinessCardInfo` | N        | `名片识别结果`   |

字段BusinessCardInfo的内容说明：

| 参数名称         | 参数类型     | 是否必填 | 参数说明                                 |
| :--------------- | :----------- | :------- | :--------------------------------------- |
| `name`           | String       | N        | `姓名`                                   |
| `email`          | String       | N        | `邮箱`                                   |
| `mobile`         | String       | N        | `手机号 可能会有多个，以;作为分割符号`   |
| `title`          | `String`     | N        | `职位`                                   |
| `company`        | String       | N        | `公司名称 可能会有多个，以;作为分割符号` |
| `address`        | String       | N        | `公司地址`                               |
| `tel`            | String       | N        | `电话号码 可能会有多个，以;作为分割符号` |
| `department`     | String       | N        | ` 部门`                                  |
| `url`            | String       | N        | `公司网址`                               |
| `postalCode`     | String       | N        | `邮编`                                   |
| `nameEn`         | String       | N        | `英文姓名`                               |
| `companyEn`      | String       | N        | `英文公司`                               |
| `addressEn`      | String       | N        | `英文地址`                               |
| `departmentEn`   | String       | N        | `英文部门`                               |
| `generalResults` | List<String> | N        | `未结构化的结果`                         |

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
    "businessCardInfo": {
        "name":"丁xx",
		"email":"dingxxxl@163.com",
		"mobile":"+86-xxxxx",
		"title":"总经理",
 		"company":"xxxxxx",
		"address":"xxxxxx",
		"tel":"'0510-xxxxxxx",
		"department":"xxxx",
		"url":"xxxx",
 		"postalCode":"xxxxxx", 
 		"nameEn":"xxxx", 
 		"companyEn":"xxxx", 
 		"addressEn":"xxxxx",   
  		"departmentEn":"xxxxxx",    
  		"generalResults": ["加期明", "xxx", "xxx"]
},
    "timestamp": 1618381882201
}
```

