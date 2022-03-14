# 营业执照质检


## 描述
营业执照质检

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
| ```extended`      | map      | N        | 附加信息, 特殊需求处理                                       |



### 返回实体

| 参数名称     | 参数类型         | 是否必填 | 参数说明                                                     |
| :----------- | :--------------- | :------- | :----------------------------------------------------------- |
| `code`       | int              |          | 返回code码0:成功                                             |
| `msg`        | string           |          | msg                                                          |
| `serialNo`   | string           |          | 交互的流水号                                                 |
| `qrCodeInfo` | List<QrCodeInfo> |          | `二维码识别结果```                                           |
| ```sealInfo` | List<SealInfo>   |          | 印章识别结果                                                 |
| type         | String           |          | 营业执照分类：normal：营业执照原件copy：营业执照复印件other：非营业执照 |
| ``           |                  |          |                                                              |

字段qrCodeInfo的内容说明：

| 参数名称         | 参数类型      | 是否必填 | 参数说明         |
| :--------------- | :------------ | :------- | :--------------- |
| `content```      | string        |          | `识别结果`       |
| `qrCodeLocation` | `BoundingBox` |          | `二维码检测位置` |
| --height         | int           |          |                  |
| --left           | int           |          |                  |
| --top            | int           |          |                  |
| --width          | int           |          |                  |

字段sealInfo的内容说明：

| 参数名称       | 参数类型      | 是否必填 | 参数说明                                |
| :------------- | :------------ | :------- | :-------------------------------------- |
| `shape`        | string        |          | `印章形状取值【“circle”, "rectangle"】` |
| color          | string        |          | 颜色取值【"red", "gray"】               |
| qualities      | List<String>  |          | “incomplete" 残缺                       |
| `sealLocation` | `BoundingBox` |          | `印章检测位置`                          |
| --height       | int           |          |                                         |
| --left         | int           |          |                                         |
| --top          | int           |          |                                         |
| --width        | int           |          |                                         |



### 请求参数示例

```
{
	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx",
	"imageItem": {
		"imgType": "BL",
		"imgBase64":"",
		"encryptionType": "NON",
		"imageType": "jpg"
	}
}
```



### 返回样例

```
{
    "code": 0,
    "msg": "成功",
    "qrCodeInfo": [
        {
            "content": "http://gsxt.gzgs.gov.cn//EntInfo.jspx?id=Zm1F5eXNQ&jumpFlag=false",
            "qrCodeLocation": {
                "height": 246,
                "left": 285,
                "top": 367,
                "width": 247
            }
        }
    ],
    "sealInfo": [
        {
            "color": "red",
            "qualities": [],
            "sealLocation": {
                "height": 287,
                "left": 175,
                "top": 1103,
                "width": 287
            },
            "shape": "circle"
        }
    ],
    "serialNo": "1598547146344-172025157194-181093",
    "timestamp": 1606981856440,
    "type": "normal"
}
```

