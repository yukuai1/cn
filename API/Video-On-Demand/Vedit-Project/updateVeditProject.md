# updateVeditProject


## 描述
修改视频剪辑工程信息

## 请求方式
PUT

## 请求地址
https://vod.jdcloud-api.com/v1/veditProjects/{projectId}


## 请求参数
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**projectId**|Long|True| |视频剪辑工程ID|
|**projectName**|String|False| |工程名称|
|**description**|String|False| |工程描述|
|**timeline**|[Timeline](updateveditproject#timeline)|False| |时间线信息|

### <div id="timeline">Timeline</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**trackList**|[MediaTrack[]](updateveditproject#mediatrack)|True| |媒体轨列表，有序，若有重合时间段，则排在后面的媒体轨上的内容将会叠加在排在前媒体轨上的画面内容之上。 多个轨道的层叠顺序与数组元素顺序一致，如：数组的第一个元素图层的最底层，第二个元素的图层在其之上，以此类推。|
### <div id="mediatrack">MediaTrack</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**trackType**|String|True| |轨类型。目前只支持的有：video，audio，text<br>- video：视频轨<br>- audio：音频轨<br>- text：文字轨<br>* 视频轨为空时，音频轨必须非空。<br>* 音频轨为空时，视频轨必须非空<br>|
|**clips**|[MediaClip[]](updateveditproject#mediaclip)|True| |视频剪辑素材片段。一个Timeline中的所有MediaClip，总共不能超过20个。|
### <div id="mediaclip">MediaClip</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**mediaId**|String|False| |素材ID（素材类型为video或audio时适用）必须为视频点播媒资的视频ID。<br>一个Timeline中的所有MediaClip中，若有2个或以上的不同MediaId，即素材片段来源于2个或以上不同视频，则在提交剪辑作业时，必须在UserData中指明合并后的视频画面的宽高。<br>如 {\"extendData\": {\"width\": 720, \"height\": 500}}，其中width和height必须为[16, 4096]之间的偶数<br>* 素材类型为视频，音频时必填；文字和图片时必空。<br>|
|**mediaType**|String|True| |素材类型，必填。不同类型的轨类型，素材类型取值不同<br>* 视频轨目前支持的素材类型有：video，image<br>- video：视频<br>- image：图片<br>* 音频轨目前支持的素材类型有：audio<br>- audio：音频<br>* 文字轨目前支持的素材类型有：text<br>- text：文字<br>|
|**mediaUrl**|String|False| |素材url（素材类型为image时适用）必填。京东对象存储的内网地址，图片资源公有读地址。<br>|
|**mediaIn**|Integer|False|0|素材片段在媒资中的入点（素材类型为video或audio时适用）单位：ms。默认为0。|
|**mediaOut**|Integer|False| |素材片段在媒资中的出点（素材类型为video或audio时适用）单位：ms。|
|**timelineIn**|Integer|False| |素材片段在合成时间线中的入点（素材类型为video、audio和text时适用）单位：ms。<br>* 如果为空，则会按照素材片段顺序相接的方式自动计算timelineIn。<br>|
|**timelineOut**|Integer|False| |素材片段在合成时间线中的出点（素材类型为video、audio和text时适用）单位：ms。<br>* 如果为空，则会按照素材片段顺序相接的方式自动计算timelineOut = timelineIn + mediaDuration。<br>* 如果非空，有可能会导致timelineOut-timelineIn 与 mediaOut-mediaIn不符，最终会以timelineOut为准。<br>|
|**duration**|Integer|False| |素材片段持续时长（素材类型为image时适用），单位:ms。|
|**posX**|Integer|False| |X坐标（素材类型为video、audio和text时适用）：表示素材的左上角距离输出视频左上角的横向距离，单位：像素。|
|**posY**|Integer|False| |Y坐标（素材类型为video、audio和text时适用）：表示素材的左上角距离输出视频左上角的纵向距离，单位：像素。|
|**content**|String|False| |文字内容（素材类型为text时适用）必填。<br>支持\n文字换行，比如："小明\n你好"。<br>|
|**font**|String|False|JDLangZheng|字体名称（素材类型为text时适用）<br>目前支持的字体有：FZHanZhen，FZShangKu，HYChaoJiZhanJia，HYLeMiao，HYNuoMi，HYYaKu，HYZhongXiu，JDLangZheng，SourceHanSans。默认为JDLangZheng:"京东朗正体"。<br>- JDLangZheng：京东朗正<br>- FZHanZhen：方正汉真<br>- FZShangKu：方正尚酷<br>- HYChaoJiZhanJia：汉仪机甲<br>- HYLeMiao：汉仪乐喵<br>- HYNuoMi：汉仪糯米<br>- HYYaKu：汉仪雅酷<br>- HYZhongXiu：汉仪中秀<br>- SourceHanSans：思源黑体<br>|
|**fontSize**|Integer|False| |文字的字号（素材类型为text时适用）|
|**fontColor**|String|False| |字体颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**fontColorOpacity**|Double|False|1|文字透明度（素材类型为text时适用）。当字幕类型为横幅文字时，表示文字的透明度，取值[0,1]，默认1。1为不透明，0为完全透明。|
|**spacing**|Integer|False|0|文字间距（素材类型为text时适用）。表示横幅文字字间距。单位：像素，默认为0。|
|**angle**|Integer|False|0|文字逆时针旋转角度（素材类型为text时适用）。表示横幅文字逆时针旋转角度。单位：度，默认为0。|
|**borderStyle**|Integer|False|1|文字边框和阴影格式（素材类型为text时适用）。取值1或3，1=边框+阴影，3=不透明底框。默认为1。|
|**outline**|Integer|False|0|描边宽度（素材类型为text时适用）。表示横幅文字描边宽度。单位：像素值，默认为0。|
|**outlineColor**|String|False| |描边颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**shadow**|Integer|False|0|文字投下阴影的深度（素材类型为text时适用）。表示横幅文字投下阴影的深度，单位：像素值，默认为0。|
|**backColor**|String|False| |阴影颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**fontFace**|[FontFace](updateveditproject#fontface)|False| |字体样式（素材类型为text时适用）|
|**operations**|[ClipOperation[]](updateveditproject#clipoperation)|False| | |
### <div id="clipoperation">ClipOperation</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**opType**|String|False| |操作类型（素材类型不同，操作类型取值不同）<br>- 操作类型为video时支持的操作类型有：scale（缩放），volume（音量），rotate（旋转）<br>- 操作类型为image时支持的操作类型有：scale（缩放），rotate（旋转）<br>- 操作类型为audio时支持的操作类型有：volume（音量）<br>如：volume<br>|
|**params**|Object|False| |操作参数，JSON对象。不同的操作类型对应不同的JSON对象的key，JSON对象的value即为key对应的值。<br>* scale对应的key取值有：width，height。<br>  - width：视频缩放后宽度，整型，偶数，如果只填一边，则另一边跟随源宽高比变换。<br>  - height：视频缩放后高度，整型，偶数，如果只填一边，则另一边跟随源宽高比变换。<br>* volume对应的key取值有：gain。<br>  - gain：音量大小，浮点型，取值[0,10]；0表示静音，1表示原音<br>* rotate对应的key取值有：angle<br>  - angle：顺时针旋转角度，整型，取值[0,360]<br>如：{"gain":1.5}<br>|
### <div id="fontface">FontFace</div>
|名称|类型|是否必需|默认值|描述|
|---|---|---|---|---|
|**bold**|Boolean|False| |加粗|
|**italic**|Boolean|False| |斜体|
|**underline**|Boolean|False| |下划线|

## 返回参数
|名称|类型|描述|
|---|---|---|
|**result**|[Result](updateveditproject#result)|修改操作结果|
|**requestId**|String|请求ID|

### <div id="result">Result</div>
|名称|类型|描述|
|---|---|---|
|**projectId**|Long|工程ID|
|**projectName**|String|工程名称|
|**description**|String|工程描述|
|**timeline**|[Timeline](updateveditproject#timeline)|时间线信息|
|**createTime**|String|创建时间|
|**updateTime**|String|修改时间|
### <div id="timeline">Timeline</div>
|名称|类型|描述|
|---|---|---|
|**trackList**|[MediaTrack[]](updateveditproject#mediatrack)|媒体轨列表，有序，若有重合时间段，则排在后面的媒体轨上的内容将会叠加在排在前媒体轨上的画面内容之上。 多个轨道的层叠顺序与数组元素顺序一致，如：数组的第一个元素图层的最底层，第二个元素的图层在其之上，以此类推。|
### <div id="mediatrack">MediaTrack</div>
|名称|类型|描述|
|---|---|---|
|**trackType**|String|轨类型。目前只支持的有：video，audio，text<br>- video：视频轨<br>- audio：音频轨<br>- text：文字轨<br>* 视频轨为空时，音频轨必须非空。<br>* 音频轨为空时，视频轨必须非空<br>|
|**clips**|[MediaClip[]](updateveditproject#mediaclip)|视频剪辑素材片段。一个Timeline中的所有MediaClip，总共不能超过20个。|
### <div id="mediaclip">MediaClip</div>
|名称|类型|描述|
|---|---|---|
|**mediaId**|String|素材ID（素材类型为video或audio时适用）必须为视频点播媒资的视频ID。<br>一个Timeline中的所有MediaClip中，若有2个或以上的不同MediaId，即素材片段来源于2个或以上不同视频，则在提交剪辑作业时，必须在UserData中指明合并后的视频画面的宽高。<br>如 {\"extendData\": {\"width\": 720, \"height\": 500}}，其中width和height必须为[16, 4096]之间的偶数<br>* 素材类型为视频，音频时必填；文字和图片时必空。<br>|
|**mediaType**|String|素材类型，必填。不同类型的轨类型，素材类型取值不同<br>* 视频轨目前支持的素材类型有：video，image<br>- video：视频<br>- image：图片<br>* 音频轨目前支持的素材类型有：audio<br>- audio：音频<br>* 文字轨目前支持的素材类型有：text<br>- text：文字<br>|
|**mediaUrl**|String|素材url（素材类型为image时适用）必填。京东对象存储的内网地址，图片资源公有读地址。<br>|
|**mediaIn**|Integer|素材片段在媒资中的入点（素材类型为video或audio时适用）单位：ms。默认为0。|
|**mediaOut**|Integer|素材片段在媒资中的出点（素材类型为video或audio时适用）单位：ms。|
|**timelineIn**|Integer|素材片段在合成时间线中的入点（素材类型为video、audio和text时适用）单位：ms。<br>* 如果为空，则会按照素材片段顺序相接的方式自动计算timelineIn。<br>|
|**timelineOut**|Integer|素材片段在合成时间线中的出点（素材类型为video、audio和text时适用）单位：ms。<br>* 如果为空，则会按照素材片段顺序相接的方式自动计算timelineOut = timelineIn + mediaDuration。<br>* 如果非空，有可能会导致timelineOut-timelineIn 与 mediaOut-mediaIn不符，最终会以timelineOut为准。<br>|
|**duration**|Integer|素材片段持续时长（素材类型为image时适用），单位:ms。|
|**posX**|Integer|X坐标（素材类型为video、audio和text时适用）：表示素材的左上角距离输出视频左上角的横向距离，单位：像素。|
|**posY**|Integer|Y坐标（素材类型为video、audio和text时适用）：表示素材的左上角距离输出视频左上角的纵向距离，单位：像素。|
|**content**|String|文字内容（素材类型为text时适用）必填。<br>支持\n文字换行，比如："小明\n你好"。<br>|
|**font**|String|字体名称（素材类型为text时适用）<br>目前支持的字体有：FZHanZhen，FZShangKu，HYChaoJiZhanJia，HYLeMiao，HYNuoMi，HYYaKu，HYZhongXiu，JDLangZheng，SourceHanSans。默认为JDLangZheng:"京东朗正体"。<br>- JDLangZheng：京东朗正<br>- FZHanZhen：方正汉真<br>- FZShangKu：方正尚酷<br>- HYChaoJiZhanJia：汉仪机甲<br>- HYLeMiao：汉仪乐喵<br>- HYNuoMi：汉仪糯米<br>- HYYaKu：汉仪雅酷<br>- HYZhongXiu：汉仪中秀<br>- SourceHanSans：思源黑体<br>|
|**fontSize**|Integer|文字的字号（素材类型为text时适用）|
|**fontColor**|String|字体颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**fontColorOpacity**|Double|文字透明度（素材类型为text时适用）。当字幕类型为横幅文字时，表示文字的透明度，取值[0,1]，默认1。1为不透明，0为完全透明。|
|**spacing**|Integer|文字间距（素材类型为text时适用）。表示横幅文字字间距。单位：像素，默认为0。|
|**angle**|Integer|文字逆时针旋转角度（素材类型为text时适用）。表示横幅文字逆时针旋转角度。单位：度，默认为0。|
|**borderStyle**|Integer|文字边框和阴影格式（素材类型为text时适用）。取值1或3，1=边框+阴影，3=不透明底框。默认为1。|
|**outline**|Integer|描边宽度（素材类型为text时适用）。表示横幅文字描边宽度。单位：像素值，默认为0。|
|**outlineColor**|String|描边颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**shadow**|Integer|文字投下阴影的深度（素材类型为text时适用）。表示横幅文字投下阴影的深度，单位：像素值，默认为0。|
|**backColor**|String|阴影颜色（素材类型为text时适用）。格式为#后跟16进制值。例如：#ffffff(RRGGBB)。|
|**fontFace**|[FontFace](updateveditproject#fontface)|字体样式（素材类型为text时适用）|
|**operations**|[ClipOperation[]](updateveditproject#clipoperation)| |
### <div id="clipoperation">ClipOperation</div>
|名称|类型|描述|
|---|---|---|
|**opType**|String|操作类型（素材类型不同，操作类型取值不同）<br>- 操作类型为video时支持的操作类型有：scale（缩放），volume（音量），rotate（旋转）<br>- 操作类型为image时支持的操作类型有：scale（缩放），rotate（旋转）<br>- 操作类型为audio时支持的操作类型有：volume（音量）<br>如：volume<br>|
|**params**|Object|操作参数，JSON对象。不同的操作类型对应不同的JSON对象的key，JSON对象的value即为key对应的值。<br>* scale对应的key取值有：width，height。<br>  - width：视频缩放后宽度，整型，偶数，如果只填一边，则另一边跟随源宽高比变换。<br>  - height：视频缩放后高度，整型，偶数，如果只填一边，则另一边跟随源宽高比变换。<br>* volume对应的key取值有：gain。<br>  - gain：音量大小，浮点型，取值[0,10]；0表示静音，1表示原音<br>* rotate对应的key取值有：angle<br>  - angle：顺时针旋转角度，整型，取值[0,360]<br>如：{"gain":1.5}<br>|
### <div id="fontface">FontFace</div>
|名称|类型|描述|
|---|---|---|
|**bold**|Boolean|加粗|
|**italic**|Boolean|斜体|
|**underline**|Boolean|下划线|

## 返回码
|HTTP状态码|错误码|描述|
|---|---|---|
|**200**||OK|
