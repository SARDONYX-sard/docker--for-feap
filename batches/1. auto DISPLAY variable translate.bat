@echo off

echo Dockerfile����DISPLAY=�̕����������ŏ��������A
echo Dockerfile.txt�����Ƃ�Dockerfile���쐬���܂��B
echo.
pause

for /f "tokens=1,2* usebackq delims=^:" %%i in (`ipconfig ^| findstr /n /r "." ^| findstr /r "IPv4 Address"`) DO @set IP=%%k

rem �擾����IP�A�h���X�O��̃X�y�[�X���폜
call :Trim %IP%

set BEFORE_STRING=172.27.224.1
set AFTER_STRING=%IP%

if exist Dockerfile rm -f Dockerfile

set INPUT_FILE=Dockerfile.txt
set OUTPUT_FILE=Dockerfile

setlocal enabledelayedexpansion
for /f "delims=" %%a in (%INPUT_FILE%) do (
set line=%%a
echo !line:%BEFORE_STRING%=%AFTER_STRING%!>>%OUTPUT_FILE%
)

echo.
echo Dockerfile�̏����������I���c



:Trim
set IP=%*
