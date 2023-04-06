#Requires AutoHotkey v2

CoordMode "Mouse", "Screen"

^q::
{
    MouseGetPos &xpos, &ypos
    PixelSearch &ColorX, &ColorY, xpos, ypos, xpos, ypos, 0x67504C , 35
    If (ColorX != "" And ColorY != "")
    {
        ToolTip "ColorIsValid"
    }
    Else
    {
        ToolTip "ColorNotValid"
    }

    SetTimer () => ToolTip(), -500

}