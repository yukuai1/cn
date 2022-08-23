# MCDN SDK iOS版手册

### 一、概述

MCDN SDK内部包含精简的HTTP Server，初始化时会在本地开启HTTP服务。在播放前，开发者需要调用SDK提供的接口重写播放地址，将播放器的请求代理到本地HTTP Server。SDK内部会进行回源策略的调整，在保证播放流畅度的同时尽可能提升下载速度，保证下载质量，降低带宽成本。
支持小时流量计费和日峰值带宽计费两种模式，默认采用小时流量计费。

### 二、系统和设备要求

- iOS 11.0+

- 机型只支持iPhone6及以上

### 三、iOS SDK集成步骤

**1、下载预编译好的Framework静态库JDMcdnSdk.framework**

**2、拷贝 framework**

若用户app已引入的第三方库不包含openssl的静态库libssl.a、libcrypto.a和libevent的静态库libevent.a，则推荐对接合并版SDK，合并版会默认打包上述依赖的3个静态库，具体对接步骤如下：

将合并版SDK对应的JDMcdnSdk.framework拖入General -> Frameworks, Libraries, and Embedded Content并添加系统动态库libc++.tbd，如下图所示：

![合并版SDK操作步骤](https://github.com/jdcloudcom/cn/blob/mcdn-0708/image/MCDN/合并版SDK.png)


若用户app已引入的第三方库已包含openssl的静态库libssl.a、libcrypto.a和libevent的静态库libevent.a，则推荐对接拆分版SDK，拆分版默认不打包上述依赖的3个静态库，具体对接步骤如下：

将拆分版SDK对应的JDMcdnSdk.framework拖入General -> Frameworks, Libraries, and Embedded Content并添加系统动态库libc++.tbd，同时用户添加app已有的openssl静态库和libevent静态库依赖，如下图所示：

![拆分版SDK操作步骤](https://github.com/jdcloudcom/cn/blob/mcdn-0708/image/MCDN/拆分版SDK.jpg)

**3、引入 JDMcdnSdk**

在工程的AppDelegate.m文件导入头文件：

#import <JDMcdnSdk/JDMcdnSdk.h>

**4、初始化 JDMcdnSdk，启动MCDN服务**

在工程AppDelegate.m文件的application:didFinishLaunchingWithOptions:方法中初始化：

```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSString *app_id = YOUR_APPID;
    NSString *app_key = YOUR_APPKEY;
    [[JDMcdnSdk sharedInstance] initWithAppId:app_id AppKey:app_key];
    return YES;
}
```

其中 YOUR_APPID和YOUR_APPKEY是用于标识用户的字符串，请换成自己的appId和appKey，请提前注册Appid并获取APPKey。

**5、转换地址**

在代码中实例化AVPlayer之后（也可以是其他任何视频播放器），先将originalUrlString传给JDMcdnSdk，之后将生成的MCDN服务地址传给播放器：
```
 NSString *originalUrlString = @"https://your_stream.mp4";
 NSString *generateUrlString = [[JDMcdnSdk sharedInstance]mcdnGenerateUrl:originalUrlString];
_player = [[AVPlayer alloc] initWithURL:[NSURL URLWithString:generateUrlString]];
```

**6、获取下载信息**
完成以上步骤后，可定时调用[[JDMcdnSdk sharedInstance] getSourceInfo:originalUrlString]方法获取下载信息。

**7、停止MCDN服务**
在app退出的时候可调用[[JDMcdnSdk sharedInstance] sdkRelease]方法停止MCDN服务，销毁资源。


### 四、接口说明


<table><tr><td>函数名</td><td>参数</td><td>返回值</td><td>功能描述</td></tr><tr><td>initWithAppId</td><td>String (申请的app id)
  
String (申请的app key)</td><td>int (0成功，其他失败)</td><td>初始化SDK，启动本地HTTP服务，在应用启动时调用</td></tr><tr><td>mcdnGenerateUrl</td><td>String (原始播放地址)</td><td>String (重定向的播放地址)</td><td>重写视频请求地址</td></tr><tr><td>getSourceInfo</td><td>String (原始播放地址)</td><td>String (单源多源流量统计字符串json格式)</td><td>统计字符串(json)</td></tr><tr><td>sdkRelease</td><td>无</td><td>无</td><td>停止HTTP服务，释放SDK占用的资源，在应用退出时调用</td></tr></table>
