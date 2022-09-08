# 性能测试指南

 本文以On Time和Star Schema数据集为例，介绍如何将测试数据集导入分析型云数据库ClickHouse并完成性能测试。

## 前提条件

已完成快速入门的如下步骤：

* 已创建分析型云数据库ClickHouse集群，[新建实例](https://docs.jdcloud.com/cn/jchdb/create-instance1)

* 已创建数据库账号，参考[创建账号](https://docs.jdcloud.com/cn/jchdb/create-account1)

* 已准备一台Linux系统的机器，并将Linux机器的IP地址添加到云数据库ClickHouse集群的白名单中，参考[设置白名单](https://docs.jdcloud.com/cn/jchdb/setwhitelist) 

* 已安装与分析型云数据库ClickHouse集群版本对应的clickhouse-client工具，参考[连接实例](https://docs.jdcloud.com/cn/jchdb/Connect-Instance1) 

## 测试说明

本测试中的所有clickhouse-client命令均在clickhouse-client客户端的安装目录下执行。

本测试中使用的On Time和Star Schema数据集均引用自ClickHouse开源网站。更多信息，请参见。[示例数据集](https://clickhouse.com/docs/en/getting-started/example-datasets/?spm=a2c4g.11186623.0.0.6bd41d84tEEahP) 

## On Time数据集测试
### 1. 连接集群
在Linux环境中使用clickhouse-client工具连接分析型云数据库ClickHouse集群。

```
./clickhouse-client --host=<数据库连接地址> --port=<TCP端口号> --user=<数据库账号> --password=<数据库账号的密码>
```

### 2. 建表
请根据分析型云数据库ClickHouse集群的规格下载正确的建表语句脚本并执行。

* [单副本集群的建表语句](../../../../../image/JCHDB/ontime_one_replicate.sql)

* [双副本集群的建表语句](../../../../../image/JCHDB/ontime_two_replicate.sql)

### 3.下载On Time数据

**说明** 

On Time数据集覆盖的时间区间非常大，下载数据时间较长，同时数据下载过程中会遇到一部分数据已丢失的错误。

```
echo https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_{1987..2021}_{1..12}.zip | xargs -P10 wget --no-check-certificate --continue
```

### 4. 导入数据至云数据库ClickHouse

请根据如下Shell命令，正确配置ck_url、ck_user、ck_pass和ck_port环境变量，再进行数据导入。

```
export ck_url=<数据库连接地址>
export ck_user=<数据库账号> 
export ck_pass=<数据库账号的密码>
export ck_port=<TCP端口号> 
for i in *.zip; do echo $i; unzip -cq $i '*.csv' | sed 's/\.00//g' | ./clickhouse-client -h $ck_url -u $ck_user --password $ck_pass --port $ck_port --query="INSERT INTO ontime FORMAT CSVWithNames"; done
```

### 5. 测试集

**说明** 

测试集引用自ClickHouse开源网站。更多信息，请参见[On Time数据集](https://clickhouse.com/docs/en/getting-started/example-datasets/ontime/)。

Q0

```
SELECT avg(c1)
FROM
(
    SELECT Year, Month, count(*) AS c1
    FROM ontime
    GROUP BY Year, Month
);
```

Q1

```
SELECT DayOfWeek, count(*) AS c
FROM ontime
WHERE Year>=2000 AND Year<=2008
GROUP BY DayOfWeek
ORDER BY c DESC;
```

Q2

```
SELECT DayOfWeek, count(*) AS c
FROM ontime
WHERE DepDelay>10 AND Year>=2000 AND Year<=2008
GROUP BY DayOfWeek
ORDER BY c DESC;
```

Q3

```
SELECT Origin, count(*) AS c
FROM ontime
WHERE DepDelay>10 AND Year>=2000 AND Year<=2008
GROUP BY Origin
ORDER BY c DESC
LIMIT 10;
```

Q4

```
SELECT Carrier, count(*)
FROM ontime
WHERE DepDelay>10 AND Year=2007
GROUP BY Carrier
ORDER BY count(*) DESC;
```

Q5

```
set joined_subquery_requires_alias=0;
set any_join_distinct_right_table_keys=1;
SELECT Carrier, c, c2, c*100/c2 as c3
FROM
(
   SELECT
       Carrier,
       count(*) AS c
   FROM ontime
   WHERE DepDelay>10
       AND Year=2007
   GROUP BY Carrier
)
ANY INNER JOIN
(
   SELECT
       Carrier,
       count(*) AS c2
   FROM ontime
   WHERE Year=2007
   GROUP BY Carrier
) USING Carrier
ORDER BY c3 DESC;
```

Q6

```
set joined_subquery_requires_alias=0;
SELECT Carrier, c, c2, c*100/c2 as c3
FROM
(
   SELECT
       Carrier,
       count(*) AS c
   FROM ontime
   WHERE DepDelay>10
       AND Year>=2000 AND Year<=2008
   GROUP BY Carrier
)
ANY INNER JOIN
(
   SELECT
       Carrier,
       count(*) AS c2
   FROM ontime
   WHERE Year>=2000 AND Year<=2008
   GROUP BY Carrier
) USING Carrier
ORDER BY c3 DESC;
```

Q7

```
set joined_subquery_requires_alias=0;
SELECT Year, c1/c2
FROM
(
   select
       Year,
       count(*)*100 as c1
   from ontime
   WHERE DepDelay>10
   GROUP BY Year
)
ANY INNER JOIN
(
   select
       Year,
       count(*) as c2
   from ontime
   GROUP BY Year
) USING (Year)
ORDER BY Year;
```

Q8

```
SELECT DestCityName, uniqExact(OriginCityName) AS u
FROM ontime
WHERE Year>=2000 and Year<=2010
GROUP BY DestCityName
ORDER BY u DESC
LIMIT 10;
```

Q9

```
SELECT Year, count(*) AS c1
FROM ontime
GROUP BY Year;
```

Q10

```
SELECT
  min(Year), max(Year), Carrier, count(*) AS cnt,
  sum(ArrDelayMinutes>30) AS flights_delayed,
  round(sum(ArrDelayMinutes>30)/count(*),2) AS rate
FROM ontime
WHERE
  DayOfWeek NOT IN (6,7) AND OriginState NOT IN ('AK', 'HI', 'PR', 'VI')
  AND DestState NOT IN ('AK', 'HI', 'PR', 'VI')
  AND FlightDate < '2010-01-01'
GROUP by Carrier
HAVING cnt>100000 and max(Year)>1990
ORDER by rate DESC
LIMIT 1000;
```

## Star Schema数据集测试

### 1.连接集群

在Linux环境中使用clickhouse-client工具连接云数据库ClickHouse集群。

```
./clickhouse-client --host=<数据库连接地址> --port=<TCP端口号> --user=<数据库账号> --password=<数据库账号的密码>
```

### 2. 建表

请根据分析型云数据库ClickHouse集群的规格下载正确的建表语句脚本并执行。

* [单副本集群的建表语句](../../../../image/JCHDB/starschema_one_replicate.sql)
* [双副本集群的建表语句](../../../../image/JCHDB/starschema_two_replicate.sql)

### 3. 生成数据文件

请根据如下Shell命令，首先克隆数据生成项目ssb-dbgen，然后通过make编译，用命令生成数据文件customer.tbl、lineorder.tbl、part.tbl和supplier.tbl。

**说明** 

示例中`-s 100`参数会产生大概6亿行的数据（67 GB），您可以根据情况适当调整测试数据量。

```
git clone https://github.com/vadimtk/ssb-dbgen.git
cd ssb-dbgen
make
./dbgen -s 100 -T c
./dbgen -s 100 -T l
./dbgen -s 100 -T p
./dbgen -s 100 -T s
```

### 4. 导入数据至云数据库ClickHouse

请根据如下Shell命令，正确配置ck_url、ck_user、ck_pass和ck_port环境变量，再进行数据导入。

```
export ck_url=<数据库连接地址>
export ck_user=<数据库账号>
export ck_pass=<数据库账号的密码>
export ck_port=<TCP端口号> 
./clickhouse-client -h <数据库连接地址> -u <数据库账号> --password <数据库账号的密码> --port <TCP端口号> --query "INSERT INTO customer FORMAT CSV" < ssb-dbgen/customer.tbl
./clickhouse-client -h <数据库连接地址> -u <数据库账号> --password <数据库账号的密码> --port <TCP端口号> --query "INSERT INTO part FORMAT CSV" < ssb-dbgen/part.tbl
./clickhouse-client -h <数据库连接地址> -u <数据库账号> --password <数据库账号的密码> --port <TCP端口号> --query "INSERT INTO supplier FORMAT CSV" < ssb-dbgen/supplier.tbl
./clickhouse-client -h <数据库连接地址> -u <数据库账号> --password <数据库账号的密码> --port <TCP端口号> --query "INSERT INTO lineorder FORMAT CSV" < ssb-dbgen/lineorder.tbl
```

### 5. 测试集

**说明** 

测试集引用自ClickHouse开源网站。更多信息，请参见[Star Schema数据集](https://clickhouse.com/docs/en/getting-started/example-datasets/star-schema/)。

Q0

```
INSERT INTO lineorder_flat
SELECT
    l.LO_ORDERKEY AS LO_ORDERKEY,
    l.LO_LINENUMBER AS LO_LINENUMBER,
    l.LO_CUSTKEY AS LO_CUSTKEY,
    l.LO_PARTKEY AS LO_PARTKEY,
    l.LO_SUPPKEY AS LO_SUPPKEY,
    l.LO_ORDERDATE AS LO_ORDERDATE,
    l.LO_ORDERPRIORITY AS LO_ORDERPRIORITY,
    l.LO_SHIPPRIORITY AS LO_SHIPPRIORITY,
    l.LO_QUANTITY AS LO_QUANTITY,
    l.LO_EXTENDEDPRICE AS LO_EXTENDEDPRICE,
    l.LO_ORDTOTALPRICE AS LO_ORDTOTALPRICE,
    l.LO_DISCOUNT AS LO_DISCOUNT,
    l.LO_REVENUE AS LO_REVENUE,
    l.LO_SUPPLYCOST AS LO_SUPPLYCOST,
    l.LO_TAX AS LO_TAX,
    l.LO_COMMITDATE AS LO_COMMITDATE,
    l.LO_SHIPMODE AS LO_SHIPMODE,
    c.C_NAME AS C_NAME,
    c.C_ADDRESS AS C_ADDRESS,
    c.C_CITY AS C_CITY,
    c.C_NATION AS C_NATION,
    c.C_REGION AS C_REGION,
    c.C_PHONE AS C_PHONE,
    c.C_MKTSEGMENT AS C_MKTSEGMENT,
    s.S_NAME AS S_NAME,
    s.S_ADDRESS AS S_ADDRESS,
    s.S_CITY AS S_CITY,
    s.S_NATION AS S_NATION,
    s.S_REGION AS S_REGION,
    s.S_PHONE AS S_PHONE,
    p.P_NAME AS P_NAME,
    p.P_MFGR AS P_MFGR,
    p.P_CATEGORY AS P_CATEGORY,
    p.P_BRAND AS P_BRAND,
    p.P_COLOR AS P_COLOR,
    p.P_TYPE AS P_TYPE,
    p.P_SIZE AS P_SIZE,
    p.P_CONTAINER AS P_CONTAINER
FROM lineorder AS l
INNER JOIN customer AS c ON c.C_CUSTKEY = l.LO_CUSTKEY
INNER JOIN supplier AS s ON s.S_SUPPKEY = l.LO_SUPPKEY
INNER JOIN part AS p ON p.P_PARTKEY = l.LO_PARTKEY;
```

Q1

```
SELECT sum(LO_EXTENDEDPRICE * LO_DISCOUNT) AS revenue
FROM lineorder_flat
WHERE toYear(LO_ORDERDATE) = 1993 AND LO_DISCOUNT BETWEEN 1 AND 3 AND LO_QUANTITY < 25;
```

Q2

```
SELECT sum(LO_EXTENDEDPRICE * LO_DISCOUNT) AS revenue
FROM lineorder_flat
WHERE toYYYYMM(LO_ORDERDATE) = 199401 AND LO_DISCOUNT BETWEEN 4 AND 6 AND LO_QUANTITY BETWEEN 26 AND 35;
```

Q3

```
SELECT sum(LO_EXTENDEDPRICE * LO_DISCOUNT) AS revenue
FROM lineorder_flat
WHERE toISOWeek(LO_ORDERDATE) = 6 AND toYear(LO_ORDERDATE) = 1994 
  AND LO_DISCOUNT BETWEEN 5 AND 7 AND LO_QUANTITY BETWEEN 26 AND 35;
```

Q4

```
SELECT
    sum(LO_REVENUE),
    toYear(LO_ORDERDATE) AS year,
    P_BRAND
FROM lineorder_flat
WHERE P_CATEGORY = 'MFGR#12' AND S_REGION = 'AMERICA'
GROUP BY
    year,
    P_BRAND
ORDER BY
    year,
    P_BRAND;
```

Q5

```
SELECT
    sum(LO_REVENUE),
    toYear(LO_ORDERDATE) AS year,
    P_BRAND
FROM lineorder_flat
WHERE P_BRAND >= 'MFGR#2221' AND P_BRAND <= 'MFGR#2228' AND S_REGION = 'ASIA'
GROUP BY
    year,
    P_BRAND
ORDER BY
    year,
    P_BRAND;
```

Q6

```
SELECT
    sum(LO_REVENUE),
    toYear(LO_ORDERDATE) AS year,
    P_BRAND
FROM lineorder_flat
WHERE P_BRAND = 'MFGR#2239' AND S_REGION = 'EUROPE'
GROUP BY
    year,
    P_BRAND
ORDER BY
    year,
    P_BRAND;
```

Q7

```
SELECT
    C_NATION,
    S_NATION,
    toYear(LO_ORDERDATE) AS year,
    sum(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE C_REGION = 'ASIA' AND S_REGION = 'ASIA' AND year >= 1992 AND year <= 1997
GROUP BY
    C_NATION,
    S_NATION,
    year
ORDER BY
    year ASC,
    revenue DESC;
```

Q8

```
SELECT
    C_CITY,
    S_CITY,
    toYear(LO_ORDERDATE) AS year,
    sum(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE C_NATION = 'UNITED STATES' AND S_NATION = 'UNITED STATES' AND year >= 1992 AND year <= 1997
GROUP BY
    C_CITY,
    S_CITY,
    year
ORDER BY
    year ASC,
    revenue DESC;
```

Q9

```
SELECT
    C_CITY,
    S_CITY,
    toYear(LO_ORDERDATE) AS year,
    sum(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE (C_CITY = 'UNITED KI1' OR C_CITY = 'UNITED KI5') AND (S_CITY = 'UNITED KI1' OR S_CITY = 'UNITED KI5') AND year >= 1992 AND year <= 1997
GROUP BY
    C_CITY,
    S_CITY,
    year
ORDER BY
    year ASC,
    revenue DESC;
```

Q10

```
SELECT
    C_CITY,
    S_CITY,
    toYear(LO_ORDERDATE) AS year,
    sum(LO_REVENUE) AS revenue
FROM lineorder_flat
WHERE (C_CITY = 'UNITED KI1' OR C_CITY = 'UNITED KI5') AND (S_CITY = 'UNITED KI1' OR S_CITY = 'UNITED KI5') AND toYYYYMM(LO_ORDERDATE) = 199712
GROUP BY
    C_CITY,
    S_CITY,
    year
ORDER BY
    year ASC,
    revenue DESC;
```

Q11

```
SELECT
    toYear(LO_ORDERDATE) AS year,
    C_NATION,
    sum(LO_REVENUE - LO_SUPPLYCOST) AS profit
FROM lineorder_flat
WHERE C_REGION = 'AMERICA' AND S_REGION = 'AMERICA' AND (P_MFGR = 'MFGR#1' OR P_MFGR = 'MFGR#2')
GROUP BY
    year,
    C_NATION
ORDER BY
    year ASC,
    C_NATION ASC;
```

Q12

```
SELECT
    toYear(LO_ORDERDATE) AS year,
    S_NATION,
    P_CATEGORY,
    sum(LO_REVENUE - LO_SUPPLYCOST) AS profit
FROM lineorder_flat
WHERE C_REGION = 'AMERICA' AND S_REGION = 'AMERICA' AND (year = 1997 OR year = 1998) AND (P_MFGR = 'MFGR#1' OR P_MFGR = 'MFGR#2')
GROUP BY
    year,
    S_NATION,
    P_CATEGORY
ORDER BY
    year ASC,
    S_NATION ASC,
    P_CATEGORY ASC;
```

Q13

```
SELECT
    toYear(LO_ORDERDATE) AS year,
    S_CITY,
    P_BRAND,
    sum(LO_REVENUE - LO_SUPPLYCOST) AS profit
FROM lineorder_flat
WHERE S_NATION = 'UNITED STATES' AND (year = 1997 OR year = 1998) AND P_CATEGORY = 'MFGR#14'
GROUP BY
    year,
    S_CITY,
    P_BRAND
ORDER BY
    year ASC,
    S_CITY ASC,
    P_BRAND ASC;
```

