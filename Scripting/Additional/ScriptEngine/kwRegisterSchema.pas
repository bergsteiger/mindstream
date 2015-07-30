unit kwRegisterSchema;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwRegisterSchema.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::TkwRegisterSchema
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
type
 TkwRegisterSchema = {final} class
 private
 // private methods
   class procedure RegisterSchema(aSender: TObject);
 end;//TkwRegisterSchema
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  k2Facade,
  k2Tags,
  evStyleInterface,
  tfwIntegerConstantRegistrator,
  k2Attributes,
  l3Base,
  k2Base,
  SysUtils,
  l3Variant,
  evdStyles,
  tfwEnumRegistrator,
  TypInfo,
  evdTypes,
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwRegisterSchema

class procedure TkwRegisterSchema.RegisterSchema(aSender: TObject);
//#UC START# *53C7C3DC0014_53C7C38A011C_var*

 function DoAttr(const anAttr: Tk2Attribute; anIndex: Integer): Boolean;
 begin
  Result := true;
  TtfwIntegerConstantRegistrator.Register('evd::ti_' + anAttr.rName, anAttr.rID);
 end;

 function OutStyle(aStyle: Pl3Variant; Index: Integer): Boolean;
 var
  l_Tag : Tl3Tag;
  l_H   : Integer;
 begin//OutStyle
  Result := true;
  l_Tag := aStyle^;
  l_H := -l_Tag.IntA[k2_tiHandle];
  if (l_H >= Low(StandardNames)) AND (l_H <= High(StandardNames)) then
  begin
   TtfwIntegerConstantRegistrator.Register('evd::sa_' + StandardNames[l_H], -l_H);
  end;//l_H >= Low(StandardNames)
 end;//OutStyle

 function OutStyle1(aStyle: Pl3Variant; Index: Integer): Boolean;
 var
  l_Tag : Tl3Tag;
  l_H   : Integer;
 begin//OutStyle1
  Result := true;
  l_Tag := astyle^;
  l_H := l_Tag.IntA[k2_tiHandle];
  TtfwIntegerConstantRegistrator.Register('evd::стиль:"' + l_Tag.StrA[k2_tiName] + '"', -l_H);
 end;//OutStyle1
  
var
 l_TT : Tk2TypeTable;
 l_Index : Integer;
 l_Type : Tk2Type;
 l_SI : TevStyleInterface;
//#UC END# *53C7C3DC0014_53C7C38A011C_var*
begin
//#UC START# *53C7C3DC0014_53C7C38A011C_impl*
 l_TT := k2.TypeTable;
 TtfwClassRef.Register(l_TT.ClassType);
 for l_Index := 0 to l_TT.MaxTypeID do
 begin
  l_Type := l_TT.TypeByHandle[l_Index];
  if (l_Type <> nil) then
  begin
   TtfwIntegerConstantRegistrator.Register('evd::id_' + l_Type.AsString, l_Type.ID);
   if (l_Type.AtomType <> nil) then
   begin
    if (l_Type.AtomType.Kind = tkEnumeration) then
     TtfwEnumRegistrator.RegisterEnum(l_Type.AtomType);
    if (l_Type.AtomClass <> nil) then
     TtfwClassRef.Register(l_Type.AtomClass);
   end;//l_Type.AtomType <> nil
   if (l_Type.WrapperType <> nil) then
    TtfwClassRef.Register(l_Type.WrapperType);
   if (l_Type.InterfaceFactory <> nil) then
    TtfwClassRef.Register(l_Type.InterfaceFactory.ClassType);
  end;//l_Type <> nil
 end;//for l_Index
 Tk2Attributes.Instance.IterateAllF(l3L2IA(@DoAttr));
 l_SI := TevStyleInterface.Make;
 try
  l_SI.IterateF(l3L2IA(@OutStyle));
  l_SI.IterateF(l3L2IA(@OutStyle1));
 finally
  FreeAndNil(l_SI);
 end;//try..finally
//#UC END# *53C7C3DC0014_53C7C38A011C_impl*
end;//TkwRegisterSchema.RegisterSchema

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53C7C3B90110*
 Tk2TypeTable.AddCreatedListener(TkwRegisterSchema.RegisterSchema);
//#UC END# *53C7C3B90110*
{$IfEnd} //not NoScripts

end.