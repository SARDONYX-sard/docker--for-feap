@echo off

echo ���Ȃ���IP�A�h���X�𒲂ׂ邽�߂̃o�b�`�ł��B
echo.
@pause

@ipconfig



for /f "tokens=1,2* usebackq delims=^:" %%i in (`ipconfig ^| findstr /n /r "." ^| findstr /r "IPv4 �A�h���X"`) DO @set IP=%%k

rem �擾����IP�A�h���X�O��̃X�y�[�X���폜
call :Trim %IP%

echo.
echo.
echo �ȉ����R�s�y���Ă��������B
echo.
echo export DISPLAY=%IP%:0.0
echo alias feap="/feappv/feappv-5.1.1c/main/feappv"
echo.

@pause

:Trim
set IP=%*