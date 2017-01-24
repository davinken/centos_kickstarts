# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|b|u|l|k|_|r|p|m|_|i|n|s|t|a|l|l|s|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# icos7bulk_rpm_installs.ks

# In charge of copying over a bulk installer script to be executed post-
# commissioning. Typically, manual execution to be performed by the SA.
# The script is in charge of installing hundreds of packages that wre
# found in F20 systems, many of them will fail due to no existing COS7
# counterpart.

# Full path: vega:/export/scratch/linux/ks/centos/ksconfigsrepo

# 04may2016/davidr - New development.

# Bulk installer:
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_bulk_f20_to_cos7_rpms -O /root/bulk_f20_to_cos7_rpms.sh

## EOF ##
