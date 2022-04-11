# 云主机


## 简介
云主机实例、镜像、实例规格、实例模板、配额相关的接口


### 版本
v1


## API
|接口名称|请求方式|功能描述|
|---|---|---|
|[**associateElasticIp**](https://docs.jdcloud.com/cn/virtual-machines/api/associateelasticip?content=API)|POST|为云主机主网卡的主内网IP绑定弹性公网IP。<br>
|[**attachDisk**](https://docs.jdcloud.com/cn/virtual-machines/api/attachdisk?content=API)|POST|为一台云主机挂载一块云硬盘。<br>|
|[**attachNetworkInterface**](https://docs.jdcloud.com/cn/virtual-machines/api/attachnetworkinterface?content=API)|POST|为云主机绑定一块弹性网卡。<br>|
|[**copyImages**](https://docs.jdcloud.com/cn/virtual-machines/api/copyimages?content=API)|POST|镜像跨区复制，将私有镜像复制到其它地域下。<br>|
|[**createImage**](https://docs.jdcloud.com/cn/virtual-machines/api/createimage?content=API)|POST|为云主机创建私有镜像。<br>|
|[**createInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/createinstancetemplate?content=API)|POST|创建一个指定参数的启动模板。<br>|
|[**createInstances**](https://docs.jdcloud.com/cn/virtual-machines/api/createinstances?content=API)|POST|创建一台或多台指定配置的云主机。<br>|
|[**createKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/createkeypair?content=API)|POST|创建ssh密钥对。公钥部分存储在京东云，并返回未加密的 PEM 编码的 PKCS#8 格式私钥，您需要自行妥善保管私钥部分。<br>|
|[**deleteImage**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteimage?content=API)|DELETE|删除一份私有镜像。<br>|
|[**deleteInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteinstance?content=API)|DELETE|删除一台按配置计费、或包年包月已到期的云主机。<br>|
|[**deleteInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteinstancetemplate?content=API)|DELETE|删除一个启动模板。<br>|
|[**deleteKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/deletekeypair?content=API)|DELETE|删除ssh密钥对。<br>|
|[**describeImage**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimage?content=API)|GET|查询镜像详情。<br>|
|[**describeImageConstraints**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimageconstraints?content=API)|GET|查询镜像的实例规格限制。<br>|
|[**describeImageConstraintsBatch**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimageconstraintsbatch?content=API)|GET|批量查询镜像的实例规格限制。<br>|
|[**describeImageMembers**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimagemembers?content=API)|GET|查询镜像共享帐户列表。<br>|
|[**describeImages**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimages?content=API)|GET|查询镜像信息列表。<br>|
|[**describeInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstance?content=API)|GET|查询一台云主机的详细信息。<br>|
|[**describeInstanceStatus**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancestatus?content=API)|GET|批量查询云主机状态。<br>|
|[**describeInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetemplate?content=API)|GET|查询启动模板详情。<br>|
|[**describeInstanceTemplates**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetemplates?content=API)|GET|查询启动模板列表。<br>|
|[**describeInstanceTypes**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetypes?content=API)|GET|查询实例规格信息列表。<br>|
|[**describeInstanceVncUrl**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancevncurl?content=API)|GET|获取云主机vnc，用于连接管理云主机。<br>|
|[**describeInstances**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstances?content=API)|GET|批量查询云主机的详细信息。<br>|
|[**describeKeypairs**](https://docs.jdcloud.com/cn/virtual-machines/api/describekeypairs?content=API)|GET|批量查询密钥对。<br>|
|[**describeQuotas**](https://docs.jdcloud.com/cn/virtual-machines/api/describequotas?content=API)|GET|查询配额。<br>|
|[**detachDisk**](https://docs.jdcloud.com/cn/virtual-machines/api/detachdisk?content=API)|POST|云主机缷载云硬盘。<br>|
|[**detachNetworkInterface**](https://docs.jdcloud.com/cn/virtual-machines/api/detachnetworkinterface?content=API)|POST|云主机缷载一块弹性网卡。<br>|
|[**disassociateElasticIp**](https://docs.jdcloud.com/cn/virtual-machines/api/disassociateelasticip?content=API)|POST|云主机解绑弹性公网IP。<br>|
|[**exportImage**](https://docs.jdcloud.com/cn/virtual-machines/api/exportimage?content=API)|POST|导出镜像。<br>|
|[**imageTasks**](https://docs.jdcloud.com/cn/virtual-machines/api/imagetasks?content=API)|GET|查询镜像导入导出任务详情。<br>|
|[**importImage**](https://docs.jdcloud.com/cn/virtual-machines/api/importimage?content=API)|POST|导入镜像。<br>|
|[**importKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/importkeypair?content=API)|POST|导入由其他工具生成的密钥对的公钥部分。<br>|
|[**modifyImageAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyimageattribute?content=API)|POST|修改镜像信息。<br>|
|[**modifyInstanceAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstanceattribute?content=API)|POST|修改云主机部分信息。<br>|
|[**modifyInstanceDiskAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancediskattribute?content=API)|POST|修改云主机挂载的数据盘属性。<br>|
|[**modifyInstanceNetworkAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancenetworkattribute?content=API)|POST|修改虚机弹性网卡属性。<br>|
|[**modifyInstancePassword**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancepassword?content=API)|POST|修改云主机密码。<br>|
|[**rebootInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/rebootinstance?content=API)|POST|重启单个云主机。<br>|
|[**rebuildInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/rebuildinstance?content=API)|POST|镜像重置云主机系统。<br>|
|[**resizeInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/resizeinstance?content=API)|POST|云主机变更实例规格。<br>|
|[**shareImage**](https://docs.jdcloud.com/cn/virtual-machines/api/shareimage?content=API)|POST|共享镜像。<br>|
|[**startInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/startinstance?content=API)|POST|启动单个云主机。<br>|
|[**stopInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/stopinstance?content=API)|POST|停止单个云主机。<br>|
|[**unShareImage**](https://docs.jdcloud.com/cn/virtual-machines/api/unshareimage?content=API)|POST|取消共享镜像。<br>|
|[**updateInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/updateinstancetemplate?content=API)|PATCH|修改一个启动模板的信息。<br>|
|[**verifyInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/verifyinstancetemplate?content=API)|GET|校验启动模板的有效性。<br>|
