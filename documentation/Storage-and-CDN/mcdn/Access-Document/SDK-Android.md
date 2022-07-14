# MCDN SDK Android版手册

### 一、概述

MCDN SDK内部包含精简的HTTP Server，初始化时会在本地开启HTTP服务。在播放前，开发者需要调用SDK提供的接口重写播放地址，将播放器的请求转向到本地HTTP Server。SDK内部会进行回源策略的调整，在保证播放流畅度的同时尽可能降低开发者的带宽成本。

### 二、系统和设备要求

目前只支持安卓64位机型

### 三、Android SDK集成步骤

**1、工程示例**

在工程中，创建libs文件夹，将所需的AAR开发包拷贝到文件中。

![拷贝AAR开发包](https://github.com/jdcloudcom/cn/blob/mcdn-0708/image/MCDN/拷贝AAR开发包.png)

并在工程配置的build.gradle中设置引用库的路径。

![设置引用路径](https://github.com/jdcloudcom/cn/blob/mcdn-0708/image/MCDN/设置引用路径.png)

引用库时在文件头添加 import com.jdcloud.mcdnsdk.McdnManager；

**2、配置AndroidMainfest.xml**

<uses-permission android:name="android.permission.INTERNET" />

**3、接口说明**

<table><tr><td>函数名</td><td>参数</td><td>返回值</td><td>功能描述</td></tr><tr><td>Init</td><td>String (申请的app id)
  
String (申请的app key)</td><td>int (0成功，其他失败)</td><td>初始化SDK，启动本地HTTP服务，应在应用启动时调用</td></tr><tr><td>McdnGenerateUrl</td><td>String (原始播放地址)</td><td>String (重定向的播放地址)</td><td>重写视频请求地址</td></tr><tr><td>GetSourceInfo</td><td>String (原始播放地址)</td><td>String (单源多源流量统计字符串json格式)</td><td>统计字符串(json)</td></tr><tr><td>Release</td><td>无</td><td>无</td><td>停止HTTP服务，释放SDK占用的资源</td></tr></table>

**4、SDK使用示例**

**启动MCDN服务**

```
private final static String app_id = "10000";
private final static String app_key = "jk%l4$342j@n";
public class MyApplication extends android.app.Application {
    @Override
    public void onCreate() {
            super.onCreate();
            McdnManager.getInstance().Init(app_id ，app_key);
    }
}
```

**生成MCDN服务地址**

```
private void onPlay(String url){
      String rewriteUrl = McdnManager.getInstance().McdnGenerateUrl (url);
      mediaPlayer.play(rewriteUrl );
}
```

**获取下载信息**

```
Timer timer = new Timer();
timer.schedule(new TimerTask() {
	@Override
	public void run() {
	 String statitics = McdnManager.getInstance().GetSourceInfo(url);
	 Log.d(TAG, "statitics : " + statitics);
	 }
}, 0, 1000);
```

**停止MCDN服务**

```
public class MyApplication extends android.app.Application {
    @Override
    public void onDestory() {
            McdnManager.getInstance().Release();
    }
}
```
