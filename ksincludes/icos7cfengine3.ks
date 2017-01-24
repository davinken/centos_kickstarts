# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|c|f|e|n|g|i|n|e|3|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# icos7cfengine3.ks
# Takes care of downloading + installing CFEngine, and then performing the
# bootstrap against the master policy server.
# This will start the CFEngine daemons (in charge of the final stages of
# configuration and specialization).

# The repository definition has been already installed, so we are ready to
# invoke yum to install CF3:
# Need to import the key:
rpm --import http://cfengine.com/pub/gpg.key
yum clean all
yum -y install cfengine-community

# Commands relative to actual filesystem locations need to consider the 
# chroot environment which is actually based on /mnt/sysimage
# sleep 2

# Initialize CFEngine3 environment (we don't want the sample files):
find /mnt/sysimage/var/cfengine/masterfiles -type f -delete
############################
# B O O T S R A P
############################
# Now bootstrap CF3:
/var/cfengine/bin/cf-agent --bootstrap 128.194.136.2
# This little guy should be now speaking with the CF3 policy hub.
# CF3 takes command now...
# sleep 70
# Now launch 1st instance of CF3 invoking the customized RPM package
# installation:
# /mnt/sysimage/var/cfengine/bin/cf-agent -D withpkg   PENDING.

## EOF ##
