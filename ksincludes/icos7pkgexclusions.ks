# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# |i|c|o|s|7|p|k|g|e|x|c|l|u|s|i|o|n|s|.|k|s|
# +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
# icos7pkgexclusions.ks
# 04dec2014/davidr - Parasol Lab @ TAMU.
# 
# List the individual packages to be excluded from installation (overriding
# any default settings).
# This list is based on older versions so it may contain already non-existent
# packages.

######################################
# E X C L U S I O N S
######################################
# Some findings from prototype - we don't want this stuff
# Exclude this stupid package:
-PackageKit-command-not-found
# Apt collides with our needs/cfengine.
-apt 
# Chronyd new invention but we prefer to maintain ntp.
-chronyd
# mtools  MS-DOS tools deprecate @ Parasol.
# Wanted to remove this but it has many dependencies.
# -mtools
# festival does voice synthesis may be interesting...
-festival
-festival-lib
-festival-speechtools-libs
-festival-freebsoft-utils
-festvox-slt-arctic-hts
-orca
-speech-dispatcher
-speech-dispatcher-python
# We don't use iscsi - it has been noisy when booting up - remove.
-iscsi-initiator-utils
# ModemManager is tied to some other important network config packages.
# -ModemManager
# We prefer old fashion 'network' service over NetworkManager.
-NetworkManager
-lohit-bengali-fonts
-lohit-gujarati-fonts
-sil-padauk-fonts
-lohit-devanagari-fonts
-lohit-assamese-fonts
-lohit-kannada-fonts
-lohit-tamil-fonts
-lohit-oriya-fonts
-lohit-telugu-fonts
-lohit-punjabi-fonts
-sil-abyssinica-fonts
-thai-scalable-fonts-common
-thai-scalable-waree-fonts
-mobile-broadband-provider-info

## END OF EXCLUSIONS ##
