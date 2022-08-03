@echo off
TITLE Fix Throttling v1.2
echo ========================Fix Throttling v1.2========================
echo.
echo " >! Checking the powerprof.dll file..."
if exist %SystemRoot%\system32\powrprof.dll (
	GOTO Available
) else (
	GOTO NotAvailable
)

:LOOP
echo ===================================================================
echo " >! Power Plan Changes   : Balanced >>> Power Saver "
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo ===================================================================
timeout 1
echo ===================================================================
echo " >! Power Plan Changes   : Power Saver >>> Balanced "
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
echo ===================================================================
echo " ># The program will repeat in 10 minutes"
echo " ># Click minimize and continue playing the game"
timeout 600 /nobreak
echo ===================================================================
GOTO LOOP

:Available
echo " File in 'powrprof.dll' in  '%SystemRoot%\system32\' is Available"
timeout 5 && GOTO LOOP

:NotAvailable
echo " File in 'powrprof.dll' in  '%SystemRoot%\system32\' is not Available, press Enter to exit"
pause
exit