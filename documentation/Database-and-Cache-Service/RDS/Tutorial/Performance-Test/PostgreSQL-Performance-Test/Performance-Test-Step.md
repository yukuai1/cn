# 性能测试步骤
云数据库 PostgreSQL 不同规格，所对应最大连接数和最大 IOPS 不同。

性能测试报告如下：

## 测试环境
* 所有测试均在华北-北京，可用区A完成
* 测试用的云主机规格：8C 32GB 40G（本地盘）
* 测试用的云主机镜像：CentOS 7.6 64位
* 测试用的云数据库 PostgreSQL 版本：10.6

## 测试工具
### pgbench
pgbench是一种在PostgreSQL上运行基准测试的简单程序。它可能在并发的数据库会话中一遍一遍地运行相同序列的 SQL 命令，并且计算平均事务率（每秒的事务数）。

### 测试步骤
1. 在云主机上安装postgresql客户端

   ```
   yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
   yum install -y https://download.postgresql.org/pub/repos/yum/11/redhat/rhel-7-x86_64/pgdg-centos11-11-2.noarch.rpm
   yum install -y postgresql10*
   ```
   
2. 配置环境变量

   ```
   export PGHOST=<PostgreSQL实例内网地址>
   export PGPORT=<PostgreSQL实例端口>
   export PGDATABASE=pgbench
   export PGUSER=<PostgreSQL数据库用户名>
   ```

3. psql连接数据库实例，创建pgbench数据库

   ```
   psql -dpostgres
   create database pgbench
   ```

4. 创建只读脚本只读与读写测试

   ```
   ro.sql:
   \set aid random_gaussian(1, :range, 10.0)
   SELECT abalance FROM pgbench_accounts WHERE aid = :aid;
   rw.sql:
   \set aid random_gaussian(1, :range, 10.0) 
   \set bid random(1, 1 * :scale) 
   \set tid random(1, 10 * :scale) 
   \set delta random(-5000, 5000) 
   BEGIN; 
   UPDATE pgbench_accounts SET abalance = abalance + :delta WHERE aid = :aid; 
   SELECT abalance FROM pgbench_accounts WHERE aid = :aid; 
   UPDATE pgbench_tellers SET tbalance = tbalance + :delta WHERE tid = :tid; 
   UPDATE pgbench_branches SET bbalance = bbalance + :delta WHERE bid = :bid; 
   INSERT INTO pgbench_history (tid, bid, aid, delta, mtime) VALUES (:tid, :bid, :aid, :delta, CURRENT_TIMESTAMP); 
   END;
   ```


5. 使用如下命令进行测试：

   只读测试：

   | 热数据/总数据（单位：亿行） | 命令                                                         |
   | --------------------------- | ------------------------------------------------------------ |
   | 1/5                         | pgbench -M prepared -n -r -P 1 -f ./ro.sql -c 16 -j 16 -T 120 -D scale=5000 -D range=100000000 |
   | 5/5                         | pgbench -M prepared -n -r -P 1 -f ./ro.sql -c 16 -j 16 -T 120 -D scale=5000 -D range=500000000 |

   读写测试：

| 总数据/热数据（单位：亿行） | 命令                                                         |
| --------------------------- | ------------------------------------------------------------ |
| 1/5                         | pgbench -M prepared -n -r -P 1 -f ./rw.sql -c 32 -j 32 -T 120 -D scale=5000 -D range=100000000 |
| 5/5                         | pgbench -M prepared -n -r -P 1 -f ./rw.sql -c 32 -j 32 -T 120 -D scale=5000 -D range=500000000 |

