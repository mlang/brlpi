include $(sort $(wildcard $(BR2_EXTERNAL_BRLPI_PATH)/package/*/*.mk))

ifeq ($(BR2_PACKAGE_EMACS),y)
define BRLPI_ENABLE_EMACS
	mkdir -p $(TARGET_DIR)/home/brlpi/.config/systemd/user/default.target.wants
	ln -sf ../../../../../../usr/lib/systemd/user/emacs.service \
		$(TARGET_DIR)/home/brlpi/.config/systemd/user/default.target.wants/emacs.service
endef

EMACS_POST_INSTALL_TARGET_HOOKS += BRLPI_ENABLE_EMACS
endif

define BRLPI_CREATE_USER_OVERLAY
	mkdir -p $(HOME)/.config/brlpi/overlay
endef

TARGET_FINALIZE_HOOKS += BRLPI_CREATE_USER_OVERLAY
