@ Echo off

Echo(

Echo BOAST ARCHITECTS 
Echo(
Echo Project Folders Creation

Echo(

Color f0

echo This will create a new project folder and a corrosponding folder on the 
echo the "Figures" drive with shortcuts to link them. 

pause

Echo(
Echo(

Set /p "_pro=Including the project number, please type project folder's name . . ."

Echo(
Echo( 

Echo If the name "%_pro%" is correct then continue, otherwise close this box.

Pause

MD "Q:\%_pro%"

If not exist "Q:\%_pro%" (
	Echo(
	Echo( 
	Echo ERROR You do not have access to the Figures drive. 
	Echo This must be performed by somebody that has access to the figures drive.
	Pause
	Exit
	)

MD "F:\%_pro%"

ROBOCOPY "F:\Job Folders Template\PUT PROJECT NAME HERE" "F:\%_pro%" /E

ROBOCOPY "Q:\NEW PROJECT FOLDER TEMPLATE\admin" "Q:\%_pro%" /E


set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "F:\%_pro%\Admin\9.0 Fees\Figures Shortcut.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "Q:\%_pro%" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
  
set SCRIPT="%TEMP%\%RANDOM%-%RANDOM%-%RANDOM%-%RANDOM%.vbs"

echo Set oWS = WScript.CreateObject("WScript.Shell") >> %SCRIPT%
echo sLinkFile = "Q:\%_pro%\Back to admin in the projects drive.lnk" >> %SCRIPT%
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> %SCRIPT%
echo oLink.TargetPath = "F:\%_pro%\Admin" >> %SCRIPT%
echo oLink.Save >> %SCRIPT%

cscript /nologo %SCRIPT%
del %SCRIPT%
  

Echo(
Echo(
Echo(
Echo(

@ Echo Proccess is complete

@ pause

