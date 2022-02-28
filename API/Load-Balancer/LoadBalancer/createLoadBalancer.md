# createLoadBalancer


## 描述
创建负载均衡

## 请求方式
POST

## 请求地址
https://lb.jdcloud-api.com/v1/regions/{regionId}/loadBalancers/

|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**regionId**|String|True| |Region ID|

## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**loadBalancerName**|String|True| |LoadBalancer的名称,只允许输入中文、数字、大小写字母、英文下划线“_”及中划线“-”，不允许为空且不超过32字符|
|**subnetId**|String|True| |LoadBalancer所属子网的Id|
|**type**|String|False| |LoadBalancer的类型，取值：alb、nlb、dnlb，默认为alb|
|**azs**|String[]|False| |【alb，nlb】LoadBalancer所属availability Zone列表,对于alb,nlb是必选参数，可用区个数不能超过2个 <br>【dnlb】中心可用区，dnlb不需要传该参数，全可用区可用；边缘可用区，仅支持传入单可用区|
|**chargeSpec**|[ChargeSpec](createloadbalancer#chargespec)|False| |【alb】支持按用量计费，默认为按用量。【nlb】支持按用量计费。【dnlb】支持按配置计费|
|**elasticIp**|[ElasticIpSpec](createloadbalancer#elasticipspec)|False| |负载均衡关联的弹性IP规格|
|**privateIpAddress**|String|False| |指定LoadBalancer的VIP(内网IPv4地址)，需要属于指定的子网并且未被占用|
|**securityGroupIds**|String[]|False| |【alb】 安全组 ID列表|
|**description**|String|False| |LoadBalancer的描述信息,允许输入UTF-8编码下的全部字符，不超过256字符|
|**deleteProtection**|Boolean|False| |删除保护，取值为True(开启)或False(关闭)，默认为False|
|**userTags**|[Tag[]](createloadbalancer#tag)|False| |用户tag 信息|


## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createloadbalancer#result)| |
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**loadBalancerId**|String|负载均衡id|

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Request field x.y.z is 'xxx', expected one of [yyy,zzz].|
|**403**|'xxx' forbidden.|
|**404**|'xxx' not found.|
|**409**|'xxx' inuse.|
|**429**|lb xxx quota exceeded.|
|**500**|internal server error|
