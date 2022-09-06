# 使用 MongoDB 客户端进行数据迁移
MongoDB 客户端自带了两套数据导入导出工具。您可以在本地服务器或云主机中安装 MongoDB 客户端，然后通过以下工具将自建的 MongoDB 数据库或其他云数据库 MongoDB 迁移至京东云数据库 MongoDB。
- mongodump 和 mongorestore 
- mongoexport 和 mongoimport

### 注意事项
- 上述工具仅支持全量数据迁移，为保障数据一致性，请在迁移操作开始前停止源数据库的写入操作。
- 不支持迁移系统库admin和local。
- 源端，目标端及客户端最好都使用相同的版本，若版本不同可能有兼容性的问题。
- 如果要将本地的 MongoDB 数据导入到云数据库 MongoDB，需要通过云主机作为传输媒介。
- 新建的 MongoDB 实例与云主机需要在同一个 **私有网络** 内。


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

## 操作步骤
1. 从本地自建的 MongoDB 进行数据导出到本地的操作，以mongodump为例:
   ```
    ./mongodump --host 192.168.0.101:27017 --authenticationDatabase admin -u user1 -p xxxx --db testdb  -o /data/mongo/testdb
   ```
2. 创建云数据库 MongoDB，具体的创建步骤请参考 [创建 MongoDB 实例](../Operation-Guide/Manage-Instance/Create-Instance.md)。
3. 通过控制台进行数据库账号的创建， [创建账号](../Operation-Guide/Managment-Database-Account.md)。
4. 创建 Linux 云主机，步骤请参考 [创建实例](https://docs.jdcloud.com/virtual-machines/create-instance)，创建云主机时候需要注意以下几点：
    * 请确保云主机和第 1 步创建的云数据库 MongoDB 在同一个 **私有网络** 内。
    * 新建的云主机需要带一个 **公网 IP**，提供公网访问能力，否则没办法上传本地的数据文件到云主机上。
    * 请确保云主机所在子网的 **网络 ACL** 是允许本地 ssh 连接到云主机上的。 
6. 完成云主机和云数据库 MongoDB 创建后，就可以将本地的数据文件上传到云主机上，执行命令
    ```
    scp /路径/导出文件名 云主机用户名@云主机公网IP: /云主机路径
    ```
    参数说明
      - 云主机用户名：创建云主机实例时候的用户名。
      - 云主机公网 IP：云主机绑定的公网 IP 地址。
      - 云主机路径：本地上传的文件在云主机中存放的路径。
7. 如果没有任何错误提示，表示本地文件成功上传到云主机上了，接着就可以将数据导入到云数据库 MongoDB 中，执行命令：
    ```
    ./mongorestore --host jmongo-hb1-prod-mongo-cfykyntf691.jmiss.jdcloud.com:27017 --authenticationDatabase admin -u root -p xxxx --db testdb --dir /data/mongo/testdb
    ```
8. 如果没有任何错误提示，表示导入成功。登录数据库检查数据导入是否有缺失。
