################################################################################
#
# emacs
#
################################################################################

EMACS_VERSION = master
EMACS_SITE = https://git.savannah.gnu.org/git/emacs.git
EMACS_SITE_METHOD = git

EMACS_AUTORECONF = YES
EMACS_AUTORECONF_OPTS = -fi -Im4

#EMACS_VERSION = 25.3
#EMACS_SOURCE = emacs-$(EMACS_VERSION).tar.xz
#EMACS_SITE = $(BR2_GNU_MIRROR)/emacs

EMACS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES) dbus gnutls jansson libxml2 zlib

ifeq ($(BR2_INIT_SYSTEMD),y)
EMACS_DEPENDENCIES += systemd
endif

EMACS_DEPENDENCIES += host-qemu
EMACS_CONF_OPTS += --with-emulator="$(QEMU_USER) -L $(TARGET_DIR)"

$(eval $(autotools-package))
