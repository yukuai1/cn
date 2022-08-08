# updateConfigFile


## 描述
更新ConfigFile信息。


## 请求方式
POST

## 请求地址
https://pod.jdcloud-api.com/v1/regions/{regionId}/configFiles/{name}:update

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 ID。|
|**name**|String|True| |ConfigFile 名称。|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |ConfigFile 的名称，须确保全局唯一。<br>只允许数字、小写字母、及中划线“-”，不超过63个字符。|
|**data**|[ConfigFileData[]](#configfiledata)|True| |ConfigFile的数据，键值对形式，不超过32对，总长度不超过1MB。|

### <div id="ConfigFileData">ConfigFileData</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**key**|String|True| |键，不能重复，只允许数字、大小写字母、英文下划线”_”、中划线“-”及点”.”，不超过128个字符。|
|**value**|String|True| |值，须base64后传入，不超过32KB。|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| 响应结果。|
|**requestId**|String|请求ID |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**name**|String|ConfigFile名称。 |

## 返回码
|HTTP状态码|错误码|描述|错误解析
|---|---|---|---|
|**200**||OK|
