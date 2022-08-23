# 通用手写体


## 描述
通用手写体

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
| cardType          | string   | Y        | 手写体【”handwriting“】，印刷体【”print“】，手写体+印刷体【"all"】 |

### 返回实体

| 参数名称    | 参数类型        | 是否必填 | 参数说明                   |
| :---------- | :-------------- | :------- | :------------------------- |
| `code`      | int             | Y        | 返回code码0:成功           |
| `msg`       | string          | N        | msg                        |
| `serialNo`  | string          | N        | 交互的流水号               |
| `blur`      |                 | N        | `模糊程度（值越大越清晰）` |
| location    | Point           | N        | 检测字符边框               |
| `textsInfo` | List<TextsInfo> | N        | 识别结果                   |

字段textsInfo的内容说明：

| 参数名称 | 参数类型 | 是否必填 | 参数说明                                                 |
| :------- | :------- | :------- | :------------------------------------------------------- |
| `type``` | string   | Y        | `字体类型：手写体【“handwriting"】，``印刷体【"print"】` |
| `text`   | `string` | Y        | `识别后的文本结果`                                       |
| points   | Point    | Y        | 文本所在位置矩形顶点坐标[pt0, pt1, pt2, pt3]             |

### 请求参数示例

```
{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"imgType": "COM",
		"imgBase64":"",
		"encryptionType": "NON"
	},
	"imageType": "jpg",
	"cardType": "handwriting"
}
```



### 返回样例

```
{
    "blur": 442.92627,
    "code": 0,
    "msg": "成功",
    "serialNo": "12092873283-2313",
	"location": {
        "top": 227,
        "left": 143,
        "width": 611,
        "height": 114
    }
    "textsInfo": [
        {
            "points": [
                {
                    "x": 1,
                    "y": 143
                },
                {
                    "x": 237,
                    "y": 752
                },
                {
                    "x": 227,
                    "y": 754
                },
                {
                    "x": 331,
                    "y": 144
                }
            ],
            "text": "中文手写体测试",
            "type": "handwriting"
        }
    ],
    "timestamp": 1618467122528
}
```