# THE AUXILIARY REPOSITORIES ##################################################
echo "# THE AUXILIARY REPOSITORIES ##################################################"
echo " +-+-+-+-+ "
echo " |E|P|E|L| "
echo " +-+-+-+-+ "
rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

# 2016-09-08: Disabling repoforge / rpmforge, as it seems to be discontinued.
# echo " +-+-+-+-+-+-+-+-+-+ "
# echo " |R|e|p|o|F|o|r|g|e| "
# echo " +-+-+-+-+-+-+-+-+-+ "
# rpm -ivh http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el7.rf.x86_64.rpm
echo "###############################################################################"
# Reset yum again:
yum clean all

## EOF ##
