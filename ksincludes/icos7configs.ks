# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|c|o|n|f|i|g|s|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# icos7configs.ks
# In charge of copying over parametrized configuration files residing in
# the kickstart server (vega) under ./ksconfigsrepo

# Full path: vega:/export/scratch/linux/ks/centos/ksconfigsrepo

# 05dec2014/davidr - Parasol Lab @ TAMU
# 11dec2014/davidr - Change cp to wget.
# 27jan2016/davidr - Added DHCP config.

/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_bashrc -O /root/.bashrc
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_nsswitchconf -O /etc/nsswitch.conf
# This breaks graphical desktop so leave out:
# /usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_pamd_systemauthac -O /etc/pam.d/system-auth-ac
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_yum_localcentosrepo -O /etc/yum.repos.d/local-CentOS-Base.repo
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_yum_parasolrepo -O /etc/yum.repos.d/parasol.repo
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_yum_cfenginerepo -O /etc/yum.repos.d/cfengine-community.repo
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_dotforward_localuser -O /home/localuser/.forward
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_localuser_bashrc -O /home/localuser/.bashrc

/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_dhclientconf -O /etc/dhcp/dhclient.conf

/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_root_cron -O /var/spool/cron/root

## EOF ##
