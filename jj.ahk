#NoEnv      ; Recc for performance in future ahk releases
#SingleInstance force ; Only keep one instance running

; Automove mouse - with Ctrl + F1

toggle := 0

^F1::
{
    MouseGetPos, MouseX, MouseY
    if (toggle := !toggle) {
        gosub, MoveMouse
    } else {
        SetTimer, MoveMouse, off
    }
    return
}

MoveMouse:
MouseMove, %MouseX%, 200
SetTimer, MoveMouse, -180000   ; every 3 minutes
MouseMove, %MouseX%, %MouseY%
return
