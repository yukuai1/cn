# deleteConfigFile


## 描述
删除一个 configFile。


## 请求方式
DELETE

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/configFiles/{name}

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID。|
|**name**|String|True| |ConfigFile名称。|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|请求ID。 |


## 返回码
|HTTP状态码|错误码|描述|错误解析
|---|---|---|---|
|**200**||OK|
|**404**|NOT_FOUND | ConfigFile xx not found| ConfigFile xx 未找到。
|**500**| INTERNAL| Internal server error|系统内部错误，请稍后重试。如果多次尝试失败，请提交工单。
|**500**|	UNKNOWN|	Unknown server error	|服务暂时不可用，请稍后重试。如果多次尝试失败，请提交工单。
