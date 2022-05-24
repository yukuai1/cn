

# 使用云解析服务添加域名解析

为了便于记忆，通常将域名解析到对应的 IP，通过域名来访问网站。您只需执行以下几个步骤便可成功添加解析。

## 步骤一：添加域名

1. 登录京东[云解析控制台](https://dns-console.jdcloud.com/list)，在”我的域名“列表中可以看到全部域名，如下图所示。

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/1.domain-name-list.jpg" alt="1.domain-name-list.jpg" style="width: 90%;" />

- 若您的域名为京东云注册，则默认添加到域名列表。
- 若您的域名为非京东云注册，您可以”添加域名“，在弹出的窗口中，将域名添加至域名解析列表中进行管理。此时页面会提示”请到域名注册商处修改为京东云解析的NS服务地址：freens1.jdgslb.com、freens2.jdgslb.com“。如下图所示。

注意：NS修改，由于域名服务商原因或localDNS缓存原因致使全网生效最长需要24-48小时，一般来讲，48小时内会成功解析到京东云NS服务。

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/2.add-domain-button.jpg" alt="2.add-domain-button.jpg" style="width: 60%;" />

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/3.add-domain.jpg" alt="3.add-domain.jpg" style="width: 70%;" />

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/4.ns-notification.jpg" alt="4.ns-notification.jpg" style="width: 95%;" />

当解析情况为”正常解析“时，您就可以使用京东云提供的云解析服务了。

## 步骤二：添加解析记录

1. 在域名所在行，点击”解析“按钮。

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/5.analysis-button.jpg" alt="5.analysis-button" style="width:90%;" />

2. 选择”添加解析“。

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/6.add-analysis.jpg" alt="6.add-analysis.jpg" style="width:90%;" />

添加解析时，根据实际需求配置”记录类型“，记录类型分类详见下表。

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/7.add-analysis-details.jpg" alt="7.add-analysis-details.jpg" style="width: 60%;" />

| 记录类型    | 使用目的                                                     |
| :---------- | :----------------------------------------------------------- |
| A 记录      | 将域名指向一个 IPv4 地址（外网地址）。                       |
| CNAME 记录  | 将域名指向另一个域名，再由另一个域名提供 IP 地址（外网地址）。 |
| JNAME记录   | 将域名指向另一个京东云托管的域名                             |
| MX 记录     | 设置邮箱，让邮箱能收到邮件。                                 |
| NS 记录     | 将子域名交给其他 DNS 服务商解析。                            |
| AAAA 记录   | 将域名指向一个 IPv6 地址。                                   |
| SRV 记录    | 用来标识某台服务器使用了某个服务，常见于微软系统的目录管理。 |
| TXT 记录    | 对域名进行标识和说明，绝大多数的 TXT 记录是用来做 SPF 记录（反垃圾邮件）。 |
| CAA记录     | CA证书办法机构授权校验                                       |
| 显性URL记录 | 将域名301重定向到另外一个地址                                |
| 隐性URL记录 | 将域名301重定向到另外一个地址，但是会隐藏真实目的地址        |

3. 添加一条域名解析A记录。

   以下示例为：配置`www.jdcup.com`的A记录为`116.196.110.143`

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/8.add-a-record.jpg" alt="8.add-a-record.jpg" style="width: 70%;" />

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/9.a-record.jpg" alt="9.a-record.jpg" style="width:95%;" />

配置成功后可以使用以下命令验证解析效果。

```shell
#linux系统使用dig命令
dig www.jdcup.com

#windows系统使用nslookup命令
nslookup www.jdcup.com
```

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/10.dig.jpg" alt="10.dig" style="width:80%;" />

<img src="https://img1.jcloudcs.com/cn/best-practice/DNS/11.nslookup.jpg" alt="11.nslookup" style="width:80%;" />
