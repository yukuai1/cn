# 印章检测


## 描述
印章检测

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
| `extMap`          | map      | N        | 附加信息, 特殊需求处理                                       |

### 返回实体

| 参数名称    | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------- | :------- | :------- | :----------------------------------------------------------- |
| `code`      | int      |          | 返回code码0:成功                                             |
| `msg`       | string   |          | msg                                                          |
| `serialNo`  | string   |          | 交互的流水号                                                 |
| `data`      | List     |          | `识别结果```                                                 |
| `algResult` | boolean  |          | 检测结果，true通过，false不通过data中每个结果都通过此字段才为true |

字段data的内容说明：

| 参数名称   | 参数类型           | 参数说明                                                  | 是否必填 |
| :--------- | :----------------- | :-------------------------------------------------------- | :------- |
| bbox       | BBoxOject          | 检测坐标                                                  | ``       |
| color      | String             | 颜色，取值【"red", "gray", "unknown"】                    | ``       |
| shape      | String             | 形状，取值【“circle”, "rectangle", "ellipse", "unknown"】 |          |
| qualities  | List<String>       | 质量属性，【"incomplete" 】                               |          |
| content    | String             | 功能开发中，返回“developing”                              |          |
| contentExt | String             | 功能开发中，返回“developing”                              |          |
| verify     | Float              | 防伪分数，功能开发中，返回0.0                             |          |
| extended   | Map<String,Object> | 待扩展字段                                                |          |



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
    "algResult": true,
    "code": 0,
    "data": [
        {
            "bbox": {
                "height": 466,
                "left": 0,
                "top": 0,
                "width": 650
            },
            "color": "red",
            "content": "developing",
            "contentExt": "developing",
            "qualities": [
                "incomplete"
            ],
            "shape": "circle",
            "verify": 0.0
        }
    ],
    "msg": "成功",
    "serialNo": "12092873283-2313",
    "timestamp": 1646202687598
}
```