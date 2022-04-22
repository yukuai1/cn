# 使用 MongoDB 客户端进行数据迁移
MongoDB 客户端自带了两套数据导入导出工具。您可以在本地服务器或云主机中安装 MongoDB 客户端，然后通过以下工具将自建的 MongoDB 数据库或其他云数据库 MongoDB 迁移至京东云数据库 MongoDB。
- mongodump 和 mongorestore 
- mongoexport 和 mongoimport

### 注意事项
- 上述工具仅支持全量数据迁移，为保障数据一致性，请在迁移操作开始前停止源数据库的写入操作。
- 不支持迁移系统库admin和local。
- 源端，目标端及客户端最好都使用相同的版本，若版本不同可能有兼容性的问题。


### mongodump 和 mongorestore
进行整库导出导入时，通常使用 [mongodump](https://docs.mongodb.com/manual/reference/program/mongodump/) 和 [mongorestore](https://docs.mongodb.com/manual/reference/program/mongorestore/)。导出的数据是 BSON 格式，导出速度和压缩率方面较好。

- mongodump 数据导出命令如下：
```
./mongodump --host <DB_HOST>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME>  -o <数据的目录名>
```
如下图所示，则执行成功：
![mongodump示例截图](https://mc.qcloudimg.com/static/img/4071cfd5d9b54c720349f41fc2e07b0c/dump_default.png)

- mongorestore 数据导入命令如下：
```
./mongorestore --host <DB_HOST>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --dir <数据的目录名>
```
如下图所示，则执行成功：
![mongorestore示例截图](https://mc.qcloudimg.com/static/img/335dbef8f11a5417e42740472df1a5b8/restore_default.png)

### mongoexport 和 mongoimport
进行单个集合导出导入时，可以使用 [mongoexport](https://docs.mongodb.com/manual/reference/program/mongoexport/) 和 [mongoimport](https://docs.mongodb.com/manual/reference/program/mongoimport/)，导出的数据是 JSON 格式，可读性较好，但性能略差。 另外 mongoexport 不支持导出单个db的所有的collection

- mongoexport 导出命令如下：
```
mongoexport --host 10.66.187.127:27017 -u mongouser -p thepasswordA1 --authenticationDatabase=admin --db=testdb --collection=testcollection -o /data/export_testdb_testcollection.json
./mongoexport --host <DB_ADDRESS>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --collection <DB_COLLECTION> --out <数据文件名称>
```

另外您也可以加上 -f 参数指定需要的字段，-q 参数指定一个查询条件来限定要导出的数据。
- mongoimport 导入命令如下：
```
mongoimport --host 10.66.187.127:27017 -u mongouser -p thepasswordA1 --authenticationDatabase=admin --db=testdb --collection=testcollection2 --file=/data/export_testdb_testcollection.json
./mongoimport --host <DB_ADDRESS>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --collection <DB_COLLECTION> --file <数据文件名称>
```
