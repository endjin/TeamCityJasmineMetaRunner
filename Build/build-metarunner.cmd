MKDIR %~dp0..\Drops
MKDIR %~dp0..\Drops\Temp

XCOPY /E /Y "%~dp0..\Solutions\*.*" "%~dp0..\Drops\Temp"

@PowerShell -File "%~dp0Create-Zip.ps1" %~dp0..\Drops\Temp\agent\ %~dp0..\Drops\Temp\agent\jasmine-metarunner.zip

DEL "%~dp0..\Drops\Temp\agent\*.xml"
RMDIR "%~dp0..\Drops\Temp\agent\bin" /S /Q

@PowerShell -File "%~dp0Create-Zip.ps1" -target %~dp0..\Drops\Temp\ %~dp0..\Drops\jasmine-metarunner.zip

RMDIR "%~dp0..\Drops\Temp\" /S /Q

PAUSE