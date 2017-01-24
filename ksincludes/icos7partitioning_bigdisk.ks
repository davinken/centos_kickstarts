############################################################################ 
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|p|a|r|t|i|t|i|o|n|i|n|g|_|b|i|g|d|i|s|k|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

# icos7partitioning_bigdisk.ks

# 28jan2016/davidr - Consider the case of a large disk where we want to have
#                    a separate /export2 partition.

# This sets up non-RAID LVM disk partitioning for a single disk, with the
# following parameters:
# -----------------------------------------
# /boot     750 MB     ext4
# /         100 GB     ext4
# swap      (automatic/recommended setting)
# /export   500 GB     ext4
# /export2  The rest   ext4
# -----------------------------------------
# All partitions will be formatted.

# System bootloader configuration
bootloader --location=mbr --boot-drive=sda

##########################
# PARTITION DATA
##########################
# Partition clearing information
clearpart --all --initlabel --drives=sda
# Disk partitioning information. Note that CentOS 7 prefers fstype="xfs" for
# large systems.
# Use LVM.
part /boot --fstype="ext4" --ondisk=sda --size=750 --label=parasol_boot
part pv.17 --fstype="lvmpv" --ondisk=sda --size=1 --grow
volgroup centos_parasol --pesize=4096 pv.17
logvol /  --fstype="ext4" --size=150000 --label="parasol_root" --name=root --vgname=centos_parasol
logvol /export  --fstype="xfs" --size=500000 --label="parasol_export" --name=export --vgname=centos_parasol
logvol /export2  --fstype="xfs" --size=1 --grow --label="parasol_export2" --name=export2 --vgname=centos_parasol
logvol swap  --fstype="swap" --recommended --name=swap --vgname=centos_parasol

## EOF ##
