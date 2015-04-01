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
                              const aRessurected: TClassToSerialize);
 end;//TmsMarshal

{$Else TmsMarshal}

// implementation

{$IfNDef TmsMarshal_uses_impl}

// uses
 SysUtils,
 msCoreObjects,
 msStringList

{$Define TmsMarshal_uses_impl}

{$Else TmsMarshal_uses_impl}

// TmsMarshal

class procedure TmsMarshal.DeSerialize(const aFileName: string;
                                       const aRessurected: TClassToSerialize);
var
 l_StringList: TmsStringList;
 l_D : TClassToSerialize;
 l_I : IUnknown;
begin
 l_StringList := TmsStringList.Create;
 try
  l_StringList.LoadFromFile(aFileName);
  l_D := UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text)) As TClassToSerialize;
  try
   aRessurected.Assign(l_D);
  finally
//   FreeAndNil(l_D)
   if not (l_D Is TInterfacedObject) then
    FreeAndNil(l_D)
   else
   begin
    while true do
    // - раз мы выше звали FreeAndNil для TInterfacedObject, то надо "убить его до конца"
     if (IUnknown(TInterfacedObject(l_D))._Release <= 0) then
      break;
    //FreeAndNil(l_D);
   end;//else
  end;//try..finally
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

{$EndIf TmsMarshal_uses_impl}

{$EndIf TmsMarshal}
{$EndIf TmsMarshal_uses_intf}
