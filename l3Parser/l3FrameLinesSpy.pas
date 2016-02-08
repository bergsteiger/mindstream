unit l3FrameLinesSpy;
 
{$Include l3Define.inc}

interface

uses
  l3InternalInterfaces,
  l3Filer,
  l3FrameObject,
  l3ProtoObject
  ;

type
 Il3FrameLinesLogger = interface(IUnknown)
   ['{E5FD726A-30C8-4738-830E-D410AAE40FCA}']
   function OpenLinesLog(const aCanvas: Il3InfoCanvas;
    aObjID: Integer): AnsiString;
   procedure CloseLinesLog(const aLogName: AnsiString);
   function GetPrecision: Integer;
 end;//Il3FrameLinesLogger

 Tl3FrameLinesSpy = class(Tl3ProtoObject)
  {* Сохранение информации по опечатанным линиям (для отрисовки не работает). }
 private
 // private fields
   f_Logger : Il3FrameLinesLogger;
   f_Filer : Tl3CustomFiler;
   f_Printing : Boolean;
   f_NeedClear : Boolean;
    {* Поле для свойства NeedClear}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   class function Exists: Boolean;
   procedure LogLines(aLines: Tl3FrameObject;
     const aCanvas: Il3InfoCanvas;
     anIndex: Integer);
   procedure SetLogger(const aLogger: Il3FrameLinesLogger;
     aPrinting: Boolean);
   procedure RemoveLogger(const aLogger: Il3FrameLinesLogger);
 public
 // public properties
   property NeedClear: Boolean
     read f_NeedClear
     write f_NeedClear;
 public
 // singleton factory method
   class function Instance: Tl3FrameLinesSpy;
    {- возвращает экземпляр синглетона. }
 end;//Tl3FrameLinesSpy

implementation

uses
  l3Base {a},
  l3FrameLine,
  l3Types,
  SysUtils,
  l3Interfaces
  ;


// start class Tl3FrameLinesSpy

var g_Tl3FrameLinesSpy : Tl3FrameLinesSpy = nil;

procedure Tl3FrameLinesSpyFree;
begin
 l3Free(g_Tl3FrameLinesSpy);
end;

class function Tl3FrameLinesSpy.Instance: Tl3FrameLinesSpy;
begin
 if (g_Tl3FrameLinesSpy = nil) then
 begin
  l3System.AddExitProc(Tl3FrameLinesSpyFree);
  g_Tl3FrameLinesSpy := Create;
 end;
 Result := g_Tl3FrameLinesSpy;
end;


class function Tl3FrameLinesSpy.Exists: Boolean;
//#UC START# *4D00B6A50143_4D00B058024F_var*
//#UC END# *4D00B6A50143_4D00B058024F_var*
begin
//#UC START# *4D00B6A50143_4D00B058024F_impl*
 Result := g_Tl3FrameLinesSpy <> nil;
//#UC END# *4D00B6A50143_4D00B058024F_impl*
end;//Tl3FrameLinesSpy.Exists

procedure Tl3FrameLinesSpy.LogLines(aLines: Tl3FrameObject;
  const aCanvas: Il3InfoCanvas;
  anIndex: Integer);
//#UC START# *4D00BAD501C9_4D00B058024F_var*

  function MangleCoord(aValue : Integer): Integer;
  begin
   with f_Logger do
    Result := (aValue div GetPrecision) * GetPrecision;
  end;

 function LogElement(Data: PObject; Index: Integer): Boolean;
 var
  i           : Integer;
  l_LinePart  : Tl3LinePart;
  l_FrameLine : Tl3FrameLine;
 begin
  Result := True;
  l_FrameLine := Tl3FrameLine(Data^);
  f_Filer.WriteLn('----');
  for i := 0 to l_FrameLine.GetBoundsArray.Count - 1 do
  begin
   l_LinePart := l_FrameLine.GetBoundsArray.Items[i];
   case l_LinePart.rDrawType of
    lpdDraw: f_Filer.WriteLn('lpdDraw');
    lpdSpecialDraw: f_Filer.WriteLn('lpdSpecialDraw');
    lpdHidden: f_Filer.WriteLn('lpdHidden');
   end; // case l_LinePart.rDrawType of
   f_Filer.WriteLn(Format('"Начало - Окончание": %d - %d', [MangleCoord(l_LinePart.rStart.LineCoordinate),
                                                           MangleCoord(l_LinePart.rFinish.LineCoordinate)]));
  end; // for i := 0 to l_FrameLine.GetBoundsArray.Count - 1 do
 end;

var
 l_LogName      : String;
 l_ColorArr     : Tl3LinesColorArray;
 l_RightLogging : Boolean;
//#UC END# *4D00BAD501C9_4D00B058024F_var*
begin
//#UC START# *4D00BAD501C9_4D00B058024F_impl*
 l_RightLogging := not (f_Printing xor aCanvas.Printing); // Или печать или отрисовка!
 if (f_Logger <> nil) and l_RightLogging and not f_NeedClear then
 begin
  l_LogName := f_Logger.OpenLinesLog(aCanvas, anIndex);
  f_Filer := Tl3CustomDOSFiler.Make(l_LogName, l3_fmWrite);
  try
   f_Filer.Open;
   try
    l_ColorArr := aLines.GetColorArray;
    if not aCanvas.Printing then
    begin
     f_Filer.WriteLn('----');
     f_Filer.WriteLn('Цвета:');
     f_Filer.WriteLn(Format('%d  %d  %d', [l_ColorArr[lpdDraw], l_ColorArr[lpdSpecialDraw], l_ColorArr[lpdHidden]]));
    end; // if not aCanvas.Printing then
    f_Filer.WriteLn('----');
    f_Filer.WriteLn('Горизонтальные линии:');
    aLines.GetLines(False).GetValues.IterateAllF(l3L2IA(@LogElement));
    f_Filer.WriteLn('----');
    f_Filer.WriteLn('Вертикальные линии:');
    aLines.GetLines(True).GetValues.IterateAllF(l3L2IA(@LogElement));
   finally
    f_Filer.Close;
   end;//try..finally
  finally
   FreeAndNil(f_Filer);
  end;//try..finally
  f_Logger.CloseLinesLog(l_LogName);
 end;//f_Logger <> nil
//#UC END# *4D00BAD501C9_4D00B058024F_impl*
end;//Tl3FrameLinesSpy.LogLines

procedure Tl3FrameLinesSpy.SetLogger(const aLogger: Il3FrameLinesLogger;
  aPrinting: Boolean);
//#UC START# *4D00CCAB029E_4D00B058024F_var*
//#UC END# *4D00CCAB029E_4D00B058024F_var*
begin
//#UC START# *4D00CCAB029E_4D00B058024F_impl*
 Assert(f_Logger = nil);
 f_NeedClear := False;
 f_Logger := aLogger;
 f_Printing := aPrinting;
//#UC END# *4D00CCAB029E_4D00B058024F_impl*
end;//Tl3FrameLinesSpy.SetLogger

procedure Tl3FrameLinesSpy.RemoveLogger(const aLogger: Il3FrameLinesLogger);
//#UC START# *4D00CCF000BC_4D00B058024F_var*
//#UC END# *4D00CCF000BC_4D00B058024F_var*
begin
//#UC START# *4D00CCF000BC_4D00B058024F_impl*
 Assert(f_Logger = aLogger);
 f_NeedClear := False;
 f_Logger := nil;
 f_Printing := False;
//#UC END# *4D00CCF000BC_4D00B058024F_impl*
end;//Tl3FrameLinesSpy.RemoveLogger

procedure Tl3FrameLinesSpy.Cleanup;
//#UC START# *479731C50290_4D00B058024F_var*
//#UC END# *479731C50290_4D00B058024F_var*
begin
//#UC START# *479731C50290_4D00B058024F_impl*
 FreeAndNil(f_Filer);
 inherited;
//#UC END# *479731C50290_4D00B058024F_impl*
end;//Tl3FrameLinesSpy.Cleanup

procedure Tl3FrameLinesSpy.ClearFields;
 {-}
begin
 f_Logger := nil;
 inherited;
end;//Tl3FrameLinesSpy.ClearFields

end.