unit afwSingleCaret;

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3Units
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  afwCustomCaretType,
  Windows,
  l3ProtoPersistent,
  Classes
  ;

type
 TafwSingleCaret = class(Tl3ProtoPersistent)
  {* Одиночная каретка ввода. }
 private
 // private fields
   f_CaretShowTimes : Integer;
   f_OrigBlinkTime : UINT;
    {* Blink time before linking}
   XOffset : Integer;
    {* X Offset of caret in cell}
   YOffset : Integer;
    {* Y Offset of caret in cell}
   f_CellHeight : Integer;
    {* Поле для свойства CellHeight}
   f_CellWidth : Integer;
    {* Поле для свойства CellWidth}
   f_Linked : Boolean;
    {* Поле для свойства Linked}
   f_Position : Tl3SPoint;
    {* Поле для свойства Position}
   f_Visible : Boolean;
    {* Поле для свойства Visible}
   f_Hidden : Boolean;
    {* Поле для свойства Hidden}
   f_CaretType : TafwCustomCaretType;
    {* Поле для свойства CaretType}
   f_Owner : TWinControl;
    {* Поле для свойства Owner}
 protected
 // property methods
   procedure pm_SetCellHeight(aValue: Integer);
   procedure pm_SetCellWidth(aValue: Integer);
   procedure pm_SetLinked(aValue: Boolean);
   procedure pm_SetPosition(const aValue: Tl3SPoint);
   procedure pm_SetVisible(aValue: Boolean);
   procedure pm_SetHidden(aValue: Boolean);
   procedure pm_SetCaretType(aValue: TafwCustomCaretType);
   procedure pm_SetOwner(aValue: TWinControl);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetOwner: TPersistent; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 protected
 // protected methods
   procedure DoShowCaret;
   procedure DoHideCaret;
   procedure CaretTypeHasChanged(Sender: TObject);
   procedure MakeShape;
   procedure Reinit;
   procedure ResetPos;
 public
 // public methods
   constructor Create(anOwner: TWinControl); reintroduce; virtual;
   function CheckHidden: Boolean;
   function CanHide: Boolean;
   procedure Scrolled;
 protected
 // protected properties
   property CaretType: TafwCustomCaretType
     read f_CaretType
     write pm_SetCaretType;
     {* текущий тип каретки. }
 public
 // public properties
   property CellHeight: Integer
     read f_CellHeight
     write pm_SetCellHeight;
     {* высота каретки. }
   property CellWidth: Integer
     read f_CellWidth
     write pm_SetCellWidth;
     {* ширина каретки. }
   property Linked: Boolean
     read f_Linked
     write pm_SetLinked;
     {* каретка привязана к окну? (Т.е. окно-владелец - в данный момент отображает каретку) }
   property Position: Tl3SPoint
     read f_Position
     write pm_SetPosition;
     {* позиция каретки (в координатах окна-владельца). }
   property Visible: Boolean
     read f_Visible
     write pm_SetVisible;
     {* показывать каретку? }
   property Hidden: Boolean
     read f_Hidden
     write pm_SetHidden;
     {* флаг временной невидимости курсора (при выходе за границы окна). }
   property Owner: TWinControl
     write pm_SetOwner;
 end;//TafwSingleCaret

implementation

uses
  l3Base
  ;

// start class TafwSingleCaret

constructor TafwSingleCaret.Create(anOwner: TWinControl);
//#UC START# *52FCEEE902D1_480DD00B02E8_var*
//#UC END# *52FCEEE902D1_480DD00B02E8_var*
begin
//#UC START# *52FCEEE902D1_480DD00B02E8_impl*
 //================ Это надо до установки Owner'а ============
 F_CellHeight := 10;
 f_CellWidth := 10;
 {make our default caret type}
 f_CaretType := TafwCustomCaretType.Create;
 //===========================================================
 Owner := anOwner;
 inherited Create;
 Reinit;
//#UC END# *52FCEEE902D1_480DD00B02E8_impl*
end;//TafwSingleCaret.Create

procedure TafwSingleCaret.pm_SetCellHeight(aValue: Integer);
//#UC START# *480DD07302DF_480DD00B02E8set_var*
//#UC END# *480DD07302DF_480DD00B02E8set_var*
begin
//#UC START# *480DD07302DF_480DD00B02E8set_impl*
 if (aValue <> f_CellHeight) and (aValue > 0) then
 begin
  f_CellHeight := aValue;
  CaretTypeHasChanged(Self);
 end;//aValue <> FHeight
//#UC END# *480DD07302DF_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetCellHeight

procedure TafwSingleCaret.pm_SetCellWidth(aValue: Integer);
//#UC START# *480DD08601B6_480DD00B02E8set_var*
//#UC END# *480DD08601B6_480DD00B02E8set_var*
begin
//#UC START# *480DD08601B6_480DD00B02E8set_impl*
 if (aValue <> f_CellWidth) and (aValue > 0) then
 begin
  f_CellWidth := aValue;
  CaretTypeHasChanged(Self);
 end;//aValue <> f_CellWidth
//#UC END# *480DD08601B6_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetCellWidth

procedure TafwSingleCaret.pm_SetLinked(aValue: Boolean);
//#UC START# *480DD09A026F_480DD00B02E8set_var*
//#UC END# *480DD09A026F_480DD00B02E8set_var*
begin
//#UC START# *480DD09A026F_480DD00B02E8set_impl*
 if (aValue <> f_Linked) then
 begin
  if f_Linked then
  begin
   while (f_Owner <> nil) AND (f_Owner.HandleAllocated) AND
         // - это именно в цикле надо, мало ли что..
         (f_CaretShowTimes > 0) do
    DoHideCaret;
  end;//f_Linked
  f_Linked := aValue;
  if (f_Owner <> nil) and f_Owner.HandleAllocated then
  begin
   if f_Linked then
   begin
    f_OrigBlinkTime := GetCaretBlinkTime;
    MakeShape;
    ResetPos;
    if (f_OrigBlinkTime <> CaretType.BlinkTime) AND
      (CaretType.BlinkTime <> 0) then
     SetCaretBlinkTime(CaretType.BlinkTime);
   end//f_Linked
   else
   begin
    SetCaretBlinkTime(f_OrigBlinkTime);
    DestroyCaret;
   end;//f_Linked
  end//Assigned(f_Owner)
  else
   f_Linked := false;
 end;//aValue <> f_Linked
//#UC END# *480DD09A026F_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetLinked

procedure TafwSingleCaret.pm_SetPosition(const aValue: Tl3SPoint);
//#UC START# *480DD0CA0330_480DD00B02E8set_var*
//#UC END# *480DD0CA0330_480DD00B02E8set_var*
begin
//#UC START# *480DD0CA0330_480DD00B02E8set_impl*
 f_Position := aValue;
 ResetPos;
//#UC END# *480DD0CA0330_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetPosition

procedure TafwSingleCaret.pm_SetVisible(aValue: Boolean);
//#UC START# *480DD1060119_480DD00B02E8set_var*
//#UC END# *480DD1060119_480DD00B02E8set_var*
begin
//#UC START# *480DD1060119_480DD00B02E8set_impl*
 if (aValue <> f_Visible) then
 begin
  f_Visible := aValue;
  if not Hidden then
  begin
   if f_Visible then
    DoShowCaret
   else
    DoHideCaret;
  end;//not Hidden
 end;//aValue <> f_Visible
//#UC END# *480DD1060119_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetVisible

procedure TafwSingleCaret.pm_SetHidden(aValue: Boolean);
//#UC START# *480DD11D0138_480DD00B02E8set_var*
//#UC END# *480DD11D0138_480DD00B02E8set_var*
begin
//#UC START# *480DD11D0138_480DD00B02E8set_impl*
 if (aValue <> f_Hidden) then
 begin
  f_Hidden := aValue;
  if Visible then
  begin
   if f_Hidden then
    DoHideCaret
   else
    DoShowCaret;
  end;//Visible
 end;//aValue <> f_Hidden
//#UC END# *480DD11D0138_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetHidden

procedure TafwSingleCaret.pm_SetCaretType(aValue: TafwCustomCaretType);
//#UC START# *480DD049030A_480DD00B02E8set_var*
//#UC END# *480DD049030A_480DD00B02E8set_var*
begin
//#UC START# *480DD049030A_480DD00B02E8set_impl*
 if l3Set(f_CaretType, aValue) then
 begin
  f_CaretType.OnChange := CaretTypeHasChanged;
  CaretTypeHasChanged(Self);
 end;//l3Set(f_CaretType, aValue)
//#UC END# *480DD049030A_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetCaretType

procedure TafwSingleCaret.pm_SetOwner(aValue: TWinControl);
//#UC START# *52FCEE200321_480DD00B02E8set_var*
var
 l_Linked : Bool;
//#UC END# *52FCEE200321_480DD00B02E8set_var*
begin
//#UC START# *52FCEE200321_480DD00B02E8set_impl*
 if (f_Owner <> aValue) then
 begin
  l_Linked := Linked;
  Linked := false;
  f_Owner := aValue;
  if (f_Owner <> nil) AND (l_Linked) then
   Linked := true;
  if not Linked AND (f_Owner <> nil) AND f_Owner.Focused then
   Linked := true;
 end;//f_Owner <> Value
//#UC END# *52FCEE200321_480DD00B02E8set_impl*
end;//TafwSingleCaret.pm_SetOwner

procedure TafwSingleCaret.DoShowCaret;
//#UC START# *480DD1C90077_480DD00B02E8_var*
//#UC END# *480DD1C90077_480DD00B02E8_var*
begin
//#UC START# *480DD1C90077_480DD00B02E8_impl*
 if Linked AND (f_Owner <> nil) AND f_Owner.HandleAllocated then
 begin
  ShowCaret(f_Owner.Handle);
  Inc(f_CaretShowTimes);
(*  while (f_CaretShowTimes <= 0) do
  begin
   ShowCaret(f_Owner.Handle);
   Inc(f_CaretShowTimes);
  end;//f_CaretShowTimes <= 0*)
 end;//Linked..
//#UC END# *480DD1C90077_480DD00B02E8_impl*
end;//TafwSingleCaret.DoShowCaret

procedure TafwSingleCaret.DoHideCaret;
//#UC START# *480DD1D40019_480DD00B02E8_var*
//#UC END# *480DD1D40019_480DD00B02E8_var*
begin
//#UC START# *480DD1D40019_480DD00B02E8_impl*
 if Linked AND (f_Owner <> nil) AND f_Owner.HandleAllocated then
 begin
  HideCaret(f_Owner.Handle);
  Dec(f_CaretShowTimes);
 end;//Linked..
//#UC END# *480DD1D40019_480DD00B02E8_impl*
end;//TafwSingleCaret.DoHideCaret

procedure TafwSingleCaret.CaretTypeHasChanged(Sender: TObject);
//#UC START# *480DD1FC039F_480DD00B02E8_var*
var
 WasLinked : boolean;
//#UC END# *480DD1FC039F_480DD00B02E8_var*
begin
//#UC START# *480DD1FC039F_480DD00B02E8_impl*
 {if something has _changed about the caret, unlink from
  our owner, recalc our values, relink}
 WasLinked := Linked;
 Linked := false;
 Reinit;
 Linked := WasLinked;
//#UC END# *480DD1FC039F_480DD00B02E8_impl*
end;//TafwSingleCaret.CaretTypeHasChanged

function TafwSingleCaret.CheckHidden: Boolean;
//#UC START# *480DD2090194_480DD00B02E8_var*
//#UC END# *480DD2090194_480DD00B02E8_var*
begin
//#UC START# *480DD2090194_480DD00B02E8_impl*
 if (F_Position.X = MaxInt) OR
    (F_Position.Y = MaxInt) OR
    (F_Position.X < 0) OR
    (F_Position.Y < -2) then
    // - 2 - на ошибку округления
  Hidden := true
 else
  Hidden := false;
 Result := Hidden;
//#UC END# *480DD2090194_480DD00B02E8_impl*
end;//TafwSingleCaret.CheckHidden

function TafwSingleCaret.CanHide: Boolean;
//#UC START# *480DD21B00FA_480DD00B02E8_var*
//#UC END# *480DD21B00FA_480DD00B02E8_var*
begin
//#UC START# *480DD21B00FA_480DD00B02E8_impl*
 Result := true;
//#UC END# *480DD21B00FA_480DD00B02E8_impl*
end;//TafwSingleCaret.CanHide

procedure TafwSingleCaret.Scrolled;
//#UC START# *480DD2280308_480DD00B02E8_var*
//#UC END# *480DD2280308_480DD00B02E8_var*
begin
//#UC START# *480DD2280308_480DD00B02E8_impl*
 {if Linked then
  GetCaretPos(TPoint(F_Position));
 CheckHidden;}
 // - закомментировал, т.к неправильно рисовался курсор, после скроллинга 
//#UC END# *480DD2280308_480DD00B02E8_impl*
end;//TafwSingleCaret.Scrolled

procedure TafwSingleCaret.MakeShape;
//#UC START# *480DD75E00E3_480DD00B02E8_var*
//#UC END# *480DD75E00E3_480DD00B02E8_var*
begin
//#UC START# *480DD75E00E3_480DD00B02E8_impl*
 {don't bother if we aren't linked to anything or if we
  don't have a caret type}
 if Linked AND Assigned(f_CaretType) then begin
  {create the caret, and if necessary show it}
  with f_CaretType do
    if (Shape = csBitmap) then
         CreateCaret(Self.f_Owner.Handle, Bitmap.Handle, 0, 0)
    else CreateCaret(Self.f_Owner.Handle, ord(IsGray), CaretWidth, CaretHeight);
  if Visible AND not Hidden then
   DoShowCaret;
 end;{Linked..}   
//#UC END# *480DD75E00E3_480DD00B02E8_impl*
end;//TafwSingleCaret.MakeShape

procedure TafwSingleCaret.Reinit;
//#UC START# *480DD7770166_480DD00B02E8_var*
var
  NewXOfs : Integer;
  NewYOfs : Integer;
//#UC END# *480DD7770166_480DD00B02E8_var*
begin
//#UC START# *480DD7770166_480DD00B02E8_impl*
 {don't bother if we don't have a caret type}
 if (not Assigned(f_CaretType)) then
   Exit;

 {inits}
 NewXOfs := 0;
 NewYOfs := 0;

 with f_CaretType do
 begin
  {stop recursion}
  OnChange := nil;

  {recalc the caret type's height and width}
  if (Shape <> csBitmap) and (Shape <> csCustom) then
  begin
   case Shape of
    csBlock:
    begin
     CaretHeight := F_CellHeight;
     CaretWidth := F_CellWidth;
    end;//csBlock
    csHalfBlock:
    begin
     CaretHeight := F_CellHeight div 2;
     CaretWidth := F_CellWidth;
    end;//csHalfBlock
    csVertLine :
     CaretHeight := F_CellHeight;
    csHorzLine :
     CaretWidth := F_CellWidth;
   end;//case Shape
  end;//Shape <> csBitmap

  {allow changes to percolate through again}
  OnChange := CaretTypeHasChanged;

  {recalc the X and Y offsets}
  case Align of
   caLeft:
   begin
    NewXOfs := 0;
    NewYOfs := (F_CellHeight - CaretHeight) div 2;
   end;//caLeft
   caTop:
   begin
    NewXOfs := (F_CellWidth - CaretWidth) div 2;
    NewYOfs := 0;
   end;//caTop
   caRight:
   begin
    NewXOfs := F_CellWidth - CaretWidth;
    NewYOfs := (F_CellHeight - CaretHeight) div 2;
   end;//caRight
   caBottom:
   begin
    NewXOfs := (F_CellWidth - CaretWidth) div 2;
    NewYOfs := F_CellHeight - CaretHeight;
   end;//caBottom
   caCenter:
   begin
    NewXOfs := (F_CellWidth - CaretWidth) div 2;
    NewYOfs := (F_CellHeight - CaretHeight) div 2;
   end;//caCenter
  end;//case Align
  if (Shape = csBitMap) then
  begin
   dec(NewXOfs, BitMapHotSpotX);
   dec(NewYOfs, BitMapHotSpotY);
  end;//Shape = csBitMap
  if (NewXOfs <> XOffset) or (NewYOfs <> YOffset) then
  begin
   XOffset := NewXOfs;
   YOffset := NewYOfs;
   ResetPos;
  end;//NewXOfs <> XOffset
 end;//with f_CaretType
//#UC END# *480DD7770166_480DD00B02E8_impl*
end;//TafwSingleCaret.Reinit

procedure TafwSingleCaret.ResetPos;
//#UC START# *480DD7840317_480DD00B02E8_var*
//#UC END# *480DD7840317_480DD00B02E8_var*
begin
//#UC START# *480DD7840317_480DD00B02E8_impl*
 if Linked then
  with f_Position do
   if (X < MaxInt) AND (Y < MaxInt) AND (X >= 0) AND (Y >= 0) then
    SetCaretPos(X + XOffset, Y + YOffset);
//#UC END# *480DD7840317_480DD00B02E8_impl*
end;//TafwSingleCaret.ResetPos

procedure TafwSingleCaret.Cleanup;
//#UC START# *479731C50290_480DD00B02E8_var*
//#UC END# *479731C50290_480DD00B02E8_var*
begin
//#UC START# *479731C50290_480DD00B02E8_impl*
 Visible := false;
 Linked := false;
 l3Free(f_CaretType);
 inherited;
//#UC END# *479731C50290_480DD00B02E8_impl*
end;//TafwSingleCaret.Cleanup

function TafwSingleCaret.GetOwner: TPersistent;
//#UC START# *480DD1890221_480DD00B02E8_var*
//#UC END# *480DD1890221_480DD00B02E8_var*
begin
//#UC START# *480DD1890221_480DD00B02E8_impl*
 Result := f_Owner;
//#UC END# *480DD1890221_480DD00B02E8_impl*
end;//TafwSingleCaret.GetOwner

procedure TafwSingleCaret.ClearFields;
 {-}
begin
 Finalize(f_Position);
 inherited;
end;//TafwSingleCaret.ClearFields

end.