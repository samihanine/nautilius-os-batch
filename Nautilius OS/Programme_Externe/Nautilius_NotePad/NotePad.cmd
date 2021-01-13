 @echo OFF 
 SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
 mode con cols=149 lines=53
 title Nautilius NotePad
 
 cd %~dp0
 COLOR 07
 
 if defined __ goto :deb
 set __=.
 darkbox -i | %0 %* | darkbox
 set __=
 goto :eof
 
 :deb
 echo;-hr 1
 call :affichage

 :ini
 
 set debx=8
 set finx=140
 set deby=13
 set finy=47
  
 if exist "teste.ini" (
  for /f "usebackq tokens=1,2,3 delims=-" %%a in ("teste.ini") do (
	echo;-gca %%a 0x0%%b %%c
	set "%%a=%%b-%%c"
	set "derpos=%%a"
	set "dercol=%%b"
  )
  if not "!derpos!"=="" ( for /f "tokens=1,2 delims= " %%a in ("!derpos!") do set /a "x=%%a+1" & set "y=%%b" ) else ( set "x=!debx!" & set "y=!deby!" )
  if not "!dercol!"=="" ( set "current_color=!dercol!" ) else ( set "current_color=7" )
 )
 
 if not exist teste.ini ( echo.>teste.ini
  set x=!debx!
  set y=!deby!
  set "current_color=7"
 )
 
 call :couleur
 
 set "fin=0"
 :loop
 if "!fin!"=="1" ( echo -q
  goto :eof
 )
 
 echo;-g !x! !y!
 
 set /p i=
 
 for /f "tokens=1,2,3,4" %%A in ("%i%") do (
 
  if %%A==m (
   if %%D==1 (
    set mx=%%B
    set my=%%C
	
	if !mx! GEQ !debx! if !mx! LEQ !finx! if !my! GEQ !deby! if !my! LEQ !finy! set "x=!mx!" & set "y=!my!"
	
	if !mx! GEQ 62 if !mx! LEQ 67 if !my!==3 set "current_color=7" & call :couleur
	if !mx! GEQ 70 if !mx! LEQ 75 if !my!==3 set "current_color=C" & call :couleur
	if !mx! GEQ 78 if !mx! LEQ 82 if !my!==3 set "current_color=A" & call :couleur
	if !mx! GEQ 85 if !mx! LEQ 89 if !my!==3 set "current_color=3" & call :couleur
	
	if !mx! GEQ 62 if !mx! LEQ 67 if !my!==7 set "current_color=E" & call :couleur
	if !mx! GEQ 70 if !mx! LEQ 75 if !my!==7 set "current_color=1" & call :couleur
	if !mx! GEQ 78 if !mx! LEQ 82 if !my!==7 set "current_color=D" & call :couleur
	if !mx! GEQ 85 if !mx! LEQ 89 if !my!==7 set "current_color=8" & call :couleur
	
	if !mx! GEQ 6 if !mx! LEQ 19 if !my! GEQ 3 if !my! LEQ 5 call :save
	if !mx! GEQ 20 if !mx! LEQ 33 if !my! GEQ 3 if !my! LEQ 5 call :compiler
	if !mx! GEQ 20 if !mx! LEQ 33 if !my! GEQ 7 if !my! LEQ 9 set fin=1
   )
  )
  
  if %%A==k (
   
   set kk=%%B
   
   If !kk! GTR 31 if !kk! LSS 254 call :lettre !kk!
   
   if !kk!==8 call :supprimer
   
   if !kk!==327 call :hau
   if !kk!==335 call :bas
   if !kk!==332 call :dro
   if !kk!==330 call :gau
   
   REM CTRL S
   if !kk!==19 call :save
   
   if !kk!==13 call :entrer
  )
  
 )
 
 goto :loop

 :hau
 set /a y-=1
 if "!y!"=="!deby!" set /a y+=1
 goto :eof
 
 :bas
 set /a y+=1
 if "!y!"=="!finy!" set /a y-=1
 goto :eof
 
 :gau
 set /a x-=1
 if "!x!"=="!debx!" set /a x+=1
 goto :eof
 
 :dro
 set /a x+=1
 if "!x!"=="!finx!" set /a x-=1
 goto :eof
 
 :lettre <code>
 if not "!%finx% %y%!"=="" goto :eof
  
 for /l %%m in (!finx!,-1,!x!) do (
  set /a "xx=%%m+1"
  set "!xx! !y!=!%%m %y%!"
  set "%%m %y%="
 )
 
 set "let=%1"
 echo;-gca !x! !y! 0x0!current_color! !let!
 set "!x! !y!=!current_color!-!let!"
 
 set /a x+=1

 call :rey
 
 goto :eof
 
 :supprimer
 if "!x! !y!"=="!debx! !deby!" goto :eof
 
 if "!x! !y!"=="!debx! !y!" ( call :moins_entrer
  goto :eof
 )
 
 for /l %%m in (!x!,1,!finx!) do (
  set /a "xx=%%m-1"
  set "!xx! !y!=!%%m %y%!"
  set "%%m %y%="
 )
 
 
 set /a x-=1
 
 call :rey
 
 goto :eof
 
 :save
 echo;-gcdh 7 3 0x07 "Sauvegarder" 0
 
 for /l %%y in (!deby!,1,!finy!) do (
  for /l %%x in (!debx!,1,!finx!) do (
   If not "!%%x %%y!"=="" (
    for /f "tokens=1,2 delims=-" %%a in ("!%%x %%y!") do (
	 echo;%%x %%y-%%a-%%b>>temp.ini
	)
   )
  )
 )
 
 del /q teste.ini
 ren "temp.ini" "teste.ini"
 
 echo;-gcdh 7 3 0x03 "Sauvegarder" 1
 
 goto :eof
 
 :entrer
 set "tt=0"
 for /l %%x in (!debx!,1,!finx!) do if not "!%%x %finy%!"=="" set "tt=1"
 if "!tt!"=="1" goto :eof
 
 set /a "y+=1"
 
 for /l %%x in (!debx!,1,!finx!) do (
  for /l %%m in (!finy!,-1,!y!) do (
   set /a "yy=%%m+1"
   set "%%x !yy!=!%%x %%m!"
   set "%%x %%m="
  )
 )
 call :re
 
 set "x=!debx!"
 
 goto :eof
 
 :moins_entrer
 for /l %%x in (!debx!,1,!finx!) do (
  for /l %%m in (!y!,1,!finy!) do (
   set /a "yy=%%m-1"
   set "%%x !yy!=!%%x %%m!"
   set "%%x %%m="
  )
 )
 
 call :re
 
 set /a "y-=1"
 
 goto :eof
 
 :re
 echo;-h 0
 for /l %%x in (!debx!,1,!finx!) do (
  for /l %%y in (!deby!,1,!finy!) do (
   If not "!%%x %%y!"=="" (
    for /f "tokens=1,2 delims=-" %%a in ("!%%x %%y!") do (
	 echo;-gca %%x %%y 0x0%%a %%b
	)
   ) else ( echo;-gcd %%x !y! 0x00 "0" )
  )
 )
 echo;-h 1
 goto :eof
 
 :rey
 for /l %%x in (!debx!,1,!finx!) do (
  If not "!%%x %y%!"=="" (
   for /f "tokens=1,2 delims=-" %%a in ("!%%x %y%!") do (
	echo;-gca %%x !y! 0x0%%a %%b
   )
  ) else ( echo;-gcd %%x !y! 0x00 "0" )
 )
 goto :eof
 
 :test
 set "tt=0"
 for /l %%x in (!debx!,1,!finx!) do if not "!%%x %finy%!"=="" set "tt=1"
 
 goto :eof
 
 :couleur 
 set col1=7
 set col2=7
 set col3=7
 set col4=7
 
 set col5=7
 set col6=7
 set col7=7
 set col8=7
 
 if !current_color!==7 set col1=3
 if !current_color!==1 set col2=3
 if !current_color!==A set col3=3
 if !current_color!==3 set col4=3
 if !current_color!==E set col5=3
 if !current_color!==C set col6=3
 if !current_color!==D set col7=3
 if !current_color!==8 set col8=3
 
 echo;-gcd 62 3 0x07 "BLANC"
 call :Contour 62 3 66 !col1!
 
 echo;-gcd 70 7 0x01 "BLEUF"
 call :Contour 70 7 74 !col2!
 
 echo;-gcd 78 3 0x0A "VERT"
 call :Contour 78 3 81 !col3!
 
 echo;-gcd 85 3 0x03 "BLEU"
 call :Contour 85 3 88 !col4!
 
 
 echo;-gcd 62 7 0x0E "JAUNE"
 call :Contour 62 7 66 !col5!
 
 echo;-gcd 70 3 0x0C "ROUGE"
 call :Contour 70 3 74 !col6!
 
 echo;-gcd 78 7 0x0D "ROSE"
 call :Contour 78 7 81 !col7!
 
 echo;-gcd 85 7 0x08 "GRIS"
 call :Contour 85 7 88 !col8!
 
 goto :eof
 
 :Contour <x> <y> <endx> <col>
 
 set xc=%1
 set /a xm=!xc!-1
 set /a xp=!xc!+1
 
 set yc=%2
 set /a ym=!yc!-1
 set /a yp=!yc!+1
 
 set xend=%3
 set /a xendp=!xend!+1
 
 for /l %%i in (!xc!,1,!xend!) do (
  echo;-gca %%i !ym! 0x0%4 196
 )
 
 for /l %%i in (!xc!,1,!xend!) do (
  echo;-gca %%i !yp! 0x0%4 196
 )
 
 echo;-6gca !xm! !yc! 0x0%4 179 !xendp! !yc! 0x0%4 179 !xm! !yp! 0x0%4 192 !xm! !ym! 0x0%4 218 !xendp! !yp! 0x0%4 217 !xendp! !ym! 0x0%4 191
 
 goto :eof
 
 :compiler
 if exist teste.txt del /q teste.txt
 echo;-gcdh 22 3 0x03 "Convertir" 0
 
 for /l %%y in (!deby!,1,!finy!) do (
  set "a="
  set "m="
  for /l %%x in (!debx!,1,!finx!) do (
   if not "!%%x %%y!"=="" ( call :comp %%x %%y ) else ( set "m=!m! " )
  )
  echo;!a!>>teste.txt
 )
 
 echo;-gcdh 22 3 0x07 "Convertir" 1
 
 start "" "teste.txt"
 goto :eof
 
 :comp
 for /f "tokens=1,2 delims=-" %%a in ("!%1 %2!") do set "code=%%b"
 
 set "f=32"

 set "sort= "

 call Conversion.cmd
 
 set "a=!a!!m!!sort!"
 set "m="
 
 goto :eof
 
 :affichage
 
 echo;-c 07
 
 echo;-gd 5 1 "ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄ¿     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄ¿     ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿     ÚÄÄÄÄÄÄÄÂÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿"
 echo;-gd 5 2 "³             ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 3 "³             ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 4 "³             ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 5 "ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÅÄÄÄÄÄÄÄÄÄÄÄÄÄ´     ÃÄÄÄÄÄÄÄÄÄÄÄÄÄ´     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 6 "³             ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 7 "³   Nouveau   ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 8 "³             ³             ³     ³             ³     ³                               ³     ³       ³                                     ³"
 echo;-gd 5 9 "ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÙ     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÙ     ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ     ÀÄÄÄÄÄÄÄÁÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
 
 echo;-gcd 22 3 0x07 "Convertir"
 echo;-gcd 7 3 0x03 "Sauvegarder"
 echo;-gcd 23 7 0x07 "Quitter" 
 
 echo;-2gcdaa 43 3 0x03 "Page " 196 16 43 7 0x03 "Page " 17 196 
 
 set debx=8
 set finx=140
 set deby=13
 set finy=47
 
 set /a a=!debx!-3
 set /a b=!finx!+3
 set /a c=!deby!-2
 set /a d=!finy!+3
 
 for /l %%x in (!a!,1,!b!) do (
  echo;-gca %%x !c! 0x07 196
 )
 
 for /l %%x in (!a!,1,!b!) do (
  echo;-gca %%x !d! 0x07 196
 )
 
 for /l %%y in (!c!,1,!d!) do (
  echo;-gca !a! %%y 0x07 179
 )
 
 for /l %%y in (!c!,1,!d!) do (
  echo;-gca !b! %%y 0x07 179
 )
 
 echo;-4ga !a! !c! 218 !a! !d! 192 !b! !c! 191 !b! !d! 217
 

 call :Contour 68 50 75 7
 echo;-gcadcdca 67 50 0x07 180 " Page " 0x03 "1 " 0x07 195 
 
 goto :eof