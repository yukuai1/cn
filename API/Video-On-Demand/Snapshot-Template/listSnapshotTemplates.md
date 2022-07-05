# listSnapshotTemplates


## 描述
查询截图模板列表。
允许通过条件过滤查询，支持的过滤字段如下：
  - snapshotType[eq] 按模板类型精确查询
  - templateId[eq] 按模板ID精确查询



## 请求方式
GET

## 请求地址
https://vod.jdcloud-api.com/v1/snapshotTemplates


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**pageNumber**|Integer|False|1|页码；默认值为 1|
|**pageSize**|Integer|False|10|分页大小；默认值为 10；取值范围 [10, 100]|
|**filters**|[Filter[]](listsnapshottemplates#filter)|False| | |

### <div id="filter">Filter</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**name**|String|True| |过滤器属性名|
|**operator**|String|False| |过滤器操作符，默认值为 eq|
|**values**|String[]|True| |过滤器属性值|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](listsnapshottemplates#result)|查询截图模板列表信息结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**pageNumber**|Integer|当前页码|
|**pageSize**|Integer|每页数量|
|**totalElements**|Integer|查询总数|
|**totalPages**|Integer|总页数|
|**content**|[SnapshotTemplateInfo[]](listsnapshottemplates#snapshottemplateinfo)|分页内容|

### <div id="snapshottemplateinfo">SnapshotTemplateInfo</div>
|名称|类型|描述|
|---|---|---|
|**templateId**|String|模板ID|
|**templateName**|String|模板标题。长度不超过 128 个字节。UTF-8 编码。|
|**snapshotType**|String|模板类型。取值范围：<br>  sample - 采样截图模板<br>  sprite - 雪碧图模板<br>|
|**imageSampleConfig**|[ImageSampleConfig](listsnapshottemplates#imagesampleconfig)|采样截图模板配置|
|**imageSpriteConfig**|[ImageSpriteConfig](listsnapshottemplates#imagespriteconfig)|雪碧图模板配置|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### <div id="imagespriteconfig">ImageSpriteConfig</div>
|名称|类型|描述|
|---|---|---|
|**startTime**|Integer|截图起始时间，单位：秒|
|**intervalTime**|Integer|截图间隔|
|**frameType**|String|截图帧类型。|
|**format**|String|截图格式。取值范围：jpg、png|
|**rows**|Integer|雪碧图小图行数。雪碧图行列积必须不大于100, 缺省值为 10<br>|
|**columns**|Integer|雪碧图小图列数。雪碧图行列积必须不大于100, 缺省值为 10<br>|
|**cellWidth**|Integer|雪碧图单元格宽度<br>取值范围：[8, 4096]，不能为奇数<br>未设置时，回退为截图宽度 width<br>|
|**cellHeight**|Integer|雪碧图单元格高度，<br>取值范围：[8, 4096]，不能为奇数<br>未设置时，系统自动会自动设置为截图高度 height<br>|
|**doKeepShots**|Boolean|是否保留截图<br>雪碧图的截图方式是先截取普通图，然后合成雪碧图。此字段控制是否保留截图。<br>|
### <div id="imagesampleconfig">ImageSampleConfig</div>
|名称|类型|描述|
|---|---|---|
|**startTime**|Integer|截图起始时间，取值范围单位为秒，缺省值为 0<br>|
|**intervalTime**|Integer|截图时间间隔。单位为毫秒<br>若未设置，则对于普通截图，按照截图张数做平均截图；对于雪碧图，则按照行列数乘积做平均截图<br>|
|**frameType**|String|截图帧类型。取值范围：<br>  any - 任意帧<br>  intra - 关键帧<br>缺省值为 any<br>|
|**format**|String|截图格式。取值范围：jpg、png|
|**number**|Integer|截图数量，缺省值为 10|
|**width**|Integer|截图宽度，取值范围：[8, 4096]<br>若宽度和高度同时设置，则按照设置的宽高截图；<br>若宽度和高度均未设置，则截图保持与源视频相同的宽高值；<br>若宽度和高度其中一项未设置，则截图保持与源视频相同的宽高比；<br>|
|**height**|Integer|截图高度，取值范围：[8, 4096]<br>若宽度和高度同时设置，则按照设置的宽高截图；<br>若宽度和高度均未设置，则截图保持与源视频相同的宽高值；<br>若宽度和高度其中一项未设置，则截图保持与源视频相同的宽高比；<br>|
|**fillType**|String|填充方式，当视频宽高与截图宽高指定值不能匹配时的填充处理方式。取值范围：<br>  stretch - 伸缩<br>  black - 留黑<br>  white - 留白<br>  gauss - 高斯模糊<br>缺省值为 black<br>|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|


## 请求示例
GET
```
https://vod.jdcloud-api.com/v1/snapshotTemplates?pageNumber=1&pageSize=10&filters.1.name=source&filters.1.values.1=custom&filters.1.operator=eq

```

## 返回示例
```
{
    "requestId": "bgvmivir54gddpgi764se9f4kfr7ge41", 
    "result": {
        "content": [
            {
                "createTime": "2022-02-24T06:40:47Z", 
                "imageSampleConfig": {
                    "fillType": "gauss", 
                    "format": "jpg", 
                    "frameType": "any", 
                    "height": 0, 
                    "intervalTime": 0, 
                    "number": 10, 
                    "startTime": 2, 
                    "width": 0
                }, 
                "imageSpriteConfig": null, 
                "snapshotType": "sample", 
                "templateId": "8HcpGFmOSTo2wa2XspV", 
                "templateName": "a4", 
                "updateTime": "2022-02-24T06:44:10Z"
            }, 
            {
                "createTime": "2022-02-23T12:57:34Z", 
                "imageSampleConfig": null, 
                "imageSpriteConfig": {
                    "cellHeight": 0, 
                    "cellWidth": 0, 
                    "columns": 10, 
                    "doKeepShots": false, 
                    "format": "jpg", 
                    "frameType": "any", 
                    "intervalTime": 0, 
                    "rows": 10, 
                    "startTime": 1
                }, 
                "snapshotType": "sprite", 
                "templateId": "uTA6wlIGhosnZEi52sV", 
                "templateName": "s1", 
                "updateTime": "2022-02-23T12:57:34Z"
            }
        ], 
        "pageNumber": 1, 
        "pageSize": 10, 
        "totalElements": 2, 
        "totalPages": 1
    }
}
```
