# 兼容接口列表

京东云OSS兼容 AWS S3的接口及说明如下：
# 关于 Service 操作
|对象存储支持的api|api简介|JD Cloud S3 API参考| AWS S3 API参考 |
|-|-|-|-|
|List Buckets|获取一个User下的所有Bucket|兼容[List Buckets](./Service-Related/Get-Service-2.md)| [List Buckets](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBuckets.html)|

# 关于 Bucket 操作

|对象存储支持的api|api简介|JD Cloud S3 API参考| AWS S3 API参考 |
|-|-|-|-|
|Create Bucket|新建一个Bucket，默认的权限为Private|兼容[Create Bucket](./Operations-On-Bucket/Put-Bucket-2.md)| [Create Bucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateBucket.html)|
|Head Bucket|确定一个Bucket是否存在且有权利访问<br>如果Bucket存在且有权利访问，则返回200 OK。如果指定的bucket不存在，则返回404 Not Found|兼容[Head Bucket](./Operations-On-Bucket/Head-Bucket-2.md)| [Head Bucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadBucket.html)|
|List Objects|获取某个Bucket下的部分或者全部Object信息（兼容Version2）|兼容[List Objects](./Operations-On-Bucket/Get-Bucket-2.md)| [List Objects](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListObjectsV2.html)|
|Delete Bucket|删除指定的Bucket|兼容[Delete Bucket](./Operations-On-Bucket/Delete-Bucket-2-Compatibility-API.md)| [Delete Bucket](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucket.html)|
|List MultiPart Uploads|获取一个Bucket下面正在进行的分块上传任务|兼容[List MultiPart Uploads](./Operations-On-Bucket/List-Multipart-Uploads-2.md)| [List MultiPart Uploads](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListMultipartUploads.html)|
|Get Bucket Policy|获取指定的Bucket上的policy|兼容[Get Bucket Policy](./Operations-On-Bucket/Get-Bucket-Policy-2.md)| [Get Bucket Policy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketPolicy.html)|
|Put Bucket Policy|为指定的Bucket上添加或编辑policy|兼容[Put Bucket Policy](./Operations-On-Bucket/Put-Bucket-Policy-2.md)| [Put Bucket Policy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketPolicy.html)|
|Delete Bucket Policy|删除指定的Bucket上的policy|兼容[Delete Bucket Policy](./Operations-On-Bucket/Delete-Bucket-Policy-2.md)| [Delete Bucket Policy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketPolicy.html)|
|Put Bucket Acl|在指定的Bucket上设置acl|兼容[Put Bucket Acl](./Operations-On-Bucket/Put-Bukcet-acl-2.md)| [Put Bucket Acl](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAcl.html)|
|Get Bucket Acl|获取指定的Bucket的acl|兼容[Get Bucket Acl](./Operations-On-Bucket/GET-Bucket-Acl-2.md)| [Get Bucket Acl](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAcl.html)|
|Put Bucket Cors|为指定的Bucket添加CORS规则|兼容[Put Bucket Cors](./Operations-On-Bucket/Put-Bucket-Cors-2.md)| [Put Bucket Cors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketCors.html)|
|Get Bucket Cors|获取指定的Bucket的CORS规则|兼容[Get Bucket Cors](./Operations-On-Bucket/Get-Bucket-Cors-2.md)| [Get Bucket Cors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketCors.html)|
|Delete Bucket Cors|删除指定的Bucket的CORS规则|兼容[Delete Bucket Cors](./Operations-On-Bucket/Delete-Bucket-Cors-2.md)| [Delete Bucket Cors](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketCors.html)|
|Put Bucket Website|为指定的Bucket添加静态网站托管规则（注：接口兼容，但规则细节与S3有出入）|兼容[Put Bucket Website](./Operations-On-Bucket/Put-Bucket-Website-2.md)| [Put Bucket Website](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketWebsite.html)|
|Get Bucket Website|获取指定的Bucket的静态网站托管规则（注：接口兼容，但规则细节与S3有出入）|兼容[Get Bucket Website](./Operations-On-Bucket/Get-Bucket-Website-2.md)| [Get Bucket Website](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketWebsite.html)|
|Delete Bucket Website|删除指定的Bucket的静态网站托管规则（注：接口兼容，但规则细节与S3有出入）|兼容[Delete Bucket Website](./Operations-On-Bucket/Delete-Bucket-Website-2.md)| [Delete Bucket Website](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketWebsite.html)|
|Put Bucket Replication|创建、修改增量数据同步配置|未支持：Account，Role，Owner AccessControlTranslation SourceSelectionCriteria<br>兼容[Put Bucket Replication](./Operations-On-Bucket/Put-Bucket-Replication-2.md)|[Put Bucket Replication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketReplication.html)|
|Get Bucket Replication|返回设置在Bucket上的增量数据同步配置|兼容[Get Bucket Replication](./Operations-On-Bucket/Get-Bucket-Replication-2.md)|[Get Bucket Replication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketReplication.html)|
|Delete Bucket Replication|删除已开启的增量数据同步配置，删除后目标Bucket和objcet依然存在|兼容[Delete Bucket Replication](./Operations-On-Bucket/Delete-Bucket-Replication-2.md)|[Delete Bucket Replication](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketReplication.html)|
|Put Bucket Notification|指定Bucket添加回调通知配置|未支持：CloudFunction，Queue<br>仅支持：Topic <br>详见 [回调通知](https://docs.jdcloud.com/cn/object-storage-service/callback-notification-2) <br>兼容[Put Bucket Notification](./Operations-On-Bucket/PUT-Bucket-Notification-2.md)|[Put Bucket Notification](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketNotification.html)|
|Get Bucket Notification|返回设置在Bucket上的回调通知配置|兼容[Get Bucket Notification](./Operations-On-Bucket/GET-Bucket-Notification-2.md)|[Get Bucket Notification](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketNotification.html)|
|Put Bucket Encryption|用于设定bucket默认加密方式置|兼容[Put Bucket Encryption](./Operations-On-Bucket/Put-Bucket-Encryption-2.md)|[Put Bucket Encryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketEncryption.html)|
|Get Bucket Encryption|返回用户对于OSS存储空间的默认加密配置|兼容[Get Bucket Encryption](./Operations-On-Bucket/Get-Bucket-Encryption-2.md)|[Get Bucket Encryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketEncryption.html)|
|Delete Bucket Encryption|删除OSS存储空间的默认加密配置|兼容[Delete Bucket Encryption](./Operations-On-Bucket/Delete-Bucket-Encryption-2.md)|[Delete Bucket Encryption](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketEncryption.html)|
|Put Bucket Lifecycle|设置Bucket的生命周期规则|未支持：Transition、AbortIncompleteMultipartUpload<br>兼容：[Put Bucket Lifecycle](./Operations-On-Bucket/Put-Bucket-Lifecycle.md)|[Put Bucket Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLifecycle.html)|
|Get Bucket Lifecycle|设置Bucket的生命周期规则|兼容：[Get Bucket Lifecycle](./Operations-On-Bucket/Get-Bucket-Lifecycle.md)|[Get Bucket Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLifecycle.html)|
|Delete Bucket Lifecycle|删除Bucket的生命周期规则|兼容：[Delete Bucket Lifecycle](./Operations-On-Bucket/Delete-Bucket-Lifecycle.md)|[Delete Bucket Lifecycle](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketLifecycle.html)|
|Put Bucket Tagging|设置Bucket的标签|兼容：[Put Bucket Tagging](./Operations-On-Bucket/Put-Bucket-Tagging.md)|[Put Bucket Tagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketTagging.html)|
|Get Bucket Tagging|获取Bucket的标签|兼容：[Get Bucket Tagging](./Operations-On-Bucket/Get-Bucket-Tagging.md)|[Get Bucket Tagging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketTagging.html)|
|Put Bucket Accelerate|设置Bucket传输加速配置|兼容：[Put Bucket Accelerate](./Operations-On-Bucket/PUT-Bucket-accelerate.md)|[Put Bucket Accelerate](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketAccelerateConfiguration.html)|
|Get Bucket Accelerate|获取Bucket传输加速配置|兼容：[Get Bucket Accelerate](./Operations-On-Bucket/GET-Bucket-accelerate.md)|[Get Bucket Accelerate](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketAccelerateConfiguration.html)|
|Put Bucket InventoryConfiguration|在存储空间中创建清单任务|兼容：[Put Bucket InventoryConfiguration](./Operations-On-Bucket/Put-Bucket-InventoryConfiguration.md)|[Put Bucket InventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketInventoryConfiguration.html)|
|Get Bucket InventoryConfiguration|查询存储空间中用户的清单任务信息|兼容：[Get Bucket InventoryConfiguration](./Operations-On-Bucket/Get-Bucket-InventoryConfiguration.md)|[Get Bucket InventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketInventoryConfiguration.html)|
|List Bucket InventoryConfigurations|请求返回一个存储桶中的所有清单任务|兼容：[List Bucket InventoryConfigurations](./Operations-On-Bucket/List-Bucket-InventoryConfigurations.md)|[List Bucket InventoryConfigurations](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListBucketInventoryConfigurations.html)|
|Delete Bucket InventoryConfiguration|删除存储空间中指定的清单任务|兼容：[Delete Bucket InventoryConfiguration](./Operations-On-Bucket/Delete-Bucket-InventoryConfiguration.md)|[Delete Bucket InventoryConfiguration](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteBucketInventoryConfiguration.html)|
|PUT Bucket Logging|设置Bucket的访问日志规则|兼容：[PUT Bucket Logging](./Operations-On-Bucket/Put-Bucket-Logging.md)|[PUT Bucket Logging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutBucketLogging.html)|
|GET Bucket Logging|获取Bucket的生命周期规则|兼容：[GET Bucket Logging](./Operations-On-Bucket/Get-Bucket-Logging.md)|[GET Bucket Logging](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetBucketLogging.html)|


# 关于 Object 操作 

|对象存储支持的api|api简介|JD Cloud S3 API参考| AWS S3 API参考 |
|-|-|-|-|
|Put Object|上传一个Object到OSS|兼容[Put Object](./Operations-On-Objects/Put-Object-2.md)| [Put Object](https://docs.aws.amazon.com/AmazonS3/latest/API/API_PutObject.html)
|GET Object|获取一个Object的Meta及数据，可以获取全部数据或者使用Range指定获取部分数据|兼容[Get Object](./Operations-On-Objects/Get-Object-2.md)| [Get Object](https://docs.aws.amazon.com/AmazonS3/latest/API/API_GetObject.html)|
|Head Object|获取一个Object的Meta|兼容[Head Object](./Operations-On-Objects/Head-Object-2.md)| [Head Object](https://docs.aws.amazon.com/AmazonS3/latest/API/API_HeadObject.html)|
|DELETE Object|删除一个Object|兼容[Delete Object](./Operations-On-Objects/Delete-Object-2.md)| [Delete Object](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObject.html)|
|Delete Objects|支持用户通过一个HTTP请求删除同一个Bucket中的多个Object|未支持：version<br>兼容[Delete Objects](./Operations-On-Objects/Delete-Multiple-Objects-2.md)|[Delete Objects](https://docs.aws.amazon.com/AmazonS3/latest/API/API_DeleteObjects.html)|
|Initiate MultiPart Upload|初始化一个多步上传的任务|兼容[Initiate Mutipart Upload](./Operations-On-Objects/Initiate-Multipart-Upload-2.md)| [Initiate MultiPart Upload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CreateMultipartUpload.html)|
|Upload Part|上传一个Part到OSS|兼容[Upload Part](./Operations-On-Objects/Upload-Part-2.md)| [Upload Part](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPart.html)|
|Complete MultiPart Upload|把上传的多个part合并成一个Object|兼容[Complete Multipart Upload](./Operations-On-Objects/Complete-Multipart-Upload-2.md)| [Complete MultiPart Upload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CompleteMultipartUpload.html)|
|Abort MultiPart Upload|终止一个分块上传任务并删除已上传的块|兼容[Abort MultiPart Upload](./Operations-On-Objects/Abort-Multipart-Upload-2.md)| [Abort MultiPart Upload](https://docs.aws.amazon.com/AmazonS3/latest/API/API_AbortMultipartUpload.html)|
|List Parts|获取特定分块上传操作中的已上传的块|兼容[List Parts](./Operations-On-Objects/List-Parts-2.md)| [List Parts](https://docs.aws.amazon.com/AmazonS3/latest/API/API_ListParts.html)|

|Copy Object|拷贝一个在OSS上已经存在的object成另外一个object|未支持：x-amz-copy-source-if-match，<br>x-amz-copy-source-if-none-match，<br>x-amz-copy-source-if-unmodified-since，<br>x-amz-copy-source-if-modified-since，<br>x-amz-tagging-directive<br>x-amz-storage-class<br>支持STANDARD和REDUCED_REDUNDANCY<br>兼容[Copy Object](./Operations-On-Objects/Put-Object-Copy-2.md)|[Copy Object](https://docs.aws.amazon.com/AmazonS3/latest/API/API_CopyObject.html)|
|Upload Part Copy|通过从一个已存在的Object中拷贝数据来上传一个Part。|未支持：x-amz-copy-source-if-match，<br>x-amz-copy-source-if-none-match，<br>x-amz-copy-source-if-unmodified-since，<br>x-amz-copy-source-if-modified-since<br>兼容[Upload Part Copy](./Operations-On-Objects/Upload-Part-Copy-2.md)|[Upload Part Copy](https://docs.aws.amazon.com/AmazonS3/latest/API/API_UploadPartCopy.html)|
|Post Object|通过表单上传文件到OSS|兼容[Post Object](./Operations-On-Objects/Post-Object-2.md)|[Post Object](https://docs.aws.amazon.com/zh_cn/AmazonS3/latest/API/RESTObjectPOST.html)|
|Post Object Restore|恢复归档存储对象得到临时副本|未支持:Select <br>兼容[Post Object Restore](./Operations-On-Objects/Post-Object-Restore.md)|[Post Object Restore](https://docs.aws.amazon.com/zh_cn/AmazonS3/latest/API/RESTObjectPOSTrestore.html)|