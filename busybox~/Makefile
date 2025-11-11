include ~/.lcb-env

# ################
# BusyBox
menu:
	@cd $(BUSYBOX_SOURCE) && $(MAKE) menuconfig

all: clean push build import su_clean su_push su_build su_import
	@echo '<--'

clean:
	@rm -f $(TARGET_DIR)/busybox
pull:
	@cp -bv $(BUSYBOX_SOURCE)/.config assets/busybox.config
push:
	@cp -bv assets/busybox.config $(BUSYBOX_SOURCE)/.config
build:
	@cd $(BUSYBOX_SOURCE) && $(MAKE) busybox -j14
import:
	@cp -f $(BUSYBOX_SOURCE)/busybox $(TARGET_DIR)/busybox

su_clean:
	@rm -f $(TARGET_DIR)/busybox.suid
su_pull:
	@cp -bv $(BUSYBOX_SOURCE)/.config assets/busybox_suid.config
su_push:
	@cp -bv assets/busybox_suid.config $(BUSYBOX_SOURCE)/.config
su_build:
	@cd $(BUSYBOX_SOURCE) && $(MAKE) busybox -j14
su_import:
	@cp -f $(BUSYBOX_SOURCE)/busybox $(TARGET_DIR)/busybox.suid

