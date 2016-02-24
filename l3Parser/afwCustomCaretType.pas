unit afwCustomCaretType;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3_Base,
  Classes,
  Graphics
  ;

type
 TafwCaretShape = (
  {* Форма каретки. }
   csBlock // block over whole cell
 , csHalfBlock // block over bottom part of cell
 , csVertLine // vertical line to left of cell
 , csHorzLine // horizontal line on bottom of cell
 , csCustom // custom width/height
 , csBitmap // bitmap caret, custom width/height
 );//TafwCaretShape

 TafwCaretAlign = (
  {* Выравнивание каретки. }
   caLeft // left side, centered vertically
 , caTop // top side, centered horizontally
 , caRight // right side, centered vertically
 , caBottom // bottom side, centered horizontally
 , caCenter // centered vertically and horizontally
 );//TafwCaretAlign

const
  { Defaults }
 DefAlign = caLeft;
 DefBlinkTime = 0;
 DefCaretWd = 2;
 DefCaretHt = 10;
 DefIsGray = False;
 DefShape = csVertLine;

type
 TafwCustomCaretType = class(Tl3_Base)
  {* Тип формы каретки. }
 private
 // private fields
   f_OnChange : TNotifyEvent;
    {* Поле для свойства OnChange}
   f_Shape : TafwCaretShape;
    {* Поле для свойства Shape}
   f_Bitmap : TBitmap;
    {* Поле для свойства Bitmap}
   f_BitmapHotSpotX : Integer;
    {* Поле для свойства BitmapHotSpotX}
   f_BitmapHotSpotY : Integer;
    {* Поле для свойства BitmapHotSpotY}
   f_Align : TafwCaretAlign;
    {* Поле для свойства Align}
   f_BlinkTime : Word;
    {* Поле для свойства BlinkTime}
   f_CaretHeight : Integer;
    {* Поле для свойства CaretHeight}
   f_CaretWidth : Integer;
    {* Поле для свойства CaretWidth}
   f_IsGray : Boolean;
    {* Поле для свойства IsGray}
 protected
 // property methods
   procedure pm_SetShape(aValue: TafwCaretShape);
   procedure pm_SetBitmap(aValue: TBitmap);
   procedure pm_SetBitmapHotSpotX(aValue: Integer);
   procedure pm_SetBitmapHotSpotY(aValue: Integer);
   procedure pm_SetAlign(aValue: TafwCaretAlign);
   procedure pm_SetBlinkTime(aValue: Word);
   procedure pm_SetCaretHeight(aValue: Integer);
   procedure pm_SetCaretWidth(aValue: Integer);
   procedure pm_SetIsGray(aValue: Boolean);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected methods
   procedure NotifyChange;
 public
 // public methods
   constructor Create; reintroduce; virtual;
 public
 // public properties
   property OnChange: TNotifyEvent
     read f_OnChange
     write f_OnChange;
     {* нотификация об изменении параметров каретки. }
   property Shape: TafwCaretShape
     read f_Shape
     write pm_SetShape
     default DefShape;
     {* форма курсора. }
   property Bitmap: TBitmap
     read f_Bitmap
     write pm_SetBitmap;
     {* картинка курсора. }
   property BitmapHotSpotX: Integer
     read f_BitmapHotSpotX
     write pm_SetBitmapHotSpotX
     default 0;
     {* смещение каретки относительно картинки по оси X. }
   property BitmapHotSpotY: Integer
     read f_BitmapHotSpotY
     write pm_SetBitmapHotSpotY
     default 0;
     {* смещение каретки относительно картинки по оси Y. }
   property Align: TafwCaretAlign
     read f_Align
     write pm_SetAlign
     default DefAlign;
     {* выравнивание курсора. }
   property BlinkTime: Word
     read f_BlinkTime
     write pm_SetBlinkTime
     default DefBlinkTime;
     {* период мигания курсора (в милисекундах). }
   property CaretHeight: Integer
     read f_CaretHeight
     write pm_SetCaretHeight
     default DefCaretHt;
     {* высота курсора. }
   property CaretWidth: Integer
     read f_CaretWidth
     write pm_SetCaretWidth
     default DefCaretWd;
     {* ширина курсора. }
   property IsGray: Boolean
     read f_IsGray
     write pm_SetIsGray
     default DefIsGray;
     {* курсор серый? }
 end;//TafwCustomCaretType

implementation

uses
  SysUtils,
  l3Bitmap
  ;

// start class TafwCustomCaretType

procedure TafwCustomCaretType.pm_SetShape(aValue: TafwCaretShape);
//#UC START# *480DC92503DD_480DC4B90226set_var*
//#UC END# *480DC92503DD_480DC4B90226set_var*
begin
//#UC START# *480DC92503DD_480DC4B90226set_impl*
 if (aValue <> F_Shape) then
 begin
  F_Shape := aValue;
  case F_Shape of
   csBlock:
    F_Align := caLeft;
   csVertLine :
   begin
    F_Align := caLeft;
    f_CaretWidth := 2;
   end;//csVertLine
   csHalfBlock:
    F_Align := caBottom;
   csHorzLine :
   begin
    F_Align := caBottom;
    F_CaretHeight := 2;
   end;//csHorzLine
   csBitmap :
   begin
    F_CaretHeight := F_BitMap.Height;
    F_CaretWidth := F_BitMap.Width;
   end;//csBitmap
  end;//case F_Shape
  NotifyChange;
 end;//aValue <> F_Shape
//#UC END# *480DC92503DD_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetShape

procedure TafwCustomCaretType.pm_SetBitmap(aValue: TBitmap);
//#UC START# *480DC95E036D_480DC4B90226set_var*
//#UC END# *480DC95E036D_480DC4B90226set_var*
begin
//#UC START# *480DC95E036D_480DC4B90226set_impl*
 if not Assigned(aValue) then
   Exit;
 F_BitMap.Assign(aValue);
 NotifyChange;
//#UC END# *480DC95E036D_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetBitmap

procedure TafwCustomCaretType.pm_SetBitmapHotSpotX(aValue: Integer);
//#UC START# *480DC9770164_480DC4B90226set_var*
//#UC END# *480DC9770164_480DC4B90226set_var*
begin
//#UC START# *480DC9770164_480DC4B90226set_impl*
 if (aValue <> f_BitmapHotSpotX) then
 begin
  f_BitmapHotSpotX := aValue;
  if (Shape = csBitMap) then
    NotifyChange;
 end;//aValue <> FBitMapX
//#UC END# *480DC9770164_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetBitmapHotSpotX

procedure TafwCustomCaretType.pm_SetBitmapHotSpotY(aValue: Integer);
//#UC START# *480DC99901B3_480DC4B90226set_var*
//#UC END# *480DC99901B3_480DC4B90226set_var*
begin
//#UC START# *480DC99901B3_480DC4B90226set_impl*
 if (aValue <> f_BitmapHotSpotY) then
 begin
  f_BitmapHotSpotY := aValue;
  if (Shape = csBitMap) then
    NotifyChange;
 end;//aValue <> FBitMapY
//#UC END# *480DC99901B3_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetBitmapHotSpotY

procedure TafwCustomCaretType.pm_SetAlign(aValue: TafwCaretAlign);
//#UC START# *480DC9AF007C_480DC4B90226set_var*
//#UC END# *480DC9AF007C_480DC4B90226set_var*
begin
//#UC START# *480DC9AF007C_480DC4B90226set_impl*
 if (aValue <> F_Align) then
 begin
  F_Align := aValue;
  NotifyChange;
 end;//aValue <> F_Align
//#UC END# *480DC9AF007C_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetAlign

procedure TafwCustomCaretType.pm_SetBlinkTime(aValue: Word);
//#UC START# *480DC9C50199_480DC4B90226set_var*
//#UC END# *480DC9C50199_480DC4B90226set_var*
begin
//#UC START# *480DC9C50199_480DC4B90226set_impl*
 if (aValue <> f_BlinkTime) then
 begin
  f_BlinkTime := aValue;
  NotifyChange;
 end;//aValue <> f_BlinkTime
//#UC END# *480DC9C50199_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetBlinkTime

procedure TafwCustomCaretType.pm_SetCaretHeight(aValue: Integer);
//#UC START# *480DC9FC0128_480DC4B90226set_var*
//#UC END# *480DC9FC0128_480DC4B90226set_var*
begin
//#UC START# *480DC9FC0128_480DC4B90226set_impl*
 if (aValue <> f_CaretHeight) and (aValue > 0) then
 begin
  f_CaretHeight := aValue;
  NotifyChange;
 end;//aValue <> f_CaretHeight
//#UC END# *480DC9FC0128_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetCaretHeight

procedure TafwCustomCaretType.pm_SetCaretWidth(aValue: Integer);
//#UC START# *480DCA13027E_480DC4B90226set_var*
//#UC END# *480DCA13027E_480DC4B90226set_var*
begin
//#UC START# *480DCA13027E_480DC4B90226set_impl*
 if (aValue <> f_CaretWidth) and (aValue > 0) then
 begin
  f_CaretWidth := aValue;
  NotifyChange;
 end;//aValue <> f_CaretWidth
//#UC END# *480DCA13027E_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetCaretWidth

procedure TafwCustomCaretType.pm_SetIsGray(aValue: Boolean);
//#UC START# *480DCA2701E2_480DC4B90226set_var*
//#UC END# *480DCA2701E2_480DC4B90226set_var*
begin
//#UC START# *480DCA2701E2_480DC4B90226set_impl*
 if (aValue <> f_IsGray) then
 begin
  f_IsGray := aValue;
  NotifyChange;
 end;//aValue <> f_IsGray
//#UC END# *480DCA2701E2_480DC4B90226set_impl*
end;//TafwCustomCaretType.pm_SetIsGray

constructor TafwCustomCaretType.Create;
//#UC START# *480DCA5C03B7_480DC4B90226_var*
//#UC END# *480DCA5C03B7_480DC4B90226_var*
begin
//#UC START# *480DCA5C03B7_480DC4B90226_impl*
 inherited Create;
 F_Shape := DefShape;
 F_Align := DefAlign;
 F_BlinkTime := DefBlinkTime;
 F_IsGray := DefIsGray;
 F_BitMap := Tl3BitMap.Create;
 F_CaretHeight := DefCaretHt;
 F_CaretWidth := DefCaretWd;
//#UC END# *480DCA5C03B7_480DC4B90226_impl*
end;//TafwCustomCaretType.Create

procedure TafwCustomCaretType.NotifyChange;
//#UC START# *480DCA6F0113_480DC4B90226_var*
//#UC END# *480DCA6F0113_480DC4B90226_var*
begin
//#UC START# *480DCA6F0113_480DC4B90226_impl*
 if Assigned(F_OnChange) then
  F_OnChange(Self);
//#UC END# *480DCA6F0113_480DC4B90226_impl*
end;//TafwCustomCaretType.NotifyChange

procedure TafwCustomCaretType.Cleanup;
//#UC START# *479731C50290_480DC4B90226_var*
//#UC END# *479731C50290_480DC4B90226_var*
begin
//#UC START# *479731C50290_480DC4B90226_impl*
 FreeAndNil(F_BitMap);
 inherited;
//#UC END# *479731C50290_480DC4B90226_impl*
end;//TafwCustomCaretType.Cleanup

end.