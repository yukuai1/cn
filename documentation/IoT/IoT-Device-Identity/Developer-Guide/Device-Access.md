# 厂商设备接入

本节介绍如何使用设备身份认证SDK。

前序条件：
- 下载购买的license和对应的PSK（下载地址：https://deviceidentity-console.jdcloud.com/list ，位置如图）  。
![管理设备](../../../../image/IoT/IoT-Device-Identity/License-Manage.png)
- 将其烧录到安全芯片中，集成烧录请联系smartcloud@jd.com，我们将提供专业团队进行技术支持。  

SDK使用方法：  
使用本SDK时，必须先调用init函数进行初始化，之后可以调用get_client_authcode函数生成相应的client_authcode，将client_authcode传给认证服务器后即可实现认证服务器对设备端的认证。
如果认证服务器认证设备成功，将回传server_authcode，用于设备验证认证服务器的身份。将server_authcode传给validate_server_authcode函数即可验证认证服务器身份。
注意：  
1. init函数必须先于所有其他SDK函数调用。
2. 每次生成的client_authcode和认证服务器回传的server_authcode是成对出现的，即函数的调用顺序必须是先get_client_authcode再validate_server_authcode。未按照顺序调用会导致认证失败。
3. 需要保存在init函数中传出的license，后续调用其他函数，均需要此参数。

SDK使用示例：[示例代码](../Related-Resources/testdemo.rar)  
具体如下：
```C++
int main(int argc, char *argv)
{
    uint8_t license[32] = {0};
    uint8_t proto_ver = 1;
    uint8_t suite_id = 1;
    server_authcode_t server_authcode;
    RET_T ret = RET_OK;

    //调用初始化函数，设置proto_ver、suite_id。获取保存在芯片中的license信息。
    ret = init(license, proto_ver, suite_id);
    if (ret != RET_OK)
    {
        printf(" init is failed , ret is %d\n", ret);
        goto EXIT;
    }

    //测试获取client_auth_code
    int len = 0;
    client_authcode_t client_authcode;
    ret = get_client_authcode(license, &client_authcode, &len);
    if (ret != RET_OK)
    {
        printf("get_client_authcode is failed! ret is %d\n", ret);
    }

    //TODO:将认证服务器回传的server_authcode信息赋值给本函数中的server_authcode变量

    //开始验证server_authcode
    ret = validate_server_authcode(license, server_authcode, LICENSE_ID_SRV_AUTHCODE_LEN);
    if (ret != RET_OK)
    {
        printf("validate_server_authcode is failed! ret is %d\n", ret);
        goto EXIT;
    }
    else
    {
        printf("校验正确\n");
    }
EXIT:
    return 0;
}
```
本示例代码采用scons进行编译，针对的是linux平台的评估版。执行示例代码需要首先连接安全芯片到linux系统中，步骤如下：
1. 需要进入root用户。
2. 使用chmod 777 /dev/sdb给安全芯片加执行权限（/dev/sdb只是示例名称，以实际安全芯片在系统中的名称为准）。
3. 标识动态库文件目录，建议使用export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/~/testdemo/:. 命令。
4. 调用./mytest执行示例程序。

需要其他平台的sdk的请邮件联系smartcloud@jd.com，并附上平台信息及对应的交叉编译链。


