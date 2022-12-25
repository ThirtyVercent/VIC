@echo off

for /d /r "C:\Program Files (x86)\Steam\steamapps\common" %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
echo %vrcdir%
echo Success
start launch.exe --profile=0
) else (
CLS
) 


exit
