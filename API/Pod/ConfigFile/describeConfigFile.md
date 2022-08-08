# describeConfigFile


## 描述
查询单个 ConfigFile 详情。


## 请求方式
GET

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
|**result**|[Result](#result)| 响应结果。|
|**requestId**|String|请求ID。 |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**configFile**|[ConfigFile](#configfile)|ConfigFile详情。 |

### <div id="ConfigFile">ConfigFile</div>
|名称|类型|描述|
|---|---|---|
|**name**|String|ConfigFile名称。|
|**data**|[ConfigFileData[]](#configfiledata)|ConfigFile数据。|

### <div id="ConfigFileData">ConfigFileData</div>
|名称|类型|描述|
|---|---|---|
|**key**|String|键。|
|**value**|String|值，返回结果为base64后的内容。|

## 返回码
|HTTP状态码|错误码|描述|错误解析
|---|---|---|---|
|**200**||OK|
