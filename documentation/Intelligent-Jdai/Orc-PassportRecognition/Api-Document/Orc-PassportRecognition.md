# 护照


## 描述
护照

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jdcloud.com/jdai/realStateCertRecognition
```

### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |

###  返回实体

| 参数名称     | 参数类型       | 是否必填 | 参数说明         |
| :----------- | :------------- | :------- | :--------------- |
| `code`       | int            |          | 返回code码0:成功 |
| `msg`        | string         |          | msg              |
| `serialNo`   | string         |          | 交互的流水号     |
| passportInfo | `PassportInfo` |          | 护照信息         |

字段PassportInfo的内容说明：

| 参数名称    | 参数类型            | 是否必填 | 参数说明                  |
| :---------- | :------------------ | :------- | :------------------------ |
| mrzCode     | String              | 否       | MRZ码，两条MRZ码以“;”隔开 |
| birthday    | String              | 否       | 生日                      |
| passportNo  | String              | 否       | 护照号                    |
| lastName    | String              | 否       | 姓                        |
| surName     | String              | 否       | 名                        |
| nationality | String              | 否       | 出生国籍                  |
| countryCode | String              | 否       | 国家码                    |
| sex         | String              | 否       | 性别                      |
| personalNo  | String              | 否       | 个人编号                  |
| expireDate  | String              | 否       | 有效期                    |
| checkResult | String              | 否       | 识别结果合规性检查        |
| extended    | Map<String, Object> | 否       | 预留扩展字段              |

###  请求参数示例

```
{
    "appAuthorityKey": "aKG/VUsDM7EjJIA7T7B8oA==",
    "appName": "JD_SFYL_OCR",
    "businessId": "JDD-OCR-TEST-PLAT",
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": "图片base64",
        "valid": true
    },
    "imageType": "jpg",
    "serialNo": "1598547146344-172025157194-181093"
}
```



### 返回样例

```
 
```

## 图片信息



| 参数名`imageItem`  | 参数类型 | 是否必填                     | 参数说明                                                     |
| ------------------ | -------- | ---------------------------- | ------------------------------------------------------------ |
| `--imgType`` `     | enum     | N（OCR服务不用指定图片类型） | `图片的类型``SFF("采集照"),FF("全景采集照"),NIR("双目采集的近红外照片"),DEEP("深度采集的照片"),IDP("身份证正面"),IDN("身份证反面"),MP("网纹照"),AP("动作照"),``VL("行驶证"),``DL("驾驶证"),``BC("银行卡")``BL("营业执照")``LP("车牌")`COM("通用图片") |
| `--imgBase64`      | string   | Y                            | `图片的Base64`                                               |
| `--filename`       | string   | N                            | 图片的存储名, 指定了则不读base64                             |
| `--imgUrl`         | string   | N                            | 图片的Url地址（外网地址可能会有socket连接超时问题，建议传base64） |
| `--imgArr`         | byte[]   | N                            | 图片的二进制                                                 |
| `--encryptionType` | enum     | Y                            | `加密方式``/** * aks加密方式 */AKS,/** * license 加密 */LICENSE,/** * 不加密 */NON,AKS解密方式：``com.wangyin.key.server.DeviceCryptoService#decryptEnvelop  版本号1.5.3` |
| `faceLocation`     | object   | N                            | 人脸坐标                                                     |
| `--top`            | int      | Y                            | 坐标开始Y方向                                                |
| `--left`           | int      | Y                            | 坐标开始X方向                                                |
| `--width`          | int      | Y                            | 人脸图片宽度                                                 |
| `--height`         | int      | Y                            | 人脸图片高度                                                 |

