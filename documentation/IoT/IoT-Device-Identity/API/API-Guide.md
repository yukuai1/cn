# API文档
## 设备端API
JDCloud 设备身份认证SDK封装了对底层安全芯片的操作细节，只需调用该接口进行相关操作，即可获取设备身份认证SDK提供的服务。本文将详细描述设备身份认证SDK中所涉及到的API函数定义及功能。

### 初始化
函数原型：RET_T init(uint8_t *license, uint8_t proto_ver, uint8_t suite_id);  
函数功能：根据输入的proto_ver 、suite_id对设备认证SDK进行初始化。  

**在执行本SDK其他函数前，必须通过执行本函数进行初始化。**

| 参数 | 参数类型 | 描述 |
| :--- | :--- | :--- |
| license | 输出参数 | 从芯片中读取到的license信息，license长度为32字节。需要用户提前开辟足够空间存储。后续使用本SDK所有函数均需提供此license，请用户自行保存。
| proto_ver | 输入参数 | 设置使用的身份认证协议版本。当前支持版本为1.
| suite_id | 输入参数| 设置使用的身份认证签名套件id.1：HMAC-SHA256
| return | 返回值 | 详细见响应码

### 获取设备端认证码
函数原型：RET_T get_client_authcode(uint8_t *license, client_authcode_t *authcode, int *buf_len);  
函数功能：根据init函数中输入的proto_ver 、suite_id生成设备端认证码。将此认证码传给认证服务器实现对设备端的认证。  

**如果传入的license不正确将导致函数执行失败。**

| 参数 | 参数类型 | 描述 |
| :--- | :--- | :--- |
| license | 输入参数 | init函数中读取到的license信息 |
| authcode | 输出参数 | 生成设备端认证码 |
| buf_len | 输出参数 | 设备端认证码的长度 |
| return | 返回值 | 详细见响应码 |

### 验证服务器认证码
函数原型：RET_T validate_server_authcode(uint8_t *license, const server_authcode_t authcode, int in_buf_len);  
函数功能：验证认证服务器回传的认证码，实现设备端对服务器的认证。  
如果认证正确，会从认证服务器认证码中解析出用于对称加密的密钥，用于后续加密通讯功能。  
**如果传入的license不正确将导致函数执行失败。**

| 参数 | 参数类型 | 描述 |
| :--- | :--- | :--- |
| license | 输入参数 | init函数中读取到的license信息 |
| authcode | 输入参数 | 认证服务器回传的认证码 |
| in_buf_len | 输入参数 | 认证服务器回传的认证码长度 |
| return | 返回值 | 详细见响应码 |

### 响应码
| 响应码 | 描述 | 
| :--- | :--- |
| 0 | 执行成功 | 
| -1 | 执行失败，通用错误 | 
| -2 | 验证server_authcode错误 | 
| -3 | rsa解密失败 | 
| -4 | rsa加密失败 | 
| -5 | 生成rsa密钥对失败 | 
| -6 | 参数错误 | 
| -7 | 参数长度错误 | 
| -8 | 连接芯片错误 | 
| -9 | 芯片读取错误 | 
| -10 | 在芯片上创建文件失败 | 
| -11 | 计算HMAC_SHA256失败 | 
| -12 | 传入的license错误 | 
| -13 | 未进行初始化 | 

## 认证服务器API
### deviceidentityClient.deviceAuthenticate
设备license认证接口，通过京东云OpenAPI 提供的SDK调用；
#### 请求参数
| 名称 | 类型 | 是否必选 | 示例值 | 描述 |
| :--- | :--- | :--- | :--- | :--- |
| regionId | String | 是 | 默认值：cn-north-1 | 实例区域 |
| tidAuthenticate | TidAuthenticateDto | 是 |  | 设备 license认证信息 |
#### TidAuthenticateDto
| 名称 | 类型 | 是否必选 | 示例值 | 描述 |
| :--- | :--- | :--- | :--- | :--- |
| clientAuthCode | String | 是 |  | 设备端生成的认证码 |
| timeStamp | Long | 是 |  | 请求时间戳 |
| version | String | 是 | 默认值：1.0 | 版本 |
| requestId | String | 是 |  | 请求traceId |
#### 返回数据
| 名称 | 类型 | 是否必选 | 描述 |
| :--- | :--- | :--- | :--- |
| code | Integer | 是 | 响应吗 |
| errorMsg | String | 是 | 错误信息提示 |
| data | ServerAuthCodeDTO | 是 | 返回数据 |
#### ServerAuthCodeDTO
| 名称 | 类型 | 是否必选 | 描述 |
| :--- | :--- | :--- | :--- |
| serverAuthCode | String | 是 | 服务端生成的认证码响应数据，设备会认证云端返回值 |
| tokenPlaintext | String | 是 | 连接会话加密秘钥token，共设备与用户应用服务器通信数据token加密谁用 |
#### 响应码
| 响应码 | 描述 | 
| :--- | :--- |
| 200 | 认证成功 | 
| 401 | tid认证失败 | 
| 404 | license不存在 | 
| 10001 | license已过期 | 
| 10002 | 设备认证码验签错误 | 








