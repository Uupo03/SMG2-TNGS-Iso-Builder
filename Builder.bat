@ECHO off
:Builder
echo Ver. 2.0
echo /=============================================================\
echo I Welcome to SMG2, The New Green Stars .iso builder by Uupo03 I
echo I     Make sure you have WIT (Wiimms ISO Tool) installed!     I
echo I                   What do you want to do?                   I
echo I                       1. Build a .iso                       I
echo I                  2. Change Game ID of .iso                  I
echo I                  3. Change TMD ID of .iso                   I
echo I              4. Change internal name of .iso                I
echo I  (3. Will make a Wii create a new save file for the mod.)   I
echo \=============================================================/

SET /P Input=Please enter 1, 2, 3 or 4: 
IF %Input% EQU 1 GOTO :Build_Iso
IF %Input% EQU 2 GOTO :Change_GameID
IF %Input% EQU 3 GOTO :Change_TMD
IF %Input% EQU 4 GOTO :Change_Name
CLS
GOTO :Builder
exit


:Build_Iso
CLS
echo /=====================================\
echo I Let's Start by choosing the .iso... I
echo \=====================================/
SET /P  isoFile=Please enter the name of your .iso file (e.g. SMG2.iso): 
if not defined isoFile GOTO :Build_Iso
if not exist ".\%isoFile%" (
	echo /====================================\
	echo I        .iso file not found         I
	echo I Press any key to enter a new name. I
	echo \====================================/
	pause >nul
	GOTO :Build_iso )

:Modded_File
CLS
echo /===============================================\
echo I What do you want the modded iso to be called? I
echo \===============================================/
SET /P moddedFile=Please enter the name you want (e.g. SMG2_modded.iso): 
if not defined moddedFile GOTO :Modded_File
if exist ".\%moddedFile%" (
	echo /====================================\
	echo I        File Already exists!        I
	echo I Press any key to enter a new name. I
	echo \====================================/
	pause >nul
	GOTO :Modded_File )

CLS
echo /=======================================\
echo I .iso file found, let's build the mod! I
echo I          Extracting files...          I
echo I        This will take a while.        I
echo \=======================================/
if exist ".\Temp\" (
	rmdir /s /q ".\Temp\" >nul )
wit EXTRACT ".\%isoFile%" ".\Temp" >nul

CLS	
color 04
echo /============================================================\
echo I          WIT (Wiimms ISO Tool), is not installed.          I
echo I Please download and install it from https://wit.wiimm.de/. I
echo I                   Press any key to exit.                   I
echo \============================================================/
if not exist  ".\Temp" (
	pause >nul
	exit
)

CLS
color 07
echo /=======================================\
echo I .iso file found, let's build the mod! I
echo I        Copying modded files...        I
echo I        This will take a while.        I
echo \=======================================/
if exist ".\Temp\DATA\" (
	xcopy ".\Mod Files\*" ".\Temp\DATA\files" /E /Y >nul
) else (
	xcopy ".\Mod Files\*" ".\Temp\files" /E /Y >nul
)

CLS
echo /=======================================\
   echo I .iso file found, let's build the mod! I
echo I        Building modded .iso...        I
echo I        This will take a while.        I
echo \=======================================/
wit COPY ".\Temp" ".\%moddedFile%" >nul
rmdir /s /q ".\Temp" >nul

CLS
echo /========================\
echo I         Done!          I
echo I Press any key to exit. I
echo \========================/
pause >nul
exit


:Change_GameID
CLS
echo /=====================================\
echo I Let's Start by choosing the .iso... I
echo \=====================================/
SET /P  isoFile=Please enter the name of your .iso file (e.g. SMG2.iso): 
if not defined isoFile GOTO :Change_GameID
if not exist ".\%isoFile%" (
	echo /====================================\
	echo I        .iso file not found         I
	echo I Press any key to enter a new name. I
	echo \====================================/
	pause >nul
	GOTO :Change_GameID )

:New_GameID
CLS
echo /===============================\
echo I Now just choose the new TID. I
echo \===============================/
SET /P  newGameID=Please enter the new Game ID (e.g. SB5E01 or TNGS01): 
if not defined newGameID GOTO :New_GameID
wit EDIT --id  %newGameID%  ".\%isoFile%" >nul

CLS
echo /========================\
echo I         Done!          I
echo I Press any key to exit. I
echo \========================/
pause >nul
exit



:Change_TMD
CLS
echo /=====================================\
echo I Let's Start by choosing the .iso... I
echo \=====================================/
SET /P  isoFile=Please enter the name of your .iso file (e.g. SMG2.iso): 
if not defined isoFile GOTO :Change_TMD
if not exist ".\%isoFile%" (
	echo /====================================\
	echo I        .iso file not found         I
	echo I Press any key to enter a new name. I
	echo \====================================/
	pause >nul
	GOTO :Change_TMD )

:New_TMD
CLS
echo /==============================\
echo I Now just choose the new TMD. I
echo \==============================/
SET /P  newTMD=Please enter the new TMD (e.g. SB5E or TNGS): 
if not defined newTMD GOTO :New_TMD
wit EDIT --tt-id  %newTMD%  ".\%isoFile%" >nul

CLS
echo /========================\
echo I         Done!          I
echo I Press any key to exit. I
echo \========================/
pause >nul
exit



:Change_Name
CLS
echo /=====================================\
echo I Let's Start by choosing the .iso... I
echo \=====================================/
SET /P  isoFile=Please enter the name of your .iso file (e.g. SMG2.iso): 
if not defined isoFile GOTO :Change_Name
if not exist ".\%isoFile%" (
	echo /====================================\
	echo I        .iso file not found         I
	echo I Press any key to enter a new name. I
	echo \====================================/
	pause >nul
	GOTO :Change_Name )

:New_Name
CLS
echo /===============================\
echo I Now just choose the new name. I
echo \===============================/
SET /P  newName=Please enter the new name (Max 63 characters): 
if not defined newName GOTO :New_Name
wit EDIT --name  %newName%  ".\%isoFile%" >nul

CLS
echo /========================\
echo I         Done!          I
echo I Press any key to exit. I
echo \========================/
pause >nul
exit

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	