# deletePanel


## 描述
删除监控大盘

## 请求方式
DELETE

## 请求地址
https://smartdba.jdcloud-api.com/v2/regions/{regionId}/panels/{panelGid}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域代码，取值范围参见[《各地域及可用区对照表》](../Enum-Definitions/Regions-AZ.md)|
|**panelGid**|String|True| |监控大盘id|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
