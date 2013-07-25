TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE
#=============================

#=============================
# Build the IOC application

PROD_IOC = TTI_EX355P
# TTI_EX355P.dbd will be created and installed
DBD += TTI_EX355P.dbd

# TTI_EX355P.dbd will be made up from these files:
TTI_EX355P_DBD += base.dbd

# Include dbd files from all support applications:
TTI_EX355P_DBD += stream.dbd
TTI_EX355P_DBD += asyn.dbd
TTI_EX355P_DBD += drvAsynSerialPort.dbd

# Add all the support libraries needed by this IOC
TTI_EX355P_LIBS += stream asyn pcre

# TTI_EX355P_registerRecordDeviceDriver.cpp derives from TTI_EX355P.dbd
TTI_EX355P_SRCS += TTI_EX355P_registerRecordDeviceDriver.cpp

# Build the main IOC entry point on workstation OSs.
TTI_EX355P_SRCS_DEFAULT += TTI_EX355PMain.cpp
TTI_EX355P_SRCS_vxWorks += -nil-

# Add support from base/src/vxWorks if needed
#TTI_EX355P_OBJS_vxWorks += $(EPICS_BASE_BIN)/vxComLibrary

# Finally link to the EPICS Base libraries
TTI_EX355P_LIBS += $(EPICS_BASE_IOC_LIBS)

#===========================

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

