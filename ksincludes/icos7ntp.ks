##############################
# Time server tune up
##############################
# Use TAMU's own NTP servers, substitute for default ones.
echo "#########"
echo "  N T P  "
echo "#########"
echo Use TAMU own NTP servers, substitute for default ones.

# Set the clock. Needed for cfengine3 sign-in & Kerberos affiliation.
/usr/sbin/ntpdate -v ntp3.tamu.edu

# And make sure it tunes to the TAMU ntp servers from now on:
/usr/bin/perl -p -i -e 's/0.centos.pool.ntp.org/ntp1.tamu.edu iburst/' /etc/ntp.conf
/usr/bin/perl -p -i -e 's/1.centos.pool.ntp.org/ntp2.tamu.edu iburst/' /etc/ntp.conf
/usr/bin/perl -p -i -e 's/2.centos.pool.ntp.org/ntp3.tamu.edu iburst/' /etc/ntp.conf
/usr/bin/systemctl start ntpd.service
# Enabling service here won't work because of chroot. Leave that to CF3.

## EOF ##
