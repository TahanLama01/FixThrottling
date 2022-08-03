@echo off
TITLE Fix Throttling v1.3

echo ========================Fix Throttling v1.3========================
echo.
echo " >! Checking the powerprof.dll file..."
if exist %SystemRoot%\system32\powrprof.dll (
	GOTO Available
) else (
	GOTO NotAvailable
)

:InputSeconds
echo.
echo " ># Press Enter to default Second 600 (10 Minute)"
set input_seconds=600
set /p input_seconds=Enter Seconds : 
set /a evaluation=input_seconds
if %evaluation% EQU %input_seconds% (
	if %input_seconds% GTR 0 (
		echo.
		goto Start
	)
	if %input_seconds% EQU 0 (
		echo.
		echo " >! This input (%input_seconds%) is a Zero number."
		echo " >! Please enter positive number" 
		set input_seconds=600 && GOTO InputSeconds
		)
    	if %input_seconds% LSS 0 (
		echo.
		echo " >! This input (%input_seconds%) is a Negative number."
		echo " >! Please enter positive number" 
		set input_seconds=600 && GOTO InputSeconds
	) 
) ELSE (
    	echo.
	echo " >! This input (%input_seconds%) is not a number"
	echo " >! Please enter positive number"
	set input_seconds=600 && GOTO InputSeconds
)

:Start
set i=1
set /a minute_d=%input_seconds% / 60
set /a second_m=%input_seconds% %% 60
echo " ># the program will run..."
timeout 3
GOTO LOOP

:Available
echo " ># File 'powrprof.dll' in '%SystemRoot%\system32\' is Available"
GOTO InputSeconds

:NotAvailable
echo " ># File 'powrprof.dll' in '%SystemRoot%\system32\' is not Available", press Enter to exit"
pause
exit

:LOOP
cls
echo				    Looping to - %i%
echo ===================================================================
echo " >! Power Plan Changes   : Balanced >>> Power Saver "
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo ===================================================================
timeout 1
echo ===================================================================
echo " >! Power Plan Changes   : Power Saver >>> Balanced "
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
echo ===================================================================
echo " ># The program will repeat in %minute_d% minutes %second_m% seconds"
echo " ># Click minimize and continue playing the game"
timeout %input_seconds% /nobreak
set /a i+=1
echo =======================================================================
GOTO LOOP