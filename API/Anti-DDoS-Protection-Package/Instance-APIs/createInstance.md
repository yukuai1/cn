# createInstance


## 描述
创建防护包实例

## 请求方式
POST

## 请求地址
https://antipro.jdcloud-api.com/v1/regions/{regionId}/instances

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域 Id, DDoS 防护包目前支持华北-北京, 华东-宿迁, 华东-上海|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**createInstanceSpec**|[CreateInstanceSpec](createinstance#createinstancespec)|True| |创建防护包实例请求参数|
|**autoRenewalSpec**|[AutoRenewalSpec](createinstance#autorenewalspec)|False| |自动续费配置, 默认不开通|

### <div id="autorenewalspec">AutoRenewalSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**autoRenewalEnable**|Boolean|True| |是否开通自动续费, true: 开通自动续费, false: 不开通自动续费|
|**timeSpan**|Integer|False| |购买防护包时长, 开通自动续费时必传. <br>- timeUnit 为 3 时, 可取值 1-9<br>- timeUnit 为 4 时, 可取值 1-3|
|**timeUnit**|Integer|False| |自动续费时长类型, 开通自动续费时必传. <br>- 3: 月<br>- 4: 年|
### <div id="createinstancespec">CreateInstanceSpec</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |防护包实例名称, 新购防护包时必传. 长度限制为 1-80 个字符, 只允许包含中文, 字母, 数字, -, ., /, _|
|**ipNum**|Integer|True| |可防护 IP 数量, 1, 5, 10, 50, 100, 1000(不限)|
|**bpGbps**|Integer|True| |保底带宽: 10, 20, 30, 50, 单位: Gbps|
|**epGbps**|Integer|True| |弹性带宽: 0, 10, 20, 单位: Gbps|
|**timeSpan**|Integer|True| |购买防护包时长, 新购防护包时必传. <br>- timeUnit 为 3 时, 可取值 1-9<br>- timeUnit 为 4 时, 可取值 1-3|
|**timeUnit**|Integer|True| |购买时长类型, 新购防护包时必传. <br>- 3: 月<br>- 4: 年|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createinstance#result)| |
|**requestId**|String| |
|**error**|[Error](createinstance#error)| |

### <div id="error">Error</div>
|名称|类型|描述|
|---|---|---|
|**err**|[Err](createinstance#err)| |
### <div id="err">Err</div>
|名称|类型|描述|
|---|---|---|
|**code**|Long|同http code|
|**details**|Object| |
|**message**|String| |
|**status**|String|具体错误|
### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**instanceId**|String|创建的防护包实例 Id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
