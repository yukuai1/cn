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
|[**createKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/createkeypair?content=API)|POST|创建ssh密钥对。公钥部分存储在京东云，并返回未加密的 PEM 编码的 PKCS#8 格式私钥，您只有一次机会保存您的私钥。请妥善保管。<br>若传入已存在的密钥名称，会返回错误。<br>|
|[**deleteImage**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteimage?content=API)|DELETE|删除一个私有镜像，只允许操作您的个人私有镜像。<br>若镜像已共享给其他用户，需先取消共享才可删除。<br>|
|[**deleteInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteinstance?content=API)|DELETE|删除按配置计费、或包年包月已到期的单个云主机。不能删除没有计费信息的云主机。<br>云主机状态必须为运行<b>running</b>、停止<b>stopped</b>、错误<b>error</b>，同时云主机没有正在进行中的任务才可删除。<br>如果主机中挂载的数据盘为按配置计费的云硬盘且AutoDelete属性为true，那么数据盘会随主机一起删除。<br>敏感操作，可开启<a href="https://docs.jdcloud.com/cn/security-operation-protection/operation-protection">MFA操作保护</a>|
|[**deleteInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/deleteinstancetemplate?content=API)|DELETE|删除一个启动模板<br>|
|[**deleteKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/deletekeypair?content=API)|DELETE|删除ssh密钥对。<br>|
|[**describeBriefInstances**]()|POST|批量查询云主机信息的轻量接口，不返回云盘、网络、计费、标签等信息。如果不需要关联资源属性，尽量选择使用该接口。<br>此接口支持分页查询，默认每页20条。<br>|
|[**describeImage**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimage?content=API)|GET|查询镜像详情。<br>|
|[**describeImageConstraints**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimageconstraints?content=API)|GET|查询镜像的实例规格限制。<br>通过此接口可以查看镜像不支持的实例规格。只有官方镜像、第三方镜像有实例规格的限制，个人的私有镜像没有此限制。<br>|
|[**describeImageConstraintsBatch**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimageconstraintsbatch?content=API)|GET|批量查询镜像的实例规格限制。<br>通过此接口可以查看镜像不支持的实例规格。只有官方镜像、第三方镜像有实例规格的限制，个人的私有镜像没有此限制。<br>|
|[**describeImageMembers**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimagemembers?content=API)|GET|查询镜像共享帐户列表，只允许操作您的个人私有镜像。<br>|
|[**describeImages**](https://docs.jdcloud.com/cn/virtual-machines/api/describeimages?content=API)|GET|查询镜像信息列表。<br>通过此接口可以查询到京东云官方镜像、第三方镜像、私有镜像、或其他用户共享给您的镜像。<br>此接口支持分页查询，默认每页20条。<br>|
|[**describeInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstance?content=API)|GET|查询一台云主机的详细信息<br>|
|[**describeInstancePrivateIpAddress**]()|GET|批量查询云主机内网IP地址，查询的是主网卡内网主IP地址。|
|[**describeInstanceStatus**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancestatus?content=API)|GET|批量查询云主机状态|
|[**describeInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetemplate?content=API)|GET|查询启动模板详情<br>|
|[**describeInstanceTemplates**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetemplates?content=API)|GET|查询启动模板列表<br>|
|[**describeInstanceTypes**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancetypes?content=API)|GET|查询实例规格信息列表<br>|
|[**describeInstanceVncUrl**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstancevncurl?content=API)|GET|获取云主机vnc，用于连接管理云主机。<br>vnc地址的有效期为1个小时，调用接口获取vnc地址后如果1个小时内没有使用，vnc地址自动失效，再次使用需要重新获取。<br>|
|[**describeInstances**](https://docs.jdcloud.com/cn/virtual-machines/api/describeinstances?content=API)|GET|批量查询云主机的详细信息<br>此接口支持分页查询，默认每页20条。<br>|
|[**describeKeypairs**](https://docs.jdcloud.com/cn/virtual-machines/api/describekeypairs?content=API)|GET|批量查询密钥对。<br>此接口支持分页查询，默认每页20条。<br>|
|[**describeQuotas**](https://docs.jdcloud.com/cn/virtual-machines/api/describequotas?content=API)|GET|查询配额，支持的类型：云主机、镜像、密钥、模板、镜像共享。<br>|
|[**detachDisk**](https://docs.jdcloud.com/cn/virtual-machines/api/detachdisk?content=API)|POST|云主机缷载云硬盘，云主机和云硬盘没有正在进行中的任务时才可缷载。<br>|
|[**detachNetworkInterface**](https://docs.jdcloud.com/cn/virtual-machines/api/detachnetworkinterface?content=API)|POST|云主机缷载一块弹性网卡。<br>云主机状态必须为<b>running</b>或<b>stopped</b>状态，并且没有正在进行中的任务才可操作。<br>不能缷载主网卡。<br>|
|[**disassociateElasticIp**](https://docs.jdcloud.com/cn/virtual-machines/api/disassociateelasticip?content=API)|POST|云主机解绑弹性公网IP，解绑的是主网卡、内网主IP对应的弹性公网IP。<br>|
|[**exportImage**](https://docs.jdcloud.com/cn/virtual-machines/api/exportimage?content=API)|POST|导出镜像，将京东云私有镜像导出至京东云以外环境<br>|
|[**imageTasks**](https://docs.jdcloud.com/cn/virtual-machines/api/imagetasks?content=API)|GET|查询镜像导入导出任务详情<br>|
|[**importImage**](https://docs.jdcloud.com/cn/virtual-machines/api/importimage?content=API)|POST|导入镜像，将外部镜像导入到京东云中<br>|
|[**importKeypair**](https://docs.jdcloud.com/cn/virtual-machines/api/importkeypair?content=API)|POST|导入由其他工具生成的密钥对的公钥部分。<br>若传入已存在的密钥名称，会返回错误。<br>|
|[**modifyImageAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyimageattribute?content=API)|POST|修改镜像信息，包括名称、描述；只允许操作您的个人私有镜像。<br>|
|[**modifyInstanceAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstanceattribute?content=API)|POST|修改云主机部分信息，包括名称、描述。<br>|
|[**modifyInstanceDiskAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancediskattribute?content=API)|POST|修改云主机挂载的数据盘属性，包括是否随主机删除。<br>仅按配置计费云硬盘支持设置随实例删除属性;包年包月计费云硬盘该属性不生效,实例删除时云硬盘将保留。<br>|
|[**modifyInstanceNetworkAttribute**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancenetworkattribute?content=API)|POST|修改虚机弹性网卡属性，包括是否随云主机一起删除。<br>不能修改主网卡。<br>|
|[**modifyInstancePassword**](https://docs.jdcloud.com/cn/virtual-machines/api/modifyinstancepassword?content=API)|POST|修改云主机密码，主机没有正在进行中的任务时才可操作。<br>修改密码后，需要重启云主机后生效。<br>|
|[**rebootInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/rebootinstance?content=API)|POST|重启单个云主机，只能重启<b>running</b>状态的云主机，云主机没有正在进行中的任务才可重启。<br>|
|[**rebuildInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/rebuildinstance?content=API)|POST|云主机使用指定镜像重置云主机系统<br>云主机的状态必须为<b>stopped</b>状态。<br>若不指定镜像ID，默认使用当前主机的原镜像重置系统。<br>云主机系统盘类型必须与待更换镜像支持的系统盘类型保持一致，若当前云主机系统盘为local类型，则更换镜像的系统盘类型必须为loaclDisk类型；同理，若当前云主机系统盘为cloud类型，则更换镜像的系统盘类型必须为cloudDisk类型。可查询<a href="http://docs.jdcloud.com/virtual-machines/api/describeimages">DescribeImages</a>接口获得指定地域的镜像信息。<br>指定的镜像必须能够支持当前主机的实例规格(instanceType)，否则会返回错误。可查询<a href="http://docs.jdcloud.com/virtual-machines/api/describeimageconstraints">DescribeImageConstraints</a>接口获得指定镜像支持的系统盘类型信息。<br>|
|[**releaseImage**]()|POST|发布社区镜像，只允许操作您的个人私有镜像。发布为社区镜像后会撤销共享关系。<br>|
|[**resizeInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/resizeinstance?content=API)|POST|云主机变更实例规格<br>云主机的状态必须为<b>stopped</b>状态。<br>以下情况的云主机，不允许在一代与二代实例规格间互相调整，例：不允许g.n1与g.n2之间互相调配<br>1、16年创建的云硬盘做系统盘的云主机<br>2、本地盘(local类型)做系统盘的云主机。<br>3、使用高可用组(Ag)创建的云主机。<br>如果当前主机中的弹性网卡数量，大于新实例规格允许的弹性网卡数量，会返回错误。可查询<a href="http://docs.jdcloud.com/virtual-machines/api/describeinstancetypes">DescribeInstanceTypes</a>接口获得指定地域及可用区下的实例规格信息。<br>当前主机所使用的镜像，需要支持要变更的目标实例规格，否则返回错误。可查询<a href="http://docs.jdcloud.com/virtual-machines/api/describeimageconstraints">DescribeImageConstraints</a>接口获得指定镜像的实例规格限制信息。<br>云主机欠费或到期时，无法更改实例规格。<br>|
|[**shareImage**](https://docs.jdcloud.com/cn/virtual-machines/api/shareimage?content=API)|POST|共享镜像，只允许操作您的个人私有镜像，单个镜像最多可共享给20个京东云帐户。<br>整机镜像目前不支持共享。<br>|
|[**startInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/startinstance?content=API)|POST|启动单个云主机，只能启动<b>stopped</b>状态的云主机，云主机没有正在进行中的任务才可启动。<br>只能启动正常计费状态的云主机，若已欠费停服或到期停服则不支持启动。<br>|
|[**stopInstance**](https://docs.jdcloud.com/cn/virtual-machines/api/stopinstance?content=API)|POST|停止单个云主机，只能停止<b>running</b>状态的云主机，云主机没有正在进行中的任务才可停止<br>|
|[**unReleaseImage**]()|POST|撤销社区镜像，只允许操作您的个人私有镜像。<br>|
|[**unShareImage**](https://docs.jdcloud.com/cn/virtual-machines/api/unshareimage?content=API)|POST|取消共享镜像，只允许操作您的个人私有镜像。<br>|
|[**updateInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/updateinstancetemplate?content=API)|PATCH|修改一个启动模板的信息，包括名称、描述<br>|
|[**verifyInstanceTemplate**](https://docs.jdcloud.com/cn/virtual-machines/api/verifyinstancetemplate?content=API)|GET|校验启动模板的有效性<br>|
