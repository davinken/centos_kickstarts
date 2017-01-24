# +-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|i|p|a|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+
# icos7ipa.ks
# In charge of copying over expect scripts to be used in automating the 
# sign-up to the IPA directory services.

# Full path: vega:/export/scratch/linux/ks/centos/ksconfigsrepo

# 10feb2016/davidr - New development.

# Expect scripts (TCL):
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_joinipa -O /root/join_ipa.exp
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_rejoinipa -O /root/rejoin_ipa.exp
# Launchers for the above.
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_joinipash -O /root/join_ipa.sh
/usr/bin/wget https://vega.cse.tamu.edu/linux/ks/centos/ksconfigsrepo/cficos7_rejoinipash -O /root/rejoin_ipa.sh

## EOF ##
