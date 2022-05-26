# PostgreSQL 通过控制台下载备份进行恢复

当用户出现数据丢失或者损坏时，可通过已经控制台手动备份后下载的备份文件对数据进行按时间点恢复，可恢复的时间根据日志保留时间来决定。



### 1.安装PostgreSQL数据库
 在待恢复数据的云主机或本地服务器中，安装与备份数据相同版本的PostgreSQL数据库。
> 本文以在 CentOS 7 操作系统的云主机或本地服务器中，安装 PostgreSQL 11 版本数据库并恢复数据为例。

1. 登陆Linux系统的云服务器或本地服务器。
2. 安装 PostgreSQL 数据库，本文采用 yum 源的安装方式，yum 源可至 该地址 查找所需版本。
3. 执行如下命令，安装 PostgreSQL 11版本。

```
sudo yum install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
sudo yum install -y postgresql11-server
```
更多安装信息可以查看postgresql官方网址https://www.postgresql.org/

### 2. 使用 postgres 用户创建恢复目录

1. 切换为 postgres 用户，在云服务器本地服务器中创建恢复目录。
```
mkdir /var/lib/pgsql/11/recovery
```

其中，recovery 为示例目录，用户可自行修改恢复目录。后续示例中不同版本目录名将不再区分描述，请以实际为准

### 3.下载全量备份文件
1. 登陆 [云数据库 RDS 控制台](https://rds-console.jdcloud.com/database)。
2. 选择需要进行备份数据下载的目标实例，点击目标实例的名称，进入到实例详情页。
3. 选择 **备份管理** 标签，选择你要下载的备份数据，点击 **操作** 这一列的 **下载**。
4. 根据提供的内网地址或外网地址链接下载备份文件。
>  使用内网地址下载备份时，云数据库须与云服务器处于同一 VPC，备份需下载至/var/lib/pgsql/11/recovery目录。
>  使用外网地址下载备份时，下载后需将备份文件上传至云服务器中的/var/lib/pgsql/11/recovery目录

### 4.解压全量备份文件
执行如下命令，解压全量备份文件。
```
[root@localhost ~]# mkdir /var/lib/pgsql/11/recovery
[root@localhost ~]# tar zxvf base.tar.gz -C /var/lib/pgsql/11/recovery
```
### 5. 修改数据目录权限
执行如下命令，修改数据目录权限。
```
[root@localhost ~]# chown postgres:postgres /var/lib/pgsql/11/recovery
[root@localhost ~]# chmod 700 /var/lib/pgsql/11/recovery
```
### 6. 删除多余的文件
执行如下命令，删除多余的临时文件。
```
rm -rf archive_wal_pgbackrest.sh
rm -rf archive_wal.sh
rm -rf backup_label
rm -rf backup_label.old
rm -rf recovery.conf  [PG12及以上版本无此文件]
rm -rf standby.signal [PG11及以下版本无此文件]
```
### 7. 修改配置文件
将配置文件postgresql.conf中的以下选项注释掉，注释方法：在行首使用#。
如有多个该选项，则全部注释掉。
```
#shared_preload_libraries = 'pgaudit,pg_stat_statements,pg_buffercache'
#pg_stat_statements.max = 10000
#pg_stat_statements.track = all
#local_preload_libraries = 'pgrds'
#rds.extensions = 'postgis,fuzzystrmatch,postgis_tiger_geocoder, postgis_topology, postgis_sfcgal,postgres_fdw'
#archive_mode = on
#archive_command = '/var/lib/pgsql/11/data/archive_wal_pgbackrest.sh c01e249b-0e6e-4060-8dd5-c542c89572e3 %p'
```
⚠️注意PG12以上版本需要注释postgresql.auto.conf中部分内容
```
#primary_conninfo = 'host=10.0.56.77 port=5432   user=rdsreplication'
#restore_command = '/bin/pgbackrest --lock-path=/var/lib/pgsql/12/data --pg1-path=/var/lib/pgsql/12/data --stanza=pg-nqds1b6bn8 archive-get %f "%p"'
```
### 8.使用 postgres 用户启动数据库
使用postgres用户启动数据库，命令如下
```
/usr/pgsql-11/bin/pg_ctl start -D /var/lib/pgsql/11/recovery
```
输出如下
```
bash-4.2$  /usr/pgsql-11/bin/pg_ctl start -D /var/lib/pgsql/11/recovery
waiting for server to start....
    29491               2022-04-03 01:13:26 CST 00000                       LOG:  00000: listening on IPv4 address "0.0.0.0", port 5432
  
    29491               2022-04-03 01:13:26 CST 00000                       LOCATION:  StreamServerPort, pqcomm.c:593
  
    29491               2022-04-03 01:13:26 CST 00000                       LOG:  00000: listening on IPv6 address "::", port 5432
  
    29491               2022-04-03 01:13:26 CST 00000                       LOCATION:  StreamServerPort, pqcomm.c:593
  
    29491               2022-04-03 01:13:26 CST 00000                       LOG:  00000: listening on Unix socket "/var/run/postgresql/.s.PGSQL.5432"
  
    29491               2022-04-03 01:13:26 CST 00000                       LOCATION:  StreamServerPort, pqcomm.c:587
  
    29491               2022-04-03 01:13:26 CST 00000                       LOG:  00000: listening on Unix socket "/tmp/.s.PGSQL.5432"
  
    29491               2022-04-03 01:13:26 CST 00000                       LOCATION:  StreamServerPort, pqcomm.c:587
  
    29491               2022-04-03 01:13:26 CST 00000                       LOG:  00000: redirecting log output to logging collector process
  
    29491               2022-04-03 01:13:26 CST 00000                       HINT:  Future log output will appear in directory "pg_log".
  
    29491               2022-04-03 01:13:26 CST 00000                       LOCATION:  SysLogger_Start, syslogger.c:668
```
### 9. 登陆数据库验证
1. 登录 PostgreSQL 数据库。
```
export PGDATA=/var/lib/pgsql/11/recovery
psql
```
2. 验证数据库是否运行。
```
/usr/pgsql-11/bin/pg_ctl status -D /var/lib/pgsql/11/recovery
```
如提示"server is running"，则代表数据库正在运行。