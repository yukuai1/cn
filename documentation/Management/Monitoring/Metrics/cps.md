## 云物理服务器

获取该产品监控数据的servicecode为cps，监控指标数据包含实例、磁盘、磁盘分区、网口四个维度，具体指标如下：
### 实例
metric | 中文名称  | 英文名称 |单位 | 说明
---|--- |--- |--- |---
cps.cpu.util |CPU使用率| CPU Usage | % |
cps.memory.util |内存使用率|Memory Usage| % |
cps.memory.used | 内存使用量 | Memory Used| GB | 
cps.disk.used |磁盘使用量 |Disk Used| GB | 
cps.disk.util |磁盘使用率 |Disk Used| % | 
cps.disk.bytes.read |磁盘读流量 |Disk Read Traffic| Bps | 
cps.disk.bytes.write |磁盘写流量 |Disk Write Traffic| Bps | 
cps.disk.counts.read |磁盘读IOPS |Disk Read IOPS| 次/秒 | 
cps.disk.counts.write |磁盘写IOPS |Disk Write IOPS| 次/秒 | 
cps.network.bytes.ingress |网卡进流量 |Network Ingress Traffic| bps | 
cps.network.bytes.egress |网卡出流量 |Network Egress Traffic| bps | 
cps.network.packets.ingress |网络进包量 |Network Ingress Packets| 个/秒 | 
cps.network.packets.egress |网络出包量 |Network Egress Packets| 个/秒 | 
cps.avg.load1 |平均负载1min |Load Average 1min| - | 
cps.avg.load5 |平均负载5min |Load Average 5min| - | 
cps.avg.load15 |平均负载15min |Load Average 15min| - | 
cps.tcp.connect.total |TCP总连接数 |Total TCP Connections| 个 | 
cps.tcp.connect.established |TCP正常连接数 |Established TCP Connections| 个 | 
cps.process.total |总进程数 |ETotal Process Count| 个 | 
### 磁盘 
Linux系统按设备名上报， Windows系统按盘符上报,tag的key为device，值为'sda','C:'…
metric | 中文名称  | 英文名称 |单位 | 说明
---|--- |--- |--- |---
cps.disk.used |磁盘使用量 |Disk Used| GB | 
cps.disk.util |磁盘使用率 |Disk Used| % | 
cps.disk.bytes.read |磁盘读流量 |Disk Read Traffic| Bps | 
cps.disk.bytes.write |磁盘写流量 |Disk Write Traffic| Bps | 
cps.disk.counts.read |磁盘读IOPS |Disk Read IOPS| 次/秒 | 
cps.disk.counts.write |磁盘写IOPS |Disk Write IOPS| 次/秒 | 
### 磁盘分区 
Linux系统按分区挂载点上报，Windows系统按盘符上报,tag的key为device，值为'/home','C:'…
metric | 中文名称  | 英文名称 |单位 | 说明
---|--- |--- |--- |---
cps.disk.used |磁盘使用量 |Disk Used| GB | 
cps.disk.util |磁盘使用率 |Disk Used| % | 
### 网口 
tag的key为device，值为'eth0','eth1','band0'…
metric | 中文名称  | 英文名称 |单位 | 说明
---|--- |--- |--- |---
cps.network.bytes.ingress |网卡进流量 |Network Ingress Traffic| bps | 
cps.network.bytes.egress |网卡出流量 |Network Egress Traffic| bps | 
cps.network.packets.ingress |网络进包量 |Network Ingress Packets| 个/秒 | 
cps.network.packets.egress |网络出包量 |Network Egress Packets| 个/秒 | 








