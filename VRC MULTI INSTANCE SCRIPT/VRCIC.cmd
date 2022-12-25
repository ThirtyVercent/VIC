@echo off

Echo This may take a while. The script is locating necessary files.

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

::+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:SET_DIR

CLS

::Set the directory manually as a variable and then switch to that directory to start profiling!

Echo =========================================================================================================
Echo . "Set the directory in format:"(DRIVE):\(Folders before Library)\SteamLibrary\steamapps\common\VRChat""
Echo =========================================================================================================

set /p "vrcdir=Enter Directory: "
echo . %vrcdir%

Echo =========================================================================================================

Goto DIR_SET_NON

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


:CHK_DIR

CLS

Echo =========================================================================================================
Echo . "THIS WILL CHECK YOU'RE DEFAULT STEAM DIRECTORY"
Echo .
Echo . "IT WILL LOOK SOMETHING LIKE THIS: Program Files (x86)\Steam\steamapps\common\VRChat"
Echo =========================================================================================================

timeout 10

CLS

for /d /r "C:\Program Files (x86)\Steam\steamapps\common" %%a in (*) do if "%%~nxa"=="VRChat" set vrcdir=%%~dpnxa
echo %vrcdir%
echo Success
Timeout 10
CLS
Goto DIR_SET_DEF
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



:DIR_SET_DEF
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

for /r "%vrcdir%" %%a in (*) do if "%%~nxa"=="VRChat.exe" set q=%%~dpnxa
::if defined q (
echo %q%
echo Success

Timeout 10

CLS

Goto CHK_SUC_DEF

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


:DIR_SET_NON
CLS
echo %vrcdir%
setx var_a %vrcdir%
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

for /r "%vrcdir%" %%a in (*) do if "%%~nxa"=="VRChat.exe" set a=%%~dpnxa
::if defined a (
echo %a%
echo Success
Timeout 10

Goto CHK_SUC_NON

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


:CHK_SUC_DEF

@echo off

CLS

Echo =========================================================================================================
Echo . All Checks Successful
Echo . Attempting to move profiling files to VRChat
Echo =========================================================================================================

echo "%vrcdir%"
timeout 10
CLS
copy "%vmis%"\DEF "%vrcdir%"
timeout 10

echo MOVE SUCCESSFUL
Timeout 10
Goto MOVE_DEF


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


:CHK_SUC_NON
CLS
Echo =========================================================================================================
Echo . All Checks Successful
Echo . Attempting to move profiling files to VRChat
Echo =========================================================================================================
echo "%vrcdir%"
timeout 10
copy "%vmis%"\NON "%vrcdir%"
timeout 10
CLS


echo MOVE SUCCESSFUL
Timeout 10
Goto MOVE_NON
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

:MOVE_DEF
CLS
Echo =========================================================================================================
Echo .
Echo .                                             MOVE COMPLETE! 
Echo .
Echo .                                     YOU MAY NOW EXIT THIS TERMINAL
Echo .
Echo .                                  TO START INSTANCES RUN DEFAULTSTART.bat
Echo .
Echo =========================================================================================================
pause
exit

:MOVE_NON
CLS
Echo =========================================================================================================
Echo .
Echo .                                             MOVE COMPLETE! 
Echo .
Echo .                                     YOU MAY NOW EXIT THIS TERMINAL
Echo .
Echo .                               TO START INSTANCES RUN NONDEFAULTSTART.bat
Echo .
Echo =========================================================================================================
pause
exit

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
