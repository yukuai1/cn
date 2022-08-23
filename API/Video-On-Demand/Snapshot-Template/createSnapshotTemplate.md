# createSnapshotTemplate


## 描述
创建截图模板

## 请求方式
POST

## 请求地址
https://vod.jdcloud-api.com/v1/snapshotTemplates


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**templateName**|String|True| |模板标题。长度不超过 128 个字节。UTF-8 编码。|
|**snapshotType**|String|False| |模板类型。取值范围：<br>  sample - 采样截图模板<br>  sprite - 雪碧图模板<br>|
|**imageSampleConfig**|[ImageSampleConfig](createsnapshottemplate#imagesampleconfig)|False| |采样截图模板配置|
|**imageSpriteConfig**|[ImageSpriteConfig](createsnapshottemplate#imagespriteconfig)|False| |雪碧图模板配置|
### <div id="imagespriteconfig">ImageSpriteConfig</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|Integer|False| |截图起始时间，单位：秒|
|**intervalTime**|Integer|False| |截图间隔|
|**frameType**|String|False| |截图帧类型。|
|**format**|String|False| |截图格式。取值范围：jpg、png|
|**rows**|Integer|True| |雪碧图小图行数。雪碧图行列积必须不大于100, 缺省值为 10<br>|
|**columns**|Integer|True| |雪碧图小图列数。雪碧图行列积必须不大于100, 缺省值为 10<br>|
|**cellWidth**|Integer|False| |雪碧图单元格宽度<br>取值范围：[8, 4096]，不能为奇数<br>未设置时，回退为截图宽度 width<br>|
|**cellHeight**|Integer|False| |雪碧图单元格高度，<br>取值范围：[8, 4096]，不能为奇数<br>未设置时，系统自动会自动设置为截图高度 height<br>|
|**doKeepShots**|Boolean|False| |是否保留截图<br>雪碧图的截图方式是先截取普通图，然后合成雪碧图。此字段控制是否保留截图。<br>|
### <div id="imagesampleconfig">ImageSampleConfig</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**startTime**|Integer|False| |截图起始时间，取值范围单位为秒，缺省值为 0<br>|
|**intervalTime**|Integer|False| |截图时间间隔。单位为毫秒<br>若未设置，则对于普通截图，按照截图张数做平均截图；对于雪碧图，则按照行列数乘积做平均截图<br>|
|**frameType**|String|False| |截图帧类型。取值范围：<br>  any - 任意帧<br>  intra - 关键帧<br>缺省值为 any<br>|
|**format**|String|False| |截图格式。取值范围：jpg、png|
|**number**|Integer|False| |截图数量，缺省值为 10|
|**width**|Integer|False| |截图宽度，取值范围：[8, 4096]<br>若宽度和高度同时设置，则按照设置的宽高截图；<br>若宽度和高度均未设置，则截图保持与源视频相同的宽高值；<br>若宽度和高度其中一项未设置，则截图保持与源视频相同的宽高比；<br>|
|**height**|Integer|False| |截图高度，取值范围：[8, 4096]<br>若宽度和高度同时设置，则按照设置的宽高截图；<br>若宽度和高度均未设置，则截图保持与源视频相同的宽高值；<br>若宽度和高度其中一项未设置，则截图保持与源视频相同的宽高比；<br>|
|**fillType**|String|False| |填充方式，当视频宽高与截图宽高指定值不能匹配时的填充处理方式。取值范围：<br>  stretch - 伸缩<br>  black - 留黑<br>  white - 留白<br>  gauss - 高斯模糊<br>缺省值为 black<br>|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](createsnapshottemplate#result)|创建截图模板结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**templateId**|String|模板ID|
|**templateName**|String|模板标题。长度不超过 128 个字节。UTF-8 编码。|
|**snapshotType**|String|模板类型。取值范围：<br>  sample - 采样截图模板<br>  sprite - 雪碧图模板<br>|
|**imageSampleConfig**|[ImageSampleConfig](createsnapshottemplate#imagesampleconfig)|采样截图模板配置|
|**imageSpriteConfig**|[ImageSpriteConfig](createsnapshottemplate#imagespriteconfig)|雪碧图模板配置|
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
POST
```
https://vod.jdcloud-api.com/v1/snapshotTemplates

```

```
{
    "imageSpriteConfig": {
        "columns": 3, 
        "intervalTime": 1, 
        "rows": 2, 
        "startTime": 1
    }, 
    "snapshotType": "sprite", 
    "templateName": "spriteT1"
}
```

## 返回示例
```
{ 
}
```

## 返回示例
```
{
    "requestId": "kAR0k6EC19w5T8Y9aM218Phi0i78YSbN", 
    "result": {
        "createTime": "2022-02-25T08:31:11.434Z", 
        "imageSpriteConfig": {
            "columns": 3, 
            "doKeepShots": false, 
            "format": "jpg", 
            "frameType": "any", 
            "intervalTime": 1, 
            "rows": 2, 
            "startTime": 1
        }, 
        "snapshotType": "sprite", 
        "templateId": "qc5p8Jv0jRRnTZc6Vgx", 
        "templateName": "spriteT1", 
        "updateTime": "2022-02-25T08:31:11.434Z"
    }
}
```
