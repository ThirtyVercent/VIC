@echo off

Echo This may take a while. The script is locating necessary files. THANK YOU FOR YOUR PATIENCE!

for /d /r %userprofile% %%a in (*) do if "%%~nxa"=="VMIS" set vmis=%%~dpnxa
if defined vmis (
cls
echo . %vmis%
echo .
echo . Success. File located and stored!
pause
Goto Begin
) else (
CLS
Echo =========================================================================================================
echo .  Something Went Wrong. Please make sure that the "VRC MULTI INSTANCE SCRIPT" Folder is located in 
echo .  the %userprofile% area. It can be in Documents, Desktop, Downloads, etc. 
Echo =========================================================================================================
Timeout 10
Exit
)

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



:Begin

CLS

Echo =========================================================================================================
Echo .	  	                 Welcome to VRC Multi instance starter!
Echo .
Echo .                This will help start VRC with multiple accounts on the same machine!
Echo .
Echo .    !!!I DO NOT TAKE ANY RESPONSIBILITY FOR USAGE OF THIS SCRIPT OR THE CONSEQUENCES THEREFORE!!!
Echo .                                       
Echo .                                       USE RESPONSIBLY
Echo =========================================================================================================
::+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
echo .
echo .   If you continue YOU AGREE TO THE ABOVE STATEMENT:
echo .
Echo =========================================================================================================
echo . 
echo .  Was there any change to the install directory in Steam for VRCHAT?
echo .
Echo . "If you don't know, choose 1. This will locate the default steam directory and find VRChat"
Echo .
Echo =========================================================================================================
echo .
echo 1) No
echo 2) Yes
set /p op=Type option:
if "%op%"=="1" goto op1
if "%op%"=="2" goto op2
:op1
goto CHK_DIR

:op2
goto SET_DIR

:op3
goto SEARCH

::+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:SET_DIR

CLS

::Set the directory manually as a variable and then switch to that directory to start profiling!

Echo =========================================================================================================
Echo . "Set the directory in format:"(DRIVE):\(Folders before Library)\SteamLibrary\steamapps\common\VRChat""
set /p "vrcdir=Enter Directory:"
echo . %vrcdir%
setx var_a %vrcdir%
Echo =========================================================================================================

Goto DIR_SET

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


:CHK_DIR

CLS
Echo =========================================================================================================
Echo . "THIS WILL CHECK YOU'RE DEFAULT STEAM DIRECTORY"
Echo .
Echo . "IT WILL LOOK SOMETHING LIKE THIS: C:\Program Files (x86)\Steam\steamapps\common\VRChat"
Echo =========================================================================================================
timeout 10

for /d /r "C:\Program Files (x86)\Steam\steamapps\common\VRChat" %%a in (*) do if "%%~nxa"=="EasyAntiCheat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto CHK_SUC
Timeout 10
) else (
CLS
Echo =========================================================================================================
echo .
echo .          Please make sure that you have ran VRChat at least once before running this script! 
echo .
echo .                              If you have, the directory maybe incorrect.
echo .
Echo .                         The Steam Directory for VRChat may have been altered!
Echo .                  Please read README.txt for help with locating the correct directory!
echo .        
Echo =========================================================================================================
Timeout 30
Goto Begin
)


::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



:DIR_SET

cd /d %vrcdir%
Echo =========================================================================================================
echo . directory check
dir
Echo =========================================================================================================
Timeout 10
CLS
Echo =========================================================================================================
Echo . STARTING CHECK FOR VRCHATS FILESYSTEM.
Echo =========================================================================================================
for /r %vrcdir% %%a in (*) do if "%%~nxa"=="VRChat.exe" set q=%%~dpnxa
if defined q (
echo %q%
echo Success
Timeout 10
Goto CHK_SUC
) else (
CLS
Echo =========================================================================================================
echo .
echo .        Please make sure that you have ran VRChat at least once before running this script! 
echo .
echo .                              If you have, the directory maybe incorrect.
Echo .
Echo =========================================================================================================
Timeout 10
Goto Begin
)
pause


::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


:CHK_SUC
@echo off
CLS
Echo =========================================================================================================
Echo . All Checks Successful
Echo . Attempting to move profiling files to VRChat
Echo =========================================================================================================

copy "%vmis%" %vrcdir%

for /r %vrcdir% %%a in (*) do if "%%~nxa"=="CheckMV.txt" set r=%%~dpnxa
if defined r (
echo %r%
echo MOVE SUCCESSFUL
Timeout 10
Goto MOVE
) else (
CLS
Echo =========================================================================================================
Echo .
Echo .                                             MOVE FAILED! 
Echo .
Echo .                         THIS MAYBE AN ISSUE IF NOT RAN WITH ELEVATED PERMISSIONS
Echo .
Echo .                                      PLEASE RUN AS ADMINISTRATOR
Echo .
Echo =========================================================================================================
Timeout 10
exit
)


:MOVE
move sp0.bat %vrcdir%
move sp1.bat %vrcdir%

Echo =========================================================================================================
Echo .
Echo .                                             MOVE COMPLETE! 
Echo .
Echo .                                     YOU MAY NOW EXIT THIS TERMINAL
Echo .
Echo .                                     TO START INSTANCES RUN STARTVRC.bat
Echo .
Echo =========================================================================================================

PAUSE

exit

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:SEARCH


ECHO . REMEMBER THIS WILL TAKE A WHILE AND ONLY SEARCHES DRIVES A:\ THROUGH G:\
ECHO .
ECHO . IT IS SAFE TO EXIT THIS PROGRAM AT ANY MOMENT DURING THIS SEARCH AS THERE IS NO WRITING OCCURING
ECHO .
ECHO . THIS WILL TAKE A WHILE
Echo .
Echo .
timeout 30

ECHO . <<< STARTING SEARCH >>>
@echo on
Goto SC


:SC
for /d /r C:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SA
)

:SA
for /d /r A:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SB
)

:SB
for /d /r B:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SD
)

:SD
for /d /r D:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SE
)

:SE
for /d /r E:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SF
)

:SF
for /d /r F:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto SG
)

:SG
for /d /r G:\ %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
if defined vrcdir (
echo %vrcdir%
echo Success
Goto DIR_SET
Timeout 10
) else (
goto NOSHOW
)

:NOSHOW
CLS

Echo . IT SEEMS THIS PROGRAM CANNOT FIND VRCHAT. PLEASE ATTEMPT TO FIND IT MANUALLY OR CHECK THAT IT IS INSTALLED. THE PROGRAM WILL NOW END.

timeout 10

Exit