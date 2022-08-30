@echo off
TITLE Fix Throttling v1.1 (LITE)

:LOOP
cls
echo Balanced to Power Saver
powercfg /setactive a1841308-3541-4fab-bc81-f71556f20b4a
echo Power Saver to Balanced
powercfg /setactive 381b4222-f694-41f0-9685-ff5bb260df2e
timeout 600
GOTO LOOP
