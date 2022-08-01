@echo off
setlocal
title Change Management Power

set yourwindows=
for /F "tokens=4-5 delims=. " %%i in ('ver') do set WindowsVersion=%%i.%%j
goto CheckWindowsVersion

:Supported
set balanced=381b4222-f694-41f0-9685-ff5bb260df2e
set powersaver=a1841308-3541-4fab-bc81-f71556f20b4a
set subgroupGUID=54533251-82be-4824-96c1-47b60b740d00
set powersettingMinimum=893dee8e-2bef-41e0-89c6-b55d0929964c
set powersettingMaximum=bc5038f7-23e0-4960-96da-33abaf5935ec
set powersettingCooling=94d3a615-a899-4ac5-ae2b-e4d8f634367f
set subgroupDisplay=7516b95f-f776-4464-8c53-06167f40cc99
set powersettingDisplay=aded5e82-b909-4619-9949-f5d71dac0bcb
set bmin-dc=5
set bmin-ac=90
set bmax-dc=100
set bmax-ac=100
set psmin-dc=5
set psmin-ac=5
set psmax-dc=90
set psmax-ac=90
set allcooling=1

if %allcooling% == 1 (
	set statuscooling=Active
	goto setpower
) 
if %allcooling% == 0 (
	set statuscooling=Passive
	goto setpower
) else (
	echo Change allcooling to 1 or 0
	echo.
	goto quit
)

:setpower
Rem - Minimum processor state -DC / On battery
Rem - Minimum processor state -AC / plugged in
Rem - Maximum processor state -DC / On battery
Rem - Maximum processor state -AC / plugged in
powercfg /setdcvalueindex %balanced% %subgroupGUID% %powersettingMinimum% %bmin-dc%
powercfg /setacvalueindex %balanced% %subgroupGUID% %powersettingMinimum% %bmin-ac%
powercfg /setdcvalueindex %balanced% %subgroupGUID% %powersettingMaximum% %bmax-dc%
powercfg /setacvalueindex %balanced% %subgroupGUID% %powersettingMaximum% %bmax-ac%

Rem - Minimum processor state -DC / On battery
Rem - Minimum processor state -AC / plugged in
Rem - Maximum processor state -DC / On battery
Rem - Maximum processor state -AC / plugged in
powercfg /setdcvalueindex %powersaver% %subgroupGUID% %powersettingMinimum% %psmin-dc%
powercfg /setacvalueindex %powersaver% %subgroupGUID% %powersettingMinimum% %psmin-ac%
powercfg /setdcvalueindex %powersaver% %subgroupGUID% %powersettingMaximum% %psmax-dc%
powercfg /setacvalueindex %powersaver% %subgroupGUID% %powersettingMaximum% %psmax-ac%

if "%WindowsVersion%" == "10.0" (
	goto SetCoolingSystem
)
if "%WindowsVersion%" == "6.3" (
	goto SetCoolingSystem
)
if "%WindowsVersion%" == "6.2" (
	goto SetCoolingSystem
)
if "%WindowsVersion%" == "6.1" (
	goto SetCoolingSystem
)
if "%WindowsVersion%" == "6.0" (
	goto WindowsVista
)

:SetCoolingSystem
Rem - System Cooling Policy -DC / On battery
Rem - System Cooling Policy -AC / plugged in
Rem - System Cooling Policy -DC / On battery
Rem - System Cooling Policy -AC / plugged in
powercfg /setdcvalueindex %balanced% %subgroupGUID% %powersettingCooling% %allcooling%
powercfg /setacvalueindex %balanced% %subgroupGUID% %powersettingCooling% %allcooling%
powercfg /setdcvalueindex %powersaver% %subgroupGUID% %powersettingCooling% %allcooling%
powercfg /setacvalueindex %powersaver% %subgroupGUID% %powersettingCooling% %allcooling%
goto NotWindowsVista


:WindowsVista
ver && echo %yourwindows%
echo ===========================================================
echo Change Processor Power Management (BALANCED) is Success
echo Minimum processor state	:
echo 	-On battery : %bmin-dc%%%
echo 	-Plugged in : %bmin-ac%%%
echo.
echo Maximum processor state	:
echo 	-On battery : %bmax-dc%%%
echo 	-Plugged in : %bmax-ac%%%
echo ===========================================================
echo ===========================================================
echo Change Processor Power Management (Power Saver) is Success
echo Minimum processor state	:
echo 	-On battery : %psmin-dc%%%
echo 	-Plugged in : %psmin-ac%%%
echo.
echo Maximum processor state	:
echo 	-On battery : %psmax-dc%%%
echo 	-Plugged in : %psmax-ac%%%
echo ===========================================================
goto quit

:NotWindowsVista
ver && echo %yourwindows%
echo ===========================================================
echo Change Processor Power Management (BALANCED) is Success
echo Minimum processor state	:
echo 	-On battery : %bmin-dc%%%
echo 	-Plugged in : %bmin-ac%%%
echo.
echo System Cooling Policy	:
echo 	-On battery : %statuscooling%
echo 	-Plugged in : %statuscooling%
echo.
echo Maximum processor state	:
echo 	-On battery : %bmax-dc%%%
echo 	-Plugged in : %bmax-ac%%%
echo ===========================================================
echo ===========================================================
echo Change Processor Power Management (Power Saver) is Success
echo Minimum processor state	:
echo 	-On battery : %psmin-dc%%%
echo 	-Plugged in : %psmin-ac%%%
echo.
echo System Cooling Policy	:
echo 	-On battery : %statuscooling%
echo 	-Plugged in : %statuscooling%
echo.
echo Maximum processor state	:
echo 	-On battery : %psmax-dc%%%
echo 	-Plugged in : %psmax-ac%%%
echo ===========================================================
goto quit

:quit
echo Press any key to exit . . . 
pause>nul
exit


:CheckWindowsVersion
if "%WindowsVersion%" == "10.0" (
	set yourwindows=Windows 10/11
	goto Supported
)
if "%WindowsVersion%" == "6.3" (
	set yourwindows=Windows 8.1 - %WindowsVersion%
	goto Supported
)
if "%WindowsVersion%" == "6.2" (
	set yourwindows=Windows 8 - %WindowsVersion%
	goto Supported
)
if "%WindowsVersion%" == "6.1" (
	set yourwindows=Windows 7 - %WindowsVersion%
	goto Supported
)
if "%WindowsVersion%" == "6.0" (
	set yourwindows=Windows Vista - %WindowsVersion%
	goto Supported
) else (
	ver
	echo Your Windows is not supported
	echo.
	goto quit
)