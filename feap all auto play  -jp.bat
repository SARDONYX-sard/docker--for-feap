@echo off

echo Dockerfile����DISPLAY=�̕����������ŏ��������A
echo Dockerfile.txt�����Ƃ�Dockerfile���쐬���܂��B
SET /P ANSWER="��낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

EXIT


:yes
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
echo.
echo ������Dockerfile�����ƂɃC���[�W���쐬���܂��B
SET /P ANSWER="��낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

EXIT


:yes
:yes
docker build -t feappv-dev .


echo.
echo Dockerfile����C���[�W���쐬���܂����B
echo.
echo �����č쐬�����C���[�W����R���e�i�\���쐬���܂��B
echo.
SET /P ANSWER="��낵���ł��� (Y/N)�H"

if /i {%ANSWER%}=={y} (goto :yes)
if /i {%ANSWER%}=={yes} (goto :yes)

EXIT


:yes
docker run --name feappv5_1 -it -v %CD%:/feappv/decks/ feappv-dev

:Trim
set IP=%*
