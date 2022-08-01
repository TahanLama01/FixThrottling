@echo off
TITLE Fix Brightness

echo ========================Fix Brightness========================
echo " >! Power Plan Changes: Balanced >>> Power Saver "
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo.
echo Set your brightness!
echo If it is set, Press any key . . .
echo.
pause>nul
echo " >! Power Plan Change: Power Saver >>> Balanced "
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
echo ===================================================================
timeout 1
exit
