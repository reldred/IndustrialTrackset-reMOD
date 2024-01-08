# reldreds garbage nfo compile system
# Written by reldred, the artist formerly known as Aegir. Major kudos to Josef 'Patchman' Drexler for the 
# suggestion to abuse the hell out of gcc preprocess and then make nforenum wipe our arses for us.

# Have fun.

# Our Steps:
# 1: gcc -ECP preprocess
# 2: nforenum process
# 3: grfcodec compile

# Macros:
# Paths for our tools
NMLC = nmlc
GRFDIR = ../../../../Software/Games/JGR\ Patchpack/newgrf/

# GCC Settings:
CC = gcc
PREPROCESS = -nostdinc -E -C -P - <

# Aliases for the set:
NAME = indtrack-reMOD

# Now, the fun stuff:

# Target for all:
all : compile

justdoit : clean compile install

# Compile GRF's
#don't need graphics anymore since grfcodec can eat pngs
compile : preprocess
	@echo "Compiling OpenTTD/DOS GRF:"
	$(NMLC) $(NAME).nml
	@echo
	
# GCC Preprocess the PNML	
preprocess :
	@echo "GCC Preprocessing PNML:"
	$(CC) $(PREPROCESS) $(NAME).pnml > $(NAME).nml
	@echo

# Clean the source tree
clean:
	@echo "Cleaning source tree:"
	@echo "Remove backups:"
	-rm *.bak *~
	@echo
	@echo "Remove .nml:"
	-rm *.nml
	@echo
	@echo "Remove .nmlcache"
	-rm .nmlcache -Rf
	@echo
	@echo "Remove compiled .grf:"
	-rm *.grf

# Installation process
install:
	@echo Installing .grf files to $(GRFDIR).
	@echo "DOS/OpenTTD GRF:"
	-cp $(NAME).grf $(GRFDIR)/$(NAME).grf
