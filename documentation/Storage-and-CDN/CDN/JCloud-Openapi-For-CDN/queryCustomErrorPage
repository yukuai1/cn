# queryFollowRedirect


## 描述
查询自定义错误页面信息

## 请求方式
GET

## 请求地址
https://cdn.jdcloud-api.com/v1/domain/{domain}/customErrorPage

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**domain**|String|True| |用户域名|

## 请求参数
无


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](queryCustomErrorPage#result)| |
|**requestId**|String| |

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**domain**|String|域名 |
|**enable**|String|自定义错误页面开关(on:开启 off：关闭) |
|**customErrorPageInfos**|[ErrorPageConfigs[]](queryCustomErrorPage#ErrorPageConfigs)|自定义错误页面信息 |

### <div id="ErrorPageConfigs">ErrorPageConfigs</div>
|名称|类型|描述|
|---|---|---|
|**errorCode**|String|状态码：可选值[403,404,414,429,500,501,502,503,504]|
|**url**|String|url|


## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**404**|NOT_FOUND|
