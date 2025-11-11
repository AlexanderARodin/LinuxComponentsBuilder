include ~/.lcb-env

# ################
# Create inird
initrd:
	@echo '[BUILD INITRD]'
	@cd $(TARGET_DIR)/rootfs && \
		find . | cpio -o -H newc -V | gzip -9 > $(TARGET_DIR)/initrd.gz

# ################
# Create squash image
sqsh:
	@echo '[BUILD SQUASH IMAGE]'
	@cd $(TARGET_DIR)/rootfs && \
		mksquashfs ./ $(TARGET_DIR)/image.sqsh

# ################
clean:
	@rm -f $(TARGET_DIR)/initrd.gz
	@rm -f $(TARGET_DIR)/image.sqsh
