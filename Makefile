TOP_DIR := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
MODULE_DIR := $(TOP_DIR)/modules
SOURCE_DIR := $(TOP_DIR)/src

INSTALL_TARGETS +=

CLEAN_TARGETS +=

-include $(SOURCE_DIR)/make/*.mk
-include $(MODULE_DIR)/*/Makefile

.PHONY: install
install: $(INSTALL_TARGETS)

.PHONY: clean
clean: $(CLEAN_TARGETS)
