# PUT Bucket Logging

## 描述

该操作支持查看Bucket设置的保存访问日志的规则，只有Bucket的拥有者才能查看Bucket的访问日志保存规则。

## 请求

### 语法

```HTTP
GET /?logging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string
```

### 请求参数
无请求参数
### 请求Header
无特殊请求Header
### 请求元素
无请求元素

## 响应
### 响应Header
无特殊响应Header
### 响应元素

名称|描述|必须
---|---|---
BucketLoggingStatus|存储Logging状态信息容器<br>类型：Container|是
LoggingEnabled|Logging信息容器<br>类型：Container<br>父标签：BucketLoggingStatus|是
TargetBucket|指定存储访问日志的Bucket<br>String<br>父标签：LoggingEnabled|是
TargetPrefix|指定保存的Logging文件的前缀，可以为空<br>类型：String<br>父标签：LoggingEnabled|否


## 示例
### 请求示例
```HTTP
GET ?logging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string
```
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 51991C342C575321
Date: Thu, 15 Nov 2012 00:17:23 GMT
Server: JDCloudOSS
Content-Length: length

<BucketLoggingStatus>
    <LoggingEnabled>
        <TargetBucket>JDbucketlogs</TargetBucket>
        <TargetPrefix>JDbucket-prefix_log/</TargetPrefix>
    </LoggingEnabled>
</BucketLoggingStatus>
```





