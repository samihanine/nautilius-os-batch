 @echo off
 SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
 mode con cols=149 lines=53
 title Batch Game Macker
 
 cd %~dp0
 COLOR 07
 
 if not exist batbox.exe call :makebatbox
 if not exist darkbox.exe call :makedarkbox
 
 if defined __ goto :deb
 set __=.
 call %0 %* | darkbox
 set __=
 goto :eof
 
 :deb
 REM -- FIRST CREATION --
 set "current_scene=Scene_1"
 If not exist "!current_scene!\" ( 
  mkdir "!current_scene!\" 
  echo.>!current_scene!\TERRAIN.ini
  echo.>!current_scene!\ACTIF.ini
 )
 
 
 echo;-hr 0
 
 :ini
 REM -- AFF SEPARATION --
 set xmax=95
 set ymax=41
 
 for /l %%i in (0,1,52) do (
   echo;-gca !xmax! %%i 0x07 186
 )
 for /l %%i in (0,1,148) do (
   echo;-gca %%i !ymax! 0x07 205
 )
 echo;-gca !xmax! !ymax! 0x07 206
 for /l %%i in (!xmax!,1,148) do (
   echo;-gca %%i 17 0x07 205
 )
 echo;-gca !xmax! 17 0x07 204
 
 REM -- AFF NEXT LAST --
 echo;-gcdd 3 44 0x03 " Last " "    Next  "
 call :Contour 3 44 8
 call :Contour 12 44 17
 
 REM -- AFF COLOR --
 set l=59
 for %%C in (1 2 3 4 5 6 7 8 9 A B C D E F) do (
  set /a l+=2
  set /a ll=!l!+1
  echo;-gca !ll! 44 0x0%%C 219
  set "!ll! 44=%%C"
 )
 call :Contour 61 44 91

 REM -- AFF INFO --
 echo;-gcd 116 2 0x0E " Information"
 call :Contour 116 2 128
 call :Contour 111 14 111
 call :Contour 115 14 115
 call :Contour 119 14 125
 
 set "current_col=E"
 set "current_skin=2"
 
 echo;-3gcd 99 10 0x07 " Sauvegarder " 117 10 0x07 " Retour Menue " 136 10 0x0C " Quitter "
 
 echo;-gcd 99 21 0x07 " Joueur "
 call :Contour 99 21 106
 
 echo;-gcd 99 25 0x07 " Menace "
 call :Contour 99 25 106
 
 echo;-gcd 99 29 0x07 " Porte "
 call :Contour 99 29 105

 echo;-gcd 99 33 0x07 " Terrain "
 call :Contour 99 33 107
 
 echo;-gcd 99 37 0x07 " Label "
 call :Contour 99 37 105
 
 call :Contour 99 6 106
 call :Contour 112 6 125
 call :Contour 131 6 141
 
 call :Contour 99 10 111
 call :Contour 117 10 130
 call :Contour 136 10 144

 
 REM -- AFF CODE --
 set "contour="
 set "code_page=1"
 call :draw_code
 
 REM -- RECUP TERRAIN --
 for /f "usebackq tokens=1,2,3 delims=-" %%A in ("!current_scene!\TERRAIN.ini") do (
  echo;-gca %%A 0x0%%B %%C
  set "%%A=t-%%B-%%C
 )
 
 set "selec=m"
 set "current_type=t"
 
 :bbm
 if "!selec!"=="m" set "msel=3" & set "ssel=7" & set "rsel=7"
 if "!selec!"=="s" set "msel=7" & set "ssel=3" & set "rsel=7"
 if "!selec!"=="r" set "msel=7" & set "ssel=7" & set "rsel=3"
 
 REM AFF ACTU
 if "!current_type!"=="t" set "aff_type=Terrain"
 
 echo;-gcdadagagcagcdgcagca 98 14 0x07 "S" 130 "lection " 16 111 14 !current_skin! 115 14 0x0!current_col! 219 119 14 0x03 "!aff_type!" 129 14 0x07 16 132 14 0x0!current_col! !current_skin! 
 echo;-3gcd 99 6 0x0!msel! " Mettre " 112 6 0x0!ssel! " Selectionner " 131 6 0x0!rsel! " Supprimer "
 echo;-gca 114 6 0x0!ssel! 130
 
 :souris
 REM SOURIS
 for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
   set a=%%c
   set y=%%b
   set x=%%a
 )
 
 REM PAGE PLUS
 if !x! GTR 11 if !x! LSS 18 if !y!==44 ( set /a "code_page+=1"
  if !code_page!==6 set "code_page=1"
  call :draw_code 
 )
 REM PAGE MOINS
 if !x! GTR 2 if !x! LSS 10 if !y!==44 ( set /a "code_page-=1"
  if !code_page!==0 set "code_page=5"
  call :draw_code
 )
 
 REM COLOR
 if !x! gtr 58 if !x! LSS 90 if !y!==44 if not "!%x% %y%!"=="" set "current_col=!%x% %y%!"
 
 REM SKIN
 if !x! gtr 0 if !x! LSS 95 if !y! gtr 45 if not "!%x% %y%!"=="" if not "!%x% %y%!"=="32" set "current_skin=!%x% %y%!"
 
 REM MSR TERRAIN
 if !x! LSS 95 if !y! LSS 41 if "!selec!"=="m" ( echo;-gca !x! !y! 0x0!current_col! !current_skin!
  set "!x! !y!=!current_type!-!current_col!-!current_skin!"
 )
 
 if !x! LSS 95 if !y! LSS 41 if "!selec!"=="r" if not "!%x% %y%!"=="" ( echo;-gca !x! !y! 0x00 0
  set "!x! !y!="
 )
 
 if !x! LSS 95 if !y! LSS 41 if "!selec!"=="s" if not "!%x% %y%!"=="" (
  for /f "tokens=1,2,3 delims=-" %%a in ("!%x% %y%!") do (
   set "current_type=%%a"
   set "current_col=%%b"
   set "current_skin=%%c"
  )
 )
 
 REM BBM INFO
 if !x! gtr 98 if !x! LSS 113 if !y!==10 ( echo;-gcd 99 10 0x03 " Sauvegarder "
 call :save
 echo;-gcd 99 10 0x07 " Sauvegarder "
 )
 if !x! gtr 135 if !x! LSS 146 if !y!==10 ( echo -q
 exit
 )
 
 if !x! gtr 98 if !x! LSS 108 if !y!==6 set "selec=m"
 if !x! gtr 130 if !x! LSS 142 if !y!==6 set "selec=r"
 if !x! gtr 110 if !x! LSS 124 if !y!==6 set "selec=s"
 
 
 goto :bbm
 
 
 :draw_code
 if "!code_page!"=="1" (
  set x=1
  
  for %%c in (1 2 3 4 5 6 11 12 14 15 16 17 30 31 18 19 20 21 22 23 24 25 26 27 29 28 173 33 34 35 36 47 38 39 40 41 42 43 37 45 44 46 248 251 253 252) do (
   set "code!x!=%%c"
   set /a x+=1
  )
  
 )

 if "!code_page!"=="2" (
  set x=1
  
  for %%c in (97 98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 129 130 131 132 133 135 136 137 138 139 48 49 50 51 52 53 54 55 56 57) do (
   set "code!x!=%%c"
   set /a x+=1
  )
  
 )
 
 if "!code_page!"=="3" (
  set x=1
  
  for %%c in (65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 225 181 182 183 233 234 235 224 226 227 144 210 211 212 128 238 239 241 242 221) do (
   set "code!x!=%%c"
   set /a x+=1
  )
  
 )
 
 if "!code_page!"=="4" (
  set x=1
  
  for %%c in (196 179 218 191 192 217 195 180 197 193 194 58 59 60 61 62 63 64 91 92 93 94 95 205 186 201 187 200 188 204 185 206 202 203 250 249 123 124 125 126 127 156 157 158 159 247) do (
   set "code!x!=%%c"
   set /a x+=1
  )
  
 )
 
 if "!code_page!"=="5" (
  set x=1
  
  for %%c in (176 177 178 219 220 223 166 167 168 169 170 171 172 243 173 174 175 240 154 244 245 232 167 168 169 184 190 209 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32 32) do (
   set "code!x!=%%c"
   set /a x+=1
  )
  
 )
 
 set r=1
 for %%y in (47 50) do ( 
  for /l %%i in (3,4,94) do (
   for %%b in (!r!) do (
    echo;-gca %%i %%y 0x07 !code%%b!
    if "!contour!"=="" call :contour %%i %%y %%i
    set "%%i %%y=!code%%b!"
	set /a ip=%%i+1
	set /a im=%%i-1
	set /a yp=%%y+1
	set /a ym=%%y-1
	set "!ip! %%y=!code%%b!"
	set "!im! %%y=!code%%b!"
	set "%%i !yp!=!code%%b!"
	set "%%i !ym!=!code%%b!"
   )
   set /a "r+=1"
  )
 )
 
 set "contour=1"
 goto :eof
  
 :Contour <x> <y> <endx>
 
 set x=%1
 set /a xm=!x!-1
 set /a xp=!x!+1
 
 set y=%2
 set /a ym=!y!-1
 set /a yp=!y!+1
 
 set xend=%3
 set /a xendp=!xend!+1
 
 for /l %%i in (!x!,1,!xend!) do (
  echo;-gca %%i !ym! 0x07 196
 )
 
 for /l %%i in (!x!,1,!xend!) do (
  echo;-gca %%i !yp! 0x07 196
 )
 
 echo;-6gca !xm! !y! 0x07 179 !xendp! !y! 0x07 179 !xm! !yp! 0x07 192 !xm! !ym! 0x07 218 !xendp! !yp! 0x07 217 !xendp! !ym! 0x07 191
 
 goto :eof
 
 :save
 cd %~dp0!current_scene!
 
 for /l %%x in (0,1,94) do (
  for /l %%y in (0,1,40) do (
   If not "!%%x %%y!"=="" (
    for /f "tokens=1,2,3 delims=-" %%a in ("!%%x %%y!") do (
	 set a=%%a
	 if "!a!"=="t" echo;%%x %%y-%%b-%%c>>TERRAIN_t.ini
	)
   )
  )
 )
 
 del /q TERRAIN.ini
 ren "TERRAIN_t.ini" "TERRAIN.ini"
 
 cd %~dp0
 goto :eof
 
:makedarkbox
del out.file 2>NUL
(
echo;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
)>>out.file
(certutil -f -decode "out.file" "darkbox.exe")>NUL
Del out.file>NUL
goto :EOF
 
:makebatbox
del out.file 2>NUL
(
echo;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
)>>out.file
(certutil -f -decode "out.file" "batbox.exe")>NUL
Del out.file>NUL
goto :EOF
 
 