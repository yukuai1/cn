# 物联网引擎


## 简介
API related to IoT Core


### 版本
v2


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|**[addDevice](DeviceInfo/addDevice.md)**|POST|注册单个设备并返回秘钥信息|
|**[createProduct](Product/createProduct.md)**|POST|新建产品|
|**[deleteProduct](Product/deleteProduct.md)**|DELETE|删除产品|
|**[describeProduct](Product/describeProduct.md)**|GET|查看产品|
|**[describeThingShadow](DeviceInfo/describeThingShadow.md)**|GET|查看设备影子|
|**[exportThingModel](ProductAbility/exportThingModel.md)**|GET|导出物模型|
|**[importThingModel](ProductAbility/importThingModel.md)**|PUT|导入物模型|
|**[invokeThingService](DeviceInfo/invokeThingService.md)**|POST|设备服务调用|
|**[listProductAbilities](ProductAbility/listProductAbilities.md)**|GET|查看产品功能列表接口|
|**[listProducts](Product/listProducts.md)**|GET|查看产品列表接口|
|**[queryDeviceDetail](DeviceInfo/queryDeviceDetail.md)**|GET|查询设备详情|
|**[queryDevicePage](DeviceInfo/queryDevicePage.md)**|GET|分页查询设备信息,支持一个或多个条件|
|**[removeDevice](DeviceInfo/removeDevice.md)**|DELETE|删除设备|
|**[updateDevice](DeviceInfo/updateDevice.md)**|POST|修改设备详情|
|**[updateProduct](Product/updateProduct.md)**|PATCH|修改产品|
|**[updateThingShadow](DeviceInfo/updateThingShadow.md)**|PATCH|更新设备影子的期望值|
