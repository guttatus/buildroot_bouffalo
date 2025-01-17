################################################################################
#
# rustsbi prototyper
#
################################################################################

RUSTSBI_VERSION = 14e6171860ac81e7e27ce07f2183c40554149460
RUSTSBI_SITE = $(call github,rustsbi,prototyper,$(RUSTSBI_VERSION))
RUSTSBI_INSTALL_IMAGES = YES
RUSTSBI_INSTALL_TARGET = NO

define RUSTSBI_BUILD_CMDS
	cd $(@D) && cargo prototyper --jump
endef

define RUSTSBI_INSTALL_IMAGES_CMDS
	$(INSTALL) -m 0755 -t $(BINARIES_DIR) -D $(@D)/target/riscv64imac-unknown-none-elf/release/rustsbi-prototyper-jump.bin
endef

$(eval $(generic-package))
