REM ###clear the screen and then copy bumptop.exe to the dogfood directy
CLS 
IF EXIST "..\..\BTShExt\BTShExt\Release\BTShExt.dll" IF EXIST BTShExt.dll regsvr32 /u BTShExt.dll
IF EXIST "..\..\BTShExt\BTShExt\Release\BTShExt.dll" IF EXIST "%PROGRAMFILES%\BumpTop\BTShExt.dll" regsvr32 /u "%PROGRAMFILES%\BumpTop\BTShExt.dll"
IF EXIST "..\..\BTShExt\BTShExt\Release\BTShExt.dll" COPY "..\..\BTShExt\BTShExt\Release\BTShExt.dll" .
IF EXIST BTShExt.dll regsvr32 BTShExt.dll 
IF EXIST  "..\Release\BumpTop.exe" COPY "..\Release\BumpTop.exe" .
PAUSE

REM ###Delete the existing Quick Launch shortcut
del "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\BumpTop.lnk"

REM ###Create a new Quick Launch shortcut
xxmklink "%APPDATA%\Microsoft\Internet Explorer\Quick Launch\BumpTop.lnk" "%CD%\BumpTop.exe" "" "%CD%"

REM ###Delete the existing startup item
del "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\BumpTop.lnk"

REM ###Create a new startup item
xxmklink "%ALLUSERSPROFILE%\Start Menu\Programs\Startup\BumpTop.lnk" "%CD%\BumpTop.exe" "" "%CD%"

REM ###
REM ###
REM ###
REM ###
REM ###
REM ###TIMESTAMP CODE (from http://jgiors.wordpress.com/example-timestamp-batch-file/)
REM ###
REM ###
REM ###
REM ###
REM ###

for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
  set dow=%%i
  set month=%%j
  set day=%%k
  set year=%%l
)

for /f "tokens=1-4 delims=.: " %%i in ("%time%") do (
 set hour=%%i
 set minute=%%j
 set second=%%k
 set hundredth=%%l
)

if %hour% LSS 10 set hour=0%hour%

REM ###NOTE: Due to execution time, the following time
REM ###may vary a little from the previous.

REM ###-
REM ###Sample usages:
REM ###-

REM ###Today is %dow%
REM ###%year%-%month%-%day% %time%
REM ###%year%%month%%day%T%hour%%minute%%second%.%hundredth%
REM ###File_%year%-%month%-%day%_%hour%h_%minute%m_%second%s.txt
REM ###File____%year%-%month%-%day%____%time%.txt


REM ###
REM ###
REM ###Backup your scene file (a convoluted method that avoids prompts)
REM ###
REM ###

DEL "%TEMP%\scene.bump"
XCOPY /h "%APPDATA%\Bump Technologies, Inc\BumpTop\scene.bump" "%TEMP%"
ATTRIB -h "%TEMP%\scene.bump"
RENAME "%TEMP%\scene.bump" scene%month%-%day%___%hour%.%minute%.%second%.bump
ATTRIB +h "%TEMP%\scene%month%-%day%___%hour%.%minute%.%second%.bump"
XCOPY /h "%TEMP%\scene%month%-%day%___%hour%.%minute%.%second%.bump" "%APPDATA%\Bump Technologies, Inc\BumpTop\%"
DEL /ah "%TEMP%\scene%month%-%day%___%hour%.%minute%.%second%.bump"
