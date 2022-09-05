CREATE TABLE customer_local on cluster default
(
        C_CUSTKEY       UInt32,
        C_NAME          String,
        C_ADDRESS       String,
        C_CITY          LowCardinality(String),
        C_NATION        LowCardinality(String),
        C_REGION        LowCardinality(String),
        C_PHONE         String,
        C_MKTSEGMENT    LowCardinality(String)
)
ENGINE = MergeTree ORDER BY (C_CUSTKEY);
CREATE TABLE `customer` on cluster default as `customer_local` ENGINE = Distributed(default, default, customer_local, C_CUSTKEY);

CREATE TABLE lineorder_local on cluster default
(
    LO_ORDERKEY             UInt32,
    LO_LINENUMBER           UInt8,
    LO_CUSTKEY              UInt32,
    LO_PARTKEY              UInt32,
    LO_SUPPKEY              UInt32,
    LO_ORDERDATE            Date,
    LO_ORDERPRIORITY        LowCardinality(String),
    LO_SHIPPRIORITY         UInt8,
    LO_QUANTITY             UInt8,
    LO_EXTENDEDPRICE        UInt32,
    LO_ORDTOTALPRICE        UInt32,
    LO_DISCOUNT             UInt8,
    LO_REVENUE              UInt32,
    LO_SUPPLYCOST           UInt32,
    LO_TAX                  UInt8,
    LO_COMMITDATE           Date,
    LO_SHIPMODE             LowCardinality(String)
)
ENGINE = MergeTree PARTITION BY toYear(LO_ORDERDATE) ORDER BY (LO_ORDERDATE, LO_ORDERKEY);
CREATE TABLE `lineorder` on cluster default as `lineorder_local` ENGINE = Distributed(default, default, lineorder_local, LO_ORDERKEY);

CREATE TABLE part_local on cluster default
(
        P_PARTKEY       UInt32,
        P_NAME          String,
        P_MFGR          LowCardinality(String),
        P_CATEGORY      LowCardinality(String),
        P_BRAND         LowCardinality(String),
        P_COLOR         LowCardinality(String),
        P_TYPE          LowCardinality(String),
        P_SIZE          UInt8,
        P_CONTAINER     LowCardinality(String)
)
ENGINE = MergeTree ORDER BY P_PARTKEY;
CREATE TABLE `part` on cluster default as `part_local` ENGINE = Distributed(default, default, part_local, P_PARTKEY);

CREATE TABLE supplier_local on cluster default
(
        S_SUPPKEY       UInt32,
        S_NAME          String,
        S_ADDRESS       String,
        S_CITY          LowCardinality(String),
        S_NATION        LowCardinality(String),
        S_REGION        LowCardinality(String),
        S_PHONE         String
)
ENGINE = MergeTree ORDER BY S_SUPPKEY;
CREATE TABLE `supplier` on cluster default as `supplier_local` ENGINE = Distributed(default, default, supplier_local, S_SUPPKEY);

CREATE TABLE lineorder_flat_local (
    `LO_ORDERKEY` UInt32, 
    `LO_LINENUMBER` UInt8, 
    `LO_CUSTKEY` UInt32, 
    `LO_PARTKEY` UInt32, 
    `LO_SUPPKEY` UInt32, 
    `LO_ORDERDATE` Date, 
    `LO_ORDERPRIORITY` LowCardinality(String), 
    `LO_SHIPPRIORITY` UInt8, 
    `LO_QUANTITY` UInt8, 
    `LO_EXTENDEDPRICE` UInt32, 
    `LO_ORDTOTALPRICE` UInt32, 
    `LO_DISCOUNT` UInt8, 
    `LO_REVENUE` UInt32, 
    `LO_SUPPLYCOST` UInt32, 
    `LO_TAX` UInt8, 
    `LO_COMMITDATE` Date, 
    `LO_SHIPMODE` LowCardinality(String), 
    `C_NAME` String, 
    `C_ADDRESS` String, 
    `C_CITY` LowCardinality(String), 
    `C_NATION` LowCardinality(String), 
    `C_REGION` LowCardinality(String), 
    `C_PHONE` String, 
    `C_MKTSEGMENT` LowCardinality(String), 
    `S_NAME` String, 
    `S_ADDRESS` String, 
    `S_CITY` LowCardinality(String), 
    `S_NATION` LowCardinality(String), 
    `S_REGION` LowCardinality(String), 
    `S_PHONE` String, 
    `P_NAME` String, 
    `P_MFGR` LowCardinality(String), 
    `P_CATEGORY` LowCardinality(String), 
    `P_BRAND` LowCardinality(String), 
    `P_COLOR` LowCardinality(String), 
    `P_TYPE` LowCardinality(String), 
    `P_SIZE` UInt8, 
    `P_CONTAINER` LowCardinality(String)
) 
ENGINE = MergeTree
 PARTITION BY toYear(LO_ORDERDATE) 
 ORDER BY (LO_ORDERDATE, LO_ORDERKEY);
CREATE TABLE `lineorder_flat` on cluster default as `lineorder_flat_local` ENGINE = Distributed(default, default, lineorder_flat_local, LO_ORDERKEY);