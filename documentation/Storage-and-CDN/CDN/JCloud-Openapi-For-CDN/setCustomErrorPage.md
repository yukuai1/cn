# setCustomErrorPage


## 描述
设置自定义错误页面信息，中国境外/全球加速时暂不支持自定义错误页面相关配置

## 请求方式
POST

## 请求地址
https://cdn.jdcloud-api.com/v1/domain/{domain}/customErrorPage

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**errorPageConfigs**|[ErrorPageConfigs[]](queryCustomErrorPage#ErrorPageConfigs)|False| |自定义错误页面配置|

### <div id="ErrorPageConfigs">ErrorPageConfigs</div>
|名称|类型|描述|
|---|---|---|
|**errorCode**|String|状态码：可选值[403,404,414,429,500,501,502,503,504]|
|**url**|String|url|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|Object| |
|**requestId**|String| |


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
