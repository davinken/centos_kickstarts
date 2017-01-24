###################################################################
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|b|a|s|i|c|v|m|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# icos7basicvm.ks
# This is to be inserted into production kickstart for CentOS 7
# via an %include statement. 
# 04dec2014/davidr - Parasol Lab @ TAMU
# 22jan2016/davidr - Update repository definition. Abandon yum.tamu.edu
# 07sep2016/davidr - Modify disk name sda -> vda (ONLY CHANGE vs icos7basic.ks)
#                    for use in KVM environments.
###################################################################

# System authorization information
auth --enableshadow --passalgo=sha512

# Use network installation (trailing slash is important!):
url --url="https://vega.cse.tamu.edu/linux/centos/7/os/x86_64/"
# Run the Setup Agent on first boot
firstboot --enable
ignoredisk --only-use=vda
# Keyboard layouts
keyboard --vckeymap=us --xlayouts='us'
# System language
lang en_US.UTF-8
# SELinux disabled:
selinux --disabled
# No firewalld desired (will interfere with CF3 and BRU bootstraps)
firewall --disabled

# Network information (--nopiv6 no longer supported).
network  --bootproto=dhcp --device=enp3s0
# Root password
rootpw --iscrypted $6$KeyK2Bk7PePwb6.K$LUcJozNlR2kLKeVfst8nXQITDbjtClEJWR0ZgZ.Xj4JVzSQtF3C5FFvY8Q/e3C5MpYA.AkZMvpcAb7cunYgui0

# System services. For servers we prefer to disable NetworkManager (replace
#                  by just network. ntp replaces newer chronyd.
services --disabled iptables, ip6tables
services --enabled network
# System timezone
timezone America/Matamoros --isUtc --ntpservers=ntp1.tamu.edu,ntp2.tamu.edu,ntp3.tamu.edu

group --name=localgroup --gid=27182
user --groups=localgroup --homedir=/home/localuser --name=localuser --password=$6$WkmgBgzX7ySQUPfD$BDGSZomXfXFHG0KSaHIMopaBZnFJnSgljzo4uthq15MDU1W2ggHG5BAfdcfrMVJOBsAmp57rMN2zT1bmlBy.X0 --iscrypted --uid=31415 --gecos="Local User"
# This will mark the License as agreed, avoids an extra click for it after 1st
# boot.
eula --agreed

# X Window System configuration information
xconfig  --startxonboot

## EOF ##
