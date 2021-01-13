@echo off
mode con cols=149 lines=53
Setlocal Enabledelayedexpansion
title Blue Nautilius OS
color 07

 cd %~dp0
 
 :deb
 
 set batbox="%~dp0Commandes_Externe\batbox.exe"
 set insertbmp="%~dp0Commandes_Externe\insertbmp.exe"
 set barre=0

rem Aceuil ---------------------------------------------------------------------------------------------------------------------------------------------
REM :useracceuil
REM cd %~dp0\Images\Interface
REM insertbmp /p:"acceuil.bmp" /x:0 /y:0 /z:100
REM insertbmp /p:"panda.bmp" /x:500 /y:130 /z:55
REM insertbmp /p:"fleche.bmp" /x:150 /y:26 /z:95
REM cd %~dp0

REM :user
REM !batbox! /c 0xF0 /g 69 31 /h 1
REM set /p user=
REM :motdepasse
REM !batbox! /c 0xF0 /g 69 37
REM set /p pass=
REM !batbox! /h 0
rem Bureau ---------------------------------------------------------------------------------------------------------------------------------------------

:bureau
 
 title Blue Nautilius OS
 !batbox! -h 0
 
 cls
 !insertbmp! /p:"Images\Interface\cls.bmp" /x:0 /y:0 /z:100

 :drawIcone
 cd %~dp0Utilisateur
 for /f "eol=# delims=" %%A in (Appli.ini) do set "%%A"
 for /f "eol=# delims=" %%A in (Constantes.ini) do set "%%A"
 cd %~dp0
 
 !insertbmp! /p:"Images\Fond_Ecran\fond0.bmp" /x:0 /y:0 /z:100
 
 for /l %%a in (1,1,16) do if not "!Icon_Path%%a!"=="" !insertbmp! /p:"!Icon_Path%%a!" /x:!iposx%%a! /y:!iposy%%a! /z:24
 

 call :batt
 call :setbat
 
 set "last_time=%time:~0,2%:%time:~3,2%"
 
 !batbox! -g 131 51 -c 0x80 -d "!Battery.RemainingCapacity!%%" -g 139 50 -c 0x80 -d " !last_time!  " -g 135 51  -a 186 -c 0x80 -d " !date!"
 
 :loopb
 set "current_time=%time:~0,2%:%time:~3,2%"
 
 if not !current_time!==!last_time! (
  set "last_time=!current_time!"
  set "current_time=%time:~0,2%:%time:~3,2%"
  !batbox! -g 131 51 -c 0x80 -d "!Battery.RemainingCapacity!%%" -g 139 50 -c 0x80 -d " !last_time!  " -g 135 51  -a 186 -c 0x80 -d " !date!"
 )
  
 for /f "tokens=1,2,3 delims=:" %%a in ('!batbox! /y') do (
  set c=%%c
  set y=%%b
  set x=%%a
 )
 
 if "!c!"=="1" goto :pos_icone
 if "!c!" GTR "6" if "%c%" LSS "100" goto :bureau
 
goto loopb

rem ----------------------------------------------------------------------------------------------------------------------------------------------------
rem                                                 FONCTION INTERFACE
rem ----------------------------------------------------------------------------------------------------------------------------------------------------

:batbox_m
 for /f "tokens=1,2,3 delims=:" %%a in ('!batbox! /m') do (
  set c=%%c
  set y=%%b
  set x=%%a
 )

goto :eof

:pos_icone

 If !x! gtr 5 if !x! LSS 16 if !y! GTR 2 if !y! LSS 9 call :start_appli 1
 If !x! GTR 23 if !x! LSS 35 if !y! GTR 2 if !y! LSS 9 call :start_appli 2
 If !x! GTR 41 if !x! LSS 53 if !y! GTR 2 if !y! LSS 9 call :start_appli 3
 If !x! GTR 59 if !x! LSS 71 if !y! GTR 2 if !y! LSS 9 call :start_appli 4
 If !x! GTR 77 if !x! LSS 89 if !y! GTR 2 if !y! LSS 9 call :start_appli 5
 If !x! GTR 95 if !x! LSS 107 if !y! GTR 2 if !y! LSS 9 call :start_appli 6
 If !x! GTR 113 if !x! LSS 125 if !y! GTR 2 if !y! LSS 9 call :start_appli 7
 If !x! GTR 131 if !x! LSS 143 if !y! GTR 2 if !y! LSS 9 call :start_appli 8
 
 If !x! gtr 5 if !x! LSS 16 if !y! GTR 12 if !y! LSS 19 call :start_appli 9
 If !x! GTR 23 if !x! LSS 35 if !y! GTR 12 if !y! LSS 19 call :start_appli 10
 If !x! GTR 41 if !x! LSS 53 if !y! GTR 12 if !y! LSS 19 call :start_appli 11
 If !x! GTR 59 if !x! LSS 71 if !y! GTR 12 if !y! LSS 19 call :start_appli 12
 If !x! GTR 77 if !x! LSS 89 if !y! GTR 12 if !y! LSS 19 call :start_appli 13
 If !x! GTR 95 if !x! LSS 107 if !y! GTR 12 if !y! LSS 19 call :start_appli 14
 If !x! GTR 113 if !x! LSS 125 if !y! GTR 12 if !y! LSS 19 call :start_appli 15
 If !x! GTR 131 if !x! LSS 143 if !y! GTR 12 if !y! LSS 19 call :start_appli 16
 
 if "!endthis!"=="1" set "endthis=0" & goto :bureau
 
 If !barre!==0 if !x! GTR 0 if !x! LSS 7 if !y! GTR 48 goto :barre_d'etat
 If !barre!==1 if !x! GTR 0 if !x! LSS 7 if !y! GTR 48 goto :nobarre
 
 REM set barre=0
 
 if !y! GTR 48 goto :bureau
 
goto :loopb


:start_appli <id_emplacement>

 if "!Appli_Name%1!"=="" goto :eof
 
 !insertbmp! /p:"!Icon_Selected_Path%1!" /x:!iposx%1! /y:!iposy%1! /z:24
  
 !batbox! /w 500
  
 if "!Chargement%1!"=="Active" (
 
  call :transition
 
  cd %~dp0!Appli_Path%1!
  call !Appli_Name%1!
  cd %~dp0
 
  set "endthis=1"
 
  goto :eof
  
 )
 
 if "!Chargement%1!"=="Start" (
 
  cd %~dp0!Appli_Path%1!
  start "" "!Appli_Name%1!"
  cd %~dp0
  
  !insertbmp! /p:"!Icon_Path%1!" /x:!iposx%1! /y:!iposy%1! /z:24
  
  goto :eof
  
 )

 goto :eof

:barre_d'etat
 
 call :bouttons
 
 !insertbmp! /p:"Images\Interface\etat_barre.bmp" /x:0 /y:301 /z:100
 
 set barre=1

goto loopb

:nobarre

 set barre=0

 !insertbmp! /p:"Images\Fond_Ecran\fond0_m.bmp" /x:0 /y:290 /z:100
 
goto :loopb

:transition
 cls
 
 !insertbmp! /p:"Images\Interface\cls.bmp" /x:0 /y:0 /z:100

 title Chargement
 
 for %%a in (a b c d e f g h i j k k2 l m n o p q r s t u) do (
  !insertbmp! /p:"Images\Chargement\%%a.bmp" /x:450 /y:180 /z:100
  ping localhost -n 00 > nul
 )
 
 !insertbmp! /p:"Images\Interface\cls.bmp" /x:0 /y:0 /z:100

 goto :eof

:setbat
 
 cd %~dp0\Images\Interface
 
 If /i "%Battery.PowerOnline%"=="TRUE" ( !insertbmp! /p:"batterie6.bmp" /x:979 /y:604 /z:55 ) else (

  If %Battery.RemainingCapacity% LSS 101 If %Battery.RemainingCapacity% GTR 90 !insertbmp! /p:"batterie1.bmp" /x:979 /y:604 /z:55
  If %Battery.RemainingCapacity% LSS 90 If %Battery.RemainingCapacity% GTR 60 !insertbmp! /p:"batterie2.bmp" /x:979 /y:604 /z:55
  If %Battery.RemainingCapacity% LSS 61 If %Battery.RemainingCapacity% GTR 40 !insertbmp! /p:"batterie3.bmp" /x:979 /y:604 /z:55
  If %Battery.RemainingCapacity% LSS 41 If %Battery.RemainingCapacity% GTR 15 !insertbmp! /p:"batterie4.bmp" /x:979 /y:602 /z:55
  If %Battery.RemainingCapacity% LSS 16 !insertbmp! /p:"batterie5.bmp" /x:979 /y:604 /z:55
 
 )
 
 cd %~dp0
 
 goto :eof

:bouttons

 !insertbmp! /p:"Images\Icone_Bureau\boutton - Selected.bmp" /x:4 /y:595 /z:100
 !batbox! /w 25
 !insertbmp! /p:"Images\Icone_Bureau\boutton.bmp" /x:4 /y:595 /z:100
 
goto :eof

:batt
 
 FOR /F "tokens=*  delims="  %%A IN ('WMIC /NameSpace:"\\root\WMI" Path BatteryStatus              Get PowerOnline^,RemainingCapacity  /Format:list ^| FIND "="')     DO SET  Battery.%%A
 FOR /F "tokens=*  delims="  %%A IN ('WMIC /NameSpace:"\\root\WMI" Path BatteryRuntime             Get EstimatedRuntime                /Format:list ^| FIND "="')     DO SET  Battery.%%A
 FOR /F "tokens=*  delims="  %%A IN ('WMIC /NameSpace:"\\root\WMI" Path BatteryFullChargedCapacity Get FullChargedCapacity             /Format:list ^| FIND "="')     DO SET  Battery.%%A
 FOR /F "tokens=1* delims==" %%A IN ('WMIC /NameSpace:"\\root\WMI" Path BatteryStatus              Get Charging^,Critical^,Discharging /Format:list ^| FIND "=TRUE"') DO set charg=%%A

 If /i not "%Battery.PowerOnline%"=="TRUE" SET /A Battery.EstimatedRuntime  = ( %Battery.EstimatedRuntime% + 30 ) / 60
 SET /A Battery.RemainingCapacity = ( %Battery.RemainingCapacity%00 + %Battery.FullChargedCapacity% / 2 ) / %Battery.FullChargedCapacity%

goto :eof


rem ------------------------------------------------------------------------------------------------------------------------------------------------------
rem                                       CODE DES PROGRAMME INTERNE
rem -----------------------------------------------------------------------------------------------------------------------------------------------------

:plusmoins
title Plus ou Moins - Nautilius
:debut
cls
COLOR 07
echo.
echo.
echo                                           ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»     
echo                                         ÉÍ¼                                                          ÈÍ»
echo                                         º                                                              º
echo                                         ÈÍ»                                                          ÉÍ¼
echo                                           ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo.
echo      ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo      º                                                                                                                             º
echo      º                                                                                                                             ÈÍÍÍ»       
echo      º                                                                                                                                 º       
echo      º                                                                                                                                 ÈÍÍÍ»  
echo      º                                        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                                          º
echo      º                                        ³                                                 ³                                          ÈÍÍÍ»
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ                                              º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ                                              º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º
echo      º                                                                                                                                         º 
echo      º                                        ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      º                                        ³                                                 ³                                              º
echo      ÈÍÍÍ»                                    ³                                                 ³                                              º
echo          º                                    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ                                              º
echo          ÈÍÍÍ»                                                                                                                                 º
echo              º                                                                                                                                 º
echo              ÈÍÍÍ»                                                                                                                             º
echo                  º                                                                                                                             º
echo                  ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼

!batbox! /g 56 4 /c 0x03 /d "Plus ou Moins -- Version Nautilius" /g 58 16 /d "Utilisateur" /g 72 17 /c 0x07 /d vs /g 78 18 /c 0x03 /d Machine /g 58 28 /d "Utilisateur" /g 72 29 /c 0x07 /d vs /g 78 30 /c 0x03 /d Utilisateur /g 64 41 /d "Retour au Bureau " /c 0x07 /d -- /g 61 41 /d -- /g 0 52
:loop
call :batbox_m

if !x! GTR 45 if !x! LSS 97 if !y! GTR 14 if !y! LSS 20 goto b
if !x! GTR 45 if !x! LSS 97 if !y! GTR 26 if !y! LSS 32 goto xx
if !x! GTR 45 if !x! LSS 97 if !y! GTR 38 if !y! LSS 44 goto bureau
goto loop

rem -----------------------------------------------------------------------

:cls1
set niv=1
set "clear1=                                                     "
!batbox! /g 44 14 /d "%clear1%" /g 44 15 /d "%clear1%" /g 44 16 /d "%clear1%" /g 44 17 /d "%clear1%" /g 44 18 /d "%clear1%" /g 44 19 /d "%clear1%" /g 44 20 /d "%clear1%" /g 58 28 /d "            " /g 72 29 /c 0x07 /d "  " /g 78 30 /c 0x03 /d "            " /g 64 41 /d "                 " /c 0x07 /d "   " /g 61 41 /d "    " /g 0 52

goto :eof

:b
call :cls1
!batbox! /g 62 29 /c 0x03 /d "Niveau personnaliser" /g 68 41 /c 0x03 /d "Retour " /c 0x07 /d "--" /g 65 41 /d "--" /g 52 14 /a 218 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 191 /g 52 20 /a 192 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 196 /a 217 /g 52 15 /a 179 /g 52 16 /a 179 /g 52 17 /a 179 /g 52 18 /a 179 /g 52 19 /a 179 /g 89 15 /a 179 /g 89 16 /a 179 /g 89 17 /a 179 /g 89 18 /a 179 /g 89 19 /a 179 /c 0x03 /g 47 17 /a 17 /a 196 /a 196 /g 91 17 /a 196 /a 196 /a 16 /c 0x03 /g 70 23 /d OU

:niveau
If %niv%==1 ( !batbox! /c 0x03 /g 67 17 /d "Niveau 1" 
set v=100
set /a n=%random%%%101 )

If %niv%==2 ( !batbox! /c 0x03 /g 67 17 /d "Niveau 2" 
set v=500
set /a n=%random%%%501 )

If %niv%==3 ( !batbox! /c 0x03 /g 67 17 /d "Niveau 3"
set v=1000
set /a n=%random%%%1001 )

!batbox! /g 0 52
:loop1
call :batbox_m

if !x! GTR 52 if !x! LSS 89 if !y! GTR 14 if !y! LSS 20 goto jeu
if !x! GTR 90 if !x! LSS 94 if !y!==17 goto mniv
if !x! GTR 45 if !x! LSS 97 if !y! GTR 26 if !y! LSS 32 goto per
if !x! GTR 45 if !x! LSS 97 if !y! GTR 38 if !y! LSS 44 goto debut
If !x! GTR 46 if !x! LSS 50 if !y!==17 goto nniv
goto loop1


:per
!batbox! /g 62 29 /d "                           " /c 0x03 /g 54 28 /d "Entrez le nombre maximal a chercher :" /g 79 28 /a 133
:t
!batbox! /g 54 30 /d "                                          " /c 0x03 /g 54 30
set /p "per=># "
If %per% GTR 5000 ( !batbox! /g 47 34 /c 0x0C /d "Le nombre est trop grand, entrez un autre nombre !" 
goto t )
If %per% LSS 11 ( !batbox! /g 47 34 /c 0x0C /d "Le nombre est trop petit, entrez un autre nombre !"
goto t )
set v=%per%
set /a n=%random%%%%per%
goto jeu

:nniv
If %niv%==1 ( set niv=3
goto niveau )
set /a niv-=1
goto niveau

:mniv
If %niv%==3 ( set niv=1
goto niveau )
set /a niv+=1
goto niveau

:jeu
cls 
set ndc=0
echo.
echo - Le but du jeu est de trouver le nombre en un minimum de coup.
echo.
set ndc=0
set /a r=%v%/2
:F
If %ndc%==%r% goto perdue
set /p nm=-- Entrez un nombre entre 1 et %v% : 
If /i "%nm%"=="code lyoko" goto gagner

If "%nm%"=="%n%" goto gagner
If "%nm%" LSS "%n%" goto sup
If "%nm%" GTR "%n%" goto inf
goto F

:sup
set /a ndc=%ndc%+1
echo - Le nombre mystere est [superieur].
goto F

:inf
set /a ndc=%ndc%+1
echo - Le nombre mystere est [inferieur].
goto F

:gagner
cd %~dp0
If not exist "Fichier Plus ou Moins" md "Fichier Plus ou Moins"  
cls
echo.
set /a ndc=%ndc%+1

If %v%==100 echo %name%-%ndc%-%date% >"%~dp0\Fichier Plus ou Moins\100.data" 
If %v%==500 echo %name%-%ndc%-%date% >"%~dp0\Fichier Plus ou MoiNs\500.data"
If %v%==1000 echo %name%-%ndc%-%date% >"%~dp0\Fichier Plus ou Moins\1000.data"
If not %v%==100 if not %v%==500 if not %v%==1000 echo %name%-%ndc%-%date%-%v% >"%~dp0\Fichier Plus ou Moins\libre.data"

echo -- Vous avez trouve le nombre mystere en [%ndc%] coups !
echo.
echo - Taper [r] Pour revenir au menu principal
echo - Taper [d] Pour revenir au menu des difficultes
echo - Taper [e] Pour quitter le jeu
echo.

:infi
echo -- Votre choix :
choice /c rde /n
If %errorlevel%==3 EXIT
If %errorlevel%==2 goto b
If %errorlevel%==1 goto debut

:perdue
echo Soit vous vous amusez avec votre clavier soit vous ˆtes d‚finitivement nul !
goto infi


:xx
cls
echo.
echo                       -- Mode Joueur contre Joueur --
echo.
echo - Chacun des deux joueurs vont a leur tour jouer au jeu du + ou -.
echo.
echo - Celui qui aura trouve le nombre mystere en moins de coup aura gagner.
echo.
echo - Avant de commencer :
echo.
set /p name1=-- Entrez le prenom du joueur 1 : 
set /p name2=-- Entrez le prÃ©nom du joueur 2 : 
cls
goto r1

:r1
set /a n1=%random%%%1001
set ndc1=0
echo.
echo - C'est a %name1% de commencer :
echo.
:F1
set /p nm1=-- Entrez un nombre entre 1 et 1000 : 
If /i "%nm1%"=="code lyoko" goto gagner1
If "%nm1%"=="%n1%" goto gagner1
If "%nm1%" LSS "%n1%" goto sup1
If "%nm1%" GTR "%n1%" goto inf1
goto F1

:sup1
set /a ndc1=%ndc1%+1
echo - Le nombre mystere est [superieur].
goto F1

:inf1
set /a ndc1=%ndc1%+1
echo - Le nombre mystere est [inferieur].
goto F1

:gagner1
cls
echo.
set /a ndc1=%ndc1%+1
echo Gagner !!
echo.
pause
cls 
goto r2

:r2
echo - C'est maintenant a %name2% de jouer.
echo.
set /a n2=%random%%%1001
set ndc2=0
goto F2

:F2
set /p nm2=-- Entrez un nombre entre 1 et 1000 : 
If /i "%nm2%"=="code lyoko" goto gagner2
If "%nm2%"=="%n2%" goto gagner2
If "%nm2%" LSS "%n2%" goto sup2
If "%nm2%" GTR "%n2%" goto inf2
goto F2

:sup2
set /a ndc2=%ndc2%+1
echo - Le nombre mystere est [superieur].
goto F2

:inf2
set /a ndc2=%ndc2%+1
echo - Le nombre mystere est [inferieur].
goto F2

:gagner2
cls
echo.
set /a ndc2=%ndc2%+1
echo Gagner !!
echo.
echo Appuyer sur une touche pour avoir les resultats ...
pause
cls
If %ndc2% LSS %ndc1% echo --- %name2% a gagne !
If %ndc1% LSS %ndc2% echo --- %name1% a gagne !
If %ndc1%==%ndc2% echo Egalite Parfaite !
echo.
echo - %name1% avait trouve le nombre en [%ndc1%] coups.
echo - %name2% avait trouve le nombre en [%ndc2%] coups.
echo.
echo.
echo - Taper [r] Pour revenir au menu principal
echo - Taper [e] Pour quitter le jeu
echo.
:infi2
echo -- Votre choix :
choice /c re /n
If %errorlevel%==2 EXIT
If %errorlevel%==1 goto debut

rem ----------------------------------------------------------------------------------------------------------------------------------------------------

:google
COLOR 07
title Google
set yy=1

:ss
!batbox! /h 0
cls
COLOR 07
cd %~dp0\Images\Interface
If %yy% LSS 3 !insertbmp! /p:"goog.bmp" /x:0 /y:0 /z:100
If %yy%==3 !insertbmp! /p:"YTB.bmp" /x:0 /y:0 /z:100
cd %~dp0

!batbox! /g 0 0 /c 0x07
echo.
echo      ÚÄÄÄÄÄÄÄÄÄ¿    ÚÄÄÄÄÄÄÄÄÄ¿    ÚÄÄÄÄÄÄÄÄÄ¿    ÚÄÄÄÄÄÄÄÄ¿
echo      ³         ³    ³         ³    ³         ³    ³        ³
echo      ³         ³    ³         ³    ³         ³    ³        ³
echo      ³         ³    ³         ³    ³         ³    ³        ³
echo      ÀÄÄÄÄÄÄÄÄÄÙ    ÀÄÄÄÄÄÄÄÄÄÙ    ÀÄÄÄÄÄÄÄÄÄÙ    ÀÄÄÄÄÄÄÄÄÙ

!batbox!  /c 0x07 /g 9 3 /d Web /g 23 3 /c 0x07 /d Image /g 38 3 /c 0x07 /d Video /g 41 3 /a 130 /g 49 6 /g 52 3 /c 0x07 /d "Retour" /g 0 6 /d "                                                        " 

If %yy%==1 !batbox! /g 10 6 /c 0x03 /a 30 /g 9 3 /d Web
If %yy%==2 !batbox! /g 25 6 /c 0x03 /a 30 /g 23 3 /d Image
If %yy%==3 !batbox! /g 40 6 /c 0x03 /a 30 /g 38 3 /d Video /g 41 3 /a 130
If %yy%==4 !batbox! /g 54 6 /c 0x03 /a 30 /g 52 3 /d Retour

:loopk

call :batbox_m

If !y! GTR 0 if !y! LSS 6 call :optiy
iF !x! GTR 34 if !x! LSS 115 if !y! GTR 32 if !y! LSS 36 goto sse
  
goto ss

:optiy
If !x! GTR 5 if !x! LSS 16 set yy=1
If !x! GTR 20 if !x! LSS 31 set yy=2
If !x! GTR 35 if !x! LSS 46 set yy=3
If !x! GTR 50 if !x! LSS 61 goto bureau
goto :eof

:sse
!batbox! /g 35 34 /c 0xF0 /d "                                                         " /g 35 34 /c 0xF0 /h 1
set /p search=
Set search=%search: =+%
If %yy%==1 start "" "https://www.google.fr/search?q=%search%&oq=%search%&aqs=chrome..69i57j69i59j0l4.2440j0j7&sourceid=chrome&ie=UTF-8"
If %yy%==2 start "" "https://www.google.fr/search?hl=fr&site=imghp&tbm=isch&source=hp&biw=1366&bih=638&q=%search%&oq=%search%&gs_l=img.3..0l10.78.392.0.773.3.3.0.0.0.0.359.359.3-1.1.0....0...1.1.64.img..2.1.358.TyQVnxh6SAk"
If %yy%==3 start "" "https://www.youtube.com/results?search_query=%search%+%search%"
goto ss
