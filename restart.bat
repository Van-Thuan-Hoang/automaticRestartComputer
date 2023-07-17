@echo OFF 

echo:
shutdown.exe /r /t 600
echo Window is restarting in 600 second.

:labelStart

echo:
echo To cancel, please enter 0
echo To lock, please enter 1
echo To shutdown, please enter 2
echo To set the waiting time, please enter number of seconds
echo:

set /p option=To change, please enter =
set /a select=option

if %select%==0 (
	shutdown.exe /a 
	echo The schedule is cancelled.
	timeout /t 5

	goto :labelEnd
) 

if %select%==1 (
	shutdown.exe /a
	timeout /t 1
	rundll32.exe user32.dll,LockWorkStation
	
	goto :labelEnd
) 

if %select%==2 (
	shutdown.exe /a	
	timeout /t 1
	shutdown.exe /s 
	goto :labelEnd
) else (

	shutdown.exe /a
	timeout /t 1
	shutdown.exe /r /t %select%
	cls
	echo:
	echo Window is restarting in %select% second.

	goto :labelStart
)

:labelEnd

