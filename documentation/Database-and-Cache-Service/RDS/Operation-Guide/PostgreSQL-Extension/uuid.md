# UUID生成器（UUID-OSSP）

## 使用说明

本文介绍如何使用UUID-OSSP插件生成UUID。

## UUID-OSSP简介

UUID-OSSP用来生成通用唯一识别码（UUID）， 它支持几种UUID产生的标准算法。同时它还提供了一些函数用来产生某些特定的UUID常量。

UUID由32个16进制数字组成，标准格式为`一组8位字符 + 一组4位字符 + 一组4位字符 + 一组4位字符 + 一组12位字符`，每组字符由短划线（-）连接，示例如下：

```
a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11
```

UUID还支持以下格式：

*  大写字母

```
A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11
```

* 大括号包裹标准格式

```
{a0eebc99-9c0b-4ef8-bb6d-6bb9bd380a11}
```

* 省略部分或所有短划线（-）

```
a0eebc999c0b4ef8bb6d6bb9bd380a11
```

* 在任意一组四位数字之后加入一个短划线（-）

```
a0ee-bc99-9c0b-4ef8-bb6d-6bb9-bd38-0a11
```

## 插件开启和关闭

*  开启UUID-OSSP

```
CREATE EXTENSION "uuid-ossp";
```

* 关闭UUID-OSSP

```
DROP EXTENSION "uuid-ossp";
```

**说明** 请使用高权限账号安装此插件。

## 插件函数说明

*  返回UUID的函数

| 函数                                        | 返回UUID的函数                                               |
| ------------------------------------------- | ------------------------------------------------------------ |
| uuid_generate_v1()                          | 此函数会生成v1版本的UUID。算法使用了计算机的MAC地址和时间戳。*说明*此函数会生成v1版本的UUID。算法使用了计算机的MAC地址和时间戳。 |
| uuid_generate_v1mc()                        | 此函数会生成一个v1版本的UUID。和`uuid_generate_v1()`的区别在于`uuid_generate_v1mc()`使用的是一个随机多播MAC地址，`uuid_generate_v1()`使用的是计算机的真实的MAC地址。 |
| uuid_generate_v3(namespace uuid, name text) | 此函数会生成一个v3版本的UUID。这个函数会使用指定输入名称`name`在指定的命名空间`namespace`中生成。  指定的命名空间是调用下表中的函数`uuid_ns_*()`返回的常量。 参数`name`是一个指定命名空间`namespace`中的标识符。 |
| uuid_generate_v4()                          | 此函数会生成一个v4版本的UUID。算法完全依靠随机数。           |
| uuid_generate_v5(namespace uuid, name text) | 此函数会生成一个v5版本的UUID。工作过程类似于v3版本的UUID，但是v5版本使用的是SHA-1的哈希算法，因为SHA-1算法被认为比MD5算法更安全，建议尽量使用v5版本。 |

* 返回UUID常量的函数

| 函数           | 返回UUID的函数                                               |
| -------------- | ------------------------------------------------------------ |
| uuid_nil()     | 代表nil的UUID常量，此处不应该看作一个真正的UUID。            |
| uuid_ns_dns()  | 代表DNS命令空间的UUID常量。                                  |
| uuid_ns_url()  | 代表URL命名空间的UUID常量。                                  |
| uuid_ns_oid()  | 代表ISO对象标识符（OID）命名空间的UUID常量。*说明*代表ISO对象标识符（OID）命名空间的UUID常量。 |
| uuid_ns_x500() | 代表X.500识别名字（DN）命名空间的UUID常量。                  |

## 示例

* 生成一个V1版本的UUID。

```
SELECT uuid_generate_v1();
```

返回信息如下：

```
           uuid_generate_v1
--------------------------------------
 a6808efc-13c8-11ed-ad4f-00163e010e52
(1 row)
```

* 生成一个V3版本的UUID。

```
SELECT uuid_generate_v3(uuid_ns_url(), 'example.com');
```

返回信息如下：

```
           uuid_generate_v3
--------------------------------------
 a0473a67-27a1-3c05-a2d1-5c134639347f
(1 row)
```

* 生成一个V4版本的UUID。

```
SELECT uuid_generate_v4();
```

返回信息如下：

```
           uuid_generate_v4
--------------------------------------
 170d0eb6-520a-4f93-a1b3-89458fffb54c
(1 row)
```

* 生成一个V5版本的UUID

```
SELECT uuid_generate_v5(uuid_ns_url(), 'example.com');
```

返回信息如下：

```
           uuid_generate_v5
--------------------------------------
 a5cf6e8e-4cfa-5f31-a804-6de6d1245e26
(1 row)
```

## 参考文档

- [OSSP官网](http://www.ossp.org/pkg/lib/uuid/)
- [PostgreSQL官网](https://www.postgresql.org/docs/current/uuid-ossp.html?spm=a2c4g.11186623.0.0.1f5d17b3Fy9BkV)

