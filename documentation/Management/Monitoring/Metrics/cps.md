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
