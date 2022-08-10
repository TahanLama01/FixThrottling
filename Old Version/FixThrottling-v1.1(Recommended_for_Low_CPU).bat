@echo off
TITLE Fix Throttling v1.1

echo ========================Fix Throttling v1.1========================
timeout 3

:LOOP
echo.
echo ===================================================================
echo " >! Power Plan Changes: Balanced >>> Power Saver "
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo ===================================================================
timeout 1
echo ===================================================================
echo " >! Power Plan Change: Power Saver >>> Balanced "
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
echo ===================================================================
echo ===================================================================
echo " ># The program will repeat in 10 minutes"
echo " ># Click minimize and continue playing the game"
timeout 600 /nobreak
echo ===================================================================
echo.
GOTO LOOP
