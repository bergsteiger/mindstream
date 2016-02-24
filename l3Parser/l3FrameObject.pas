unit l3FrameObject;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Units,
  l3CoordinateMap,
  l3CProtoObject
  ;

type
 Tl3FrameObject = class(Tl3CProtoObject)
  {* Объект с рамкой }
 private
 // private fields
   f_LastBottom : Integer;
    {* Нижняя граница для выравнивания рамок.}
   f_CurrColorArray : Tl3LinesColorArray;
    {* Массив цветов для отрисовки линий}
   f_HorisontalLines : Tl3CoordinateMap;
    {* Массив горизонтальных линий для отрисовки}
   f_VerticalLines : Tl3CoordinateMap;
    {* Массив вертикальных линий для отрисовки}
   f_HorisontalBtmBuffer : Tl3CoordinateMap;
    {* Массив горизонтальных линий для выравнивания}
   f_FrameObjID : Integer;
    {* Поле для свойства FrameObjID}
   f_FinishedFO : Boolean;
    {* Поле для свойства FinishedFO}
   f_LineWidth : Integer;
    {* Поле для свойства LineWidth}
  {$If defined(nsTest)}
   f_NeedLog : Boolean;
    {* Поле для свойства NeedLog}
  {$IfEnd} //nsTest
 protected
 // property methods
   function pm_GetLineWidth: Integer;
   {$If defined(nsTest)}

   {$IfEnd} //nsTest
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aFrameID: Integer;
    const aColorArray: Tl3LinesColorArray); reintroduce;
   procedure AddFrame(const aFrame: Tl3Frame;
    const aFrameRect: Tl3Rect;
    anAnalizeType: Tl3FrameAnalizeType);
     {* Учесть рамку (продлить одну или несколько линий или создать новую) }
   procedure AlignBoundary(const aFrame: Tl3Frame;
    anIsSingle: Boolean);
     {* Применить выравнивающие ограничения - выравниванием все линии от aStart 
         до aFinish по значению Finish }
   procedure FinishFrameObject(aAlignValue: Integer);
     {* Скобки для отрисовки "сложных" объектов с рамками - таблиц }
   procedure DrawLines(const aCanvas: Il3Canvas);
     {* Нарисовать выровненные рамки }
   function GetAlignData: Il3IntegerList;
     {* Получить данный о выравнивании }
   procedure SetAlignData(const aData: Il3IntegerList);
     {* Сохранить информацию о выравнивании }
   procedure Clear;
     {* Очистить линии для текущего объекта. }
   function GetLines(aVertical: Boolean): Tl3CoordinateMap;
   function GetColorArray: Tl3LinesColorArray;
 public
 // public properties
   property FrameObjID: Integer
     read f_FrameObjID;
     {* Идентификатор отрисовываемого объета. Может быть указателем, номером 
         в списке параграфов - чем угодно, только бы был уникальным. В любом 
         случае информация хранится только до слеующей прорисовки }
   property FinishedFO: Boolean
     read f_FinishedFO
     write f_FinishedFO;
     {* Закончена ли отрисовка объекта. }
   property LineWidth: Integer
     read pm_GetLineWidth;
   {$If defined(nsTest)}
   property NeedLog: Boolean
     read f_NeedLog
     write f_NeedLog;
   {$IfEnd} //nsTest
 end;//Tl3FrameObject

implementation

uses
  l3Base,
  l3FrameLine,
  l3MinMax
  ;

// start class Tl3FrameObject

function Tl3FrameObject.pm_GetLineWidth: Integer;
//#UC START# *4A92848703B5_48CA64150378get_var*
//#UC END# *4A92848703B5_48CA64150378get_var*
begin
//#UC START# *4A92848703B5_48CA64150378get_impl*
 Result := f_LineWidth;
//#UC END# *4A92848703B5_48CA64150378get_impl*
end;//Tl3FrameObject.pm_GetLineWidth

constructor Tl3FrameObject.Create(aFrameID: Integer;
  const aColorArray: Tl3LinesColorArray);
//#UC START# *48CA655400D8_48CA64150378_var*
//#UC END# *48CA655400D8_48CA64150378_var*
begin
//#UC START# *48CA655400D8_48CA64150378_impl*
 inherited Create;
 f_FrameObjID := aFrameID;
 f_HorisontalLines := Tl3CoordinateMap.Create(false);
 f_VerticalLines := Tl3CoordinateMap.Create(true);
 f_HorisontalBtmBuffer := Tl3CoordinateMap.Create(false);
 f_CurrColorArray := aColorArray;
 f_LastBottom := 0;
 f_FinishedFO := False;
 f_LineWidth := 1;
//#UC END# *48CA655400D8_48CA64150378_impl*
end;//Tl3FrameObject.Create

procedure Tl3FrameObject.AddFrame(const aFrame: Tl3Frame;
  const aFrameRect: Tl3Rect;
  anAnalizeType: Tl3FrameAnalizeType);
//#UC START# *48CA656F02B4_48CA64150378_var*
var
 l_UpLine    : Tl3FrameLine;
 l_DownLine  : Tl3FrameLine;
 l_LeftLine  : Tl3FrameLine;
 l_RightLine : Tl3FrameLine;
//#UC END# *48CA656F02B4_48CA64150378_var*
begin
//#UC START# *48CA656F02B4_48CA64150378_impl*
 if anAnalizeType <> laDoNothing then
  if anAnalizeType = laCheckOnly then
  begin
   f_VerticalLines.ClearPrev(True);
   f_HorisontalBtmBuffer.CheckLine(aFrameRect.Left, aFrameRect.Right);
  end
  else
  begin
  // Запоминаем видимые и невидимые границы рамок, т.к. они нужны для выравнивания.
   l_UpLine := f_HorisontalLines.AddLine(aFrameRect.Top, nil, False);
   l_LeftLine := f_VerticalLines.AddLine(aFrameRect.Left, nil, False);
   if anAnalizeType = laDelayAlignLowLine then
    l_DownLine := f_HorisontalBtmBuffer.AddLine(cWaitAlignMean, nil, False)
   else
    l_DownLine := f_HorisontalBtmBuffer.AddLine(aFrameRect.Bottom, nil, False);
   l_RightLine := f_VerticalLines.AddLine(aFrameRect.Right, nil, True);
   // Добавляем границы к отрезкам.
   with aFrame.rP[l3_fpiUp] do
   begin
    l_UpLine.AddBounds(l_LeftLine, l_RightLine, rColor, rDrawType);
    f_LineWidth := Max(f_LineWidth, rWidth);
   end;
   with aFrame.rP[l3_fpiDown] do
   begin
    l_DownLine.AddBounds(l_LeftLine, l_RightLine, rColor, rDrawType);
    f_LineWidth := Max(f_LineWidth, rWidth);
   end;
   with aFrame.rP[l3_fpiLeft] do
   begin
    l_LeftLine.AddBounds(l_UpLine, l_DownLine, rColor, rDrawType);
    f_LineWidth := Max(f_LineWidth, rWidth);
   end;
   with aFrame.rP[l3_fpiRight] do
   begin
    l_RightLine.AddBounds(l_UpLine, l_DownLine, rColor, rDrawType);
    f_LineWidth := Max(f_LineWidth, rWidth);
   end;
  end
 else
  f_VerticalLines.ClearPrev(False);
//#UC END# *48CA656F02B4_48CA64150378_impl*
end;//Tl3FrameObject.AddFrame

procedure Tl3FrameObject.AlignBoundary(const aFrame: Tl3Frame;
  anIsSingle: Boolean);
//#UC START# *48CA65890091_48CA64150378_var*
//#UC END# *48CA65890091_48CA64150378_var*
begin
//#UC START# *48CA65890091_48CA64150378_impl*
 if anIsSingle then
  f_VerticalLines.SavePrev;
 f_VerticalLines.ClearPrev(False);
 f_HorisontalBtmBuffer.AlignBoundary(aFrame.rRect.Top, aFrame.rRect.Bottom, f_HorisontalLines);
 f_LastBottom := aFrame.rRect.Bottom;
//#UC END# *48CA65890091_48CA64150378_impl*
end;//Tl3FrameObject.AlignBoundary

procedure Tl3FrameObject.FinishFrameObject(aAlignValue: Integer);
//#UC START# *48CA65AD0380_48CA64150378_var*
//#UC END# *48CA65AD0380_48CA64150378_var*
begin
//#UC START# *48CA65AD0380_48CA64150378_impl*
 if not f_FinishedFO then
  f_LastBottom := Max(f_LastBottom, aAlignValue);
 f_VerticalLines.ClearPrev(True); 
 f_HorisontalBtmBuffer.AlignAllLines(f_LastBottom, f_HorisontalLines);
 f_FinishedFO := False;
//#UC END# *48CA65AD0380_48CA64150378_impl*
end;//Tl3FrameObject.FinishFrameObject

procedure Tl3FrameObject.DrawLines(const aCanvas: Il3Canvas);
//#UC START# *48CA65D00372_48CA64150378_var*
//#UC END# *48CA65D00372_48CA64150378_var*
begin
//#UC START# *48CA65D00372_48CA64150378_impl*
 f_HorisontalLines.DrawLines(aCanvas, f_CurrColorArray, f_LineWidth);
 f_VerticalLines.DrawLines(aCanvas, f_CurrColorArray, f_LineWidth);
//#UC END# *48CA65D00372_48CA64150378_impl*
end;//Tl3FrameObject.DrawLines

function Tl3FrameObject.GetAlignData: Il3IntegerList;
//#UC START# *4AB8764202D2_48CA64150378_var*
//#UC END# *4AB8764202D2_48CA64150378_var*
begin
//#UC START# *4AB8764202D2_48CA64150378_impl*
 Result := f_VerticalLines.GetAlignData;
//#UC END# *4AB8764202D2_48CA64150378_impl*
end;//Tl3FrameObject.GetAlignData

procedure Tl3FrameObject.SetAlignData(const aData: Il3IntegerList);
//#UC START# *4AB8766F019E_48CA64150378_var*
//#UC END# *4AB8766F019E_48CA64150378_var*
begin
//#UC START# *4AB8766F019E_48CA64150378_impl*
 f_VerticalLines.SetAlignData(aData);
//#UC END# *4AB8766F019E_48CA64150378_impl*
end;//Tl3FrameObject.SetAlignData

procedure Tl3FrameObject.Clear;
//#UC START# *4C651E890332_48CA64150378_var*
//#UC END# *4C651E890332_48CA64150378_var*
begin
//#UC START# *4C651E890332_48CA64150378_impl*
 f_HorisontalLines.Clear;
 f_VerticalLines.Clear;
 f_HorisontalBtmBuffer.Clear;
 f_LastBottom := 0;
//#UC END# *4C651E890332_48CA64150378_impl*
end;//Tl3FrameObject.Clear

function Tl3FrameObject.GetLines(aVertical: Boolean): Tl3CoordinateMap;
//#UC START# *4D00D5D700A4_48CA64150378_var*
//#UC END# *4D00D5D700A4_48CA64150378_var*
begin
//#UC START# *4D00D5D700A4_48CA64150378_impl*
 if aVertical then
  Result := f_VerticalLines
 else
  Result := f_HorisontalLines;
//#UC END# *4D00D5D700A4_48CA64150378_impl*
end;//Tl3FrameObject.GetLines

function Tl3FrameObject.GetColorArray: Tl3LinesColorArray;
//#UC START# *4DA4374C01A2_48CA64150378_var*
//#UC END# *4DA4374C01A2_48CA64150378_var*
begin
//#UC START# *4DA4374C01A2_48CA64150378_impl*
 Result := f_CurrColorArray;
//#UC END# *4DA4374C01A2_48CA64150378_impl*
end;//Tl3FrameObject.GetColorArray

procedure Tl3FrameObject.Cleanup;
//#UC START# *479731C50290_48CA64150378_var*
//#UC END# *479731C50290_48CA64150378_var*
begin
//#UC START# *479731C50290_48CA64150378_impl*
 {$If defined(nsTest)}
 f_NeedLog := false;
 {$IfEnd}
 l3Free(f_HorisontalLines);
 l3Free(f_VerticalLines);
 l3Free(f_HorisontalBtmBuffer);
 inherited;
//#UC END# *479731C50290_48CA64150378_impl*
end;//Tl3FrameObject.Cleanup

end.