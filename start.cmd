@echo off
SETLOCAL EnableDelayedExpansion

REM gets the values from  start.conf and place them into variables
FOR /f "delims== tokens=1,2,3,4,5,6,7,8,9" %%G IN (start.conf) DO SET %%G=%%H

REM checks for ktx files
IF EXIST "%cd%\etc\ktx\"%ktxfilename%".ktx" (
	ECHO F | XCOPY "%cd%\etc\ktx\"%ktxfilename%".ktx" "%cd%\kitty\Sessions\Default%%20Settings" /Y
) 
IF NOT EXIST "%cd%\etc\ktx\"%ktxfilename%".ktx" (
	ECHO F | XCOPY "%cd%\etc\ktx\default\Default*" "%cd%\kitty\Sessions\Default%%20Settings" /Y
)

REM prepares the run.txt - once the terminal is up, kitty will excute the content of the file to the remote host
DEL "%cd%\kitty\run.txt" /f /q
XCOPY "%cd%\etc\ini\run.txt" "%cd%\kitty\" /Y

IF "%authtype%" == "pw" GOTO :UNPW
IF "%authtype%" == "key" GOTO :KEYAUTH 
EXIT

:UNPW
IF "%deployzyxtools%" == "yes" (
CD "%cd%\kitty\"
START "" kitty.exe "%username%"@%host% -pw "%password%" -P %port% -title "%windowtitle%" -cmd run.txt
)

IF "%deployzyxtools%" == "no" (
START "" "%cd%\kitty\kitty.exe" "%username%"@%host% -pw "%password%" -P "%port%" -title "%windowtitle%"
)
EXIT

:KEYAUTH
REM checks the  key file
IF EXIST "%cd%\etc\key\"%keyname%".ppk" (
	SET privkey=%cd%\etc\key\%keyname%.ppk
) 
IF NOT EXIST "%cd%\etc\key\"%keyname%".ppk" (
	CLS
	ECHO Config Error: KEY DOES NOT EXIST
	PAUSE
	EXIT
)

IF "%deployzyxtools%" == "yes" (
CD "%cd%\kitty\"
START "" kitty.exe "%username%"@%host% -i "%privkey%" -P "%port%" -title "%windowtitle%" -cmd run.txt
)

IF "%deployzyxtools%" == "no" (
START "" "%cd%\kitty\kitty.exe" "%username%"@%host% -i "%privkey%" -P %port% -title "%windowtitle%"
)
EXIT
