# 系统时间

时间同步
----------
`/usr/sbin/ntpdate -u xx.xx.xx.xx`

> 中国国家授时中心：210.72.145.44
  NTP服务器(上海) ：ntp.api.bz
  美国： time.nist.gov
  复旦： ntp.fudan.edu.cn
  微软公司授时主机(美国) ：time.windows.com
  北京邮电大学 : s1a.time.edu.cn
  清华大学 : s1b.time.edu.cn
  北京大学 : s1c.time.edu.cn
  台警大授时中心(台湾)：asia.pool.ntp.org

将系统时间写入到硬件（bios）
------------
1. `hwclock`
2. `clock -w`
