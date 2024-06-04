# Makefile for compiling all SQLRPGLE files in QRPGLESRC

# Target library for the compiled programs (passed as a parameter)
BUILDLIB ?= IBMSQL_QT

# Directory containing the SQLRPGLE files
SRC_DIR := $(CURDIR)/QRPGLESRC

# Get a list of all SQLRPGLE files in the directory
SQLRPGLE_FILES := $(wildcard $(SRC_DIR)/*.SQLRPGLE)

# Target for each SQLRPGLE file, transforming the filename to remove the directory and extension
TARGETS := $(SQLRPGLE_FILES:$(SRC_DIR)/%.SQLRPGLE=/QSYS.LIB/$(BUILDLIB).LIB/%.PGM)

# Default target
all: $(TARGETS) 
	@echo "*** End of makefile ***"

# Rule to convert each SQLRPGLE file using CRTSQLRPGI
/QSYS.LIB/$(BUILDLIB).LIB/%.PGM: $(SRC_DIR)/%.SQLRPGLE
	-system -i "CRTSQLRPGI OBJ($(BUILDLIB)/$*) SRCSTMF('$(SRC_DIR)/$*.SQLRPGLE') COMMIT(*NONE) REPLACE(*YES) CVTCCSID(*JOB)" 


# Cleanup
clean:
	# Add commands to remove compiled objects if necessary
	@echo "Clean target is not implemented. Manually clean if necessary."
