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
./mongodump --host <DB_HOST>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME>  -o <DATA_DIR>
```

- mongorestore 数据导入命令如下：
```
./mongorestore --host <DB_HOST>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --dir <DATA_DIR>
```
##### 参数说明
|参数|说明|
|:-|:-| 
|<DB_HOST>| 数据库地址|
|<DB_PORT>| 数据库端口号|
|<DB_USER>| 数据库用户名|
|\<PASSWORD>|数据库密码|
|<DB_NAME>| 数据库名|
|<DATA_DIR>| 数据文件目录的路径|

### mongoexport 和 mongoimport
进行单个集合导出导入时，可以使用 [mongoexport](https://docs.mongodb.com/manual/reference/program/mongoexport/) 和 [mongoimport](https://docs.mongodb.com/manual/reference/program/mongoimport/)，导出的数据是 JSON 格式，可读性较好，但性能略差。 另外 mongoexport 不支持导出单个db的所有的collection。

- mongoexport 导出命令如下：
```
./mongoexport --host <DB_ADDRESS>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --collection <DB_COLLECTION> --out <DATA_FILE>
```

- mongoimport 导入命令如下：
```
./mongoimport --host <DB_ADDRESS>:<DB_PORT> --authenticationDatabase admin -u <DB_USER> -p <PASSWORD> --db <DB_NAME> --collection <DB_COLLECTION> --file <DATA_FILE>
```

##### 参数说明
|参数|说明|
|:-|:-| 
|<DB_HOST>| 数据库地址|
|<DB_PORT>| 数据库端口号|
|<DB_USER>| 数据库用户名|
|\<PASSWORD>|数据库密码|
|<DB_NAME>| 数据库名|
|<DATA_FILE>| 数据文件的路径|
