
:explorateur
set bur=0
:: ###~ HEAD
  @echo off
  mode con cols=149 lines=53
  title Nautilius Exploreur
  Setlocal Enabledelayedexpansion
 
  :: ###~ VAR
   set CurrentPage=1
   set CurrentFolder=%userprofile%\Desktop\
   set batbox="%~dp0\batbox.exe"
   set Desktop=%userprofile%\Desktop\
   set Favoris=%userprofile%\Favoris\
 
   rem UI1 : zone centrale, l?  o๙ seront affich้s les dossiers et les fichiers
     set UI1.Name=DisplayFileFolder
     set UI1.Size=60
     set UI1.Clear=
     for /l %%t in (1,10,!UI1.Size!) do set "UI1.Clear=!UI1.Clear!          "
   
   rem UI2 : zone en bas de la fen๊tre, l?  o๙ seront affich้s les diff้rents messages
     set UI2.Name=DisplayMessage
     set UI2.Size=140
     set UI2.Clear=
     for /l %%t in (1,10,!UI2.Size!) do set "UI2.Clear=!UI2.Clear!          "
     set UI2.Clear=!UI2.Clear:~0,-3!
   
   rem UI3 : petite zone tout ?  droite de la fen๊tre
     set UI3.Name=Display
     set UI3.Size=40
     set UI3.Clear=
     for /l %%t in (1,10,!UI3.Size!) do set "UI3.Clear=!UI3.Clear!          "
     set "UI3.Clear=!UI3.Clear!   "
   

	 
:setvar	 
set colorClear=0
set color1=3
set color2=7

set maxLengthName=6
set maxItemPerRow=4
set maxLine=3
set marginBetweenItemX=15
set marginBetweenItemY=10
set decalX=-5
set decalY=-1
 
   
   
   
   
:Icone
   rem Syst่me d'icone
     
     set FOLDER.color=7
     set FOLDER.form.ligne1=/a 219 /a 219 /a 220
     set FOLDER.form.ligne2=/a 219 /a 219 /a 219
     set FOLDER.form.ligne3=/a 219 /a 219 /a 223
     
     
     set extension.list=bat cmd txt exe
         
         rem Syntaxe :
        rem   Remplace [EXTENSION] par l'extension de ton choix puis ajoute l?  ?  la variable %extension.list% ci-dessus
       
         rem !color2!  ---->  Couleur par d้faut
         
         set extension.[EXTENSION].color=!color1!
         set extension.[EXTENSION].text=
         set extension.[EXTENSION].form.ligne1=/a 220 /a 220 /a 219
         set extension.[EXTENSION].form.ligne2=/a 219 /a 219 /a 219
         set extension.[EXTENSION].form.ligne3=/a 219 /a 219 /a 219 
       
         
         rem Icone non reconnu
           set extension.DEFAULT.color=!color1!
           set extension.DEFAULT.text=
           set extension.DEFAULT.form.ligne1=/a 220 /a 220 /a 219
           set extension.DEFAULT.form.ligne2=/a 219 /a 219 /a 219
           set extension.DEFAULT.form.ligne3=/a 219 /a 219 /a 219 
       
         rem [FILE].bat
           set extension.bat.color=3
           set extension.bat.text=
           set extension.bat.form.ligne1=/a 220 /a 220 /a 219 
           set extension.bat.form.ligne2=/a 219 /a 219 /a 219
           set extension.bat.form.ligne3=/a 219 /a 219 /a 219
       
         rem [FILE].cmd
           set extension.cmd.color=3
           set extension.cmd.text=
           set extension.cmd.form.ligne1=/a 220 /a 220 /a 219
           set extension.cmd.form.ligne2=/a 219 /a 219 /a 219
           set extension.cmd.form.ligne3=/a 219 /a 219 /a 219
       
         rem [FILE].txt
           set extension.txt.color=3
           set extension.txt.text=
           set extension.txt.form.ligne1=/a 220 /a 220 /a 219
           set extension.txt.form.ligne2=/a 219 /a 219 /a 219
           set extension.txt.form.ligne3=/a 219 /a 219 /a 219
       
         rem [FILE].exe
           set extension.exe.color=3
           set extension.exe.text=
           set extension.exe.form.ligne1=/a 220 /a 220 /a 219 
           set extension.exe.form.ligne2=/a 219 /a 219 /a 219
           set extension.exe.form.ligne3=/a 219 /a 219 /a 219
       
         
         
         rem Compil้ -->
        rem Extension li้ ?  la vid้o et ?  la music
         set extension.list=!extension.list! mp4 avi mkv mov mp3 wav ogg
        rem [FILE].mp4
           set extension.mp4.color=1&set extension.mp4.text=&set extension.mp4.form.ligne1=/a 220 /a 220 /a 219&set extension.mp4.form.ligne2=/a 219 /a 219 /a 219&set extension.mp4.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].avi
           set extension.avi.color=1&set extension.avi.text=&set extension.avi.form.ligne1=/a 220 /a 220 /a 219&set extension.avi.form.ligne2=/a 219 /a 219 /a 219&set extension.avi.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].mkv
           set extension.mkv.color=1&set extension.mkv.text=&set extension.mkv.form.ligne1=/a 220 /a 220 /a 219&set extension.mkv.form.ligne2=/a 219 /a 219 /a 219&set extension.mkv.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].mov
           set extension.mov.color=1&set extension.mov.text=&set extension.mov.form.ligne1=/a 220 /a 220 /a 219&set extension.mov.form.ligne2=/a 219 /a 219 /a 219&set extension.mov.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].mp3
           set extension.mp3.color=1&set extension.mp3.text=&set extension.mp3.form.ligne1=/a 220 /a 220 /a 219&set extension.mp3.form.ligne2=/a 219 /a 219 /a 219&set extension.mp3.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].wav
           set extension.wav.color=1&set extension.wav.text=&set extension.wav.form.ligne1=/a 220 /a 220 /a 219&set extension.wav.form.ligne2=/a 219 /a 219 /a 219&set extension.wav.form.ligne3=/a 219 /a 219 /a 219
        rem [FILE].ogg
           set extension.ogg.color=1&set extension.ogg.text=&set extension.ogg.form.ligne1=/a 220 /a 220 /a 219&set extension.ogg.form.ligne2=/a 219 /a 219 /a 219&set extension.ogg.form.ligne3=/a 219 /a 219 /a 219
 
   
   
   
   rem C'est ici que tu rajoutes des zones cliquables :
:eventListener
   rem Liste des EventListeners :
     set EventListener.TurnPage.Left=notActive
     set EventListener.TurnPage.Right=notActive
   
     
     rem Voici la syntaxe :
     
      rem set EventListener.Button.[NAME]=Active
      rem        set EventListener.Button.[NAME].Function=call :Function.Button.[NAME]
     rem        set EventListener.Button.[NAME].minX=10
     rem        set EventListener.Button.[NAME].maxX=21
     rem        set EventListener.Button.[NAME].minY=27
     rem        set EventListener.Button.[NAME].maxY=30
     
       
       
       
      rem     1ER LIGNE                  MinY
     rem     2EME LIGNE                 |
     rem     ETC            -----------------------
     rem                   |           +(2)        |
     rem          MinX-->  |+(1)               (3)+| <--MaxX
     rem                   |           +(4)        |
     rem                    -----------------------
     rem                             |      
     rem                             MaxY
     
      rem Calcul ?  la main (en comptant) la positon des "+"
     rem Soit dans notre exemple :
     
      rem +(1) : X=18
     rem +(2) : Y=4
     rem +(3) : X=40
     rem +(4) : Y=6
     
      rem Le nombre le plus petit est le minimum et le plus grand est le maximum,
     rem Si on traduit ็a en Batch, ็a donne :
     
      rem set EventListener.Button.MonPremierBouton=Active     <----- Ceci permet d'activer le bouton, il suffit de mettre autre chose que "Active" pour le d้sactiver
     rem set EventListener.Button.MonPremierBouton.Function=call :Function.Button.MonPremierBouton
     rem        set EventListener.Button.MonPremierBouton.minX=18
     rem        set EventListener.Button.MonPremierBouton.maxX=40
     rem        set EventListener.Button.MonPremierBouton.minY=4
     rem        set EventListener.Button.MonPremierBouton.maxY=6
 
 
 
     set list.Event=Web Cmd Recherche Bureau Racine Favoris terminal CommandProcessus
   
       rem Web
       set EventListener.Button.Web=Active
             set EventListener.Button.Web.Function=call :Function.Button.Web
            set EventListener.Button.Web.minX=10
            set EventListener.Button.Web.maxX=21
            set EventListener.Button.Web.minY=27
            set EventListener.Button.Web.maxY=30
     
      rem Cmd
       set EventListener.Button.Cmd=Active
             set EventListener.Button.Cmd.Function=call :Function.Button.Cmd
            set EventListener.Button.Cmd.minX=9
            set EventListener.Button.Cmd.maxX=20
            set EventListener.Button.Cmd.minY=31
            set EventListener.Button.Cmd.maxY=34
     
      rem Recherche
       set EventListener.Button.Recherche=Active
             set EventListener.Button.Recherche.Function=call :Function.Button.Recherche
            set EventListener.Button.Recherche.minX=9
            set EventListener.Button.Recherche.maxX=20
            set EventListener.Button.Recherche.minY=35
            set EventListener.Button.Recherche.maxY=38
 
       rem Bureau
      set EventListener.Button.Bureau=Active
             set EventListener.Button.Bureau.Function=call :Function.Button.Bureau
            set EventListener.Button.Bureau.minX=9
            set EventListener.Button.Bureau.maxX=20
            set EventListener.Button.Bureau.minY=6
            set EventListener.Button.Bureau.maxY=8
 
       rem Racine
       set EventListener.Button.Racine=Active
             set EventListener.Button.Racine.Function=call :Function.Button.Racine
            set EventListener.Button.Racine.minX=9
            set EventListener.Button.Racine.maxX=20
            set EventListener.Button.Racine.minY=12
            set EventListener.Button.Racine.maxY=13
 
       rem Favoris
      set EventListener.Button.Favoris=Active
             set EventListener.Button.Favoris.Function=call :Function.Button.Favoris
            set EventListener.Button.Favoris.minX=9
            set EventListener.Button.Favoris.maxX=20
            set EventListener.Button.Favoris.minY=18
            set EventListener.Button.Favoris.maxY=20
 
       rem Terminal
      set EventListener.Button.terminal=Active
             set EventListener.Button.terminal.Function=call :Function.Button.terminal
            set EventListener.Button.terminal.minX=6
            set EventListener.Button.terminal.maxX=143
            set EventListener.Button.terminal.minY=45
            set EventListener.Button.terminal.maxY=54
 
       rem le [X]
       set EventListener.Button.CommandProcessus=Active
              set EventListener.Button.CommandProcessus.Function=call :Function.Button.CommandProcessus
              set EventListener.Button.CommandProcessus.minX=95
              set EventListener.Button.CommandProcessus.maxX=135
              set EventListener.Button.CommandProcessus.minY=7
              set EventListener.Button.CommandProcessus.maxY=7
 
   
  :: ###~ VAR_END
:: ###~ HEAD
 

 
:: ###~ BODY
  call :DrawUI 2>nul
  call :updateUI 2>nul
  call :startEventListener 2>nul
:: ###~ BODY
 
 
:: ###~ FOOT
  goto :eof
 
  :Navigate <path> <t>
    set tmp1=%~1
   call :RealName
    if "%~2"==".." (
     set temp_=!tmp1!
     set temp_2=!temp_:~3,1!
     if not "!temp_2!"=="." (
       set temp_=!temp_:~0,-3!
       for %%p in ("!temp_!") do (
         set temp=%%~nxp
         for %%t in (!temp!) do set CurrentFolder=!CurrentFolder:%%t=!
        set CurrentFolder=!CurrentFolder:~0,-1!
       )
     )
   ) else (
     set CurrentFolder=!tmp1!\
   )
   set CurrentPage=1
   call :updateUI 2>nul
  goto :eof
 
 
  :updateUI <page>
    call :clearUI1 2>nul
   call :resetEventListenerItem 2>nul
   set tempPage=1
   set addItemTemp=0
   if not "%~1"=="" set tempPage=%~1
   if "!tempPage!"=="1" set addItemTemp=1
   set /a posX=1+!addItemTemp!
   set posY=1
   set /a tempnb=1+!addItemTemp!
   set tempDisplay=FALSE&set tempEnd=FALSE
   set CurrentPage=!tempPage!
   set /a queryTempnb=1+!addItemTemp!
   set TotalDisplayItem=!addItemTemp!
   set /a tempTotalItem=!maxLine!*!maxItemPerRow!*!tempPage!+1-!maxLine!*!maxItemPerRow!+!addItemTemp!
   set tempFolder=!CurrentFolder:~55,1!
   if not "!tempFolder!"=="" ( set tempFolder=!CurrentFolder:~0,52!.. ) else ( set tempFolder=!CurrentFolder! )
   !batbox! /c 0x0!color1! /g 27 8 /d "                                                      " /g 27 8 /d "!tempFolder!"
   if "!addItemTemp!"=="1" (
     call :DrawFolderFile "back" "." "." "1" "1" !maxLengthName! !marginBetweenItemX! !marginBetweenItemY! 2>nul
      call :AddEventListenerItem "back" "." "." "1" "1" !maxLengthName! !marginBetweenItemX!  !marginBetweenItemY! 1 2>nul
   )
    for /f "tokens=*" %%d in ('dir /b /o /n "!CurrentFolder!"') do (
     if "!tempEnd!"=="FALSE" (
       if !tempnb! GEQ !tempTotalItem! (
        set tempDisplay=TRUE
       ) else (
        set tempDisplay=FALSE
        )
       if "!tempDisplay!"=="TRUE" (
         if exist !CurrentFolder!\%%~nxd\nul (
          set typeTemp=folder
         ) else (
          set typeTemp=file
         )
        set Tmp1=%%~nd
        set Tmp2=%%~xd
        call :CleanName
         call :DrawFolderFile "!typeTemp!" "!Tmp1!" "!Tmp2!" "!posX!" "!posY!" !maxLengthName! !marginBetweenItemX!  !marginBetweenItemY! 2>nul
        call :AddEventListenerItem "!typeTemp!" "!Tmp1!" "!Tmp2!" "!posX!" "!posY!" !maxLengthName! !marginBetweenItemX!  !marginBetweenItemY! !queryTempnb! 2>nul
         set /a queryTempnb+=1
        set /a tempposX=!posX! %% !maxItemPerRow!
         if "!tempposX!"=="0" (
           set posX=1
          set /a posY+=1
         ) else (
           set /a posX+=1
         )
         set /a tempposY=!posY!-1
         if "!maxLine!"=="!tempposY!" ( set tempDisplay=FALSE&set tempEnd=TRUE )
        set /a tempTotalItem+=1
       )
     )
     set /a tempnb+=1
   )
   set /a TotalDisplayItem=!tempTotalItem!-1
   set /a tempTotalItem=!tempnb!-1
   call :updatePage 2>nul
  goto :eof
  :updatePage
   set /a temp=!maxLine!*!maxItemPerRow!&set /a totalPage=!tempTotalItem!/!temp!&set /a totalPage+=1
   set /a temp2=!tempTotalItem! %% !temp!
   if "!temp2!"=="0" set /a totalPage-=1
   if !CurrentPage! GTR 1 (
     !batbox! /c 0x0!color1! /g 28 39 /d "[P] <" /a 196
     set EventListener.TurnPage.Left=Active
   )
    !batbox! /g 45 39 /c 0x0!color1! /a 196 /a 196 /d " Page !CurrentPage! / !totalPage! " /a 196 /a 196
   if !CurrentPage! LSS !totalPage! (
     !batbox! /g 75 39 /c 0x0!color1! /a 196 /d "> [S]"
     set EventListener.TurnPage.Right=Active
   )
    !batbox! /g 97 24 /c 0x0!color2!
  goto :eof
 
 
  :CleanName
    set Tmp1=!Tmp1:(=458GTH52F.dfdD5D6Q!
   set Tmp1=!Tmp1:)=458GTH52F.dfdD5D6O!
   if not "!Tmp2!"=="" (
     set Tmp2=!Tmp2:^(=458GTH52F.dfdD5D6Q!
     set Tmp2=!Tmp2:^)=458GTH52F.dfdD5D6O!
   )
  goto :eof
  :RealName
    set Tmp1=!Tmp1:458GTH52F.dfdD5D6Q=(!
   set Tmp1=!Tmp1:458GTH52F.dfdD5D6O=)!
  goto :eof
 
 
 
  :startEventListener
 If !bur!==1 goto :eof
 
  !batbox! /g 0 52
   for /f "tokens=1,2,3 delims=:" %%a in ('!batbox! /m') do (
      set c=%%c
      set y=%%b
      set x=%%a
    )
   
   call :clearUI2 2>nul
   call :clearUI3 2>nul
   
   rem CLICK ----------------------------------------------------------------------------
   if "!c!"=="1" (
     if /i "!EventListener.TurnPage.Left!"=="Active" (
       if !x! GEQ 28 if !x! LEQ 34 if !y! EQU 39 (
        if not "!CurrentPage!"=="1" set /a CurrentPage-=1
        call :updateUI !CurrentPage! 2>nul
        goto :break_1
      )
     )
     if /i "!EventListener.TurnPage.Right!"=="Active" (
       if !x! GEQ 75 if !x! LEQ 81 if !y! EQU 39 (
        if not !CurrentPage! GEQ !totalPage! set /a CurrentPage+=1
        call :updateUI !CurrentPage! 2>nul
        goto :break_1
      )
     )
     
     for /l %%c in (1,1,!TotalDisplayItem!) do (
       if /i "!EventListener.Item.%%c!"=="Active" (
         if !x! GEQ !EventListener.Item.%%c.minX! if !x! LEQ !EventListener.Item.%%c.maxX! if !y! GEQ !EventListener.Item.%%c.minY! if !y! LEQ !EventListener.Item.%%c.maxY! (
          call :onClickItem %%c 2>nul
         goto :break_1
        )
       )
     )
     
     for %%b in (!list.Event!) do (
       if /i "!EventListener.Button.%%b!"=="Active" (
        if !x! GEQ !EventListener.Button.%%b.minX! if !x! LEQ !EventListener.Button.%%b.maxX! if !y! GEQ !EventListener.Button.%%b.minY! if !y! LEQ !EventListener.Button.%%b.maxY! (
          !EventListener.Button.%%b.Function!
         goto :break_1
        )
      )
     )
     
   )
  rem End_CLICK ------------------------------------------------------------------------
   :break_1
  goto :startEventListener
  :AddEventListenerItem <type> <name> <ext> <X <Y <maxLenght> <MarginX> <MarginY> <ID>
    set EventListener.Item.%~9=Active
   set /a EventListener.Item.%~9.minX=20+%~7*%~4+!decalX!-3
   set /a EventListener.Item.%~9.minY=13-%~8+%~8*%~5+!decalY!
   set /a EventListener.Item.%~9.maxX=!EventListener.Item.%~9.minX!+8
   set /a EventListener.Item.%~9.maxY=!EventListener.Item.%~9.minY!+5
   set EventListener.Item.%~9.Name=%~2%~3
   set EventListener.Item.%~9.Type=%~1
   set EventListener.Item.%~9.AbsolutePath=!CurrentFolder!%~2%~3
  goto :eof
  :resetEventListenerItem
   set /a temp=!maxLine!*!maxItemPerRow!
    for /l %%r in (1,1,!temp!) do (
     set EventListener.Item.%%r=notActive
   )
  goto :eof
 
 
 
  :onClickItem
    set cbatbox=/c 0x03 /d "Vous avez cliqu" /a 130 /d " sur le "
    if /i "!EventListener.Item.%~1.Type!"=="folder" (
     set cbatbox=!cbatbox! /d "dossier :"
   ) else (
     set cbatbox=!cbatbox! /d "fichier :"
   )
   set tmp1=!EventListener.Item.%~1.Name!
   call :RealName
   set cbatbox=!cbatbox! /c 0x07 /g 97 26 /d "- " /c 0x0!color1! /d "!tmp1!" /c 0x0!color2! /d " -"
   !batbox! !cbatbox!
   if /i "!EventListener.Item.%~1.Type!"=="folder" call :Navigate "!CurrentFolder!!EventListener.Item.%~1.Name!" 2>nul
   if /i "!EventListener.Item.%~1.Type!"=="back" call :Navigate "!CurrentFolder!!EventListener.Item.%~1.Name!" .. 2>nul
   if /i "!EventListener.Item.%~1.Type!"=="file" if exist "!CurrentFolder!!tmp1!" start "" "!CurrentFolder!!tmp1!" 2>nul
  goto :eof
 
 
 
  :clearUI1
   !batbox! /c 0x!colorClear!0 /g 25 12 /d "!UI1.Clear!" /g 25 13 /d "!UI1.Clear!" /g 25 14 /d "!UI1.Clear!" /g 25 15 /d "!UI1.Clear!" /g 25 16 /d "!UI1.Clear!" /g 25 17 /d "!UI1.Clear!" /g 25 18 /d "!UI1.Clear!" /g 25 19 /d "!UI1.Clear!" /g 25 20 /d "!UI1.Clear!" /g 25 21 /d "!UI1.Clear!" /g 25 22 /d "!UI1.Clear!" /g 25 23 /d "!UI1.Clear!" /g 25 24 /d "!UI1.Clear!" /g 25 25 /d "!UI1.Clear!" /g 25 26 /d "!UI1.Clear!" /g 25 27 /d "!UI1.Clear!" /g 25 28 /d "!UI1.Clear!" /g 25 29 /d "!UI1.Clear!" /g 25 30 /d "!UI1.Clear!" /g 25 31 /d "!UI1.Clear!" /g 25 32 /d "!UI1.Clear!" /g 25 33 /d "!UI1.Clear!" /g 25 34 /d "!UI1.Clear!" /g 25 35 /d "!UI1.Clear!" /g 25 36 /d "!UI1.Clear!" /g 25 37 /d "!UI1.Clear!" /g 25 38 /d "!UI1.Clear!" /g 25 39 /d "!UI1.Clear!" /c 0x0!color2!
  goto :eof
  :clearUI2 <Display [CLICK]>
    if "%~1"=="1" (
      !batbox! /c 0x!colorClear!0 /g 6 45 /d "!UI2.Clear!" /g 6 46 /d "!UI2.Clear!" /g 6 47 /d "!UI2.Clear!" /g 6 48 /d "!UI2.Clear!" /g 6 49 /d "!UI2.Clear!" /g 10 47 /g 97 24 /c 0x0!color2!
   ) else (
     !batbox! /c 0x!colorClear!0 /g 6 45 /d "!UI2.Clear!" /g 6 46 /d "!UI2.Clear!" /g 6 47 /d "!UI2.Clear!" /g 6 48 /d "!UI2.Clear!" /g 6 49 /d "!UI2.Clear!" /g 10 47 /c 0x0!color1! /d "[ CLICK ]" /g 97 24 /c 0x0!color2!
   )
  goto :eof
  :clearUI3
   !batbox! /c 0x!colorClear!0 /g 96 23 /d "!UI3.Clear!" /g 96 24 /d "!UI3.Clear!" /g 96 25 /d "!UI3.Clear!" /g 96 26 /d "!UI3.Clear!" /g 96 27 /d "!UI3.Clear!" /g 96 28 /d "!UI3.Clear!" /g 96 29 /d "!UI3.Clear!" /g 96 30 /d "!UI3.Clear!" /g 96 31 /d "!UI3.Clear!" /g 96 32 /d "!UI3.Clear!" /g 96 33 /d "!UI3.Clear!" /g 96 34 /d "!UI3.Clear!" /g 96 35 /d "!UI3.Clear!" /g 96 36 /d "!UI3.Clear!" /g 96 37 /d "!UI3.Clear!" /g 97 24 /c 0x0!color2!
  goto :eof
 
 
 
  :: ###~ FUNCTION_BUTTON
    :Function.Button.Web
     start "" "www.google.com"
     !batbox! /c 0x0!color2! /d "WEB ^!"
     goto :eof
   :Function.Button.Cmd
      start cmd
     !batbox! /c 0x0!color2! /d "CMD ^!"
   goto :eof
   :Function.Button.Recherche
     !batbox! /c 0x0!color2! /d "RECHERCHE ^!"
   goto :eof
   
   :Function.Button.Bureau
     set CurrentFolder=!Desktop!
     !batbox! /c 0x0!color2! /d "BUREAU ^!"
     set CurrentPage=1
     call :updateUI
   goto :eof
   :Function.Button.Racine
     set CurrentFolder=!CurrentFolder:~0,3!
     !batbox! /c 0x0!color2! /d "RACINE ^!"
     set CurrentPage=1
     call :updateUI
   goto :eof
   :Function.Button.Favoris
     set bur=1
     goto :eof
   
   :Function.Button.terminal
     call :clearUI2 1 2>nul
     batbox /g 8 47 /c 0x0!color2! /d "># "
	 batbox /h 1
     set /p c=
     
     if /i "%c%"=="cmd" ( start cmd & goto :break_2 )
     if /i "%c%"=="exit" exit
     if /i "%c%"=="b" ( call :Function.Button.Bureau & goto :break_2 )
      if /i "%c%"=="c" ( call :Function.Button.Racine & goto :break_2 )
     
     if /i "%c%"=="s" (
       if not !CurrentPage! GEQ !totalPage! set /a CurrentPage+=1
      call :updateUI !CurrentPage! 2>nul
      goto :break_2
     )
      if /i "%c%"=="p" (
       if not "!CurrentPage!"=="1" set /a CurrentPage-=1
      call :updateUI !CurrentPage! 2>nul
      goto :break_2
     )
     
      !batbox! /g 97 24 /c 0x0C /d "- La commande tapee n'est pas valide." /g 114 24 /a 130
      !batbox! /g 97 27 /c 0x0C /d "- Pour afficher l'integralite des " /g 125 27 /a 130 /g 118 27 /a 130 /g 97 29 /c 0x0C /d "  commandes disponible, tapez HELP."
     call :clearUI2 2>nul
     
     :break_2
	 batbox /h 0
   goto :eof
 
   :Function.Button.CommandProcessus
      pause
    goto :eof
 :: ###~ END_FUNCTION_BUTTON
 
 
 
 
  :DrawFolderFile <type> <name> <ext> <X <Y <maxLenght> <MarginX> <MarginY>
    set temp=%~1
   if "!temp!"=="back" set temp=folder
   if /i "!temp!"=="folder" (
     set CurrentName=%~2%~3
     set CurrentName=!CurrentName:~0,%~6!
     if not "!CurrentName!"=="%~2%~3" set CurrentName=!CurrentName!..
     set /a currentPosX=20+%~7*%~4+!decalX!&set /a currentPosXN=!currentPosX!-3
     set /a currentPosY1=13-%~8+%~8*%~5+!decalY!&set /a currentPosY2=!currentPosY1!+1&set /a currentPosY3=!currentPosY2!+1&set /a currentPosYN=!currentPosY2!+3
     !batbox! /c 0x0!FOLDER.color! /g !currentPosX! !currentPosY1! !FOLDER.form.ligne1! /d "" /g !currentPosX! !currentPosY2! !FOLDER.form.ligne2! /d "" /g !currentPosX! !currentPosY3! !FOLDER.form.ligne3! /d "" /c 0x0!color2! /g !currentPosXN! !currentPosYN! /d "!CurrentName!"
   ) else (
     set CurrentName=%~2
     set CurrentName=!CurrentName:~0,%~6!
     if not "!CurrentName!"=="%~2" ( set CurrentName=!CurrentName![]%~3 ) else ( set CurrentName=!CurrentName!%~3 )
     set CurrentExt=%~3
     if "!CurrentExt:~0,1!"=="." set CurrentExt=!CurrentExt:~1!
     set /a currentPosX=20+%~7*%~4+!decalX!&set /a currentPosXtmp=!currentPosX!+2&set /a currentPosXN1=!currentPosX!-3&set /a currentPosXN2=!currentPosX!-1
     set /a currentPosY1=13-%~8+%~8*%~5+!decalY!&set /a currentPosY2=!currentPosY1!+1&set /a currentPosY3=!currentPosY2!+1&set /a currentPosYN1=!currentPosY2!+3&set /a currentPosYN2=!currentPosYN1!+1
     for %%Y in (!extension.list!) do (
       if /i "!CurrentExt!"=="%%Y" (
        if "!extension.%%Y.text!"=="" (
          !batbox! /c 0x0!extension.%%Y.color! /g !currentPosX! !currentPosY1! !extension.%%Y.form.ligne1! /d "" /g !currentPosX! !currentPosY2! !extension.%%Y.form.ligne2! /d "" /g !currentPosX! !currentPosY3! !extension.%%Y.form.ligne3! /d "" /g !currentPosXN1! !currentPosYN1! /c 0x0!color2! /d "!CurrentName!"
         goto :eof
        ) else (
          !batbox! /c 0x0!extension.%%Y.color! /g !currentPosX! !currentPosY1! !extension.%%Y.form.ligne1! /d "" /g !currentPosX! !currentPosY2! /a 219 /c 0x!extension.%%Y.color!0 /d "!extension.%%Y.text!" /c 0x0!extension.%%Y.color! /g !currentPosX! !currentPosY3! !extension.%%Y.form.ligne3! /d "" /c 0x0!color2! /g !currentPosXN1! !currentPosYN1! /d "!CurrentName!"
         goto :eof
        )
      )
     )
     if "!extension.DEFAULT.text!"=="" (
       !batbox! /c 0x0!extension.DEFAULT.color! /g !currentPosX! !currentPosY1! !extension.DEFAULT.form.ligne1! /d "" /g !currentPosX! !currentPosY2! !extension.DEFAULT.form.ligne2! /d "" /g !currentPosX! !currentPosY3! !extension.DEFAULT.form.ligne3! /d "" /g !currentPosXN1! !currentPosYN1! /c 0x0!color2! /d "!CurrentName!"
     ) else (
       !batbox! /c 0x0!extension.DEFAULT.color! /g !currentPosX! !currentPosY1! !extension.DEFAULT.form.ligne1! /d "" /g !currentPosX! !currentPosY2! /a 219 /c 0x!extension.DEFAULT.color!0 /d "!extension.DEFAULT.text!" /c 0x0!extension.DEFAULT.color! /g !currentPosX! !currentPosY3! !extension.DEFAULT.form.ligne3! /d "" /g !currentPosXN1! !currentPosYN1! /c 0x0!color2! /d "!CurrentName!"
     )
   )
  goto :eof
  
  
  :DrawUI
  
    color !color2!
    cls
    echo.
    echo.
    echo      ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป     ษอออออออออออออออออออออออออออออออออออออออออออออออออออป
    echo      บ                                                                               บ     บ                                                   บ
    echo      บ                 ณ   ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ    บ     ฬอออออออออออออออออออออออออออออออออออออออออออออออออออน
    echo      บ   ÛÛÜ    [B]    ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛÛ           ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛ฿   Bureau  ณ                                                             บ     บ   [X] Affiche les commandes processus             บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                 ณ   ฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤ    บ     บ   [E] Affiches les commandes d'dition fichiers   บ
    echo      บ   ÛÛÜ    [C]    ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛÛ           ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛ฿   Racine  ณ                                                             บ     บ   [M] Affiche les racourcis commandes CMD         บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                 ณ                                                             บ     บ   [Q] Retourne sur la page principal de OS        บ
    echo      บ   ÛÛÜ    [Q]    ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛÛ           ณ                                                             บ     บ                                                   บ
    echo      บ   ÛÛ฿  Quitter  ณ                                                             บ     บ   [O] Paramtre de l'explorateur                  บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ  ฺฤฤฤฤฤฤฤฤฤฤฤฟ  ณ                                                             บ     บ   ฺฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฟ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณฤฤฤฤฤฤฤฤฤฤฤณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ    Web    ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณฤฤฤฤฤฤฤฤฤฤฤณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ    CMD    ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณฤฤฤฤฤฤฤฤฤฤฤณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ Recherche ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ณ           ณ  ณ                                                             บ     บ   ณ                                           ณ   บ
    echo      บ  ภฤฤฤฤฤฤฤฤฤฤฤู  ณ                                                             บ     บ   ภฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤฤู   บ
    echo      บ                 ณ                                                             บ     บ                                                   บ
    echo      บ                                                                               บ     บ                                                   บ
    echo      ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ     ศอออออออออออออออออออออออออออออออออออออออออออออออออออผ
    echo.
    echo.
    echo      ษอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป
    echo      บ                                                                                                                                         บ
    echo      บ                                                                                                                                         บ
    echo      บ                                                                                                                                         บ
    echo      บ                                                                                                                                         บ
    echo      บ                                                                                                                                         บ
    echo      ศอออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ
   
   
    !batbox! /c 0x0!color1! /g 27 6 /d "Repertoire actuel" /g 108 3 /d "Commandes Disponibles" /g 11 24 /d "Options" /g 58 39 /a 196 /g 59 39 /a 196 /g 48 39 /a 196 /g 49 39 /a 196 /g 10 47 /d "" /c 0x0!color2! /g 20 34 /a 180 /g 20 30 /a 180 /g 20 26 /a 180 /g 8 34 /a 195 /g 8 30 /a 195 /g 8 26 /a 195 /g 97 24 /c 0x0!color1! /d "- Pour acceder au terminal, cliquer sur" /g 107 24 /a 130 /g 97 26 /c 0x0!color1! /d "  la zone inferieur de l'explorateur." /g 110 26 /a 138 /g 97 29 /c 0x0!color1! /d "- Pour afficher l'integralite des " /g 125 29 /a 130 /g 118 29 /a 130 /g 97 31 /c 0x0!color1! /d "  commandes disponible, tapez HELP." /g 10 47 /c 0x0!color1! /d "[ CLICK ]"
	
   
  goto :eof