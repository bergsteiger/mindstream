unit tfwTypeInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwTypeInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: InternalInterfaces::Category Shared Delphi Low Level::ScriptEngine$Core::tfwTypeInfo
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwScriptingExceptions,
  l3Interfaces
  ;

type
 TtfwValueType = (
   tfw_vtVoid
 , tfw_vtInt
 , tfw_vtBool
 , tfw_vtStr
 , tfw_vtObj
 , tfw_vtList
 , tfw_vtIntf // Интерфейс
 , tfw_vtNil
 , tfw_vtFile
 , tfw_vtChar
 , tfw_vtWStr
 , tfw_vtBracket // Псевдо-значение. "Скобка"
 , tfw_vtClass // Ссылка на класс
 );//TtfwValueType

 TtfwStackValue = {$IfDef XE4}record{$Else}object{$EndIf}
 public
   rString : Il3CString;
   rInteger : Integer;
   rType : TtfwValueType;
   rSLen : Integer;
   rSCodePage : Integer;
 public
    function AsBoolean: Boolean;
    function AsString: Il3CString;
    function AsObject: TObject; overload; 
    function AsInt: Integer;
    function AsIntf(const aGUID: TGUID): IUnknown; overload; 
    function AsIntf: IUnknown; overload; 
    procedure CheckTypeIs(aTypeNeeded: TtfwValueType);
    function AsChar: AnsiChar;
    function AsWString: Tl3WString;
    function AsPrintable: Il3CString;
    function IsBracket: Boolean;
    function AsClass: TClass; overload; 
    procedure Clear;
    function AsObject(aClass: TClass): Pointer; overload; 
    function AsDelphiString: AnsiString;
    function AsClass(aClass: TClass): Pointer; overload; 
 end;//TtfwStackValue

 TtfwTypeInfo = {$IfDef XE4}record{$Else}object{$EndIf}
 private
   rTypeInfo : PTypeInfo;
   rClass : TClass;
 public
    function Compare(const anOther: TtfwTypeInfo): Integer;
    function Name: Il3CString;
    function AcceptsValue(const aValue: TtfwStackValue): Boolean;
    function DefaultValue: TtfwStackValue;
    function Empty: Boolean;
 end;//TtfwTypeInfo

 PtfwStackValue = ^TtfwStackValue;


function TtfwTypeInfo_C(aTypeInfo: PTypeInfo): TtfwTypeInfo; overload;
function TtfwTypeInfo_C(aType: TtfwValueType): TtfwTypeInfo; overload;
function TtfwTypeInfo_C(aClass: TClass): TtfwTypeInfo; overload;
function TtfwTypeInfo_E: TtfwTypeInfo;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  Classes,
  TypeInfoPack,
  VarWorkingPack,
  l3String,
  tfwScriptingTypes,
  tfwScriptingInterfaces
  ;

// start class TtfwStackValue

function TtfwStackValue.AsBoolean: Boolean;
//#UC START# *4DB0137B0192_4DB00A510300_var*
//#UC END# *4DB0137B0192_4DB00A510300_var*
begin
//#UC START# *4DB0137B0192_4DB00A510300_impl*
 CheckTypeIs(tfw_vtBool);
 Result := (rInteger <> 0);
//#UC END# *4DB0137B0192_4DB00A510300_impl*
end;//TtfwStackValue.AsBoolean

function TtfwStackValue.AsString: Il3CString;
//#UC START# *4DB04AE10159_4DB00A510300_var*
//#UC END# *4DB04AE10159_4DB00A510300_var*
begin
//#UC START# *4DB04AE10159_4DB00A510300_impl*
 CheckTypeIs(tfw_vtStr);
 Result := rString;
//#UC END# *4DB04AE10159_4DB00A510300_impl*
end;//TtfwStackValue.AsString

function TtfwStackValue.AsObject: TObject;
//#UC START# *4DBAF96002B5_4DB00A510300_var*
//#UC END# *4DBAF96002B5_4DB00A510300_var*
begin
//#UC START# *4DBAF96002B5_4DB00A510300_impl*
 if (rType = tfw_vtNil) then
  Result := nil
 else
 begin
  CheckTypeIs(tfw_vtObj);
  Result := TObject(rInteger);
 end;//rType = tfw_svtNil
//#UC END# *4DBAF96002B5_4DB00A510300_impl*
end;//TtfwStackValue.AsObject

function TtfwStackValue.AsInt: Integer;
//#UC START# *4E4CE1D0000E_4DB00A510300_var*
//#UC END# *4E4CE1D0000E_4DB00A510300_var*
begin
//#UC START# *4E4CE1D0000E_4DB00A510300_impl*
 CheckTypeIs(tfw_vtInt);
 Result := rInteger;
//#UC END# *4E4CE1D0000E_4DB00A510300_impl*
end;//TtfwStackValue.AsInt

function TtfwStackValue.AsIntf(const aGUID: TGUID): IUnknown;
//#UC START# *4EB2750D010D_4DB00A510300_var*
var
 l_O : TObject;
//#UC END# *4EB2750D010D_4DB00A510300_var*
begin
//#UC START# *4EB2750D010D_4DB00A510300_impl*
 if (rType = tfw_vtObj) then
 begin
  l_O := Self.AsObject;
  if (l_O <> nil) then
  begin
   if l_O.GetInterface(aGUID, Result) then
    Exit
(*   else
   if Supports(Self.AsObject, aGUID, Result) then
    Exit*)
   // - наверное не стоит ходить за интерфейсом "окольными путями"
   //   если объект его не поддерживает
   //   Ну типа как в Delphi. 
   ;
  end;//l_O <> nil
 end//rType = tfw_svtObj
 else
 if (rType = tfw_vtIntf) then
 begin
  if Supports(Self.AsIntf, aGUID, Result) then
   Exit;
 end;//rType = tfw_svtIntf
 EtfwCheck.Fail(l3Str(AsPrintable) + ': Не поддерживается интерфес ' + GUIDToString(aGUID));
//#UC END# *4EB2750D010D_4DB00A510300_impl*
end;//TtfwStackValue.AsIntf

function TtfwStackValue.AsIntf: IUnknown;
//#UC START# *4EB275290323_4DB00A510300_var*
//#UC END# *4EB275290323_4DB00A510300_var*
begin
//#UC START# *4EB275290323_4DB00A510300_impl*
 if (rType = tfw_vtNil) then
  Result := nil
 else
 begin
  if not ((rType = tfw_vtIntf) OR
          (rType = tfw_vtList) OR
          (rType = tfw_vtFile)) then
   EtfwCheck.Fail('Тип значения ' +
          GetEnumName(TypeInfo(TtfwValueType), Ord(rType)) +
          ' несовместим с интерфейсом'
         );
  Result := IUnknown(rString);
 end;//rType = tfw_svtNil
//#UC END# *4EB275290323_4DB00A510300_impl*
end;//TtfwStackValue.AsIntf

procedure TtfwStackValue.CheckTypeIs(aTypeNeeded: TtfwValueType);
//#UC START# *4F47BE7100B4_4DB00A510300_var*
//#UC END# *4F47BE7100B4_4DB00A510300_var*
begin
//#UC START# *4F47BE7100B4_4DB00A510300_impl*
 if (rType <> aTypeNeeded) then
  EtfwCheck.Fail(
         'Тип значения ' +
         GetEnumName(TypeInfo(TtfwValueType), Ord(rType)) +
         ' несовместим с ' +
         GetEnumName(TypeInfo(TtfwValueType), Ord(aTypeNeeded))
        );
//#UC END# *4F47BE7100B4_4DB00A510300_impl*
end;//TtfwStackValue.CheckTypeIs

function TtfwStackValue.AsChar: AnsiChar;
//#UC START# *4F4FDCBE01B5_4DB00A510300_var*
//#UC END# *4F4FDCBE01B5_4DB00A510300_var*
begin
//#UC START# *4F4FDCBE01B5_4DB00A510300_impl*
 CheckTypeIs(tfw_vtChar);
 Result := AnsiChar(rInteger);
//#UC END# *4F4FDCBE01B5_4DB00A510300_impl*
end;//TtfwStackValue.AsChar

function TtfwStackValue.AsWString: Tl3WString;
//#UC START# *4F4FE10601D8_4DB00A510300_var*
//#UC END# *4F4FE10601D8_4DB00A510300_var*
begin
//#UC START# *4F4FE10601D8_4DB00A510300_impl*
 CheckTypeIs(tfw_vtWStr);
 Result.S := PAnsiChar(rInteger);
 Result.SLen := rSLen;
 Result.SCodePage := rSCodePage;
//#UC END# *4F4FE10601D8_4DB00A510300_impl*
end;//TtfwStackValue.AsWString

function TtfwStackValue.AsPrintable: Il3CString;
//#UC START# *4F4FEB3C01D1_4DB00A510300_var*
var
 l_Obj : TObject;
//#UC END# *4F4FEB3C01D1_4DB00A510300_var*
begin
//#UC START# *4F4FEB3C01D1_4DB00A510300_impl*
 Case rType of
  tfw_vtStr:
   Result := AsString;
  tfw_vtInt:
   Result := TtfwCStringFactory.C(IntToStr(rInteger));
  tfw_vtBool:
   Result := TtfwCStringFactory.C(BoolToStr(AsBoolean, true));
  tfw_vtVoid:
   Result := TtfwCStringFactory.C('<void>');
  tfw_vtObj:
  begin
   l_Obj := AsObject;
   if (l_Obj Is TComponent) then
    Result := TtfwCStringFactory.C(TComponent(l_Obj).Name + ' : ' + l_Obj.ClassName)
   else
   if (l_Obj <> nil) then
    Result := TtfwCStringFactory.C(l_Obj.ClassName)
   else
    Result := TtfwCStringFactory.C('<nil>'); 
  end;//tfw_svtObj
  tfw_vtIntf:
   Result := TtfwCStringFactory.C(Format('<interface %p>', [Pointer(rString)]));
  tfw_vtList:
   Result := TtfwCStringFactory.C(Format('<array %p>', [Pointer(rString)]));
  tfw_vtWStr:
   Result := TtfwCStringFactory.C(AsWString);
  tfw_vtChar:
   Result := TtfwCStringFactory.C(AsChar);
  tfw_vtBracket:
   Result := TtfwCStringFactory.C('<bracket>');
  tfw_vtNil:
   Result := TtfwCStringFactory.C('<nil>');
  tfw_vtClass:
    Result := TtfwCStringFactory.C(AsClass.ClassName);
  else
  begin
   Result := nil;
   EtfwCheck.Fail('Неизвестный тип для приведения к печатному виду');
  end;//else
 end;//Case rType  
//#UC END# *4F4FEB3C01D1_4DB00A510300_impl*
end;//TtfwStackValue.AsPrintable

function TtfwStackValue.IsBracket: Boolean;
//#UC START# *4F503089022C_4DB00A510300_var*
//#UC END# *4F503089022C_4DB00A510300_var*
begin
//#UC START# *4F503089022C_4DB00A510300_impl*
 Result := (rType = tfw_vtBracket);
//#UC END# *4F503089022C_4DB00A510300_impl*
end;//TtfwStackValue.IsBracket

function TtfwStackValue.AsClass: TClass;
//#UC START# *5085301700BE_4DB00A510300_var*
//#UC END# *5085301700BE_4DB00A510300_var*
begin
//#UC START# *5085301700BE_4DB00A510300_impl*
 if (rType = tfw_vtNil) then
  Result := nil
 else
 begin
  CheckTypeIs(tfw_vtClass);
  Result := TClass(rInteger);
 end;//rType = tfw_svtNil
//#UC END# *5085301700BE_4DB00A510300_impl*
end;//TtfwStackValue.AsClass

procedure TtfwStackValue.Clear;
//#UC START# *558D1A20035B_4DB00A510300_var*
//#UC END# *558D1A20035B_4DB00A510300_var*
begin
//#UC START# *558D1A20035B_4DB00A510300_impl*
 rString := nil;
//#UC END# *558D1A20035B_4DB00A510300_impl*
end;//TtfwStackValue.Clear

function TtfwStackValue.AsObject(aClass: TClass): Pointer;
//#UC START# *55C8C3D00092_4DB00A510300_var*
var
 l_O : TObject;
//#UC END# *55C8C3D00092_4DB00A510300_var*
begin
//#UC START# *55C8C3D00092_4DB00A510300_impl*
 l_O := AsObject;
 if (l_O = nil) then
 begin
  if aClass.InheritsFrom(TtfwWord) then
  begin
   Result := nil;
   Exit;
  end;//aClass.IhneritsFrom(TtfwWord)
  EtfwCheck.Fail('Передан nil, вместо: ' + aClass.ClassName);
 end;//l_O = nil
 if not (l_O Is aClass) then
  EtfwCheck.Fail('Класс: ' + l_O.ClassName + ' не совместим с: ' + aClass.ClassName);
 Result := Pointer(l_O);
//#UC END# *55C8C3D00092_4DB00A510300_impl*
end;//TtfwStackValue.AsObject

function TtfwStackValue.AsDelphiString: AnsiString;
//#UC START# *55CB0A17007A_4DB00A510300_var*
//#UC END# *55CB0A17007A_4DB00A510300_var*
begin
//#UC START# *55CB0A17007A_4DB00A510300_impl*
 Result := l3Str(Self.AsString);
//#UC END# *55CB0A17007A_4DB00A510300_impl*
end;//TtfwStackValue.AsDelphiString

function TtfwStackValue.AsClass(aClass: TClass): Pointer;
//#UC START# *55CB29290229_4DB00A510300_var*
var
 l_C : TClass;
//#UC END# *55CB29290229_4DB00A510300_var*
begin
//#UC START# *55CB29290229_4DB00A510300_impl*
 l_C := AsClass;
 if (l_C = nil) then
 begin
(*  if aClass.InheritsFrom(TtfwWord) then
  begin
   Result := nil;
   Exit;
  end;//aClass.IhneritsFrom(TtfwWord)*)
  EtfwCheck.Fail('Передан nil, вместо: ' + aClass.ClassName);
 end;//l_C = nil
 if not l_C.InheritsFrom(aClass) then
  EtfwCheck.Fail('Класс: ' + l_C.ClassName + ' не совместим с: ' + aClass.ClassName);
 Result := Pointer(l_C);
//#UC END# *55CB29290229_4DB00A510300_impl*
end;//TtfwStackValue.AsClass

function TtfwTypeInfo_C(aTypeInfo: PTypeInfo): TtfwTypeInfo;
//#UC START# *55BF15F300FE_55BF154E022D_var*
//#UC END# *55BF15F300FE_55BF154E022D_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55BF15F300FE_55BF154E022D_impl*
 {$IfNDef seTypeCheck}
 if (aTypeInfo <> nil) then
 begin
  if (aTypeInfo.Kind = tkClass) then
  begin
   Result.rTypeInfo := TypeInfo(TObject);
   Exit;
  end//aTypeInfo.Kind = tkObject
 end;//aTypeInfo <> nil
 {$EndIf  seTypeCheck}
 Result.rTypeInfo := aTypeInfo;
 Result.rClass := nil;
//#UC END# *55BF15F300FE_55BF154E022D_impl*
end;//TtfwTypeInfo.C

// start class TtfwTypeInfo

function TtfwTypeInfo.Compare(const anOther: TtfwTypeInfo): Integer;
//#UC START# *55BF161202B0_55BF154E022D_var*
//#UC END# *55BF161202B0_55BF154E022D_var*
begin
//#UC START# *55BF161202B0_55BF154E022D_impl*
 if Empty then
 begin
  if anOther.Empty then
   Result := 0
  else
   Result := -1;
 end//Empty
 else
 if (Self.rTypeInfo <> nil) then
 begin
  if (anOther.rTypeInfo = nil) then
   Result := Integer(Self.rTypeInfo) - Integer(anOther.rClass)
  else
   Result := Integer(Self.rTypeInfo) - Integer(anOther.rTypeInfo);
 end//Self.rTypeInfo <> nil
 else
 begin
  if (anOther.rClass = nil) then
   Result := Integer(Self.rClass) - Integer(anOther.rTypeInfo)
  else
   Result := Integer(Self.rClass) - Integer(anOther.rClass);
 end;//Self.rTypeInfo <> nil
//#UC END# *55BF161202B0_55BF154E022D_impl*
end;//TtfwTypeInfo.Compare

function TtfwTypeInfo_C(aType: TtfwValueType): TtfwTypeInfo;
//#UC START# *55BF29550294_55BF154E022D_var*
//#UC END# *55BF29550294_55BF154E022D_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55BF29550294_55BF154E022D_impl*
 Case aType of
  tfw_vtVoid:
   Result.rTypeInfo := @tfw_tiVoid;
  tfw_vtInt:
   Result.rTypeInfo := TypeInfo(Integer);
  tfw_vtBool:
   Result.rTypeInfo := TypeInfo(Boolean);
  tfw_vtStr:
   Result.rTypeInfo := TypeInfo(AnsiString);
  tfw_vtObj:
   Result.rTypeInfo := TypeInfo(TObject);
  tfw_vtList:
   Result.rTypeInfo := TypeInfo(ItfwValueList);
  tfw_vtIntf:
   Result.rTypeInfo := TypeInfo(IUnknown);
  tfw_vtNil:
   Result.rTypeInfo := @tfw_tiNil;
  tfw_vtFile:
   Result.rTypeInfo := TypeInfo(ItfwFile);
  tfw_vtChar:
   Result.rTypeInfo := TypeInfo(AnsiChar);
  tfw_vtWStr:
   Result.rTypeInfo := @tfw_tiWString;
  tfw_vtBracket:
   Result.rTypeInfo := @tfw_tiBracket;
  tfw_vtClass:
   Result.rTypeInfo := @tfw_tiClassRef;
  else
   Assert(false);
 end;//Case aType
//#UC END# *55BF29550294_55BF154E022D_impl*
end;//TtfwTypeInfo.C

// start class TtfwTypeInfo

function TtfwTypeInfo.Name: Il3CString;
//#UC START# *55BF5E34013D_55BF154E022D_var*
var
 l_TD : PTypeData;
//#UC END# *55BF5E34013D_55BF154E022D_var*
begin
//#UC START# *55BF5E34013D_55BF154E022D_impl*
 if Empty then
  Result := nil
 else
 if (rClass <> nil) then
 begin
  if (rClass = TObject) then
   Result := TtfwCStringFactory.C('OBJECT')
  else
   Result := TtfwCStringFactory.C(rClass.ClassName);
 end//rClass <> nil
 else
 begin
  Case rTypeInfo.Kind of
   tkInterface:
   begin
    l_TD := GetTypeData(rTypeInfo);
    Assert(l_TD <> nil);
    if (ifHasGuid in l_TD.IntfFlags) then
    begin
     if IsEqualGUID(l_TD.GUID, ItfwFile) then
      Result := TtfwCStringFactory.C('FILE')
     else
     if IsEqualGUID(l_TD.GUID, ItfwValueList) then
      Result := TtfwCStringFactory.C('ARRAY')
     else
     if IsEqualGUID(l_TD.GUID, IUnknown) then
      Result := TtfwCStringFactory.C('INTERFACE')
     else
      Result := TtfwCStringFactory.C(rTypeInfo.Name);
    end//ifHasGuid in l_TD.IntfFlags
    else
     Result := TtfwCStringFactory.C(rTypeInfo.Name);
   end;//tkInterface
   tkClass:
   begin
    l_TD := GetTypeData(rTypeInfo);
    Assert(l_TD <> nil);
    if (l_TD.ClassType = TObject) then
     Result := TtfwCStringFactory.C('OBJECT')
    else
     Result := TtfwCStringFactory.C(rTypeInfo.Name);
   end;//tkClass
   tkInteger:
   begin
    Result := TtfwCStringFactory.C(rTypeInfo.Name);
    if l3Same(Result, 'Integer', true) then
     Result := TtfwCStringFactory.C('INTEGER');
   end;//tkInteger
   else
   begin
    Result := TtfwCStringFactory.C(rTypeInfo.Name);
    if l3Same(Result, 'Char', true) then
     Result := TtfwCStringFactory.C('CHAR')
    else
    if l3Same(Result, 'String', true) then
     Result := TtfwCStringFactory.C('STRING')
    else
    if l3Same(Result, 'AnsiString', true) then
     Result := TtfwCStringFactory.C('STRING')
    else
    if l3Same(Result, 'Boolean', true) then
     Result := TtfwCStringFactory.C('BOOLEAN')
    ;
   end;//else
  end//Case rTypeInfo.Kind
 end;//rTypeInfo.Empty
//#UC END# *55BF5E34013D_55BF154E022D_impl*
end;//TtfwTypeInfo.Name

function TtfwTypeInfo.AcceptsValue(const aValue: TtfwStackValue): Boolean;
//#UC START# *55BF5E720257_55BF154E022D_var*
var
 l_TD : PTypeData;
 l_O : TObject;
//#UC END# *55BF5E720257_55BF154E022D_var*
begin
//#UC START# *55BF5E720257_55BF154E022D_impl*
 if Empty then
  Result := false
 else
  Case aValue.rType of
   tfw_vtNil:
   begin
    if (rTypeInfo = nil) then
     Result := true
    else
     Case rTypeInfo.Kind of
      tkUnknown:
      begin
       if (rTypeInfo = @tfw_tiClassRef) then
        Result := true
       else
       if (rTypeInfo = @tfw_tiNil) then
        Result := true
       else
       begin
        Result := false;
        Assert(false);
       end;//else
      end;//tkUnknown
      tkInterface,
      tkString,
      tkLString,
      tkClass:
       Result := true;
      else
       Result := false;
     end;//Case rTypeInfo.Kind
   end;//tfw_vtNil
   else
    if (rClass <> nil) then
    begin
     if (aValue.rType <> tfw_vtObj) then
      Result := false
     else
     begin
      l_O := aValue.AsObject;
      if (l_O = nil) then
       Result := true
      else
       Result := l_O.InheritsFrom(rClass);
     end;//aValue.rType <> tfw_vtObj
    end//rClass <> nil
    else
    Case rTypeInfo.Kind of
     tkUnknown:
     begin
      Result := Self.Compare(TtfwTypeInfo_C(aValue.rType)) = 0;
      Assert(Result);
     end;//tkUnknown
     tkClass:
     begin
      if (aValue.rType <> tfw_vtObj) then
       Result := false
      else
      begin
       Result := Self.Compare(TtfwTypeInfo_C(aValue.rType)) = 0;
       if not Result then
       begin
        l_O := aValue.AsObject;
        if (l_O = nil) then
         Result := true
        else
        begin
         l_TD := GetTypeData(rTypeInfo);
         Assert(l_TD <> nil);
         Result := l_O.InheritsFrom(l_TD.ClassType);
        end;//l_O = nil
       end;//not Result
      end;//aValue.rType
     end;//tkClass
     else
      Result := Self.Compare(TtfwTypeInfo_C(aValue.rType)) = 0;
    end;//Case rTypeInfo.Kind
  end;//Case aValue.rType
//#UC END# *55BF5E720257_55BF154E022D_impl*
end;//TtfwTypeInfo.AcceptsValue

function TtfwTypeInfo.DefaultValue: TtfwStackValue;
//#UC START# *55C0C954038A_55BF154E022D_var*
//#UC END# *55C0C954038A_55BF154E022D_var*
begin
//#UC START# *55C0C954038A_55BF154E022D_impl*
 if Empty then
  Result := TtfwStackValue_E
 else
 if (rClass <> nil) then
  Result := TtfwStackValue_NULL
 else
  Case rTypeInfo.Kind of
   tkUnknown:
   begin
    if (rTypeInfo = @tfw_tiClassRef) then
     Result := TtfwStackValue_NULL
    else
    if (rTypeInfo = @tfw_tiWString) then
     Result := TtfwStackValue_NULL
    else
    begin
     Result := TtfwStackValue_E;
     Assert(false);
    end;//else
   end;//tkUnknown
   tkInteger:
    Result := TtfwStackValue_C(0);
   tkChar:
    Result := TtfwStackValue_C(#0);
   tkEnumeration:
    Result := TtfwStackValue_C(0);
   //tkFloat,
   tkString:
    Result := TtfwStackValue_C(TtfwCStringFactory.C(''));
   //tkSet,
   tkClass:
    Result := TtfwStackValue_NULL;
   //tkMethod,
   //tkWChar,
   tkLString:
    Result := TtfwStackValue_C(TtfwCStringFactory.C(''));
   //tkWString,
   //tkVariant,
   //tkArray,
   //tkRecord,
   tkInterface:
    Result := TtfwStackValue_NULL;
   //tkDynArray:
   else
   begin
    Result := TtfwStackValue_E;
    Assert(false);
   end;//else
  end;//Case rTypeInfo.Kind
//#UC END# *55C0C954038A_55BF154E022D_impl*
end;//TtfwTypeInfo.DefaultValue

function TtfwTypeInfo.Empty: Boolean;
//#UC START# *55C1EB170084_55BF154E022D_var*
//#UC END# *55C1EB170084_55BF154E022D_var*
begin
//#UC START# *55C1EB170084_55BF154E022D_impl*
 Result := (rTypeInfo = nil) AND (rClass = nil); 
//#UC END# *55C1EB170084_55BF154E022D_impl*
end;//TtfwTypeInfo.Empty

function TtfwTypeInfo_C(aClass: TClass): TtfwTypeInfo;
//#UC START# *55C4A74F01B0_55BF154E022D_var*
//#UC END# *55C4A74F01B0_55BF154E022D_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55C4A74F01B0_55BF154E022D_impl*
 Result.rTypeInfo := nil;
 Result.rClass := aClass;
//#UC END# *55C4A74F01B0_55BF154E022D_impl*
end;//TtfwTypeInfo.C


function TtfwTypeInfo_E: TtfwTypeInfo;
//#UC START# *55C4A777013F_55BF154E022D_var*
//#UC END# *55C4A777013F_55BF154E022D_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55C4A777013F_55BF154E022D_impl*
 Result.rTypeInfo := nil;
 Result.rClass := nil;
//#UC END# *55C4A777013F_55BF154E022D_impl*
end;//TtfwTypeInfo.E

{$IfEnd} //not NoScripts

end.