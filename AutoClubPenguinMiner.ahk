#Requires AutoHotkey v2

CoordMode "Mouse", "Screen"

global loopState := true

^q::
{
    oldLoop := 0
    Rand := 0
    While loopState{
        global Rand := Random(1, 5)
        x := 0
        Y := 0

        If (Rand != oldLoop) {
            oldLoop := Rand
            Switch Rand
            {
                Case "1":
                    x := 715 
                    y := 649
                Case "2":
                    x := 880
                    y := 570
                Case "3":
                    x := 972
                    y := 815
                Case "4":
                    x := 1073
                    y := 696
                Case "5":
                    x := 1308
                    y := 723
            }

            MouseMove x, y
            Sleep 500
            Click
            Sleep 6000
            Send "{d}"
            Sleep 30000
        }
    }

}

^w::
{
    If (loopState){
        global loopState := False
        ToolTip "loop is false"
    }Else{
        global loopState := True
        ToolTip "loop is true"
    }
    
    SetTimer () => ToolTip(), -1000
}