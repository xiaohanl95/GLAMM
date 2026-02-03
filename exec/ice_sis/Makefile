# Makefile created by mkmf 2022.01.00

CPPDEFS = -DINTERNAL_FILE_NML -Duse_netCDF
OTHERFLAGS = -I$(BUILDROOT)ice_param -I$(BUILDROOT)mom6 -I$(BUILDROOT)fms
include $(MK_TEMPLATE)


.DEFAULT:
	-echo $@ does not exist.
all: libice_sis.a
combined_ice_ocean_driver.o: $(SRCROOT)ice_sis/combined_ice_ocean_driver.F90 ice_model.o
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/combined_ice_ocean_driver.F90
ice_bergs.o: $(SRCROOT)ice_sis/ice_bergs.F90
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_bergs.F90
ice_dyn.o: $(SRCROOT)ice_sis/ice_dyn.F90 ice_grid.o ice_thm.o
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_dyn.F90
ice_grid.o: $(SRCROOT)ice_sis/ice_grid.F90
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_grid.F90
ice_model.o: $(SRCROOT)ice_sis/ice_model.F90 ice_type.o ice_grid.o ice_spec.o ice_thm.o ice_dyn.o ice_bergs.o
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_model.F90
ice_spec.o: $(SRCROOT)ice_sis/ice_spec.F90
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_spec.F90
ice_thm.o: $(SRCROOT)ice_sis/ice_thm.F90
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_thm.F90
ice_type.o: $(SRCROOT)ice_sis/ice_type.F90 ice_grid.o ice_thm.o ice_dyn.o ice_bergs.o
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/ice_type.F90
mask.o: $(SRCROOT)ice_sis/mask.F90 rot.o
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/mask.F90
rot.o: $(SRCROOT)ice_sis/rot.F90
	$(FC) $(CPPDEFS) $(FPPFLAGS) $(FFLAGS) $(OTHERFLAGS) $(OTHER_FFLAGS) -c	$(SRCROOT)ice_sis/rot.F90
./rot.F90: $(SRCROOT)ice_sis/rot.F90
	cp $(SRCROOT)ice_sis/rot.F90 .
./mask.F90: $(SRCROOT)ice_sis/mask.F90
	cp $(SRCROOT)ice_sis/mask.F90 .
./ice_grid.F90: $(SRCROOT)ice_sis/ice_grid.F90
	cp $(SRCROOT)ice_sis/ice_grid.F90 .
./combined_ice_ocean_driver.F90: $(SRCROOT)ice_sis/combined_ice_ocean_driver.F90
	cp $(SRCROOT)ice_sis/combined_ice_ocean_driver.F90 .
./ice_bergs.F90: $(SRCROOT)ice_sis/ice_bergs.F90
	cp $(SRCROOT)ice_sis/ice_bergs.F90 .
./ice_model.F90: $(SRCROOT)ice_sis/ice_model.F90
	cp $(SRCROOT)ice_sis/ice_model.F90 .
./ice_thm.F90: $(SRCROOT)ice_sis/ice_thm.F90
	cp $(SRCROOT)ice_sis/ice_thm.F90 .
./ice_dyn.F90: $(SRCROOT)ice_sis/ice_dyn.F90
	cp $(SRCROOT)ice_sis/ice_dyn.F90 .
./ice_type.F90: $(SRCROOT)ice_sis/ice_type.F90
	cp $(SRCROOT)ice_sis/ice_type.F90 .
./ice_spec.F90: $(SRCROOT)ice_sis/ice_spec.F90
	cp $(SRCROOT)ice_sis/ice_spec.F90 .
SRC = $(SRCROOT)ice_sis/ice_spec.F90 $(SRCROOT)ice_sis/ice_model.F90 $(SRCROOT)ice_sis/rot.F90 $(SRCROOT)ice_sis/ice_bergs.F90 $(SRCROOT)ice_sis/ice_grid.F90 $(SRCROOT)ice_sis/mask.F90 $(SRCROOT)ice_sis/ice_type.F90 $(SRCROOT)ice_sis/ice_dyn.F90 $(SRCROOT)ice_sis/ice_thm.F90 $(SRCROOT)ice_sis/combined_ice_ocean_driver.F90
OBJ = ice_spec.o ice_model.o rot.o ice_bergs.o ice_grid.o mask.o ice_type.o ice_dyn.o ice_thm.o combined_ice_ocean_driver.o
OFF = $(SRCROOT)ice_sis/rot.F90 $(SRCROOT)ice_sis/mask.F90 $(SRCROOT)ice_sis/ice_grid.F90 $(SRCROOT)ice_sis/combined_ice_ocean_driver.F90 $(SRCROOT)ice_sis/ice_bergs.F90 $(SRCROOT)ice_sis/ice_model.F90 $(SRCROOT)ice_sis/ice_thm.F90 $(SRCROOT)ice_sis/ice_dyn.F90 $(SRCROOT)ice_sis/ice_type.F90 $(SRCROOT)ice_sis/ice_spec.F90
clean: neat
	-rm -f .libice_sis.a.cppdefs $(OBJ) libice_sis.a

neat:
	-rm -f $(TMPFILES)

localize: $(OFF)
	cp $(OFF) .

TAGS: $(SRC)
	etags $(SRC)

tags: $(SRC)
	ctags $(SRC)

libice_sis.a: $(OBJ)
	$(AR) $(ARFLAGS) libice_sis.a $(OBJ)

