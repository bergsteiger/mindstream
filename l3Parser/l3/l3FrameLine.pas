unit l3FrameLine;
 
{$Include ..\L3\l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Const,
  l3ProtoDataContainer,
  l3CProtoObject,
  l3Memory,
  l3Types,
  l3Core,
  l3Except,
  Classes
  ;

type
 Tl3FrameLinePrim = class(Tl3CProtoObject)
  {* Это чтобы избежать Tl3FrameLine "[Error] l3FrameLine.pas(40): Type 'Tl3FrameLine' is not yet completely defined" }
 private
 // private fields
   f_LineCoordinate : Integer;
    {* Поле для свойства LineCoordinate}
 protected
 // protected methods
   procedure ChangeLine(aSource: Tl3FrameLinePrim;
    aDest: Tl3FrameLinePrim); virtual; abstract;
     {* Сменить линию }
 public
 // public properties
   property LineCoordinate: Integer
     read f_LineCoordinate
     write f_LineCoordinate;
     {* Начальная точка линии в дюймах }
 end;//Tl3FrameLinePrim

 Tl3LinePart = {$IfDef XE4}record{$Else}object{$EndIf}
  {* Массив отрезков }
 public
   rWasDrawn : Boolean; // Уже была отрисована
   rStart : Tl3FrameLinePrim; // Линия окончания
   rFinish : Tl3FrameLinePrim; // Линия начала
   rDrawType : Tl3LinePartDrawType; // Тип отрисовки
 public
    function EQ(const Another: Tl3LinePart): Boolean;
 end;//Tl3LinePart

 {$Define l3Items_NoSort}

 _ItemType_ = Tl3LinePart;
 _l3RecordWithEQList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include ..\L3\l3RecordWithEQList.imp.pas}
 Tl3LineParts = class(_l3RecordWithEQList_)
  {* Отрезок }
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 end;//Tl3LineParts

const
  { Константы для выравнивания отрезков линий. }
 cWaitAlignMean = l3Const.l3ShapeNil - 1;
  { Ждать появления выравнивающего значения (нижней границы строки таблицы) }
 cAlingByBoundary = l3Const.l3ShapeNil - 2;
  { Выравнивать по нижней границе объекта отрисовки (таблицы) - ждать пока будет вызвано FrameAlignObject }

type
 Tl3FrameLine = class(Tl3FrameLinePrim)
  {* Выравнивающая линия }
 private
 // private fields
   f_BoundsArray : Tl3LineParts;
    {* Массив частей линии. http://mdp.garant.ru/pages/viewpage.action?pageId=89096241&focusedCommentId=115344375#comment-115344375}
 protected
 // realized methods
   procedure ChangeLine(aSource: Tl3FrameLinePrim;
    aDest: Tl3FrameLinePrim); override;
     {* Сменить линию }
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   procedure AssignData(aValue: Tl3FrameLine);
     {* Копируем данные об объекте }
   procedure DrawLine(const aCanvas: Il3Canvas;
    const aColorArray: Tl3LinesColorArray;
    aVert: Boolean;
    aWidth: Integer);
     {* Нарисовать линию }
   procedure AddBounds(aMinBound: Tl3FrameLine;
    aMaxBound: Tl3FrameLine;
    aColor: Integer;
    aLinePartType: Tl3LinePartDrawType);
     {* Добавляет границы для отрезка линии и корректирует её видимость }
   constructor Create(aLineCoordinate: Integer); reintroduce;
   procedure CheckCoordinate(aMinBound: Integer;
    aMaxBound: Integer);
     {* Функция проверяющая лежит находится ли коррдината линии в заданных пределах и если находится, то линия будет выравнена при следующем вызове AlignBoundary (используется для выравнивания нижних границ ячейек по нижней границе строки) }
   function GetBoundsArray: Tl3LineParts;
 end;//Tl3FrameLine

implementation

uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils,
  l3Units,
  Windows,
  l3UnitsTools
  ;

// start class Tl3LinePart

function Tl3LinePart.EQ(const Another: Tl3LinePart): Boolean;
//#UC START# *4BE2E84C0134_48CA54C5025F_var*
//#UC END# *4BE2E84C0134_48CA54C5025F_var*
begin
//#UC START# *4BE2E84C0134_48CA54C5025F_impl*
 Result :=
  (rWasDrawn = Another.rWasDrawn) AND
  (rStart = Another.rStart) AND
  (rFinish = Another.rFinish) AND
  (rDrawType = Another.rDrawType);
//#UC END# *4BE2E84C0134_48CA54C5025F_impl*
end;//Tl3LinePart.EQ
// start class Tl3LineParts

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_48CA557F02FF_var*
//#UC END# *47B2C42A0163_48CA557F02FF_var*
begin
//#UC START# *47B2C42A0163_48CA557F02FF_impl*
 Assert(false);
//#UC END# *47B2C42A0163_48CA557F02FF_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_48CA557F02FF_var*
//#UC END# *47B99D4503A2_48CA557F02FF_var*
begin
//#UC START# *47B99D4503A2_48CA557F02FF_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_48CA557F02FF_impl*
end;//CompareExistingItems

type _Instance_R_ = Tl3LineParts;

{$Include ..\L3\l3RecordWithEQList.imp.pas}

// start class Tl3LineParts

{$If not defined(DesignTimeLibrary)}
class function Tl3LineParts.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_48CA557F02FF_var*
//#UC END# *47A6FEE600FC_48CA557F02FF_var*
begin
//#UC START# *47A6FEE600FC_48CA557F02FF_impl*
 Result := true;
//#UC END# *47A6FEE600FC_48CA557F02FF_impl*
end;//Tl3LineParts.IsCacheable
{$IfEnd} //not DesignTimeLibrary
// start class Tl3FrameLine

procedure Tl3FrameLine.AssignData(aValue: Tl3FrameLine);
//#UC START# *48CA574603C2_48CA54A000F7_var*
var
 i          : Integer;
 l_Delta    : Integer;
 l_Count    : Integer;
 l_LinePart : Tl3LinePart;
//#UC END# *48CA574603C2_48CA54A000F7_var*
begin
//#UC START# *48CA574603C2_48CA54A000F7_impl*
 if (f_BoundsArray = nil) then
  f_BoundsArray := Tl3LineParts.Create;
 l_Count := f_BoundsArray.Count;
 l_Delta := l_Count;
 Inc(l_Count, aValue.f_BoundsArray.Count);
 for i := 0 to aValue.f_BoundsArray.Count - 1 do
 begin
  l_LinePart := aValue.f_BoundsArray[i];
  l_LinePart.rStart.ChangeLine(aValue, Self);
  l_LinePart.rFinish.ChangeLine(aValue, Self);
  l_LinePart.rWasDrawn := False;
  if l_LinePart.rDrawType <> lpdDraw then
   f_BoundsArray.Add(l_LinePart)
  else
   f_BoundsArray.Insert(0, l_LinePart);
 end; // for i := 0 to aValue.f_BoundsArray.Count - 1 do
//#UC END# *48CA574603C2_48CA54A000F7_impl*
end;//Tl3FrameLine.AssignData

procedure Tl3FrameLine.DrawLine(const aCanvas: Il3Canvas;
  const aColorArray: Tl3LinesColorArray;
  aVert: Boolean;
  aWidth: Integer);
//#UC START# *48CA575E00E2_48CA54A000F7_var*
var
 i       : Integer;
 l_X     : Integer;
 l_Y     : Integer;
 l_E     : Tl3SPoint;
 l_MW    : Integer;
 l_X1    : Integer;
 l_Y1    : Integer;
 l_LP    : Tl3LinePart;
 l_Count : Integer;
//#UC END# *48CA575E00E2_48CA54A000F7_var*
begin
//#UC START# *48CA575E00E2_48CA54A000F7_impl*
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
    if f_BoundsArray <> nil then
    begin
     l_Count := f_BoundsArray.Count - 1;
     for i := l_Count downto 0 do
     begin
      l_LP := f_BoundsArray[i];
      if aVert then
      begin
       l_X := LineCoordinate;
       l_X1 := l_X;
       l_Y := l_LP.rStart.LineCoordinate;
       l_Y1 := l_LP.rFinish.LineCoordinate;
      end//aVert
      else
      begin
       l_Y := LineCoordinate;
       l_Y1 := l_Y;
       l_X := l_LP.rStart.LineCoordinate;
       l_X1 := l_LP.rFinish.LineCoordinate;
      end;//else

      with l_LP do
       if not rWasDrawn and
          ((rDrawType = lpdDraw) or (DrawSpecial and (rDrawType = lpdSpecialDraw))) then
       begin
        l_E := LP2DP(l3Point(l_X1 - l_X, l_Y1 - l_Y));
        WindowOrg := l3Point(l_X, l_Y).Neg;
        BackColor := aColorArray[rDrawType];
        l_LP.rWasDrawn := True;
        if aVert then
         FillForeRect(l3SRect(l3SPoint0, l3SPoint(Max(aWidth, l_MW), l_E.Y)))
        else
         FillForeRect(l3SRect(l3SPoint0, l3SPoint(l_E.X, Max(aWidth, l_MW))));
        f_BoundsArray[i] := l_LP;
       end;//if (rDrawType = lpdDraw) ...
     end;//for i := 0 to f_BndArrayLen - 1 do
    end; // if f_BoundsArray <> nil then
   finally
    PopWO;
   end;//try..finally
  finally
   PopBC;
  end;//try..finally
 end;//with aCanvas
//#UC END# *48CA575E00E2_48CA54A000F7_impl*
end;//Tl3FrameLine.DrawLine

procedure Tl3FrameLine.AddBounds(aMinBound: Tl3FrameLine;
  aMaxBound: Tl3FrameLine;
  aColor: Integer;
  aLinePartType: Tl3LinePartDrawType);
//#UC START# *48CA578300F4_48CA54A000F7_var*
var                                 
 i           : Integer;
 l_Count     : Integer;
 l_Start     : Integer;
 l_Finish    : Integer;
 l_Start1    : Integer;
 l_Finish1   : Integer;
 l_FndIndex  : Integer; 
 l_LinePart  : Tl3LinePart;
 l_FoundPart : Tl3LinePart;
//#UC END# *48CA578300F4_48CA54A000F7_var*
begin
//#UC START# *48CA578300F4_48CA54A000F7_impl*
 Assert((aMinBound <> nil) and (aMaxBound <> nil), 'Одна из границ отрисовки линии не задана!');
 if (f_BoundsArray = nil) then
  f_BoundsArray := Tl3LineParts.Create;
 l_LinePart.rStart := aMinBound;
 l_LinePart.rFinish := aMaxBound;
 l_LinePart.rWasDrawn := False;
 l_LinePart.rDrawType := aLinePartType;
 l_Count := f_BoundsArray.Count;
 // Корректируем видимость линии.
 if l_Count > 1 then
 begin
  l_Start := l_LinePart.rStart.LineCoordinate;
  l_Finish := l_LinePart.rFinish.LineCoordinate;
  // Ищем предыдущую линию:
  l_FndIndex := -1;
  Dec(l_Count, 2);
  for i := l_Count downto 0 do
  begin
   l_Start1 := f_BoundsArray[i].rStart.LineCoordinate;
   l_Finish1 := f_BoundsArray[i].rFinish.LineCoordinate;
   if (Abs(l_Start - l_Start1) < L3FrameLinesDelta) and 
      (Abs(l_Finish - l_Finish1) < L3FrameLinesDelta) then
   begin
    l_FndIndex := i;
    Break;
   end; //if (Abs(l_Start - l_Start1) < L3FrameLinesDelta) and ...   
  end; //for i := f_BndArrayLen - 2 to 0 do
  // Анализируем...
  if l_FndIndex > -1 then
  begin
   // Далее идет попытка оптимизации (не выводим дублирующие строки):
   l_FoundPart := f_BoundsArray[l_FndIndex];
   if (l_FoundPart.rDrawType = lpdDraw) and
     (l_LinePart.rDrawType = lpdDraw) then
    l_FoundPart.rDrawType := lpdHidden;
   if (l_FoundPart.rDrawType = lpdSpecialDraw) and
     (l_LinePart.rDrawType = lpdDraw) then
    l_FoundPart.rDrawType := lpdHidden;
   if (l_FoundPart.rDrawType = lpdDraw) and
     (l_LinePart.rDrawType = lpdSpecialDraw) then
   begin
    l_FoundPart.rDrawType := lpdHidden;
    l_LinePart.rDrawType := lpdDraw;
   end; //if (l_FoundPart.rDrawType = lpdDraw) and
   if (l_FoundPart.rDrawType = lpdSpecialDraw) and
      (l_LinePart.rDrawType = lpdSpecialDraw) then
    l_LinePart.rDrawType := lpdHidden;
   f_BoundsArray[l_FndIndex] := l_FoundPart;
  end; //if l_FndIndex > -1 then
 end; //if f_BndArrayLen > 1 then
 if l_LinePart.rDrawType = lpdDraw then
  f_BoundsArray.Insert(0, l_LinePart)
 else
  f_BoundsArray.Add(l_LinePart);
//#UC END# *48CA578300F4_48CA54A000F7_impl*
end;//Tl3FrameLine.AddBounds

constructor Tl3FrameLine.Create(aLineCoordinate: Integer);
//#UC START# *48CA57CF0049_48CA54A000F7_var*
//#UC END# *48CA57CF0049_48CA54A000F7_var*
begin
//#UC START# *48CA57CF0049_48CA54A000F7_impl*
 inherited Create;
 f_LineCoordinate := aLineCoordinate;
//#UC END# *48CA57CF0049_48CA54A000F7_impl*
end;//Tl3FrameLine.Create

procedure Tl3FrameLine.CheckCoordinate(aMinBound: Integer;
  aMaxBound: Integer);
//#UC START# *491449690084_48CA54A000F7_var*
//#UC END# *491449690084_48CA54A000F7_var*
begin
//#UC START# *491449690084_48CA54A000F7_impl*
 if (Abs(f_BoundsArray[0].rStart.LineCoordinate - aMinBound) <= L3FrameLinesDelta) and
    (Abs(f_BoundsArray[0].rFinish.LineCoordinate - aMaxBound) <= L3FrameLinesDelta) then
  f_LineCoordinate := cAlingByBoundary;
//#UC END# *491449690084_48CA54A000F7_impl*
end;//Tl3FrameLine.CheckCoordinate

function Tl3FrameLine.GetBoundsArray: Tl3LineParts;
//#UC START# *4D00C0D90279_48CA54A000F7_var*
//#UC END# *4D00C0D90279_48CA54A000F7_var*
begin
//#UC START# *4D00C0D90279_48CA54A000F7_impl*
 Result := f_BoundsArray;
//#UC END# *4D00C0D90279_48CA54A000F7_impl*
end;//Tl3FrameLine.GetBoundsArray

procedure Tl3FrameLine.ChangeLine(aSource: Tl3FrameLinePrim;
  aDest: Tl3FrameLinePrim);
//#UC START# *48CA56FC0278_48CA54A000F7_var*
var
 i      : Integer;
 l_Part : Tl3LinePart;
 l_Count: Integer;
//#UC END# *48CA56FC0278_48CA54A000F7_var*
begin
//#UC START# *48CA56FC0278_48CA54A000F7_impl*
 if (f_BoundsArray <> nil) then
 begin
  l_Count := f_BoundsArray.Count - 1;
  for i := 0 to l_Count do
  begin
   l_Part := f_BoundsArray[i];
   if l_Part.rStart = aSource then
    l_Part.rStart := aDest;
   if l_Part.rFinish = aSource then
    l_Part.rFinish := aDest;
   f_BoundsArray[i] := l_Part;
  end; //for i := 0 to f_BndArrayLen - 1 do
 end; // if (f_BoundsArray <> nil) then
//#UC END# *48CA56FC0278_48CA54A000F7_impl*
end;//Tl3FrameLine.ChangeLine

procedure Tl3FrameLine.Cleanup;
//#UC START# *479731C50290_48CA54A000F7_var*
//#UC END# *479731C50290_48CA54A000F7_var*
begin
//#UC START# *479731C50290_48CA54A000F7_impl*
 FreeAndNil(f_BoundsArray);
 inherited;
//#UC END# *479731C50290_48CA54A000F7_impl*
end;//Tl3FrameLine.Cleanup

end.