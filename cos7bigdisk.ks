#version=RHEL7
# cos7gen.ks
#   ____           _    ___  ____    _____ ____  
#  / ___|___ _ __ | |_ / _ \/ ___|  |___  |___ \ 
# | |   / _ \ '_ \| __| | | \___ \     / /  __) |
# | |__|  __/ | | | |_| |_| |___) |   / /_ / __/ 
#  \____\___|_| |_|\__|\___/|____/   /_/(_)_____|
#                                                
# 
# Kickstart file for CentOS 7 physical large sizes (typically 1 TB+). 64 bits.
# The OS (/) has 150 GB reserved; swap space is determined automatically.
# 750 MB for /boot.
# The large disk is partitioned in 2 areas:
#    /export   -> 500 GB
#    /export2  -> The rest. XFS filesystem to be used.
# These are typically single-purpose back-end servers or workstations, with
# disks larger than 500 GB. Typical 1 to 2 TB.
# No RAID considered here.

# The installation resources are on a local NFS resource (vega).

# 04dec2014/davidr - PARASOL LAB @ TAMU
# 22jan2016/davidr - Revisions for CentOS 7.2.1115
# 28jan2016/davidr - This is a variation of cos7gen.ks changing only the
#                    invocation of the disk partitioning component.
# NOTE: Possible interruptions:
#           Disk name change from sda to vda (virtual environments)
#           Network device is no longer eth0, or even em1... crazy.
#           This may fail on multi-card systems!!!! The first one responding
#           gets the rights...

# Refer to the %pre section at the end to see how the /ksincludes is mounted.

#####################
# Commands section:
#####################
%include /ksincludes/icos7basic.ks
%include /ksincludes/icos7partitioning_bigdisk.ks

#####################
# Packages section:
#####################
%packages --ignoremissing
%include /ksincludes/icos7pkgmanifest_base.ks
%include /ksincludes/icos7pkgmanifest_adhoc.ks
%include /ksincludes/icos7pkgexclusions.ks
%end

##################################
# %post section
##################################
%post --log=/tmp/ks-post-chroot.log
echo "######################################################"
echo "This is the regular (chroot) part of the post-install."
echo "######################################################"
%include /ksincludes/icos7configs.ks
%include /ksincludes/icos7ntp.ks
%include /ksincludes/icos7ipa.ks
%include /ksincludes/icos7bulk_rpm_installs.ks
%include /ksincludes/icos7repoforge_and_epel.ks
%include /ksincludes/icos7bru.ks
# Install & affiliate to CF3:
%include /ksincludes/icos7cfengine3.ks

yum clean all
yum -y update

echo "  ___________________________________ "
echo " < Kickstart for CentOS 7 finished >"
echo "  ----------------------------------- "
echo "         \   ^__^"
echo "          \  (oo)\_______"
echo "             (__)\       )\/\ "
echo "                 ||----w |"
echo "                 ||     ||"
echo " "
%end

#####################
# %pre section:
#####################
# Makes extra KS configurations available via NFS shares from repo server vega.
%pre
echo "####################################"
echo "    %pre : pre-install component."
echo "####################################"
mkdir /ksincludes
mkdir /ksconfigsrepo
mount -t nfs -o nolock vega:/export/scratch/linux/ks/centos/ksincludes /ksincludes
mount -t nfs -o nolock vega:/export/scratch/linux/ks/centos/ksconfigsrepo /ksconfigsrepo
%end

## EOF ##
