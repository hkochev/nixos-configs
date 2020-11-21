-- xmobar config used by Vic Fryzel
-- Author: Vic Fryzel
-- http://github.com/vicfryzel/xmonad-config
-- This is setup for dual 1920x1080 monitors, with the right monitor as primary
Config { font = "xft:Fixed-8"
       , bgColor = "#000000"
       , fgColor = "#ffffff"
       , position = TopW R 100  -- , position = Static { xpos = 0, ypos = 0, width = 1920, height = 22 }
       , lowerOnStart = True
       , commands = [ Run Weather "CYVR" ["-t","<tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
                    , Run Network "enp0s20f0u6u1i5" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Network "wlp4s0" ["-L","0","-H","32","--normal","green","--high","red"] 10
                    , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                    , Run Memory ["-t","Mem: <usedratio>%"] 10
                    , Run Battery ["-t","Batt: <left>"] 10
                    , Run Com "uname" ["-o","-r"] "" 36000
                    , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                    , Run StdinReader
                    ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%StdinReader% | %cpu% | %memory%  }{<fc=#ee9a00>%date%</fc>| %battery% | %wlp4s0% - %enp0s20f0u6u1i5% | %CYVR% | %uname%"
        }
