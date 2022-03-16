# 枚举类型定义

- [engineVersion 引擎版本](engineversion-引擎版本#engineversion)
- [instanceStatus 实例状态](instancestatus-实例状态#instancestatus)
- [accountStatus 账号状态](accountStatus-账号状态#accountstatus)
- [dbPrivilege 数据库访问权限](dbPrivilege-数据库访问权限#dbprivilege)
- [backupStatus 备份状态](backupStatus-备份状态#backupstatus)
- [backupType 备份类型](backupType-备份类型#backuptype)
- [backupMode 备份模式](backupMode-备份模式#backupmode)
- [storageType 存储类型](storagetype-存储类型#storagetype)
- [nodeStatus 节点状态](nodeStatus-节点状态#nodestatus)

## engineVersion 引擎版本
<div id="engineversion"></div>

|取值|说明|
|-|-|
|4.0|TiDB 4.0 版本|
|5.4|TiDB 5.4 版本|

## instanceStatus 实例状态
<div id="instancestatus"></div>

|取值|说明|
|-|-|
|BUILDING|创建中|
|RUNNING|运行|
|SCALING|水平扩容中|
|UPGRADING |版本升级中|
|REBOOTING|重启中|
|BACKUPRESTORING|根据备份创建中|


## accountStatus 账号状态
<div id="accountstatus"></div>

|取值|说明|
|-|-|
|BUILDING|创建中|
|RUNNING|运行|
|RESETING|密码重置中|

## dbPrivdlege 数据库访问权限
<div id="dbprivilege"></div>

|取值|说明|
|-|-|
|ro|只读|
|rw|读写|

## backupStatus 备份状态
<div id="backupstatus"></div>

|取值|说明|
|-|-|
|COMPLETED|备份成功|
|BUILDING|备份中|
|DELETING|删除中|

## backupType 备份类型
<div id="backuptype"></div>

|取值|说明|
|-|-|
|full|全量备份|
|increment|增量备份|

## backupMode 备份模式
<div id="backupmode"></div>

|取值|说明|
|-|-|
|auto|系统自动备份|
|manual|手动备份|

## storageType 存储类型 
<div id="storagetype"></div>

|取值|说明|
|-|-|
|LOCAL_SSD|本地 SSD|
|EBS_SSD|SSD云盘|


## nodeStatus 节点状态
<div id="nodestatus"></div>

|取值|说明|
|-|-|
|Pending|待创建|
|Running|运行|
|Succeed|创建成功|
|Failed|创建失败|
|Unknown|未知|
