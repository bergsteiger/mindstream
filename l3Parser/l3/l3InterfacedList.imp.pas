{$IfNDef l3InterfacedList_imp}


{$Define l3InterfacedList_imp}
 _l3ListAssign_Parent_ = _l3InterfacedList_Parent_;
 {$Include ..\L3\l3ListAssign.imp.pas}
 _l3InterfacedList_ = {mixin} class(_l3ListAssign_, _ListType_)
 protected
 // realized methods
   function pm_GetCount: Integer;
 public
 // public methods
   class function MakeI: _ListType_; reintroduce;
 end;//_l3InterfacedList_

{$Else l3InterfacedList_imp}

{$Include ..\L3\l3ListAssign.imp.pas}

// start class _l3InterfacedList_

class function _l3InterfacedList_.MakeI: _ListType_;
var
 l_Inst : _l3InterfacedList_;
begin
 l_Inst := Create;
 try
  Result := _Instance_R_(l_Inst);
 finally
  l_Inst.Free;
 end;//try..finally
end;

function _l3InterfacedList_.pm_GetCount: Integer;
//#UC START# *4BB08B8902F2_47CED1980057get_var*
//#UC END# *4BB08B8902F2_47CED1980057get_var*
begin
//#UC START# *4BB08B8902F2_47CED1980057get_impl*
 Result := Count;
//#UC END# *4BB08B8902F2_47CED1980057get_impl*
end;//_l3InterfacedList_.pm_GetCount

{$EndIf l3InterfacedList_imp}
