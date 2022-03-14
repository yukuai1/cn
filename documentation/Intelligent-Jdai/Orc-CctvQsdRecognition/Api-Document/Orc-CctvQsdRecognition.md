# CCTV清算单


## 描述
CCTV清算单

## 请求方式

POST

## 请求地址

```apl
https://aiapi.jd.com/jdai/maskInsurance
```



### 请求参数

| 参数名称          | 参数类型 | 是否必填 | 参数说明                                                     |
| :---------------- | :------- | :------- | :----------------------------------------------------------- |
| `serialNo`        | string   | N        | 请求流水号, 不传接口自动生成                                 |
| appName           | string   | Y        | 授权appName, 申请分配                                        |
| `appAuthorityKey` | string   | Y        | 授权key, 申请分配                                            |
| `businessId`      | string   | Y        | 业务id, 申请分配                                             |
| `imageItem`       | Object   |          | 图片信息[公共请求参数实体#公共请求参数实体-4.图片信息](https://cf.jd.com/pages/viewpage.action?pageId=138528176#id-公共请求参数实体-公共请求参数实体-4.图片信息) |
| `extended`        | map      | N        | 附加信息, 特殊需求处理                                       |

### 返回实体

| 参数名称      | 参数类型      | 是否必填 | 参数说明         |
| :------------ | :------------ | :------- | :--------------- |
| `code`        | int           |          | 返回code码0:成功 |
| `msg`         | string        |          | msg              |
| `serialNo`    | string        |          | 交互的流水号     |
| `cctvQsdInfo` | `CCTVQsdInfo` |          | `识别结果`       |
| ``            |               |          |                  |

CCTVQsdInfo的内容说明：

| 参数名称        | 参数类型 | 是否必填 | 参数说明               |
| :-------------- | :------- | :------- | :--------------------- |
| contractNo      | String   |          | 合同号                 |
| agent           | String   |          | 代理公司               |
| advertiser      | String   |          | 广告主                 |
| payer           | String   |          | 交款方                 |
| project         | String   |          | 项目名称               |
| startTime       | String   |          | 播出开始日期           |
| endTime         | String   |          | 播出结束日期           |
| totalAmount     | String   |          | 合同总金额             |
| thisPercent     | String   |          | 本期交款占原合同百分比 |
| thisAmount      | String   |          | 本期交款金额           |
| agentPercent    | String   |          | 代理费率               |
| agentAmount     | String   |          | 代理金额               |
| payAmount       | String   |          | 交款金额               |
| spAgentAmount   | String   |          | 特别代理费             |
| actualPayAmount | String   |          | 实际交款金额           |
| partyA          | String   |          | 甲方                   |
| partyB          | String   |          | 乙方                   |
| signDate        | String   |          | 签订日期               |
| printDate       | String   |          | 打印日期               |

### 请求参数示例

```
{
 	"appName": "FACE_xxx",
	"appAuthorityKey": "sADxxx==",
	"businessId": "FACE-xxxxxx", 
    "imageItem": {
        "encryptionType": "NON",
        "imgBase64": ""
    },
    "serialNo": "12092873283-2313"
}
```

### 返回样例

```
{
    "cctvQsdInfo": {
        "actualPayAmount": "1463224 壹佰肆拾陆万叁仟贰佰贰拾肆元整",
        "advertiser": "江西省农业厅",
        "agent": "北京中外名人文化科技有限公司",
        "agentAmount": "162580",
        "agentPercent": "10%",
        "contractNo": "202000000269第;期",
        "endTime": "2020-05-17",
        "partyA": "北京中外名人文化科技有限公司",
        "partyB": "中央电视台",
        "payAmount": "1463224",
        "payer": "北京中外名人文化科技有限公司",
        "printDate": "2020-04-24",
        "project": "2020年CCTV-1、CCTV-新闻新闻联播提示收看广告(旅游行业-签约认购)",
        "signDate": "2019-12-26",
        "spAgentAmount": "0",
        "startTime": "2020-05-11",
        "thisPercent": "25.00%",
        "totalAmount": "6503226 陆佰伍拾万叁仟贰佰贰拾陆元整"
    },
    "code": 0,
    "msg": "成功",
    "serialNo": "1598547146344-172025157194-181093",
    "timestamp": 1646708318101
}
```