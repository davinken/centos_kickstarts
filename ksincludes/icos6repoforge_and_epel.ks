# THE AUXILIARY REPOSITORIES ##################################################
# CentOS 6 target

echo "# THE AUXILIARY REPOSITORIES ##################################################"
echo " +-+-+-+-+ "
echo " |E|P|E|L| "
echo " +-+-+-+-+ "
rpm -ivh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm

# 2016-09-08: Disabling repoforge / rpmforge, as it seems to be discontinued.
# echo " +-+-+-+-+-+-+-+-+-+ "
# echo " |R|e|p|o|F|o|r|g|e| "
# echo " +-+-+-+-+-+-+-+-+-+ "
# rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
echo "###############################################################################"
# Reset yum again:
yum clean all

## EOF ##
