# 厂商服务器对接京东云服务
本节介绍厂商服务器调用京东云设备身份认证服务的具体步骤。

厂商服务器通过京东云OpenAPI，调用京东云身份认证服务校验设备身份。京东云OpenAPI使用方法请参见[各语言SDK和demo](https://docs.jdcloud.com/cn/common-declaration/api/introduction )。  

本节提供服务调用的Java语言的调用示例：[示例代码](../Related-Resources/user-service.zip)  
示例中已将调用方法进行封装，具体类为：JdOpenApiUtil。示范代码如下：

```Java
/**
 *      京东云设备接入依赖
 * 		<dependency>
 * 			<groupId>com.jdcloud.sdk</groupId>
 * 			<artifactId>deviceidentity</artifactId>
 * 			<version>1.0.0-SNAPSHOT</version>
 * 		</dependency>
 * 请求京东云设备身份认证服务工具类
 * @author 京东IOT
 * @date 2022/2/9 15:43
 */
public class JdOpenApiUtil {
    /**
     * 获取设备上报的字符串后，将字符串传入，调用该方法获取认证结果
     * @param deviceAuthData
     * @return
     */
    public static ResponseWrap<ServerAuthData> getAuthResult(String deviceAuthData) {
        //1. 设置accessKey和secretKey，申请地址：https://uc.jdcloud.com/accesskey/index
        String accessKey = "XXXXXXXXXXXXXXXXX";
        String secretKey = "XXXXXXXXXXXXXXXXX";
        CredentialsProvider credentialsProvider = new StaticCredentialsProvider(accessKey, secretKey);

        //2. 创建DeviceidentityClient
        DeviceidentityClient deviceidentityClient = DeviceidentityClient.builder()
                .credentialsProvider(credentialsProvider)
                .httpRequestConfig(new HttpRequestConfig.Builder().protocol(Protocol.HTTPS).build()) //默认为HTTPS
                .build();

        //3. 设置请求参数
        TidAuthenticateDto authenticateDto = new TidAuthenticateDto();
        authenticateDto.setVersion("1.0");
        authenticateDto.setClientAuthCode(deviceAuthData);
        authenticateDto.setRequestId(UUID.randomUUID().toString());
        authenticateDto.setTimeStamp(System.currentTimeMillis());

        DeviceAuthenticateRequest request = new DeviceAuthenticateRequest();
        request.setTidAuthenticate(authenticateDto);
        request.setRegionId("cn-north-1");

        //4. 执行请求
        DeviceAuthenticateResponse response = deviceidentityClient.deviceAuthenticate(request);

        //5. 处理响应，根据用户服务器情况组装返回结构
        ResponseWrap<ServerAuthData> responseWrap = new ResponseWrap<>();
        DeviceAuthenticateResult result = response.getResult();
        if (result == null || result.getData() == null) {
            responseWrap.setCode(500);
            responseWrap.setErrorMsg("认证服务返回为空");
            return responseWrap;
        }

        //code=200时，代表认证成功，其他为失败情况
        if (result.getCode() == 200) {
            ServerAuthData serverAuthData = new ServerAuthData();
            serverAuthData.setServerAuthCode(result.getData().getServerAuthCode());
            serverAuthData.setTokenPlaintext(result.getData().getTokenPlaintext());
            responseWrap.setData(serverAuthData);
        } else if (result.getCode() == 401) {
            responseWrap.setErrorMsg("tid认证失败");
        } else if (result.getCode() == 404) {
            responseWrap.setErrorMsg("tid不存在");
        } else if (result.getCode() == 10001) {
            responseWrap.setErrorMsg("tid已过期");
        } else if (result.getCode() == 10002) {
            responseWrap.setErrorMsg("设备签名错误");
        } else {
            responseWrap.setErrorMsg("未知错误");
        }
        return responseWrap;
    }
}
```