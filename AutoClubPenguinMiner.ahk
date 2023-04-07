#Requires AutoHotkey v2

CoordMode "Mouse", "Screen"

global loopState := true

^q::
{
    Coords := [0, 0]
    While(loopState){
        While(IsValidPosition(Coords)){
            Rand := GetRandomPosition()
            Coords := GetMousePosition(Rand)
        }
        MouseMove Coords[0+1], Coords[1+1]
        Sleep 500
        Click
        Sleep 6000
        Send "{d}"
        Sleep 30000
    }
}

GetRandomPosition(){
    oldLoop := 0
    Rand := 0
    While(oldLoop != Rand){
        Rand := Random(1, 5)
    }
    return Rand
}

GetMousePosition(Index){
    Switch Index
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
    Return [x,y]
}

IsValidPosition(Coords){
    Colors := [0x67504C,0x634D49,0x5F4946,0x5B4643,0x574340,0x54403D]
    PixelColor := PixelGetColor(Coords[0+1], Coords[1+1])
    for Color in Colors
        if (PixelColor == Color){
            return true
        }
    return false
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