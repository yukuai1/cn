# 审计日志（pgAudit）

## 使用说明

RDS PostgreSQL支持pgAudit插件，为您提供生成审计日志的能力，这些日志通常需要符合政府、金融或 ISO 认证。通过审计日志，您还可以对数据库进行故障分析、行为分析等操作，有效帮助您获取数据的执行情况。

## 前提条件

* 京东云PostgreSQL实例版本支持  10、11、12、13。

* 使用该插件前，需要将**pgaudit**加入到 **shared_preload_libraries**  参数中。

您可以使用RDS-PostgreSQL参数设置功能，为**shared_preload_libraries**参数添加**pgaudit**。具体操作，请参见[修改参数](https://www.postgresql.org/docs/10/runtime-config.html)。

## 注意事项

* 根据设置的不同，pgAudit会生成大量日志。使用前请评估使用审计日志的对象，以避免日志过多导致磁盘空间不足。
* 对象重命名后，审计日志会产生在重命名后的对象下。

## 开启或关闭插件

* 开启pgAudit。

```
CREATE EXTENSION pgaudit;
```

* 关闭pgAudit。

```
DROP EXTENSION pgaudit;
```

##  相关参考

pgAudit的详细说明，请参考[pgAudit官方文档](https://github.com/pgaudit/pgaudit)。