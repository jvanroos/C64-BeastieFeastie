@echo OFF

IF EXIST CurrentBuild.txt GOTO Start
SET /p Build=""
ECHO %Build%>CurrentBuild.txt
ATTRIB +R +H CurrentBuild.txt

:Start
IF EXIST build\debug\ GOTO CreateRelease
md build\debug\

:CreateRelease
IF EXIST build\release GOTO Compile
md build\release\

:Compile

SET /p CurrentBuild=<CurrentBuild.txt
SET /a NewBuild=%CurrentBuild%+1
ATTRIB -R -H CurrentBuild.txt
ECHO %NewBuild% > CurrentBuild.txt
ATTRIB +R CurrentBuild.txt

REM for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyyMMdd_HHmm"') do set BUILD_DATE=%%i

CLS
tools\acme -v3 %1
REM acme.exe -v3 -o build\debug\main_%NewBuild%_%BUILD_DATE%.prg main.asm
REM acme -v3 -o build\debug\main_%NewBuild%.prg main.asm