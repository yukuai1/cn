# 监控与报警概述
实例监控与报警为您提供实时实例监控管理服务，支持不同监控维度，在实例成功创建后即开始采集数据，以图表方式直观展现，方便您掌握实例资源使用情况、运行状态等信息，同时您可设置不同的报警规则，当触发该类条件后则触发报警通知，使您轻松定位故障。

## 监控指标
京东云监控服务为您提供主机实例的CPU、内存、磁盘、网络等类型的监控指标，其中云主机监控指标分为基础指标以及扩展指标：
* 基础指标具有较高的通用性，能满足您平时对监控数据的需求，上报的指标类型不支持调整 
* 扩展指标具有更详尽的信息，您可以根据不同业务场景的需求，自定义上报的指标类型，您可以参照[下方文档](monitoring-overview#user-content-2)进行配置

### 基础指标 
<table>
	<thead>
    <tr>
	<th>指标类型</th>
	<th>指标英文名</th>
        <th>指标中文名</th>
      	<th>单位</th>
      	<th>说明</th>
        <th>维度</th>
    </tr>
	</thead>
	<tbody>
    <tr>
        <td rowspan="4">CPU</td>
        <td>vm.cpu.util</td>
	<td>CPU使用率</td>
	<td> % </td>
        <td> 非空闲vCPU所占的百分比</td>
        <td> 无 </td>   
    </tr>
    <tr>
        <td>vm.avg.load1</td>
	<td> CPU平均负载（1min）</td>
	<td> 无 </td>    
        <td> 1分钟内的系统平均负载<br>仅Linux系统有此组指标</td>
        <td> 无</td>
    </tr>
    <tr>
        <td>vm.avg.load5</td>
	<td> CPU平均负载（5min）</td>
	<td> 无 </td>     
        <td> 5分钟内的系统平均负载<br>仅Linux系统有此组指标</td>
	<td> 无 </td>
    </tr>
    <tr>
        <td>vm.avg.load15</td>
	<td> CPU平均负载（15min）</td>
        <td> 无 </td>
        <td> 15分钟内的系统平均负载<br>仅Linux系统有此组指标 </td>    
	<td> 无</td>
    </tr>
    <tr>
        <td rowspan="2">内存</td>
        <td>vm.memory.usage</td>
	<td>内存使用率</td>
	<td> % </td>
        <td> 已用内存量占总内存总量百分比</td>
        <td> 无 </td>   
    </tr>
    <tr>
        <td>vm.memory.used.bytes</td>
	<td>内存使用量</td>
	<td> Bytes </td>
        <td> 系统已用内存情况</td>
        <td> 无 </td>   
    </tr>
    <tr>
        <td rowspan="9">磁盘</td>
        <td>vm.disk.bytes.read</td>
	<td>磁盘读吞吐量（Host）</td>
	<td> Bps </td>
        <td> 全部磁盘每秒读取的字节数</td>
        <td> 无 </td>   
    </tr>
    <tr>
        <td>vm.disk.bytes.write</td>
	<td>磁盘写吞吐量（Host）</td>
	<td> Bps </td>
        <td> 全部磁盘每秒写入的字节数</td>
        <td> 无 </td>   
    </tr>
    <tr>
        <td>vm.disk.dev.bytes.read</td>
	<td> 磁盘读吞吐量</td>
	<td> Bps </td>
        <td> 磁磁盘每秒读取的字节数</td>
        <td> devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td>   
    </tr>
    <tr>
        <td>vm.disk.dev.bytes.write</td>
	<td>磁盘写吞吐量</td>
	<td> Bps </td>
        <td> 磁盘每秒写入的字节数</td>
        <td> devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td> 
    </tr>	
    <tr>
        <td> vm.disk.dev.io.read</td>
        <td> 磁盘读IOPS </td>
        <td> Count/s</td> 
        <td> 磁盘每秒读请求数量</td>
        <td> devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td>
    </tr> 
    <tr>
        <td> vm.disk.dev.io.write</td>
        <td> 磁盘写IOPS </td>
        <td>Count/s</td> 
        <td>磁盘每秒写请求数量</td>
        <td>devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td>
    </tr>
    <tr>
        <td>vm.disk.dev.used</td>
        <td> 磁盘使用率 </td>
        <td>%</td>
        <td>磁盘已使用空间容量</td> 
        <td> mountPoint <br>* Linux：'mountPoint'='/','/mnt', ...<br>* Windows：‘mountPoint’='C','D', ...<br></td>
    </tr>
    <tr>
        <td> vm.disk.dev.used.bytes</td>
        <td>磁盘使用量 </td>
        <td>Bytes </td> 
        <td>磁盘已使用空间容量</td>
         <td> mountPoint <br>* Linux：'mountPoint'='/','/mnt', ...<br>* Windows：‘mountPoint’='C','D', ...<br></td>
    </tr>
    <tr>
        <td> vm.disk.dev.inode.used</td>
        <td>磁盘inode使用率</td>
        <td>%</td> 
        <td>磁盘文件系统inode使用百分比</td>
         <td> mountPoint <br>* Linux：'mountPoint'='/','/mnt', ...<br>* Windows：‘mountPoint’='C','D', ...<br></td>
    </tr>
    <tr>
        <td rowspan="7">网络</td>
        <td>vm.network.bytes.incoming </td>
        <td>网络入带宽（Host）</td>
        <td>bps</td> 
        <td>全部网卡每秒接收的比特数（为实例整体网络带宽，不分区网卡和内外网）</td>
        <td>无</td>
    </tr>
    <tr>
        <td>vm.network.bytes.outgoing</td>
        <td> 网络出带宽（Host）</td>
        <td>bps</td> 
        <td>全部网卡每秒接收的比特数（为实例整体网络带宽，不分区网卡和内外网</td>
        <td>无</td>
    </tr>
    <tr>
        <td> vm.network.dev.bytes.in </td>
        <td>网络入带宽</td>
        <td>bps</td> 
        <td>网卡每秒接收的比特数（网卡整体数据指标，不分区内外网）</td>
        <td>devName <br>* Linux/Windows：'devName'='eth0','eth1', ...</td>
    </tr>
    <tr>
        <td> vm.network.dev.bytes.out </td>
        <td>网络出带宽</td>
        <td>bps</td> 
        <td> 网卡每秒发送的比特数（网卡整体数据指标，不分区内外网）</td>
        <td>devName <br>* Linux/Windows：'devName'='eth0','eth1', ...</td>
    </tr>
    <tr>
        <td>vm.network.dev.packets.in </td>
        <td> 网络入包量</td>
        <td>pps</td> 
        <td> 网卡每秒入包量（网卡整体数据指标，不分区内外网）</td>
        <td>devName <br>* Linux/Windows：'devName'='eth0','eth1', ...</td>
    </tr>
    <tr>
        <td>vm.network.dev.packets.out </td>
        <td> 网络出包量 </td>
        <td>pps</td> 
        <td>网卡每秒出包量</td>
        <td>devName <br>* Linux/Windows：'devName'='eth0','eth1', ...</td>
    </tr>
    <tr>
        <td>vm.netstat.tcp.established </td>
        <td> TCP连接数  </td>
        <td>Count</td> 
        <td>处于 ESTABLISHED 状态的 TCP 连接数量</td>
        <td>无/td>
    </tr>
    <tr>
        <td rowspan="7">GPU</td>
        <td>vm.gpu.power </td>
        <td> GPU功耗   </td>
        <td>Wt</td> 
        <td>GPU功耗 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>
    <tr>
        <td>vm.gpu.temperature</td>
        <td> GPU温度   </td>
        <td>℃</td> 
        <td>GPU温度 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>
    <tr>
        <td>vm.gpu.util.gpu</td>
        <td> GPU核心使用率   </td>
        <td>%</td> 
        <td>GPU核心使用率 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>
    <tr>
        <td>vm.gpu.util.encoder</td>
        <td> GPU编码器使用率   </td>
        <td>%</td> 
        <td>GPU编码器使用率 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>
    <tr>
        <td>vm.gpu.util.decoder</td>
        <td> GPU解码器使用率   </td>
        <td>%</td> 
        <td>GPU解码器使用率 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>	
    <tr>
        <td>vm.gpu.util.mem</td>
        <td> GPU内存使用率   </td>
        <td>%</td> 
        <td>GPU内存使用率 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>	
    <tr>
        <td>vm.gpu.used.mem.bytes</td>
        <td> GPU内存使用量   </td>
        <td>Bytes</td> 
        <td>GPU内存使用量 </td>
        <td>gpu_index<br>* Linux/Windows：'gpu_index‘=’0’,’1’,’2’,’3’, ...<br>/td>
    </tr>	
	</tbody>
</table> 

### 扩展指标 
<table>
	  <thead>
  <tr>
	<th>指标类型</th>
	<th>指标英文名</th>
	<th>指标中文名</th>
	<th>单位</th>
	<th>说明</th>
	<th>维度</th>
  </tr>
	  </thead>
	  <tbody>
    <tr>
    	<td rowspan="2">CPU</td>
        <td>vm.cpu.cores.user</td>
	<td> 用户CPU使用率 </td>
        <td> % </td>
        <td> cpu在用户态进程和低优先级进程的时间占cpu总运行时间的百分比<br>仅Linux系统有此组指标</td>    
	<td> resourceId </td>
    </tr>
    <tr>
        <td>vm.cpu.cores.iowait</td>
	<td> io cpu使用率</td>
        <td> % </td>
        <td> 等待io操作的时间占cpu总运行时间的百分比<br>仅Linux系统有此组指标</td>    
	<td>resourceId </td>
    </tr>	  	  
      <tr>
	<td rowspan="2">磁盘</td>
        <td> vm.disk.dev.io.util</td>
        <td>磁盘IO繁忙百分比</td>
        <td>%</td> 
        <td>磁盘IO繁忙百分比</td>
        <td>devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td>
    </tr>
    <tr>
        <td> vm.disk.dev.io.await </td>
        <td>磁盘IO等待百分比</td>
        <td>%</td> 
        <td>磁盘IO等待百分比</td>
        <td>devName <br>* Linux：'devName'='/vda','/vdb1', ...<br>* Windows：‘devName’='C','D', ...<br></td>
    </tr>
   <tr>
   	<td rowspan="6">TCP连接数</td>
        <td>vm.netstat.tcp.last_ack </td>
        <td> last_ack </td>
        <td>Count</td> 
        <td>处于last_ack状态下的TCP连接数量</td>
        <td>resourceId</td>
   </tr>	
     <tr>
        <td>vm.netstat.tcp.syn_recv </td>
        <td>  syn_recv </td>
        <td>Count</td> 
        <td>处于syn_recv状态下的TCP连接数</td>
        <td>resourceId</td>
   </tr>
     <tr>
        <td>vm.netstat.tcp.fin_wait1 </td>
        <td> fin_wait1 </td>
        <td>Count</td> 
        <td>处于fin_wait1状态下的TCP连接数量</td>
        <td>resourceId</td>
   </tr>
     <tr>
        <td>vm.netstat.tcp.fin_wait2 </td>
        <td> fin_wait2 </td>
        <td>Count</td> 
        <td>处于fin_wait2状态下的TCP连接数量</td>
        <td>resourceId</td>
   </tr>
   <tr>
        <td>vm.netstat.tcp.closing </td>
        <td> closing </td>
        <td>Count</td> 
        <td>处于closing状态下的TCP连接数量</td>
        <td>resourceId</td>
   </tr>
   <tr>
        <td>vm.netstat.tcp.time_wait </td>
        <td> time_wait</td>
        <td>Count</td> 
        <td>处于time_wait状态下的TCP连接数量</td>
        <td>resourceId</td>
   </tr>
	</body>
</table>
 		
 
<div id="user-content-1"></div>

## 监控插件安装说明

云主机监控数据的采集和上报依赖于官方镜像系统组件'JCS-Agent'中的'MonitorPlugin'插件，当前官方镜像均默认安装'ifrit'工具，实现对JCS-Agent的自动升级。

如果您当前实例没有安装JCS-Agent，或是JCS-Agent版本过低不支持自动升级，请您检查是否卸载了早期系统组件cloud-init和QGA，确认后再安装ifrit（安装完成约10分钟，将自动安装最新版本的JCS-Agent）。

* 关于安装Ifrit以及cloud-init和QGA的卸载，您可以参考：[官方镜像系统组件-JCS-Agent](https://docs.jdcloud.com/cn/virtual-machines/default-agent-in-public-image#user-content-1)
* JCS-Agent版本查看方式：
  * Linux：
  `
   ps -ef|grep MonitorPlugin
  `
  * Windows：
  `
  wmic process where caption="MonitorPlugin.exe" get caption,commandline /value
  `
## 扩展指标上报配置说明
扩展指标包含更加详尽的信息，能够满足您在不同场景下的监控需求，您可以按照下方步骤进行操作，确保数据能够正常采集并且上报
  * 确认JCS-Agent组件版本不低于'3.0.1086'
  * 移至监控插件目录下
  `
    cd /usr/local/share/jcloud/agent/plugins/MonitorPlugin-[version]
  `
  * 创建名称为“Extended.cfg”的配置文件,您可以参考下方示例，根据需求自定义参数
    * "namespace"：上报至云监控中自定义监控的命名空间（长度不可超过255字节，只允许英文、数字、下划线_、点., [0-9][a-z] [A-Z] [. _ ]）
    * "metrics"：上报至云监控的扩展指标，目前支持的扩展指标类别包含："cpu", "disk-io", "netstat"
```
{
  "agent": {
   	"namespace":"vm_extend_metric" 
  }, 
  "metrics": {
  	"disk-io": {"measurement-white-list": [
		"vm.disk.dev.io.util", 
		"vm.disk.dev.io.await" ]},
  	"netstat": {"measurement-white-list": [
		"vm.netstat.tcp.last_ack", 
		"vm.netstat.tcp.syn_recv", 
		"vm.netstat.tcp.fin_wait1", 
		"vm.netstat.tcp.fin_wait2",
		"vm.netstat.tcp.closing", 
		"vm.netstat.tcp.time_wait", 
		"vm.netstat.tcp.retrans_segs" ]}, 
	  "cpu": {
		"measurement-white-list": [
			"vm.cpu.cores.user", 
			"vm.cpu.cores.iowait" ]}}
}
```
  * 重启监控插件，插件进程将在5分钟内自动拉起，并开始采集、上报扩展指标（插件升级期间基础指标可能存在短暂缺失）
    * 查看监控进程id：
    `
      ps -ef | grep -i MonitorPlugin 
    ` 
    * 杀死进程：
    `
      kill [pid]       
    `
  
## 监控数据说明
* 监控数据采集周期为10s，最小展示间隔为1min；
* 不同指标的默认聚合方式不同，可在监控图中查看各指标的聚合方式；
* 统计周期默认支持1小时、6小时、12小时、1天、3天、7天及14天，此外还支持您设置统计周期，最短为1分钟最长为一个月；
* 不同统计周期监控值会做对应聚合，例如6小时统计周期情况下，监控图上间隔5分钟显示一个监控值，该监控值为对应统计周期内采集值的聚合，当前仅支持以默认聚合方式查询；
* 监控数据最长保存30天，用户在控制台可直接可以观察30天的监控数据。

## 其他
* bps表示每秒传输bit数，ps为per second，意同/s；
* Bps表示每秒传输Byte数，ps为per second，意同/s；
* Kbps=1000bps，KBps=1000Bps。
  
 
   
