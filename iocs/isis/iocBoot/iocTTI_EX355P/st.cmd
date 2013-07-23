#!../../bin/windows-x64/TTI_EX355P

< envPaths

epicsEnvSet "STREAM_PROTOCOL_PATH" "$(TOP)/../../ttiEX355PApp/protocol"
epicsEnvSet "P" "$(P=$(MYPVPREFIX))"
epicsEnvSet "R" "$(R=TTIEX355P)"
epicsEnvSet "TTY" "$(TTY=\\\\\\\\.\\\\COM1)"

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/TTI_EX355P.dbd"
TTI_EX355P_registerRecordDeviceDriver pdbbase

drvAsynSerialPortConfigure("L0", "$(TTY)", 0, 0, 0, 0)
asynSetOption("L0", -1, "baud", "9600")
asynSetOption("L0", -1, "bits", "8")
asynSetOption("L0", -1, "parity", "none")
asynSetOption("L0", -1, "stop", "1")

## Load record instances
#dbLoadRecords("$(TOP)/../../db/ttiEX355P.template","P=$(P)$(R),PORT=L0")
dbLoadRecords("$(TOP)/../../db/ttiEX355P.template","P=$(R),PORT=L0")

cd ${TOP}/iocBoot/${IOC}
iocInit

