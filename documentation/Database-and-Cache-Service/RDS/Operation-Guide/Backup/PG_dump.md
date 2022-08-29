# 逻辑备份PostgreSQL数据

使用PostgreSQL自带的工具pg_dump将实例的数据进行逻辑备份，并导出到本地保存。

## 背景
pg_dump是备份PostgreSQL数据库的工具，可用于备份单个数据库。更多详情请参见[pg_dump](https://www.postgresql.org/docs/10/app-pgdump.html?spm=a2c4g.11186623.0.0.df515bfeMGke8x)。

本文使用CentOS 7操作系统和PostgreSQL 10版本为例进行演示。

## 前提条件
1. PostgreSQL实例已经设置白名单连接云服务器或本地服务器的IP。
2. 云服务器或本地服务器已安装与云数据库PostgreSQL相同版本的PostgreSQL实例；

## 注意事项
建议使用高权限账号进行备份，避免出现权限不足的问题。

## 1 备份单个数据库
1. 登陆云服务器或本地服务器，使用如下命令备份目标数据库。

   ```
   pg_dump -h '<hostname>' -U <username> -p <port> -Fc <dbname> > <dumpdir>
   ```



| 参数     | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| hostname | 云数据库 PostgreSQL实例连接地址。                            |
| username | 云数据库 PostgreSQL实例高权限账号名称。                      |
| port     | 云数据库PostgreSQL实例端口。                                 |
| -Fc      | 输出格式。`-Fc`表示输出自定义格式的存档，这个格式适合通过pg_restore进行导入还原。更多选项的详细说明请参见[pg_dump](https://www.postgresql.org/docs/10/app-pgdump.html)。 |
| dbname   | 目标数据库名称。                                             |
| dumpdir  | 导出的备份文件路径及名称。                                   |



## 2 备份数据库时排除指定表
1.登陆云服务器或本地服务器，使用如下命令备份目标数据库并排除指定表。
 ```
 pg_dump -h '<hostname>' -U <username> -p <port> -T <table> -Fc <dbname> > <dumpdir>
 ```
| 参数     | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| hostname | 云数据库 PostgreSQL实例连接地址。                            |
| username | 云数据库 PostgreSQL实例高权限账号名称。                      |
| port     | 云数据库PostgreSQL实例端口。                                 |
| table    | 需要排除的表。可以用多个-T <table>排除多个表。                  |
| -Fc      | 输出格式。`-Fc`表示输出自定义格式的存档，这个格式适合通过pg_restore进行导入还原。更多选项的详细说明请参见[pg_dump](https://www.postgresql.org/docs/10/app-pgdump.html)。 |
| dbname   | 目标数据库名称。                                             |
| dumpdir  | 导出的备份文件路径及名称。                                   |

## 3 备份数据库模式（不备份数据）
1.登陆云服务器或本地服务器，使用如下命令备份目标数据库模式。
```
pg_dump -h '<hostname>' -U <username> -p <port> -s -Fc <dbname> > <dumpdir>
```
| 参数     | 说明                                                         |
| -------- | ------------------------------------------------------------ |
| hostname | 云数据库 PostgreSQL实例连接地址。                            |
| username | 云数据库 PostgreSQL实例高权限账号名称。                      |
| port     | 云数据库PostgreSQL实例端口。                                 |
| -s         | 仅备份数据库模式，不备份数据。更多选项的详细说明请参见[pg_dump](https://www.postgresql.org/docs/10/app-pgdump.html)。                  |
| -Fc      | 输出格式。`-Fc`表示输出自定义格式的存档，这个格式适合通过pg_restore进行导入还原。更多选项的详细说明请参见[pg_dump](https://www.postgresql.org/docs/10/app-pgdump.html)。 |
| dbname   | 目标数据库名称。                                             |
| dumpdir  | 导出的备份文件路径及名称。                                   |










