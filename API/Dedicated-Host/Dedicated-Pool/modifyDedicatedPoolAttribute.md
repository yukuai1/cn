# modifyDedicatedPoolAttribute


## 描述
修改专有资源池属性。

## 接口说明
- 支持修改专有宿主机的名称、描述和可用区。
- 修改可用区时旧可用区必须是新可用区的子集，即可用区只能添加，不能减少。

## 请求方式
POST

## 请求地址
https://dh.jdcloud-api.com/v1/regions/{regionId}/dedicatedPool/{dedicatedPoolId}:modifyAttribute

|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**regionId**|String|是|cn-north-1 |地域ID|
|**dedicatedPoolId**|String|是|pool-9dur****yt |专有资源池ID|

## 请求参数
|名称|类型|是否必需|示例值|描述|
|---|---|---|---|---|
|**name**|String|否| |名称，<a href="http://docs.jdcloud.com/virtual-machines/api/general_parameters">参考公共参数规范</a>。|
|**description**|String|否| |描述，<a href="http://docs.jdcloud.com/virtual-machines/api/general_parameters">参考公共参数规范</a>。|
|**az**|String[]|否|cn-north-1c |指定专有资源池申请专有宿主机时默认继承的可用区。<br><br>修改可用区时旧可用区必须是新可用区的子集，即可用区只能添加，不能减少。<br>|


## 返回参数
|名称|类型|示例值|描述|
|---|---|---|---|
|**requestId**|String|c2hmmaan8w06w19qcdfuic4w03f7ft2d|请求ID。|

## 请求示例
POST

```
/v1/regions/cn-north-1/dedicatedPool/pool-urn7rqof1q:modifyAttribute?name=dp-test
{
    "name":"test-0110",
}
```

## 返回示例
```
{
    "requestId": "a0633f72670e59f8c6db36b1ee257011"
}
```

## 返回码
|返回码|描述|
|---|---|
|**200**|OK|
|**400**|Invalid parameter|
|**401**|Authentication failed|
|**404**|Not found|
|**500**|Internal server error|
|**503**|Service unavailable|
