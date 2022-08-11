# PUT Bucket Logging

## 描述

该操作支持为已存在的Bucket设置日志转存规则，系统将根据此规则，保存Bucket的详细操作日志。

## 请求
### 语法
```HTTP
PUT /?tagging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Date: date
Authorization: authorization string
Content-MD5: MD5
 
<BucketLoggingStatus>
    <LoggingEnabled>
        <TargetBucket>TargetBucket</TargetBucket>
        <TargetPrefix>TargetPrefix</TargetPrefix>
    </LoggingEnabled>
</BucketLoggingStatus>
```

### 请求参数

无请求参数

### 请求Header

无特殊请求Header

### 请求元素

名称|描述|必须
---|---|---
BucketLoggingStatus|存储Logging状态信息容器<br>类型：Container|是
LoggingEnabled|Logging信息容器<br>类型：Container<br>父标签：BucketLoggingStatus|是
TargetBucket|指定存储访问日志的Bucket<br>String<br>父标签：LoggingEnabled|是
TargetPrefix|指定保存的Logging文件的前缀，可以为空<br>类型：String<br>父标签：LoggingEnabled|否

## 响应
### 响应Header
无特殊响应Header
### 响应元素
无响应元素

## 示例
### 请求示例
##### 开启Bucket Logging的请求示例
```HTTP
PUT ?logging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: 163
x-amz-date: Thu, 12 Apr 2012 20:04:21 GMT
Authorization: authorization string

<BucketLoggingStatus>
<LoggingEnabled>
<TargetBucket>examplebucket</TargetBucket>
<TargetPrefix>MyLog-</TargetPrefix>
</LoggingEnabled>
</BucketLoggingStatus>
```
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 9E26D08072A8EF9E
Date: Wed, 14 May 2014 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```

### 请求示例
##### 关闭Bucket Logging的请求示例
发送一个空的BucketLoggingStatus即可关闭Logging功能

```HTTP
PUT ?logging HTTP/1.1
Host: <BUCKET_NAME>.s3.<REGION>.jdcloud-oss.com
Content-Length: 45
x-amz-date: Thu, 12 Apr 2012 20:04:21 GMT
Authorization: authorization string

<BucketLoggingStatus>
</BucketLoggingStatus>
```
### 响应示例
```HTTP
HTTP/1.1 200 OK
x-amz-request-id: 8C24D08OC7H8FG6B
Date: Wed, 14 May 2014 02:11:22 GMT
Content-Length: 0
Server: JDCloudOSS
```






