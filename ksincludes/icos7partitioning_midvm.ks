############################################################################ 
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
# |i|c|o|s|7|p|a|r|t|i|t|i|o|n|i|n|g|_|m|i|d||v|m|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-++-+-+-+-+-+
# icos7partitioning_midvm.ks

# 04dec2014/davidr - Parasol Lab @ TAMU
# 27jan2016/davidr - Increase sizes.
# 08apr2016/davidr - Change ext4 -> xfs as filesystem for /export.
# 10nov2016/davidr - Customized for mid size KVM VMs, 150 GB typical and disk
#                    name is vda (instead of sda).

# This sets up non-RAID LVM disk partitioning for a single disk, with the
# following parameters:
# -----------------------------------------
# /boot     750 MB     ext4
# /         60 GB      ext4
# swap      (automatic/recommended setting)
# /export   The rest of the disk.    xfs
# -----------------------------------------
# All partitions will be formatted.

# System bootloader configuration
bootloader --location=mbr --boot-drive=vda

##########################
# PARTITION DATA
##########################
# Partition clearing information
clearpart --all --initlabel --drives=vda
# Disk partitioning information. Note that CentOS 7 prefers fstype="xfs" for
# large systems.
# Use LVM.
part /boot --fstype="ext4" --ondisk=vda --size=750 --label=parasol_boot
part pv.17 --fstype="lvmpv" --ondisk=vda --size=1 --grow
volgroup centos_parasol --pesize=4096 pv.17
logvol /export  --fstype="xfs" --size=1 --grow --label="parasol_export" --name=export --vgname=centos_parasol
logvol /  --fstype="ext4" --size=60000 --label="parasol_root" --name=root --vgname=centos_parasol
logvol swap  --fstype="swap" --recommended --name=swap --vgname=centos_parasol

## EOF ##
