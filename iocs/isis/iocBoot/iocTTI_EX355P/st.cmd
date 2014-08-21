#!../../bin/windows-x64/TTI_EX355P

< envPaths

epicsEnvSet "IOCNAME" "$(P=$(MYPVPREFIX))TTIEX355P"
epicsEnvSet "IOCSTATS_DB" "$(DEVIOCSTATS)/db/iocAdminSoft.db"

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../ttiEX355PApp/protocol"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\COM1)"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TTI_EX355P.dbd"
TTI_EX355P_registerRecordDeviceDriver pdbbase

#drvAsynSerialPortConfigure("L0", "$(TTY)", 0, 0, 0, 0)
#asynSetOption("L0", -1, "baud", "9600")
#asynSetOption("L0", -1, "bits", "8")
#asynSetOption("L0", -1, "parity", "none")
#asynSetOption("L0", -1, "stop", "1")

## Load record instances
dbLoadRecords("$(TOP)/../../db/ttiEX355P.db","P=$(IOCNAME):,PORT=L0")
#dbLoadRecords("$(IOCSTATS_DB)","IOC=$(IOCNAME)")

cd ${TOP}/iocBoot/${IOC}
iocInit

