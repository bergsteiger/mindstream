unit afwVirtualCaret;

 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  l3CacheableBase,
  afwInterfaces,
  Types,
  l3Interfaces
  ;

type
 TafwVirtualCaret = class(Tl3CacheableBase, IafwCaret, IafwScrollCaret)
  {* Виртуальная каретка. }
 private
 // private fields
   f_Extent : TafwSPoint;
   f_CaretPos : TafwSPoint;
   f_CaretExt : TPoint;
 protected
 // realized methods
   function CheckHidden: Boolean;
   function CanHide: Boolean;
   procedure Set_Extent(const aValue: TPoint);
   function Get_Position: Tl3_SPoint;
   procedure Set_Position(const aValue: Tl3_SPoint);
   function Get_Visible: Boolean;
   procedure pm_SetHidden(aValue: Boolean);
   function IsInited: Boolean;
   function IsOnScreen: Boolean;
   procedure Scroll(const aOfs: Tl3_SPoint);
   procedure Reset;
 public
 // public methods
   constructor Create(const anExtent: TafwSPoint); reintroduce;
   class function Make(const anExtent: TafwSPoint): IafwScrollCaret; reintroduce;
     {* Сигнатура фабрики TafwVirtualCaret.Make }
 end;//TafwVirtualCaret

implementation

uses
  l3Units
  ;

// start class TafwVirtualCaret

constructor TafwVirtualCaret.Create(const anExtent: TafwSPoint);
//#UC START# *4CC69A8B0337_474154CE0081_var*
//#UC END# *4CC69A8B0337_474154CE0081_var*
begin
//#UC START# *4CC69A8B0337_474154CE0081_impl*
 f_Extent := anExtent;
 Reset;
 inherited Create;
//#UC END# *4CC69A8B0337_474154CE0081_impl*
end;//TafwVirtualCaret.Create

class function TafwVirtualCaret.Make(const anExtent: TafwSPoint): IafwScrollCaret;
var
 l_Inst : TafwVirtualCaret;
begin
 l_Inst := Create(anExtent);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TafwVirtualCaret.CheckHidden: Boolean;
//#UC START# *4728CC9400ED_474154CE0081_var*
//#UC END# *4728CC9400ED_474154CE0081_var*
begin
//#UC START# *4728CC9400ED_474154CE0081_impl*
 Result := false;
//#UC END# *4728CC9400ED_474154CE0081_impl*
end;//TafwVirtualCaret.CheckHidden

function TafwVirtualCaret.CanHide: Boolean;
//#UC START# *4728CCB1004E_474154CE0081_var*
//#UC END# *4728CCB1004E_474154CE0081_var*
begin
//#UC START# *4728CCB1004E_474154CE0081_impl*
 Result := false;
//#UC END# *4728CCB1004E_474154CE0081_impl*
end;//TafwVirtualCaret.CanHide

procedure TafwVirtualCaret.Set_Extent(const aValue: TPoint);
//#UC START# *4728CCBC023F_474154CE0081set_var*
//#UC END# *4728CCBC023F_474154CE0081set_var*
begin
//#UC START# *4728CCBC023F_474154CE0081set_impl*
 f_CaretExt := aValue;
//#UC END# *4728CCBC023F_474154CE0081set_impl*
end;//TafwVirtualCaret.Set_Extent

function TafwVirtualCaret.Get_Position: Tl3_SPoint;
//#UC START# *4728CCC90157_474154CE0081get_var*
//#UC END# *4728CCC90157_474154CE0081get_var*
begin
//#UC START# *4728CCC90157_474154CE0081get_impl*
 Result := f_CaretPos;
//#UC END# *4728CCC90157_474154CE0081get_impl*
end;//TafwVirtualCaret.Get_Position

procedure TafwVirtualCaret.Set_Position(const aValue: Tl3_SPoint);
//#UC START# *4728CCC90157_474154CE0081set_var*
//#UC END# *4728CCC90157_474154CE0081set_var*
begin
//#UC START# *4728CCC90157_474154CE0081set_impl*
 f_CaretPos := Tl3SPoint(aValue);
//#UC END# *4728CCC90157_474154CE0081set_impl*
end;//TafwVirtualCaret.Set_Position

function TafwVirtualCaret.Get_Visible: Boolean;
//#UC START# *4728CCD502A9_474154CE0081get_var*
//#UC END# *4728CCD502A9_474154CE0081get_var*
begin
//#UC START# *4728CCD502A9_474154CE0081get_impl*
 Result := true;
//#UC END# *4728CCD502A9_474154CE0081get_impl*
end;//TafwVirtualCaret.Get_Visible

procedure TafwVirtualCaret.pm_SetHidden(aValue: Boolean);
//#UC START# *4728CCEA00DC_474154CE0081set_var*
//#UC END# *4728CCEA00DC_474154CE0081set_var*
begin
//#UC START# *4728CCEA00DC_474154CE0081set_impl*
//#UC END# *4728CCEA00DC_474154CE0081set_impl*
end;//TafwVirtualCaret.pm_SetHidden

function TafwVirtualCaret.IsInited: Boolean;
//#UC START# *4728CD1103B3_474154CE0081_var*
//#UC END# *4728CD1103B3_474154CE0081_var*
begin
//#UC START# *4728CD1103B3_474154CE0081_impl*
 Result := (f_CaretPos.Y <> High(f_CaretPos.Y));
//#UC END# *4728CD1103B3_474154CE0081_impl*
end;//TafwVirtualCaret.IsInited

function TafwVirtualCaret.IsOnScreen: Boolean;
//#UC START# *4728CD240270_474154CE0081_var*
//#UC END# *4728CD240270_474154CE0081_var*
begin
//#UC START# *4728CD240270_474154CE0081_impl*
 Assert(IsInited);
 Result := (f_CaretPos.Y >= 0) AND (f_CaretPos.Y + f_CaretExt.Y <= f_Extent.Y);
//#UC END# *4728CD240270_474154CE0081_impl*
end;//TafwVirtualCaret.IsOnScreen

procedure TafwVirtualCaret.Scroll(const aOfs: Tl3_SPoint);
//#UC START# *4728CD370137_474154CE0081_var*
//#UC END# *4728CD370137_474154CE0081_var*
begin
//#UC START# *4728CD370137_474154CE0081_impl*
 if IsInited then
  Tl3SPoint(f_CaretPos).Inc(Tl3SPoint(aOfs));
//#UC END# *4728CD370137_474154CE0081_impl*
end;//TafwVirtualCaret.Scroll

procedure TafwVirtualCaret.Reset;
//#UC START# *4728CD4101D2_474154CE0081_var*
//#UC END# *4728CD4101D2_474154CE0081_var*
begin
//#UC START# *4728CD4101D2_474154CE0081_impl*
 f_CaretPos.X := High(f_CaretPos.X);
 f_CaretPos.Y := High(f_CaretPos.Y);
//#UC END# *4728CD4101D2_474154CE0081_impl*
end;//TafwVirtualCaret.Reset

end.