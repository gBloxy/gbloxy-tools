@echo off
SET TOOL_NAME=gla
SET TARGET_DIR=%USERPROFILE%\AppData\Local\Programs\Python\Scripts

:: Create target dir if it doesn't exist
IF NOT EXIST "%TARGET_DIR%" (
    mkdir "%TARGET_DIR%"
)

:: Copy and rename the tool
copy /Y "%TOOL_NAME%.py" "%TARGET_DIR%\%TOOL_NAME%.py"

:: Create a .bat launcher
echo @echo off > "%TARGET_DIR%\%TOOL_NAME%.bat"
echo python "%TARGET_DIR%\%TOOL_NAME%.py" %%* >> "%TARGET_DIR%\%TOOL_NAME%.bat"

:: Check if target dir is in PATH
echo %PATH% | find /I "%TARGET_DIR%" >nul
IF ERRORLEVEL 1 (
    echo.
    echo Add this to your PATH manually: %TARGET_DIR%
    echo (or set it temporarily with: set PATH=%%PATH%%;%TARGET_DIR%)
) ELSE (
    echo Installed %TOOL_NAME% to %TARGET_DIR% successfully.
)

pause
