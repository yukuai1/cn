# 清理表空间（pg_repack）

## 使用说明

RDS PostgreSQL支持通过插件pg_repack在线清理表空间，有效解决因对全表大量更新等操作引起的表膨胀问题。pg_repack无需获取排它锁，相比CLUSTER或VACUUM FULL更加轻量化。

## 前提条件

* 京东云PostgreSQL实例版本支持  10、11、12、13。


## 注意事项

* pg_repack需要额外的存储空间。全表repack时，剩余存储空间大小需要至少是待repack表大小的2倍。

* pg_repack无法操作临时表。

* pg_repack无法操作GiST索引。

* pg_repack运行时无法对repack操作中的表执行DDL。pg_repack会持有ACCESS SHARE锁，禁止DDL执行。

重建表和索引时会占用较多的磁盘IO，使用时请提前评估是否影响业务。以ESSD PL1云盘为例，repack 100GB的表时，会达到IO吞吐上限（250MB/s）。

## 功能介绍

pg_repack插件支持全表repack和索引repack。

- 对整表数据进行repack的实现原理如下：
  1. 创建日志表记录对原表的变更。
  2. 在原表创建触发器，将原表的INSERT、UPDATE和DELETE操作记录到日志表中。
  3. 创建新表，与原表的行列相同。
  4. 在新表中创建索引。
  5. 将日志表里的变更应用到新表。
  6. 在system catalog交换新旧表。
  7. 删除旧表。

- **说明** pg_repack会在第i、ii步和第vi、vii步短暂持有ACCESS EXCLUSIVE锁。其余步骤pg_repack只需要持有原表的ACCESS SHARE锁，不影响原表的INSERT、UPDATE和DELETE。

- 对表中索引进行repack的实现原理如下：
  1. 以CONCURRENTLY方式创建新索引。
  2. 在system catalog交换新旧索引。
  3. 删除旧索引。

## 插件开启与关闭

* 开启插件。

```
CREATE EXTENSION pg_repack;
```

* 关闭插件。

```
DROP EXTENSION pg_repack;
```

## 安装客户端

pg_repack插件需要配合客户端使用，以ECS Alibaba Cloud Linux 3.2104及以上版本为例，参考以下命令：

1. 安装环境依赖。

```
yum install postgresql* redhat-rpm-config libpq* openssl-devel readline-devel -y
```

2. 添加环境变量。

```
export PATH=$PATH:/usr/lib64/pgsql/postgresql-12/bin
```

3. 下载pg_repack客户端并编译安装。

```
wget https://github.com/reorg/pg_repack/archive/refs/tags/ver_1.4.6.tar.gz
tar zxvf ver_1.4.6.tar.gz
cd pg_repack-ver_1.4.6
make && make install
```

## 使用示例

```
-- 检查但不执行：--dry-run
$ pg_repack --dry-run --no-superuser-check --echo --no-order -h 连接串 -p 端口 -d database1 -U user --table schema1.table1

-- 检查并执行
$ pg_repack  --no-superuser-check --echo --no-order -h 连接串 -p 端口 -d database1 -U user --table schema1.table1
```

## 常见问题

Q：报错“ERROR: pg_repack failed with error: You must be a superuser to use pg_repack”。

A：请使用-k或--no-superuser-check，避免没有权限。