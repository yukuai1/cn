# 印章识别

## 描述

印章识别

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/stampRecognition
```

## 请求参数

### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   | Y        | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |

###  17.3.返回实体

| 参数名称    | 参数类型          | 是否必填 | 参数说明         |
| :---------- | :---------------- | :------- | :--------------- |
| `code`      | int               | Y        | 返回code码0:成功 |
| `msg`       | string            | N        | msg              |
| `serialNo`  | string            | N        | 交互的流水号     |
| `stampInfo` | `List<StampInfo>` | N        | `印章识别结果`   |

字段StampInfo的内容说明：

| 参数名称    | 参数类型              | 是否必填 | 参数说明                                         |
| :---------- | :-------------------- | :------- | :----------------------------------------------- |
| `bbox`      | `BoundingBox`         | N        | `检测坐标信息`                                   |
| `color`     | String                | N        | `颜色 取值【"red", "gray"】`                     |
| `shape`     | String                | N        | `形状 取值【“circle”, "rectangle"】`             |
| `qualities` | `List<String>`        | N        | `质量属性 【"incomplete" 残缺】`                 |
| `content`   | String                | N        | `印章识别公司名称，返回印章公司名称字段识别结果` |
| contentExt  | List<String>          | N        | `印章识别其他内容，返回印章所有其他字段识别结果` |
| `verify`    | String                | N        | `防伪分数  功能开发中`                           |
| `extended`  | `Map<String, Object>` | N        | `待扩展字段`                                     |

字段BoundingBox的内容说明：

| 参数名称 | 参数类型  | 是否必填 | 参数说明   |
| :------- | :-------- | :------- | :--------- |
| `top`    | `Integer` | N        | `高`       |
| `left`   | Integer   | N        | 左         |
| `width`  | Integer   | N        | 人脸的宽度 |
| `height` | Integer   | N        | 人脸的高度 |

**17.4.请求参数示例**

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



### 17.5.返回样例

```
{
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "stampInfo": {         
			"bbox": {
                "left": 356,
                "top": 417,
                "width": 157,
                "height": 158
            	},
            "shape": "circle",
            "color": "red",
            "qualities": [
                  
            ],
            "content": '苏州xxxxxxxxxxxx有限公司',
            "contentExt": ['3205120029070'],
            "verify": 0.0,
            "extended": null 
		},
    "timestamp": 1618381882201
}
```