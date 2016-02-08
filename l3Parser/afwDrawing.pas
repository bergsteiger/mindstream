unit afwDrawing;

{ Библиотека "Application Framework" }
{ Модуль: afw -                      }

{$Include afwDefine.inc }

interface
Uses Windows, Graphics, Types;

procedure AwfDrawSizeGrip(aDC: THandle; aRect: TRect; aBgColor: TColor);

implementation

procedure AwfDrawSizeGrip(aDC: THandle; aRect: TRect; aBgColor: TColor);
var h_Brush, h_BrushOld: HBRUSH;
    h_Pen1, h_Pen2, h_PenOld: HPEN;
begin
 h_Brush := CreateSolidBrush(ColorToRGB(aBgColor));
 try
  h_BrushOld := SelectObject(aDC, h_Brush);
  Dec(aRect.Left, 4);
  Dec(aRect.Top);
  FillRect(aDC, aRect, h_Brush);

  h_Pen1 := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNHIGHLIGHT));
  try
   h_PenOld := SelectObject(aDC, h_Pen1);
   Inc(aRect.Left, 3);
   MoveToEx(aDC, aRect.Right - 2, aRect.Bottom, nil);
   LineTo(aDC, aRect.Right, aRect.Bottom - 2);
   MoveToEx(aDC, aRect.Right - 13, aRect.Bottom, nil);
   LineTo(aDC, aRect.Right, aRect.Bottom - 13);
   MoveToEx(aDC, aRect.Right - 9, aRect.Bottom, nil);
   LineTo(aDC, aRect.Right, aRect.Bottom - 9);
   MoveToEx(aDC, aRect.Right - 5, aRect.Bottom, nil);
   LineTo(aDC, aRect.Right, aRect.Bottom - 5);
   MoveToEx(aDC, aRect.Right - 1, aRect.Bottom, nil);
   LineTo(aDC, aRect.Right, aRect.Bottom);

   h_Pen2 := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNSHADOW));
   try
    SelectObject(aDC, h_Pen2);
    MoveToEx(aDC, aRect.Right - 11, aRect.Bottom, nil);
    LineTo(aDC, aRect.Right, aRect.Bottom - 11);
    MoveToEx(aDC, aRect.Right - 7, aRect.Bottom, nil);
    LineTo(aDC, aRect.Right, aRect.Bottom - 7);
    MoveToEx(aDC, aRect.Right - 3, aRect.Bottom, nil);
    LineTo(aDC, aRect.Right, aRect.Bottom - 3);
    {$IfNDef Nemesis}
    SetDCBrushColor(aDC, ColorToRGB(aBgColor));
    SetDCPenColor(aDC, ColorToRGB(clBtnShadow));
    MoveToEx(aDC, aRect.Left, aRect.Top, nil);
    LineTo(aDC, aRect.Right, aRect.Top);
    {$EndIf  Nemesis}
   finally
    DeleteObject(h_Pen2);
   end;//try..finally
   SelectObject(aDC, h_PenOld);
  finally
   DeleteObject(h_Pen1);
  end;//try..finally
  SelectObject(aDC, h_BrushOld);
 finally
  DeleteObject(h_Brush);
 end;//try..finally
end;

end.

