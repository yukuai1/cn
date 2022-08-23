# 港澳通行证识别接口


## 描述
港澳通行证识别接口

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
| `cardType` | string | N | 港澳通行证类型 正反面【“front”，“back”】, 若未知传"unknown" |



### 返回实体

| 参数名称  | 参数类型             | 是否必填 | 参数说明                              |
| :-------- | :------------------- | :------- | :------------------------------------ |
| code      | int                  |          | 返回code码0:成功                      |
| msg       | string               |          | msg                                   |
| serialNo  | string               |          | 交互的流水号                          |
| cardType  | String               |          | 港澳通行证类型 正面：front 反面：back |
| frontInfo | EntryPermitFrontInfo |          | 正面信息cardType为front时有信息       |
| backInfo  | EntryPermitBackInfo  |          | 反面信息cardType为back时有信息        |

## 字段AirplaneItineraryInfo的内容说明

| 参数名称   | 参数类型            | 是否必填 | 参数说明                 |
| :--------- | :------------------ | :------- | :----------------------- |
| 参数名称   | 参数类型            | 是否必填 | 参数说明                 |
| smallId    | String              | 否       | 短id号（位于证件右上方） |
| name       | String              | 否       | 姓名                     |
| pinyin     | String              | 否       | 姓名拼音                 |
| birthdate  | String              | 否       | 出生日期                 |
| sex        | String              | 否       | 性别                     |
| valideDate | String              | 否       | 有效期限                 |
| issue      | String              | 否       | 签发机关                 |
| place      | String              | 否       | 签发地点                 |
| longId     | String              | 否       | 长id号（位于证件下方）   |
| extended   | Map<String, Object> | 否       | 预留扩展字段             |

字段EntryPermitBackInfo的内容说明：

| 参数名称   | 参数类型            | 是否必填 | 参数说明                                        |
| :--------- | :------------------ | :------- | :---------------------------------------------- |
| 参数名称   | 参数类型            | 是否必填 | 参数说明                                        |
| cardId     | String              | 否       | id（位于证件左侧，可能不存在）                  |
| typeHk     | String              | 否       | 种类（往来香港签注）                            |
| timesHk    | String              | 否       | 往返有效次数（往来香港签注）                    |
| dateHk     | String              | 否       | 有效期（往来香港签注）                          |
| noteHk     | String              | 否       | 备注（往来香港签注）                            |
| codeHk     | String              | 否       | code码（位于香港签注二维码下方）                |
| typeMacao  | String              | 否       | 种类（往来澳门签注）                            |
| timesMacao | String              | 否       | 往返有效次数（往来澳门签注）                    |
| dateMacao  | String              | 否       | 有效期（往来澳门签注）                          |
| noteMacao  | String              | 否       | 备注（往来澳门签注）                            |
| codeMacao  | String              | 否       | code码（位于澳门签注二维码下方）                |
| keyPs      | String              | 否       | 提示（预存指纹信息(R1L1VHM)，可按规定自助通关） |
| extended   | Map<String, Object> | 否       | 预留扩展字段                                    |

## 请求参数示例

```json
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
    "serialNo": "1598547146344-172025157194"
}

```

## 

