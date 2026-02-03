# Makefile created by mkmf 2022.01.00

CPPDEFS = -DINTERNAL_FILE_NML -DSPMD -DCLIMATE_NUDGE
OTHERFLAGS = -I$(BUILDROOT)atmos_cubed_sphere -I$(BUILDROOT)am5_phys -I$(BUILDROOT)fms
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: libatmos_dyn.a
atmos_model.o: $(SRCROOT)atmos_drivers/coupled/atmos_model.F90 $(SRCROOT)FMS/include/file_version.h
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c -I$(SRCROOT)FMS/include	$(SRCROOT)atmos_drivers/coupled/atmos_model.F90
./file_version.h: $(SRCROOT)FMS/include/file_version.h
	cp $(SRCROOT)FMS/include/file_version.h .
./atmos_model.F90: $(SRCROOT)atmos_drivers/coupled/atmos_model.F90
	cp $(SRCROOT)atmos_drivers/coupled/atmos_model.F90 .
SRC = $(SRCROOT)atmos_drivers/coupled/atmos_model.F90 $(SRCROOT)FMS/include/file_version.h
OBJ = atmos_model.o
OFF = $(SRCROOT)FMS/include/file_version.h $(SRCROOT)atmos_drivers/coupled/atmos_model.F90
clean: neat
	-rm -f .libatmos_dyn.a.cppdefs $(OBJ) libatmos_dyn.a

neat:
	-rm -f $(TMPFILES)

localize: $(OFF)
	cp $(OFF) .

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

libatmos_dyn.a: $(OBJ)
	$(AR) $(ARFLAGS) libatmos_dyn.a $(OBJ)

