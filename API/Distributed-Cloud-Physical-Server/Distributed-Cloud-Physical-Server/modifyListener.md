# modifyListener


## 描述
修改监听器

## 请求方式
POST

## 请求地址
https://edcps.jdcloud-api.com/v1/regions/{regionId}/listeners/{listenerId}:modifyListenerAttributes

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |地域ID，可调用接口（describeCPSLBRegions）获取云物理服务器支持的地域|
|**listenerId**|String|True| |监听器ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**algorithm**|String|False| |调度算法|
|**stickySession**|String|False| |会话保持|
|**realIp**|String|False| |是否获取真实ip，取值范围on|off|
|**name**|String|False| |名称|
|**description**|String|False| |描述|
|**healthCheck**|String|False| |健康检查|
|**healthCheckTimeout**|Integer|False| |健康检查响应的最大超时时间|
|**healthCheckInterval**|Integer|False| |健康检查响应的最大间隔时间|
|**healthyThreshold**|Integer|False| |健康检查结果为success的阈值|
|**unhealthyThreshold**|Integer|False| |健康检查结果为fail的阈值|
|**serverGroupId**|String|False| |服务器组id|
|**stickySessionTimeout**|Integer|False| |会话保持超时时间，单位s|
|**cookieType**|String|False| |会话类型，植入Cookie or 重写Cookie|
|**healthCheckUri**|String|False| |检查路径|
|**healthCheckHttpCode**|String|False| |正常态码，要使用的Http状态码|
|**certificateId**|String|False| |证书ID|
|**headers**|String[]|False| |获取HTTP头字段：X-Forwarded-For、X-Forwarded-Proto、X- Forwarded-Port、X-Forwarded-LBIP|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](#result)| |
|**requestId**|String| |

### <div id="Result">Result</div>
|名称|类型|描述|
|---|---|---|
|**listener**|[Listener](#listener)|监听器详细信息|
### <div id="Listener">Listener</div>
|名称|类型|描述|
|---|---|---|
|**listenerId**|String|监听器ID|
|**loadBalancerId**|String|负载均衡ID|
|**protocol**|String|协议|
|**port**|Integer|端口|
|**algorithm**|String|调度算法|
|**stickySession**|String|会话保持状态，取值on|off|
|**realIp**|String|获取真实ip|
|**status**|String|状态|
|**name**|String|名称|
|**description**|String|描述|
|**healthCheck**|String|健康检查状态，取值on|off|
|**healthCheckTimeout**|Integer|健康检查响应的最大超时时间，单位s|
|**healthCheckInterval**|Integer|健康检查响应的最大间隔时间，单位s|
|**healthyThreshold**|Integer|健康检查结果为success的阈值|
|**unhealthyThreshold**|Integer|健康检查结果为fail的阈值|
|**healthCheckIp**|String|健康检查ip|
|**serverGroupId**|String|服务器组id|
|**stickySessionTimeout**|Integer|会话保持超时时间，单位s|
|**cookieType**|String|会话类型，植入Cookie or 重写Cookie|
|**healthCheckUri**|String|检查路径|
|**healthCheckHttpCode**|String|正常态码，要使用的Http状态码|
|**certificateId**|String|证书ID|
|**certificateName**|String|证书名称|
|**headers**|String[]|获取HTTP头字段：X-Forwarded-For、X-Forwarded-Proto、X- Forwarded-Port、X-Forwarded-LBIP|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
