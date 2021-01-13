@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS 
mode con lines=30 cols=38
title Calculatice Nautilius
COLOR 07
 
 set k=0
 set rep=0
 set cla=0

 cd %~dp0

set a=0
set b=0
set c=0
set d=0
set e=0
set f=0
set g=0
set h=0
set i=0
set j=0
set l=0
set m=0
set n=0
set o=0
set p=0
set q=0
set r=0
set s=0
set t=0
set u=0
set v=0
set w=0
set x=0
set y=0
set z=0


:setvar
set "var1="
set "var2="
set "var3="
set "var4="
set "var5="
set "var6="
set "var7="
set "var8="
set "var9="
set "var10="
set "var11="
set "var12="
set "var13="
set "var14="
set "var15="
set "var16="
set "var17="
set "var18="
set "var19="
set "var20="
set "var21="
set "var22="
set "var23="
set "var24="
set "var25="
set "var26="
set "var27="
set m=1
If %cla%==1 (
batbox /g 6 3 /d "                             "
set cla=0 
goto clavier )

:draw
color 07
cls
echo.
echo    ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»
echo    º                               º
echo    º                               º
echo    º                               º
echo    ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼
echo.
echo    ÚÄÄÄÄÄ¿ ÚÄÄÄÄÄ¿   ÚÄÄÄÄÄ¿ ÚÄÄÄÄÄ¿
echo    ³  +  ³ ³  -  ³   ³  (  ³ ³  )  ³ 
echo    ÀÄÄÄÄÄÙ ÀÄÄÄÄÄÙ   ÀÄÄÄÄÄÙ ÀÄÄÄÄÄÙ
echo    ÚÄÄÄÄÄ¿ ÚÄÄÄÄÄ¿   ÚÄÄÄÄÄ¿ ÚÄÄÄÄÄ¿
echo    ³  x  ³ ³     ³   ³ rep ³ ³     ³
echo    ÀÄÄÄÄÄÙ ÀÄÄÄÄÄÙ   ÀÄÄÄÄÄÙ ÀÄÄÄÄÄÙ
echo.
echo    ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿
echo    ³   7   ³   ³   8   ³   ³   9   ³
echo    ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ
echo.
echo    ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿
echo    ³   4   ³   ³   5   ³   ³   6   ³
echo    ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ
echo.
echo    ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿
echo    ³   1   ³   ³   2   ³   ³   3   ³
echo    ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ
echo.
echo    ÚÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¿   ÚÄÄÄÄÄÄÄ¿
echo    ³         0         ³   ³       ³
echo    ÀÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ   ÀÄÄÄÄÄÄÄÙ


batbox /h 0 /c 0x03 /g 14 11 /a 246 /c 0x03 /g 31 11 /a 196 /a 196 /a 16 /c 0x03 /g 31 27 /a 205 /g 32 8 /d ")" /g 24 8 /d "(" /g 23 11 /d "rep" /g 14 8 /d "-" /g 6 8 /d "+" /g 6 11 /d "x"

:a

If %k%==0 batbox /g 6 3 /d "                             " /g 6 3 /d "%var1%%var2%%var3%%var4%%var5%%var6%%var7%%var8%%var9%%var10%%var11%%var12%%var13%%var14%%var15%%var16%%var17%%var18%%var19%%var20%%var21%%var22%%var23%%var24%%var25%%var26%%var27%
batbox /g 0 29

If %k%==1 ( batbox /g 6 3 /d "                             " /g 6 3 /d "= %res%"
batbox /g 0 29 )

for /f "tokens=1,2,3 delims=:" %%a in ('batbox /m') do (
set c=%%c
set y=%%b
set x=%%a
)
if %k%==1 ( set k=0
goto setvar )

REM ---
If %x% GTR 3 if %x% LSS 36 if %y% GTR 0 if %y% LSS 6 ( set cla=1
goto setvar )

If %x% GTR 27 if %x% LSS 36 if %y% GTR 25 if %y% LSS 29 goto eg
If %m% GTR 27 goto a 

If %x% GTR 3 if %x% LSS 10 if %y% GTR 6 if %y% LSS 10 goto plus
If %x% GTR 3 if %x% LSS 10 if %y% GTR 9 if %y% LSS 13 goto fois

If %x% GTR 11 if %x% LSS 18 if %y% GTR 6 if %y% LSS 10 goto moins
If %x% GTR 11 if %x% LSS 18 if %y% GTR 9 if %y% LSS 13 goto div

If %x% GTR 21 if %x% LSS 28 if %y% GTR 6 if %y% LSS 10 goto par1
If %x% GTR 21 if %x% LSS 28 if %y% GTR 9 if %y% LSS 13 goto rep

If %x% GTR 29 if %x% LSS 36 if %y% GTR 6 if %y% LSS 10 goto par2
If %x% GTR 29 if %x% LSS 36 if %y% GTR 9 if %y% LSS 13 goto sup
REM ---
If %x% GTR 3 if %x% LSS 12 if %y% GTR 13 if %y% LSS 17 goto 7
If %x% GTR 15 if %x% LSS 24 if %y% GTR 13 if %y% LSS 17 goto 8
If %x% GTR 27 if %x% LSS 36 if %y% GTR 13 if %y% LSS 17 goto 9
If %x% GTR 3 if %x% LSS 12 if %y% GTR 17 if %y% LSS 21 goto 4
If %x% GTR 15 if %x% LSS 24 if %y% GTR 17 if %y% LSS 21 goto 5
If %x% GTR 27 if %x% LSS 36 if %y% GTR 17 if %y% LSS 21 goto 6

If %x% GTR 3 if %x% LSS 12 if %y% GTR 21 if %y% LSS 25 goto 1
If %x% GTR 15 if %x% LSS 24 if %y% GTR 21 if %y% LSS 25 goto 2
If %x% GTR 27 if %x% LSS 36 if %y% GTR 21 if %y% LSS 25 goto 3

If %x% GTR 3 if %x% LSS 24 if %y% GTR 25 if %y% LSS 29 goto 0

goto a

:clavier

batbox /g 6 3 /d "> "
set /p "res="
if "%res%"=="" set res=0
set res=%res:08=8%
set res=%res:09=9%

set res=!res:rep=%rep%!
set res=%res:a=0%
set res=%res:b=0%
set res=%res:c=0%
set res=%res:d=0%
set res=%res:e=0%
set res=%res:f=0%
set res=%res:g=0%
set res=%res:h=0%
set res=%res:i=0%
set res=%res:j=0%
set res=%res:k=0%
set res=%res:l=0%
set res=%res:m=0%
set res=%res:n=0%
set res=%res:o=0%
set res=%res:p=0%
set res=%res:q=0%
set res=%res:r=0%
set res=%res:s=0%
set res=%res:t=0%
set res=%res:u=0%
set res=%res:v=0%
set res=%res:w=0%
set res=%res:x=0%
set res=%res:y=0%
set res=%res:z=0%
set res=%res:>=0%
set res=%res:<=0%
set res=%res:?=0%
set res=%res:!=0%
set res=%res: =0%
set res=%res:;=0%
set res=%res:œ=0%
set res=%res:$=0%
set res=%res:@=0%
set res=%res:_=0%
set res=%res:‚=0%
set res=%res:&=0%
set res=%res:|=0%
set res=%res:‡=0%
set res=%res:^=0%
set res=%res:ø=0%
set res=%res:æ=0%
set res=%res:Š=0%
set res=%res:…=0%
set res=%res:}=0%
set res=%res:{=0%
set res=%res:Ï=0%
set res=%res:õ=0%
set res=%res:'=0%
set res=%res:`=0%


set /a "res=%res%+0"
set res=%res:~0,27%
batbox /g 6 3 /d "                             " /g 6 3 /d "= %res%"
set rep=%res%
batbox /g 0 29
pause >nul
goto setvar

:rep
set "var%m%=%rep%"
set /a m=%m%+1
goto a

:plus
set "var%m%=+"
set /a m=%m%+1
goto a

:fois
set "var%m%=*"
set /a m=%m%+1
goto a

:moins
set "var%m%=-"
set /a m=%m%+1
goto a

:div
set "var%m%=/"
set /a m=%m%+1
goto a

:par1
set "var%m%=("
set /a m=%m%+1
goto a

:par2
set "var%m%=)"
set /a m=%m%+1
goto a

:sup
set /a m=%m%-1
set "var%m%="
goto a

:1
set "var%m%=1"
set /a m=%m%+1
goto a

:2
set "var%m%=2"
set /a m=%m%+1
goto a

:3
set "var%m%=3"
set /a m=%m%+1
goto a

:4
set "var%m%=4"
set /a m=%m%+1
goto a

:5
set "var%m%=5"
set /a m=%m%+1
goto a

:6
set "var%m%=6"
set /a m=%m%+1
goto a

:7
set "var%m%=7"
set /a m=%m%+1
goto a

:8
set "var%m%=8"
set /a m=%m%+1
goto a

:9
set "var%m%=9"
set /a m=%m%+1
goto a

:0
set "var%m%=0"
set /a m=%m%+1
goto a


:eg
If "%var1%"=="" set var1=0
set "res=%var1%%var2%%var3%%var4%%var5%%var6%%var7%%var8%%var9%%var10%%var11%%var12%%var13%%var14%%var15%%var16%%var17%%var18%%var19%%var20%%var21%%var22%%var23%%var24%%var25%%var26%%var27%"
set "res=%res:08=8%"
set "res=%res:09=9%"
set /a "res=%res%+0"
set "res=%res:~0,27%"
set "rep=%res%"
batbox /g 6 3 /d "                             "
set k=1
goto a