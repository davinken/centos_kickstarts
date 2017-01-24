###########################################################################
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|p|k|g|m|a|n|i|f|e|s|t|_|b|a|s|e|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# icos7pkgmanifest_base.ks

# 2014-12-21 
# 2016-01-27 (revision)
# Manifest of RPM packages / package groups to be installed (generic).
#   Package groups (prepend with @)
#   Individual packages (prepend with - to exclude/remove).
#
# Pending: Consider system environment (prepend with @^) - see commented below.
###########################################################################

#############################################################################
# Environment declaration (only one possible)
# Check file: repodata/*-comps-variant.architecture.xml in installation disk.
# Disable for now:
# @^Infrastructure Server
#############################################################################
@base
@core
# @desktop-debugging                  2016-01-22 comment out many pkg groups
#                                     as part of debugging issue with IPA
@development
# @dial-up
@directory-client
@fonts
@gnome-apps
@gnome-desktop
@guest-agents
@guest-desktop-agents
@input-methods
@internet-browser
# @java-platform
# @multimedia
@network-file-system-client
# @office-suite
# @print-client
# @remote-desktop-clients
@x11

# (this makes a good bulk of > 1000 pkgs).
## END OF BASE PACKAGE MANIFEST
