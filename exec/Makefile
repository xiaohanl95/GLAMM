# Makefile for Experiment 'am4_glamm'
SRCROOT = ${BASEDIR}/src/
BUILDROOT = ${BASEDIR}/exec/
MK_TEMPLATE = ${BASEDIR}/exec/intel-classic.mk
include $(MK_TEMPLATE)

fms_am4_glamm.x: coupler/libcoupler.a ice_sis/libice_sis.a atmos_dyn/libatmos_dyn.a atmos_cubed_sphere/libatmos_cubed_sphere.a ice_param/libice_param.a mom6/libmom6.a atmos_phys/libatmos_phys.a land_lad2/libland_lad2.a fms/libfms.a
	$(LD) $^ $(LDFLAGS) -o $@ $(STATIC_LIBS)

fms/libfms.a:  FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=fms $(@F) 

atmos_phys/libatmos_phys.a: fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=atmos_phys $(@F) 

atmos_cubed_sphere/libatmos_cubed_sphere.a: atmos_phys/libatmos_phys.a fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=atmos_cubed_sphere $(@F) 

atmos_dyn/libatmos_dyn.a: atmos_cubed_sphere/libatmos_cubed_sphere.a atmos_phys/libatmos_phys.a fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=atmos_dyn $(@F) 

ice_sis/libice_sis.a: ice_param/libice_param.a mom6/libmom6.a fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=ice_sis $(@F) 

ice_param/libice_param.a: mom6/libmom6.a fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=ice_param $(@F) 

land_lad2/libland_lad2.a: fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=land_lad2 $(@F) 

mom6/libmom6.a: fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE) OPENMP="" --directory=mom6 $(@F) 

coupler/libcoupler.a: ice_sis/libice_sis.a atmos_dyn/libatmos_dyn.a ice_param/libice_param.a atmos_phys/libatmos_phys.a mom6/libmom6.a land_lad2/libland_lad2.a fms/libfms.a FORCE
	$(MAKE) SRCROOT=$(SRCROOT) BUILDROOT=$(BUILDROOT) MK_TEMPLATE=$(MK_TEMPLATE)  --directory=coupler $(@F) 

FORCE:

stage:
	install -d $(STAGEDIR)
	install -m 555 fms_am4_glamm.x $(STAGEDIR)

clean:
	$(MAKE) --directory=fms clean
	$(MAKE) --directory=atmos_phys clean
	$(MAKE) --directory=atmos_cubed_sphere clean
	$(MAKE) --directory=atmos_dyn clean
	$(MAKE) --directory=ice_sis clean
	$(MAKE) --directory=ice_param clean
	$(MAKE) --directory=land_lad2 clean
	$(MAKE) --directory=mom6 clean
	$(MAKE) --directory=coupler clean

localize:
	$(MAKE) -f $(BUILDROOT)fms/Makefile localize
	$(MAKE) -f $(BUILDROOT)atmos_phys/Makefile localize
	$(MAKE) -f $(BUILDROOT)atmos_cubed_sphere/Makefile localize
	$(MAKE) -f $(BUILDROOT)atmos_dyn/Makefile localize
	$(MAKE) -f $(BUILDROOT)ice_sis/Makefile localize
	$(MAKE) -f $(BUILDROOT)ice_param/Makefile localize
	$(MAKE) -f $(BUILDROOT)land_lad2/Makefile localize
	$(MAKE) -f $(BUILDROOT)mom6/Makefile localize
	$(MAKE) -f $(BUILDROOT)coupler/Makefile localize

distclean:
	$(RM) -r fms
	$(RM) -r atmos_phys
	$(RM) -r atmos_cubed_sphere
	$(RM) -r atmos_dyn
	$(RM) -r ice_sis
	$(RM) -r ice_param
	$(RM) -r land_lad2
	$(RM) -r mom6
	$(RM) -r coupler
	$(RM) fms_am4_glamm.x
	$(RM) Makefile

