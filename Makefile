include ~/workDir/.lcb-env

CHECK_GIT_STATUS = git status -s | sed 's/"/|/g'
# ################
# HELP
help:
	@echo 'empty help (still)'

# ################
# Tuning
dev:
	@nvim Makefile
run-root.init.user:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

# ################
# Main target parts
rootfs.allin:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
uutils.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
busybox.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)
kernel.all:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

image.initrd:
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)

# ################
# Any submodule
%:
	@echo [ AUTODETECTION: $@ ]
	@$(MAKE) -C $(shell ./scripts/main-target.sh $@) $(shell ./scripts/sub-target.sh $@)


# ################
# GIT
pull:
	@git pull
savetogit: git.pushall
	@echo '<--'
git.pushall: git.commitall
	@git push
git.commitall: git.addall
	@echo '--> COMMIT if STATUS allows..'
	@if [ -n "$(shell $(CHECK_GIT_STATUS))" ]; \
		then \
			git commit -m 'saving'; \
		else \
			echo '--- nothing to commit'; \
	fi
git.addall:
	@git add .
