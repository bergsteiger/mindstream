{$IfNDef TmsMarshal_uses_intf}

// interface

{$Define TmsMarshal_uses_intf}

// uses

 JSON,
 Data.DBXJSONReflect

{$Else TmsMarshal_uses_intf}

{$IfNDef TmsMarshal}
// http://programmingmindstream.blogspot.ru/2014/12/generic-2.html

{$Define TmsMarshal}

 TmsMarshal = class
 // - шаблонизируем, ибо мы скоро будем сериализовать и другие классы.
 strict private
  class var f_Marshal : TJSONMarshal;
  class var f_UnMarshal : TJSONUnMarshal;
  class function Marshal: TJSONMarshal;
  class function UnMarshal: TJSONUnMarshal;
 public
  class procedure Serialize(const aFileName: string; const aDiagramm: TClassToSerialize);
  class procedure DeSerialize(const aFileName: string; const aDiagramm: TClassToSerialize);
  class destructor Destroy;
 end;//TmsMarshal

{$Else TmsMarshal}

// implementation

{$IfNDef TmsMarshal_uses_impl}

// uses
 msShape,
 SysUtils,
 msSerializeInterfaces,
 msRegisteredShapes,
 msCoreObjects

{$Define TmsMarshal_uses_impl}

{$Else TmsMarshal_uses_impl}

// TmsMarshal

class function TmsMarshal.UnMarshal: TJSONUnMarshal;
begin
 if (f_UnMarshal = nil) then
 begin
  f_UnMarshal := TJSONUnMarshal.Create;

  f_UnMarshal.RegisterReverter(TmsDiagramm, 'FShapeList',
   procedure (Data: TObject; Field: String; Args: TListOfObjects)
   var
    l_Object: TObject;
    l_Diagramm : TmsDiagramm;
    l_msShape: TmsShape;
   begin
    Assert(Data Is TmsDiagramm);
    l_Diagramm := TmsDiagramm(Data);
    assert(l_Diagramm <> nil);

    for l_Object in Args do
    begin
     l_msShape := l_Object as TmsShape;
     l_Diagramm.ShapeList.Add(l_msShape);
    end//for l_Object
   end
  );//f_UnMarshal.RegisterReverter
 end;//f_UnMarshal = nil
 Result := f_UnMarshal;
end;

class destructor TmsMarshal.Destroy;
begin
 FreeAndNil(f_Marshal);
 FreeAndNil(f_UnMarshal);
end;

class function TmsMarshal.Marshal: TJSONMarshal;
begin
 if (f_Marshal = nil) then
 begin
  f_Marshal := TJSONMarshal.Create;

  f_Marshal.RegisterConverter(TmsDiagramm, 'FShapeList',
   function (Data: TObject; Field: string): TListOfObjects
   var
    l_Shape: ImsShape;
    l_Index: Integer;
   begin
    Assert(Field = 'FShapeList');
    SetLength(Result, (Data As TmsDiagramm).ShapeList.Count);
    l_Index := 0;
    for l_Shape in (Data As TmsDiagramm).ShapeList do
    begin
     Result[l_Index] := (l_Shape As ImsObjectWrap).HackInstance;
     Inc(l_Index);
    end; // for l_Shape
   end
  );//f_Marshal.RegisterConverter

  TmsRegisteredShapes.IterateShapes(
   procedure (aShapeClass: RmsShape)
   begin
    f_Marshal.RegisterJSONMarshalled(aShapeClass, 'FRefCount', false);
   end
  );//TmsRegisteredShapes.IterateShapes
 end;//f_Marshal = nil
 Result := f_Marshal;
end;

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
