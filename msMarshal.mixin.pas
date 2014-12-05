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

 TmsMarshal = class(TmsMarshalPrim)
 // - шаблонизируем, ибо мы скоро будем сериализовать и другие классы.
 public
  class procedure Serialize(const aFileName: string; const aDiagramm: TClassToSerialize);
  class procedure DeSerialize(const aFileName: string; const aDiagramm: TClassToSerialize);
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

class procedure TmsMarshal.DeSerialize(const aFileName: string; const aDiagramm: TClassToSerialize);
var
 l_StringList: TmsStringList;
 l_D : TClassToSerialize;
begin
 l_StringList := TmsStringList.Create;
 try
  l_StringList.LoadFromFile(aFileName);
  l_D := UnMarshal.Unmarshal(TJSONObject.ParseJSONValue(l_StringList.Text)) As TClassToSerialize;
  try
   aDiagramm.Assign(l_D);
  finally
   FreeAndNil(l_D);
  end;//try..finally
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

class procedure TmsMarshal.Serialize(const aFileName: string;
                                                 const aDiagramm: TClassToSerialize);
var
 l_Json: TJSONObject;
 l_StringList: TmsStringList;
begin
 l_StringList := TmsStringList.Create;
 try
  l_Json := nil;
  try
   l_Json := Marshal.Marshal(aDiagramm) as TJSONObject;
   l_StringList.Add(l_Json.toString);
  finally
   FreeAndNil(l_Json);
  end;//try..finally
  l_StringList.SaveToFile(aFileName);
 finally
  FreeAndNil(l_StringList);
 end;//try..finally
end;

{$EndIf TmsMarshal_uses_impl}

{$EndIf TmsMarshal}
{$EndIf TmsMarshal_uses_intf}
