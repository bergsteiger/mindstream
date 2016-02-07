unit l3FrameLines;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Units,
  l3FrameObject,
  l3FrameObjectList,
  l3CProtoObject
  ;

type
 Tl3FrameLines = class(Tl3CProtoObject, Il3FrameLines)
  {* Комментарии к использованию: 
Есть возможность отрисовывать все накопленные линии сразу или по одному 
объекту (в качестве идентификатора выступает PID). Последнее используется 
при выводе на печать. При выводе на экран накапливается информация для всех 
таблиц, а потом выводить все за один прием выводится. Можно использовать
для любых объектов, имеющих рамку, но пока используется только для таблиц. }
 private
 // private fields
  {$If defined(nsTest)}
   f_LastFoundObjIndex : Integer;
    {* Используется для тестов для формирования уникального имени лога для таблицы}
  {$IfEnd} //nsTest
   f_FrameObjects : Tl3FrameObjectList;
    {* Массив списка линий по данной координате}
   f_Behaviour : Tl3FrameObjectBehaviour;
 private
 // private methods
   function GetFrameObjects: Tl3FrameObjectList;
 protected
 // realized methods
   function Get_FinishedFO(aFrameObjID: Integer): Boolean;
   procedure Set_FinishedFO(aFrameObjID: Integer; aValue: Boolean);
 public
 // realized methods
   procedure StartFrameObject(anBehaviour: Tl3FrameObjectBehaviour;
    aFrameObjID: Integer;
    const aColorArray: Tl3LinesColorArray);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure FinishFrameObject(anObjectID: Integer;
    aAlignValue: Integer);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц. }
   procedure AddFrame(const aCanvas: Il3Canvas;
    anObjectID: Integer;
    const aFrame: Tl3Frame;
    anAnalizeType: Tl3FrameAnalizeType);
     {* Учесть рамку (продлить одну или несколько линий или создать новую). }
   procedure AlignBoundary(anObjectID: Integer;
    const aFrame: Tl3Frame;
    anIsSingle: Boolean);
     {* Применить выравнивающие ограничения. }
   procedure DrawAllLines(const aCanvas: Il3Canvas;
    anObjectID: Integer);
     {* Нарисовать выровненные рамки. anObjectID = -1 выводить все линии, 
          если anObjectID > -1, то выводим линии только для одного объекта. 
          Пока в качестве anObjectID передается PID параграфа (таблицы и т.п.) }
   procedure DrawFrame(const aCanvas: Il3Canvas;
    const aFrame: Tl3Frame;
    const aText: Il3FrameTextPainter);
     {* Отрисовывает рамку. }
   function GetLineWidth(aFrameObjID: Integer): Integer;
     {* Возвращает ширину линии для указанного объекта. }
   function ReadAlignData(anObjectID: Integer): Il3IntegerList;
     {* Прочитать массив данных для сохранения }
   procedure WriteAlignData(anObjectID: Integer;
    const aData: Il3IntegerList);
     {* Записать данные о выравнивании }
   {$If defined(nsTest)}
   procedure SetNeedLogging(anObjectID: Integer;
    aNeedLog: Boolean);
     {* Метод для тестов. Выставляет флаг объекту о необходимости записи в лог. }
   {$IfEnd} //nsTest
   {$If defined(nsTest)}
   procedure ClearFrameObject(aFrameObjID: Integer);
   {$IfEnd} //nsTest
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
 protected
 // protected methods
   function InternalFrameObject(anObjID: Integer): Tl3FrameObject;
     {* Возвращает объект отрисовки по ключу }
   procedure UpdateFrameRect(const aCanvas: Il3Canvas;
    const aFrame: Tl3Frame;
    var aRect: Tl3Rect);
     {* Добавить к aRect отсутпы границ рамок }
 public
 // public methods
   class function Make: Il3FrameLines; reintroduce;
     {* конструктор }
 end;//Tl3FrameLines

implementation

uses
  l3Base,
  l3Types,
  l3MinMax,
  Windows,
  l3FrameLinesSpy
  ;

// start class Tl3FrameLines

function Tl3FrameLines.GetFrameObjects: Tl3FrameObjectList;
//#UC START# *51B96284001B_48CA6E8201B8_var*
//#UC END# *51B96284001B_48CA6E8201B8_var*
begin
//#UC START# *51B96284001B_48CA6E8201B8_impl*
 if f_FrameObjects = nil then
  f_FrameObjects := Tl3FrameObjectList.Make;
 Result := f_FrameObjects;
//#UC END# *51B96284001B_48CA6E8201B8_impl*
end;//Tl3FrameLines.GetFrameObjects

class function Tl3FrameLines.Make: Il3FrameLines;
var
 l_Inst : Tl3FrameLines;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function Tl3FrameLines.InternalFrameObject(anObjID: Integer): Tl3FrameObject;
//#UC START# *48CA703303A3_48CA6E8201B8_var*

 function CheckElement(Data: PObject; Index: Integer): Boolean;
 begin
  Result := Tl3FrameObject(Data^).FrameObjID <> anObjID;
  if not Result then
  begin
   InternalFrameObject := Tl3FrameObject(Data^);
   {$IFDEF nsTest}
   f_LastFoundObjIndex := Index;
   {$ENDIF nsTest}
  end;
 end;

//#UC END# *48CA703303A3_48CA6E8201B8_var*
begin
//#UC START# *48CA703303A3_48CA6E8201B8_impl*
 Result := nil;
 if f_Behaviour = l3_fobIgnore then Exit;
 {$IFDEF nsTest}
 f_LastFoundObjIndex := -1;
 {$ENDIF nsTest}
 GetFrameObjects.IterateAllF(l3L2IA(@CheckElement));
//#UC END# *48CA703303A3_48CA6E8201B8_impl*
end;//Tl3FrameLines.InternalFrameObject

procedure Tl3FrameLines.UpdateFrameRect(const aCanvas: Il3Canvas;
  const aFrame: Tl3Frame;
  var aRect: Tl3Rect);
//#UC START# *48CA70430236_48CA6E8201B8_var*
//#UC END# *48CA70430236_48CA6E8201B8_var*
begin
//#UC START# *48CA70430236_48CA6E8201B8_impl*
 aRect := Tl3Rect(aFrame.rRect);
 Inc(aRect.R.Top, aFrame.rP[l3_fpiUp].rSpaceBefore);
 Inc(aRect.R.Left, aFrame.rP[l3_fpiLeft].rSpaceBefore);
 Dec(aRect.R.Bottom, aFrame.rP[l3_fpiDown].rSpaceAfter);
 if aFrame.rInfinite then
  aRect.Right := Max(aRect.Right, aCanvas.GetClientRect.Right);
//#UC END# *48CA70430236_48CA6E8201B8_impl*
end;//Tl3FrameLines.UpdateFrameRect

procedure Tl3FrameLines.StartFrameObject(anBehaviour: Tl3FrameObjectBehaviour;
  aFrameObjID: Integer;
  const aColorArray: Tl3LinesColorArray);
//#UC START# *4A4CB2B2031F_48CA6E8201B8_var*
var
 l_FrameObject : Tl3FrameObject;
//#UC END# *4A4CB2B2031F_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2B2031F_48CA6E8201B8_impl*
 f_Behaviour := anBehaviour;
 if f_Behaviour <> l3_fobIgnore then
 begin
  l_FrameObject := InternalFrameObject(aFrameObjID);
  if (l_FrameObject = nil) then
  begin
   l_FrameObject := Tl3FrameObject.Create(aFrameObjID, aColorArray);
   try
    GetFrameObjects.Add(l_FrameObject);
   finally
    l3Free(l_FrameObject);
   end;//try..finally
  end//l_FrameObject = nil
  else
   if f_Behaviour = l3_fobPrinting then
    l_FrameObject.Clear
   {$IFDEF nsTest}
   else
    if Tl3FrameLinesSpy.Exists and l_FrameObject.NeedLog and Tl3FrameLinesSpy.Instance.NeedClear then
     l_FrameObject.Clear;
   {$ENDIF nsTest}
 end;
//#UC END# *4A4CB2B2031F_48CA6E8201B8_impl*
end;//Tl3FrameLines.StartFrameObject

procedure Tl3FrameLines.FinishFrameObject(anObjectID: Integer;
  aAlignValue: Integer);
//#UC START# *4A4CB2BE0134_48CA6E8201B8_var*
var
 l_FrameObject: Tl3FrameObject;
//#UC END# *4A4CB2BE0134_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2BE0134_48CA6E8201B8_impl*
 l_FrameObject := InternalFrameObject(anObjectID);
 try
  if (l_FrameObject <> nil) then 
   l_FrameObject.FinishFrameObject(aAlignValue);
 finally
  l_FrameObject := nil;
 end; 
//#UC END# *4A4CB2BE0134_48CA6E8201B8_impl*
end;//Tl3FrameLines.FinishFrameObject

procedure Tl3FrameLines.AddFrame(const aCanvas: Il3Canvas;
  anObjectID: Integer;
  const aFrame: Tl3Frame;
  anAnalizeType: Tl3FrameAnalizeType);
//#UC START# *4A4CB2C300F6_48CA6E8201B8_var*
var
 l_FrameObject : Tl3FrameObject;
 l_Frame       : Tl3Rect; 
//#UC END# *4A4CB2C300F6_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2C300F6_48CA6E8201B8_impl*
 l_FrameObject := InternalFrameObject(anObjectID);
 try
  if l_FrameObject <> nil then
  begin
   UpdateFrameRect(aCanvas, aFrame, l_Frame);
   l_FrameObject.AddFrame(aFrame, l_Frame, anAnalizeType);
  end; 
 finally
  l_FrameObject := nil
 end;
//#UC END# *4A4CB2C300F6_48CA6E8201B8_impl*
end;//Tl3FrameLines.AddFrame

procedure Tl3FrameLines.AlignBoundary(anObjectID: Integer;
  const aFrame: Tl3Frame;
  anIsSingle: Boolean);
//#UC START# *4A4CB2D20019_48CA6E8201B8_var*
var
 l_FrameObject: Tl3FrameObject;
//#UC END# *4A4CB2D20019_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2D20019_48CA6E8201B8_impl*
 l_FrameObject := InternalFrameObject(anObjectID);
 try
  if l_FrameObject <> nil then
   l_FrameObject.AlignBoundary(aFrame, anIsSingle);
 finally
  l_FrameObject := nil;
 end;
//#UC END# *4A4CB2D20019_48CA6E8201B8_impl*
end;//Tl3FrameLines.AlignBoundary

procedure Tl3FrameLines.DrawAllLines(const aCanvas: Il3Canvas;
  anObjectID: Integer);
//#UC START# *4A4CB2DD02ED_48CA6E8201B8_var*
var
 l_FrameObject: Tl3FrameObject;
//#UC END# *4A4CB2DD02ED_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2DD02ED_48CA6E8201B8_impl*
 l_FrameObject := InternalFrameObject(anObjectID);  
 try
  if l_FrameObject <> nil then                
  begin
   l_FrameObject.DrawLines(aCanvas);
   {$IFDEF nsTest}
   try
    if Tl3FrameLinesSpy.Exists and l_FrameObject.NeedLog then
     Tl3FrameLinesSpy.Instance.LogLines(l_FrameObject, aCanvas, f_LastFoundObjIndex);
   finally
   {$ENDIF nsTest}
   {$IFDEF nsTest}
   end;//try..finally
   {$ENDIF nsTest}
  end; // if l_FrameObject <> nil then
 finally
  l_FrameObject := nil;
 end; 
//#UC END# *4A4CB2DD02ED_48CA6E8201B8_impl*
end;//Tl3FrameLines.DrawAllLines

procedure Tl3FrameLines.DrawFrame(const aCanvas: Il3Canvas;
  const aFrame: Tl3Frame;
  const aText: Il3FrameTextPainter);
//#UC START# *4A4CB2E1010D_48CA6E8201B8_var*
var
 l_E     : Tl3SPoint;
 l_MW    : Integer;
 l_Rect  : Tl3Rect;
 l_Frame : Tl3Frame;
//#UC END# *4A4CB2E1010D_48CA6E8201B8_var*
begin
//#UC START# *4A4CB2E1010D_48CA6E8201B8_impl*
 with aCanvas do
 begin
  PushBC;
  try
   PushWO;
   try
    PushWO;
    try
     SWindowOrg := l3SPoint0;
     l_E := l3SPoint(1, 1);
     DPtoLP(DC, l_E, 1);
     // - Без сдвига начала координат в ноль эта функция возвращает неправильные значения
     l_MW := l_E.X;
    finally
     PopWO;
    end;//try..finally
    UpdateFrameRect(aCanvas, aFrame, l_Rect);

    with l_Rect do
     l_E := LP2DP(BottomRight.Sub(TopLeft));

    WindowOrg := l3Point(l_Rect.Left, l_Rect.Top).Neg;

    with aFrame.rP[l3_fpiUp] do
     if ((rDrawType = lpdDraw) or
        ((rDrawType = lpdSpecialDraw) and DrawSpecial)) AND
        (rWidth > 0) then
     begin
      BackColor := rColor;
      FillForeRect(l3SRect(l3SPoint0, l3SPoint(l_E.X, Max(rWidth, l_MW))));
     end;//rVisible

    if (aText <> nil) then
    begin
     BackColor := TopBC;
     aText.DrawFrameText(true);
    end;//aText <> nil

    with aFrame.rP[l3_fpiLeft] do
      if ((rDrawType = lpdDraw) or
        ((rDrawType = lpdSpecialDraw) and DrawSpecial)) AND
        (rWidth > 0) then
     begin
      WindowOrg := l3Point(l_Rect.Left, l_Rect.Top).Neg;
      BackColor := rColor;
      FillForeRect(l3SRect(l3SPoint0, l3SPoint(Max(rWidth, l_MW), l_E.Y)));
     end;//rVisible

    WindowOrg := l3Point(l_Rect.Left, l_Rect.Bottom).Neg;
    if (aText <> nil) then
    begin
     BackColor := TopBC;
     aText.DrawFrameText(false);
    end;//aText <> nil
    
    with aFrame.rP[l3_fpiDown] do
      if ((rDrawType = lpdDraw) or
        ((rDrawType = lpdSpecialDraw) and DrawSpecial)) AND
        (rWidth > 0) then
     begin
      BackColor := rColor;
      FillForeRect(l3SRect(l3SPoint0, l3SPoint(l_E.X, Max(rWidth, l_MW))));
     end;//rVisible

    with aFrame.rP[l3_fpiRight] do
      if ((rDrawType = lpdDraw) or
        ((rDrawType = lpdSpecialDraw) and DrawSpecial)) AND
        (rWidth > 0) then          
     begin
      WindowOrg := l3Point(l_Rect.Right, l_Rect.Top).Neg;
      BackColor := rColor;
      FillForeRect(l3SRect(l3SPoint0, l3SPoint(Max(rWidth, l_MW), l_E.Y)));
     end;//rVisible
   finally
    PopWO;
   end;//try..finally
  finally
   PopBC;
  end;//try..finally
 end;
//#UC END# *4A4CB2E1010D_48CA6E8201B8_impl*
end;//Tl3FrameLines.DrawFrame

function Tl3FrameLines.Get_FinishedFO(aFrameObjID: Integer): Boolean;
//#UC START# *4A810BC702C0_48CA6E8201B8get_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4A810BC702C0_48CA6E8201B8get_var*
begin
//#UC START# *4A810BC702C0_48CA6E8201B8get_impl*
 Result := False;
 l_FO := InternalFrameObject(aFrameObjID);
 if l_FO <> nil then
  Result := l_FO.FinishedFO;
//#UC END# *4A810BC702C0_48CA6E8201B8get_impl*
end;//Tl3FrameLines.Get_FinishedFO

procedure Tl3FrameLines.Set_FinishedFO(aFrameObjID: Integer; aValue: Boolean);
//#UC START# *4A810BC702C0_48CA6E8201B8set_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4A810BC702C0_48CA6E8201B8set_var*
begin
//#UC START# *4A810BC702C0_48CA6E8201B8set_impl*
 l_FO := InternalFrameObject(aFrameObjID);
 if l_FO <> nil then
  l_FO.FinishedFO := aValue;
//#UC END# *4A810BC702C0_48CA6E8201B8set_impl*
end;//Tl3FrameLines.Set_FinishedFO

function Tl3FrameLines.GetLineWidth(aFrameObjID: Integer): Integer;
//#UC START# *4A928509010C_48CA6E8201B8_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4A928509010C_48CA6E8201B8_var*
begin
//#UC START# *4A928509010C_48CA6E8201B8_impl*
 Result := 1;
 l_FO := InternalFrameObject(aFrameObjID);
 if l_FO <> nil then
  Result := l_FO.LineWidth;
//#UC END# *4A928509010C_48CA6E8201B8_impl*
end;//Tl3FrameLines.GetLineWidth

function Tl3FrameLines.ReadAlignData(anObjectID: Integer): Il3IntegerList;
//#UC START# *4AB873270004_48CA6E8201B8_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4AB873270004_48CA6E8201B8_var*
begin
//#UC START# *4AB873270004_48CA6E8201B8_impl*
 l_FO := InternalFrameObject(anObjectID);
 if l_FO = nil then
  Result := nil
 else
  Result := l_FO.GetAlignData
//#UC END# *4AB873270004_48CA6E8201B8_impl*
end;//Tl3FrameLines.ReadAlignData

procedure Tl3FrameLines.WriteAlignData(anObjectID: Integer;
  const aData: Il3IntegerList);
//#UC START# *4AB8736B0062_48CA6E8201B8_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4AB8736B0062_48CA6E8201B8_var*
begin
//#UC START# *4AB8736B0062_48CA6E8201B8_impl*
 l_FO := InternalFrameObject(anObjectID);
 if l_FO <> nil then
  l_FO.SetAlignData(aData);
//#UC END# *4AB8736B0062_48CA6E8201B8_impl*
end;//Tl3FrameLines.WriteAlignData

{$If defined(nsTest)}
procedure Tl3FrameLines.SetNeedLogging(anObjectID: Integer;
  aNeedLog: Boolean);
//#UC START# *4D01F080037C_48CA6E8201B8_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4D01F080037C_48CA6E8201B8_var*
begin
//#UC START# *4D01F080037C_48CA6E8201B8_impl*
 l_FO := InternalFrameObject(anObjectID);
 if l_FO <> nil then
  l_FO.NeedLog := aNeedLog;
//#UC END# *4D01F080037C_48CA6E8201B8_impl*
end;//Tl3FrameLines.SetNeedLogging
{$IfEnd} //nsTest

{$If defined(nsTest)}
procedure Tl3FrameLines.ClearFrameObject(aFrameObjID: Integer);
//#UC START# *4E54CF2D00D3_48CA6E8201B8_var*
var
 l_FO: Tl3FrameObject;
//#UC END# *4E54CF2D00D3_48CA6E8201B8_var*
begin
//#UC START# *4E54CF2D00D3_48CA6E8201B8_impl*
 l_FO := InternalFrameObject(aFrameObjID);
 if l_FO <> nil then
  l_FO.Clear;
//#UC END# *4E54CF2D00D3_48CA6E8201B8_impl*
end;//Tl3FrameLines.ClearFrameObject
{$IfEnd} //nsTest

procedure Tl3FrameLines.Cleanup;
//#UC START# *479731C50290_48CA6E8201B8_var*
//#UC END# *479731C50290_48CA6E8201B8_var*
begin
//#UC START# *479731C50290_48CA6E8201B8_impl*
 l3Free(f_FrameObjects);
 f_Behaviour := l3_fobNone;
 inherited;
//#UC END# *479731C50290_48CA6E8201B8_impl*
end;//Tl3FrameLines.Cleanup

procedure Tl3FrameLines.InitFields;
//#UC START# *47A042E100E2_48CA6E8201B8_var*
//#UC END# *47A042E100E2_48CA6E8201B8_var*
begin
//#UC START# *47A042E100E2_48CA6E8201B8_impl*
 inherited;
 {$If defined(nsTest)}
 f_LastFoundObjIndex := -1;
 f_Behaviour := l3_fobNone;
 {$IfEnd}
//#UC END# *47A042E100E2_48CA6E8201B8_impl*
end;//Tl3FrameLines.InitFields

end.