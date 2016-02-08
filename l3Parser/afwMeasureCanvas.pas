unit afwMeasureCanvas;
 
{$Include w:\common\components\gui\Garant\AFW\afwDefine.inc}

interface

uses
  afwInterfaces,
  l3InternalInterfaces,
  l3VirtualCanvas,
  l3Interfaces,
  l3Units,
  l3Types,
  l3Core,
  l3PrinterInterfaces
  ;

type
 TafwMeasureCanvas = class(Tl3VirtualCanvas)
  {* Канва для измерений и вычисления позиции курсора. }
 private
 // private fields
   f_Caret : IafwCaret;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetCaret: Il3Caret; override;
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const anExtent: TafwPoint;
     const aCaret: IafwCaret); reintroduce;
   class function Make(const anExtent: TafwPoint;
     const aCaret: IafwCaret): Il3Canvas; reintroduce;
     {* Сигнатура фабрики TafwMeasureCanvas.Make }
 end;//TafwMeasureCanvas

implementation

// start class TafwMeasureCanvas

constructor TafwMeasureCanvas.Create(const anExtent: TafwPoint;
  const aCaret: IafwCaret);
//#UC START# *4CC69AD60087_47414D0C018A_var*
//#UC END# *4CC69AD60087_47414D0C018A_var*
begin
//#UC START# *4CC69AD60087_47414D0C018A_impl*
 with anExtent do
  inherited Create(Tl3_Point_C(X, Y + Y div 4));
 f_Caret := aCaret;
 ShowCursor := (f_Caret <> nil);
//#UC END# *4CC69AD60087_47414D0C018A_impl*
end;//TafwMeasureCanvas.Create

class function TafwMeasureCanvas.Make(const anExtent: TafwPoint;
  const aCaret: IafwCaret): Il3Canvas;
var
 l_Inst : TafwMeasureCanvas;
begin
 l_Inst := Create(anExtent, aCaret);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TafwMeasureCanvas.Cleanup;
//#UC START# *479731C50290_47414D0C018A_var*
//#UC END# *479731C50290_47414D0C018A_var*
begin
//#UC START# *479731C50290_47414D0C018A_impl*
 f_Caret := nil;
 inherited;
//#UC END# *479731C50290_47414D0C018A_impl*
end;//TafwMeasureCanvas.Cleanup

function TafwMeasureCanvas.GetCaret: Il3Caret;
//#UC START# *47DFB3CE02C5_47414D0C018A_var*
//#UC END# *47DFB3CE02C5_47414D0C018A_var*
begin
//#UC START# *47DFB3CE02C5_47414D0C018A_impl*
 Result := f_Caret;
//#UC END# *47DFB3CE02C5_47414D0C018A_impl*
end;//TafwMeasureCanvas.GetCaret

procedure TafwMeasureCanvas.ClearFields;
 {-}
begin
 f_Caret := nil;
 inherited;
end;//TafwMeasureCanvas.ClearFields

end.