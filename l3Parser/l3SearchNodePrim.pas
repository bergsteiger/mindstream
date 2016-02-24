unit l3SearchNodePrim;
 
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3ProtoObject
  ;

type
 Tl3SearchNodePrim = class(Tl3ProtoObject)
 private
 // private fields
   f_Data : IUnknown;
    {* Поле для свойства Data}
   f_Text : Il3CString;
    {* Поле для свойства Text}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aText: Il3CString;
     const aData: IUnknown); reintroduce;
 public
 // public properties
   property Data: IUnknown
     read f_Data
     write f_Data;
   property Text: Il3CString
     read f_Text
     write f_Text;
 end;//Tl3SearchNodePrim

implementation

// start class Tl3SearchNodePrim

constructor Tl3SearchNodePrim.Create(const aText: Il3CString;
  const aData: IUnknown);
//#UC START# *4E5CEE3601A1_4E5CDE950027_var*
//#UC END# *4E5CEE3601A1_4E5CDE950027_var*
begin
//#UC START# *4E5CEE3601A1_4E5CDE950027_impl*
 inherited Create;
 f_Text := aText;
 f_Data := aData;
//#UC END# *4E5CEE3601A1_4E5CDE950027_impl*
end;//Tl3SearchNodePrim.Create

procedure Tl3SearchNodePrim.Cleanup;
//#UC START# *479731C50290_4E5CDE950027_var*
//#UC END# *479731C50290_4E5CDE950027_var*
begin
//#UC START# *479731C50290_4E5CDE950027_impl*
 f_Text := nil;
 f_Data := nil;
 inherited;
//#UC END# *479731C50290_4E5CDE950027_impl*
end;//Tl3SearchNodePrim.Cleanup

procedure Tl3SearchNodePrim.ClearFields;
 {-}
begin
 Data := nil;
 Text := nil;
 inherited;
end;//Tl3SearchNodePrim.ClearFields

end.