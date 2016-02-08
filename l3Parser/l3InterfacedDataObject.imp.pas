{$IfNDef l3InterfacedDataObject_imp}


{$Define l3InterfacedDataObject_imp}
 _l3InterfacedDataObject_ = {mixin} class(Tl3DataObject)
  {* Для хранения в буфере обмена интерфейса }
 private
 // private fields
   f_Data : _DataType_;
    {* Поле для свойства Data}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* Реализация запроса интерфейса }
 public
 // public methods
   constructor Create(const aData: _DataType_;
     const aFormats: Tl3ClipboardFormats); reintroduce;
   class function Make(const aData: _DataType_;
     const aFormats: Tl3ClipboardFormats): IDataObject; reintroduce;
     {* Сигнатура фабрики l3InterfacedDataObject.Make }
 private
 // private properties
   property Data: _DataType_
     read f_Data;
 end;//_l3InterfacedDataObject_

{$Else l3InterfacedDataObject_imp}

// start class _l3InterfacedDataObject_

constructor _l3InterfacedDataObject_.Create(const aData: _DataType_;
  const aFormats: Tl3ClipboardFormats);
//#UC START# *4CE27E5A011A_4680F7A602E3_var*
//#UC END# *4CE27E5A011A_4680F7A602E3_var*
begin
//#UC START# *4CE27E5A011A_4680F7A602E3_impl*
 inherited Create(aFormats);
 f_Data := aData;
//#UC END# *4CE27E5A011A_4680F7A602E3_impl*
end;//_l3InterfacedDataObject_.Create

class function _l3InterfacedDataObject_.Make(const aData: _DataType_;
  const aFormats: Tl3ClipboardFormats): IDataObject;
var
 l_Inst : _l3InterfacedDataObject_;
begin
 l_Inst := Create(aData, aFormats);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure _l3InterfacedDataObject_.Cleanup;
//#UC START# *479731C50290_4680F7A602E3_var*
//#UC END# *479731C50290_4680F7A602E3_var*
begin
//#UC START# *479731C50290_4680F7A602E3_impl*
 f_Data := nil;
 inherited;
//#UC END# *479731C50290_4680F7A602E3_impl*
end;//_l3InterfacedDataObject_.Cleanup

function _l3InterfacedDataObject_.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4680F7A602E3_var*
//#UC END# *4A60B23E00C3_4680F7A602E3_var*
begin
//#UC START# *4A60B23E00C3_4680F7A602E3_impl*
 if (f_Data = nil) then
  Result.SetNOINTERFACE
 else
  Result := Tl3HResult_C(f_Data.QueryInterface(IID.IID, Obj));
 if Result.Fail then
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_4680F7A602E3_impl*
end;//_l3InterfacedDataObject_.COMQueryInterface

{$EndIf l3InterfacedDataObject_imp}
