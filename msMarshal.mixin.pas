{$IfNDef TmsMarshal_uses_intf}

// interface

{$Define TmsMarshal_uses_intf}

// uses

 JSON,
 Data.DBXJSONReflect,
 msMarshalPrim

{$Else TmsMarshal_uses_intf}

{$IfNDef TmsMarshal}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsMarshal}

 TmsMarshal = class abstract(TmsMarshalPrim)
 // - шаблонизируем, ибо мы скоро будем сериализовать и другие классы.
 public
  class procedure DeSerialize(const aFileName: string;
                              const anObjToAssign: TClassToSerialize);
 end;//TmsMarshal

{$Else TmsMarshal}

// implementation

{$IfNDef TmsMarshal_uses_impl}

// uses
 SysUtils,
 msCoreObjects,
 msStringList,
 msGarbageCollector

{$Define TmsMarshal_uses_impl}

{$Else TmsMarshal_uses_impl}

// TmsMarshal

class procedure TmsMarshal.DeSerialize(const aFileName: string;
                                       const anObjToAssign: TClassToSerialize);
var
 l_StringList: TmsStringList;
 l_Ressurected : TClassToSerialize;
 l_I : IUnknown;
begin
 l_StringList := TmsStringList.Create;
 try
  l_StringList.LoadFromFile(aFileName);
  l_Ressurected := UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text)) As TClassToSerialize;
  try
   anObjToAssign.Assign(l_Ressurected);
  finally
//   FreeAndNil(l_Ressurected);
   if not (l_Ressurected Is TInterfacedObject) then
    FreeAndNil(l_Ressurected)
   else
   begin
    while true do
    // - раз мы выше звали FreeAndNil для TInterfacedObject, то надо "убить его до конца"
     if (IUnknown(TInterfacedObject(l_Ressurected))._Release <= 0) then
      break;
    //FreeAndNil(l_Ressurected);
   end;//else
   TmsGarbageCollector.Instance.Clear;
  end;//try..finally
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

{$EndIf TmsMarshal_uses_impl}

{$EndIf TmsMarshal}
{$EndIf TmsMarshal_uses_intf}
