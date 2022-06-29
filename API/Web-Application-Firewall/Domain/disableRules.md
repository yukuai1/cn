# disableRules


## 描述
规则开关

## 请求方式
POST

## 请求地址
https://waf.jdcloud-api.com/v1/regions/{regionId}/wafInstanceIds/{wafInstanceId}/domain:disableRules

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |实例所属的地域ID|
|**wafInstanceId**|String|True| |实例Id|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**req**|[DisableRulesReq](disablerules#disablerulesreq)|True| |请求|
|**content-language**|String|True| |语言，"en":英文，"zh":中文|

### <div id="disablerulesreq">DisableRulesReq</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**wafInstanceId**|String|True| |实例id，代表要设置的WAF实例|
|**domain**|String|True| |域名|
|**disable**|Integer|False| |0:使用规则，1：禁用规则|
|**ids**|Integer[]|False| |操作的规则id, ruleType非"waf"时必填|
|**ruleType**|String|True| |操作的规则类型，"waf":waf总体防护开关，"cc":cc规则，"ratelimit"：限速，"usrdefCookie":cookie类型的黑白名单，"usrdefGeo":geo类型的黑白名单，"usrdefHeaders":header类型的黑白名单，"usrdefIP":ip类型的黑白名单，"usrdefURI":uri类型的黑白名单，"filterReqresp":请求头类型的流量管理，"filterSenseinfo":敏感信息防泄漏，"usrdefWaf":waf自定义规则,"rewriteRule":重写规则（目前是uri重写规则）,"listRule":黑白名单规则（目前指method黑白名单）,"proxycache":url缓存，"botUsr":自定义类型BOT规则,"risk":风险防护规则,"riskEvent":风险控制事件,"riskUsrList":风险控制用户自定义名单|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**requestId**|String|此次请求的ID|


## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
