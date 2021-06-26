#NoEnv      ; Recc for performance in future ahk releases
#SingleInstance force ; Only keep one instance running


SetTitleMatchMode,2

; Google Search highlighted text
; Alt
; old !sc0046::
!#Home::
{
 Send, ^c
 Sleep 50
 Run, https://github.com/search?q=%clipboard%&ref=opensearch
 Return
}
; Ctrl
^#sc0046::
{
 Send, ^c
 Sleep 50
 Run, https://confluence/dosearchsite.action?queryString=%clipboard%
 Return
}
; Shift
+#sc0046::
{
 Send, ^c
 Sleep 50
 Run, https://jira/secure/QuickSearch.jspa?searchString=%clipboard%
 Return
}
; Ctrl + Shift
^+#sc0046::
{
 Send, ^c
 Sleep 50
 Run, http://www.google.com/search?q=%clipboard%
 Return
}

; activate primary messenging platform
F1::WinActivate, Messenger
;F2::WinActivate, Visual                                                     ; activate my editor window
;Pause::WinActivate, chidv-awl1                                                             ; activate my Delphi window
;Pause::Send ^m
PrintScreen::Send ^m
;F5::Send {F3}
; F3 is used heavily by many editors and word processors to as a "do it again" action when searching and replacing.
; So, I just change it to F5 so I can use F1 thru F4 to switch among open apps.
;;F8::Send ^w                                                                             ; close the active window
F9::Send ^+{TAB}                                                                        ; go to next child window of an MDI window
F10::Send ^{TAB}                                                                        ; go to prev child window of an MDI window
;F11::Send ^{F4}                                                                         ; close the active child of an MDI window

; Caps lock to Ctrl
CapsLock::LCtrl

;-- when pressing CapsLock alone, it will activate Escape button
Capslock Up::
SendInput, {LControl Up}  ;-- For stability
If A_TimeSincePriorHotkey < 150
{
    SendInput, {Escape}
}
Else