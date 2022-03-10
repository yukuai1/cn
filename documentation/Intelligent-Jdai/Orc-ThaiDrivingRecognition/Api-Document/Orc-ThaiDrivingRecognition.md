# 泰国驾驶证识别


## 描述
泰国驾驶证识别

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
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `cardType`        | string   | N        | 备用字段                                                     |

### 返回实体

| 参数名称   | 参数类型 | 是否必填 | 参数说明         |
| :--------- | :------- | :------- | :--------------- |
| `code`     | int      |          | 返回code码0:成功 |
| `msg`      | string   |          | msg              |
| `serialNo` | string   |          | 交互的流水号     |
| `data`     | Object   |          | `识别结果`       |

字段data的内容说明：

| 参数名称          | 参数类型 | 是否必填 | 参数说明 |
| :---------------- | :------- | :------- | :------- |
| `IOcrObject```    | Object   |          | ``       |
| `TextsInfoObject` | `Object` |          |          |

字段IOcrObject的内容说明：

| 参数名称   | 参数类型            | 参数说明                         | 是否必填 |
| :--------- | :------------------ | :------------------------------- | :------- |
| `bbox`     | BBoxObject          | 检测整体字符边框                 | ``       |
| `textInfo` | List                | 单行文本信息                     |          |
| blur       | float               | 模糊程度（0~1，值越大越模糊）    |          |
| luma       | float               | 图像亮度（0~1，值越大亮度越高）  | ``       |
| type       | String              | 证件类型：“ThaiDriving”/ “Other” |          |
| extended   | Map<String, Object> | 待扩展字段                       |          |

字段TextsInfoObject的内容说明：

| 参数名称 | 参数类型            | 参数说明                                                     |
| -------- | ------------------- | ------------------------------------------------------------ |
| `type`   | String              | 关键字：carBrand车辆品牌carColor车辆颜色carModel车辆型号carPlateNo车牌号carTypeNumber车辆类型编码engineBrand发动机型号engineSize发动机尺寸modelYear年份numberOfSeats座位数registeredDate注册日期registeredProvince注册省份subType子类型totalWeight总重量VIN车辆识别代码 |
| text     | String              | 识别后的文本结果                                             |
| points   | List                | 文本所在位置矩形顶点坐标[pt0, pt1, pt2, pt3]                 |
| extended | Map<String, Object> | 待扩展字段                                                   |

### 请求参数示例

```
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

### 返回样例

```
{
    "code": 0,
    "data": {
        "bbox": {
            "height": 283,
            "left": 46,
            "top": 39,
            "width": 663
        },
        "blur": 0.0,
        "luma": 0.89667434,
        "textInfo": [
            {
                "points": [
                    {
                        "x": 117.0,
                        "y": 143.0
                    },
                    {
                        "x": 169.0,
                        "y": 143.0
                    },
                    {
                        "x": 169.0,
                        "y": 157.0
                    },
                    {
                        "x": 117.0,
                        "y": 157.0
                    }
                ],
                "text": "TOYOTA",
                "type": "carBrand"
            },
            {
                "points": [
                    {
                        "x": 82.0,
                        "y": 170.0
                    },
                    {
                        "x": 112.0,
                        "y": 170.0
                    },
                    {
                        "x": 112.0,
                        "y": 185.0
                    },
                    {
                        "x": 82.0,
                        "y": 185.0
                    }
                ],
                "text": "ขาว",
                "type": "carColor"
            },
            {
                "points": [
                    {
                        "x": 364.0,
                        "y": 137.0
                    },
                    {
                        "x": 408.0,
                        "y": 137.0
                    },
                    {
                        "x": 408.0,
                        "y": 152.0
                    },
                    {
                        "x": 364.0,
                        "y": 152.0
                    }
                ],
                "text": "HILUX",
                "type": "carModel"
            },
            {
                "points": [
                    {
                        "x": 387.0,
                        "y": 84.0
                    },
                    {
                        "x": 442.0,
                        "y": 84.0
                    },
                    {
                        "x": 442.0,
                        "y": 101.0
                    },
                    {
                        "x": 387.0,
                        "y": 101.0
                    }
                ],
                "text": "ชฮ 579",
                "type": "carPlateNo"
            },
            {
                "points": [
                    {
                        "x": 411.0,
                        "y": 108.0
                    },
                    {
                        "x": 427.0,
                        "y": 108.0
                    },
                    {
                        "x": 427.0,
                        "y": 128.0
                    },
                    {
                        "x": 411.0,
                        "y": 128.0
                    }
                ],
                "text": "1",
                "type": "carTypeNumber"
            },
            {
                "points": [
                    {
                        "x": 177.0,
                        "y": 193.0
                    },
                    {
                        "x": 231.0,
                        "y": 193.0
                    },
                    {
                        "x": 231.0,
                        "y": 207.0
                    },
                    {
                        "x": 177.0,
                        "y": 207.0
                    }
                ],
                "text": "TOYOTA",
                "type": "engineBrand"
            },
            {
                "points": [
                    {
                        "x": 204.0,
                        "y": 258.0
                    },
                    {
                        "x": 242.0,
                        "y": 258.0
                    },
                    {
                        "x": 242.0,
                        "y": 272.0
                    },
                    {
                        "x": 204.0,
                        "y": 272.0
                    }
                ],
                "text": "2982",
                "type": "engineSize"
            },
            {
                "points": [
                    {
                        "x": 662.0,
                        "y": 127.0
                    },
                    {
                        "x": 701.0,
                        "y": 127.0
                    },
                    {
                        "x": 701.0,
                        "y": 145.0
                    },
                    {
                        "x": 662.0,
                        "y": 145.0
                    }
                ],
                "text": "2007",
                "type": "modelYear"
            },
            {
                "points": [
                    {
                        "x": 408.0,
                        "y": 301.0
                    },
                    {
                        "x": 425.0,
                        "y": 301.0
                    },
                    {
                        "x": 425.0,
                        "y": 320.0
                    },
                    {
                        "x": 408.0,
                        "y": 320.0
                    }
                ],
                "text": "7",
                "type": "numberOfSeats"
            },
            {
                "points": [
                    {
                        "x": 158.0,
                        "y": 91.0
                    },
                    {
                        "x": 269.0,
                        "y": 91.0
                    },
                    {
                        "x": 269.0,
                        "y": 104.0
                    },
                    {
                        "x": 158.0,
                        "y": 104.0
                    }
                ],
                "text": "3 เมษายน 2551",
                "type": "registeredDate"
            },
            {
                "points": [
                    {
                        "x": 586.0,
                        "y": 79.0
                    },
                    {
                        "x": 690.0,
                        "y": 79.0
                    },
                    {
                        "x": 690.0,
                        "y": 99.0
                    },
                    {
                        "x": 586.0,
                        "y": 99.0
                    }
                ],
                "text": "กรุงเทพมหานคร",
                "type": "registeredProvince"
            },
            {
                "points": [
                    {
                        "x": 517.0,
                        "y": 101.0
                    },
                    {
                        "x": 588.0,
                        "y": 101.0
                    },
                    {
                        "x": 588.0,
                        "y": 122.0
                    },
                    {
                        "x": 517.0,
                        "y": 122.0
                    }
                ],
                "text": "นั่งสามตอน",
                "type": "subType"
            },
            {
                "class": "com.jd.jdd.vision.ocr.message.TextsInfoObject",
                "points": [
                    {
                        "x": 215.0,
                        "y": 307.0
                    },
                    {
                        "x": 251.0,
                        "y": 307.0
                    },
                    {
                        "x": 251.0,
                        "y": 322.0
                    },
                    {
                        "x": 215.0,
                        "y": 322.0
                    }
                ],
                "text": "1900",
                "type": "totalWeight"
            },
            {
                "points": [
                    {
                        "x": 332.0,
                        "y": 163.0
                    },
                    {
                        "x": 477.0,
                        "y": 163.0
                    },
                    {
                        "x": 477.0,
                        "y": 176.0
                    },
                    {
                        "x": 332.0,
                        "y": 176.0
                    }
                ],
                "text": "MR0YZ59G900062648",
                "type": "VIN"
            }
        ],
        "type": "ThaiDriving"
    },
    "msg": "成功",
    "serialNo": "1598547146344-172025157194-181093",
    "timestamp": 1646706828210
}
```