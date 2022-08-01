# **什么情况下需要进行域名归属校验？**

1. 域名首次接入时，例如：a.example.com；该域名接入后，同级域名及次级域名如 b.example.com 视为已有权限域名，默认可接入，无需校验。但上级域名如 example.com 接入仍需校验。

2. 子域名已在其他账号下接入时，需进行域名归属校验验证当前域名归属权，如验证通过，可通过取回域名接入当前账号。

3. 同级泛域名接入时，需校验，例如：a.example.com 已接入，\*.example.com接入时仍需校验，*.a.example.com 属于次级泛域名，可免校验接入。

# **方法一：DNS解析验证**

1. 在添加域名时，如果该域名需校验，在域名下方会提示需验证域名归属权。

2. 验证方法中，默认为 DNS 解析验证。

   使用 DNS 解析验证的方式，需要您前往该域名的解析服务商，在主域名下添加一个主机记录值为 _cdnautover 的 TXT 记录。

   `注意`

   无论您需要新增的域名为 c.b.a.example.com、\*.example.com 或 test.example.com，多级域名下主机记录值仍应添加在主域名下，例如：添加的域名是 c.b.a.example.com，需要新增一条解析记录为 _cdnautover.example.com即可。

   ![DNS解析验证](https://github.com/jdcloudcom/cn/blob/cdn_20220222_api/image/CDN/DNS解析验证.png)

   # **DNS 解析添加方法参考：**

   如果您的解析服务商在京东云 DNSPod 上，可进入[DNS解析控制台](https://www.jdcloud.com/cn/products/jd-cloud-dns)，找到该域名并单击解析，添加一条记录类型为 TXT 的 DNS 记录，主机记录填写为_cdnautover，记录类型选择为 TXT，记录值填写为京东云 CDN 提供的记录值，其余选项按照默认参数填写即可。可参考:[DNS解析操作说明](https://docs.jdcloud.com/cn/jd-cloud-dns/domain-record-add)。

3. 添加完解析记录后，等待 TXT 记录值生效，生效后，您可点击下方的验证按钮，即可完成域名归属校验；如果验证失败，请确认当前 TXT 记录值在域名解析服务商内是否已生效或是否填写了正确的 TXT 记录值。

# **方法二：文件验证**

1.	在添加域名时，如果该域名需校验，在域名下方会提示需验证域名归属权；

2.	在验证方法内，选择文件验证的方式；

![文件验证](https://github.com/jdcloudcom/cn/blob/cdn_20220222_api/image/CDN/文件验证.png)

3.	单击下载文件 verification.html；

4.	将该文件上传至您主域名的服务器（例如您的 CVM、COS、阿里 ECS、阿里 OSS 等）根目录下，例如：当前添加的域名为 test.example.com，您需要将该文件上传至 example.com 的根目录下；

5.	确保可通过 http://example.com/verification.html 访问至该文件后，即可单击验证按钮进行验证。如果文件内的记录值与我们提供的记录值是一致的，即可验证通过；如果验证失败，请确保上述文件链接可访问，并且您上传的文件为正确文件，可通过访问文件的链接与所下载的文件进行比对是否一致。

