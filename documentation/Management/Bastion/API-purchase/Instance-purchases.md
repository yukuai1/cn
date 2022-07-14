# 创建实例-API

## 描述

创建指定配置实例

## 请求方式

POST

## 请求地址

https://bastion.jdcloud-api.com/v1/regions/{regionId}/instances

| 名称 | 类型 | 是否必需 | 默认值 | 描述 | 
| :--------: | :--------:| :--------: | :--------:| :--------: |
| regionId  | String | True  |    |  regionId  |

## 请求参数

| 名称 | 类型 | 是否必需 | 默认值 | 描述 | 
| :--------: | :--------:| :--------: | :--------:| :--------: |
| instanceSpec  | InstanceSpec | True  |    |  实例的相关配置  |
| chargeSpec  | ChargeSpec | False  |    |  计费信息的相关配置  |

#### ChargeSpec

| 名称 | 类型 | 是否必需 | 默认值 | 描述 | 
| :--------: | :--------:| :--------: | :--------:| :--------: |
| chargeMode  | String | False  |    |  资源计费类型（CONFIG-按配置，MONTHLY-包年包月)  |
| chargeUnit  | String | True  |    |  预付费计费单位，预付费必填，取值为：MONTH、YEAR  |
| chargeDuration  | Integer | True  |    |  预付费计费时长，预付费必填，当chargeUnit为month时取值为：1~9，当chargeUnit为year时取值为：1、2、3  |
| autoRenew  | Boolean	 | False  |    |  True=：OPEN——开通自动续费、False=CLOSE—— 不开通自动续费，默认为CLOSE  |
| autoPay  | Boolean | False  |    |  自动支付标识(SDK下单自动付费时设置为true)  |
| buyScenario  | String | False  |    |  产品线统一活动凭证JSON字符串，需要BASE64编码，目前要求编码前格式为 {"activity":{"activityType":必填字段, "activityIdentifier":必填字段}}  |

#### InstanceSpec

| 名称 | 类型 | 是否必需 | 默认值 | 描述 | 
| :--------: | :--------:| :--------: | :--------:| :--------: |
| az  | String | True  |    |  可用区  |
| vpcId  | String | True  |    |  私有网络vpcId  |
| subnetId  | String | True  |    |  子网subnetId  |
| spec  | String	 | True  |    |  规格  |
| quantity  | Integer | True  |    |  购买的数量  |
| ipVersion  | String | True  |    |  v4或v4&v6  |
| desc  | String | False  |    |  描述信息  |

## 返回参数

| 名称 | 类型 | 描述 | 
| :--------: | :--------:| :--------: |
| result  | Result | 结果  |
| requestId  | String	 | 本次请求的ID  |

#### Result

| 名称 | 类型 | 描述 | 
| :--------: | :--------:| :--------: |
| buyId  | String | 交易buyId  |
| sourceIds  | Source[]	 |   |

#### Source

| 名称 | 类型 | 描述 | 
| :--------: | :--------:| :--------: |
| sourceId  | String | 订单号sourceId  |

## 返回码

| HTTP状态码 | 错误码 | 描述 | 
| :--------: | :--------:| :--------: |
| 200  |  | OK  |









