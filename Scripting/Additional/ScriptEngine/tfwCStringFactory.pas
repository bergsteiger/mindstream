unit tfwCStringFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCStringFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CString::TtfwCStringFactory
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwCStringList,
  l3Variant
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCStringFactory = class(TtfwCStringList)
 protected
 // overridden protected methods
   procedure InitFields; override;
 public
 // public methods
   class function C(const aString: AnsiString): Il3CString; overload; 
   class function C(const aString: Tl3WString): Il3CString; overload; 
   class function C(aString: Tl3PrimString): Il3CString; overload; 
   class function C(aChar: AnsiChar): Il3CString; overload; 
 public
 // singleton factory method
   class function Instance: TtfwCStringFactory;
    {- возвращает экземпляр синглетона. }
 end;//TtfwCStringFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a},
  l3String,
  tfwCStringArraySing,
  tfwCStringArraySing2,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwCStringFactory

var g_TtfwCStringFactory : TtfwCStringFactory = nil;

procedure TtfwCStringFactoryFree;
begin
 l3Free(g_TtfwCStringFactory);
end;

class function TtfwCStringFactory.Instance: TtfwCStringFactory;
begin
 if (g_TtfwCStringFactory = nil) then
 begin
  l3System.AddExitProc(TtfwCStringFactoryFree);
  g_TtfwCStringFactory := Create;
 end;
 Result := g_TtfwCStringFactory;
end;

const
   { Local }
  cLimit = 200;

// start class TtfwCStringFactory

class function TtfwCStringFactory.C(const aString: AnsiString): Il3CString;
//#UC START# *4F47405B02FD_4F473F9402D8_var*
var
 i : Integer;
 l_Len : Integer;
 l_W   : Word;
//#UC END# *4F47405B02FD_4F473F9402D8_var*
begin
//#UC START# *4F47405B02FD_4F473F9402D8_impl*
 {.$IfNDef XE}
 l_Len := Length(aString);
 if (l_Len < cLimit) then
 begin
  if (l_Len = 1) then
   Result := C(aString[1])
  else
  if (l_Len = 2) then
  begin
   l_W := PWord(@(aString[1]))^;
   Result := TtfwCStringArraySing2.Instance.Items[l_W];
   if (Result = nil) then
   begin
    Result := l3CStr(aString);
    TtfwCStringArraySing2.Instance.Items[l_W] := Result;
   end;//Result = nil
  end//l_Len = 2
  else
   with Instance do
   begin
    if FindData(l3PCharLen(aString), i, SortIndex) then
     Result := Items[i]
    else
    begin
     Result := l3CStr(aString);
     DirectInsert(i, Result);
    end;//FindData(l3PCharLen(aString), i)
   end;//with Instance
 end//Length(aString) < cLimit
 else
 {.$EndIf XE}
  Result := l3CStr(aString);
//#UC END# *4F47405B02FD_4F473F9402D8_impl*
end;//TtfwCStringFactory.C

class function TtfwCStringFactory.C(const aString: Tl3WString): Il3CString;
//#UC START# *4F47407D0052_4F473F9402D8_var*
var
 i : Integer;
 l_W : Word;
//#UC END# *4F47407D0052_4F473F9402D8_var*
begin
//#UC START# *4F47407D0052_4F473F9402D8_impl*
 {.$IfNDef XE}
 if (aString.SLen < cLimit) then
 begin
  if (aString.SLen = 1) AND l3IsANSI(aString.SCodePage) then
  begin
   Assert(aString.S <> nil);
   Result := C(aString.S[0]);
  end//aString.SLen = 1
  else
  if (aString.SLen = 2) AND l3IsANSI(aString.SCodePage) then
  begin
   Assert(aString.S <> nil);
   l_W := PWord(aString.S)^;
   Result := TtfwCStringArraySing2.Instance.Items[l_W];
   if (Result = nil) then
   begin
    Result := l3CStr(aString);
    TtfwCStringArraySing2.Instance.Items[l_W] := Result;
   end;//Result = nil
  end//aString.SLen = 2
  else
   with Instance do
   begin
    if FindData(aString, i, SortIndex) then
     Result := Items[i]
    else
    begin
     Result := l3CStr(aString);
     DirectInsert(i, Result);
    end;//FindData(l3PCharLen(aString), i)
   end;//with Instance
 end//Length(aString) < cLimit
 else
 {.$EndIf XE}
  Result := l3CStr(aString);
//#UC END# *4F47407D0052_4F473F9402D8_impl*
end;//TtfwCStringFactory.C

class function TtfwCStringFactory.C(aString: Tl3PrimString): Il3CString;
//#UC START# *4F4740A802A8_4F473F9402D8_var*
var
 l_S : Tl3WString;
//#UC END# *4F4740A802A8_4F473F9402D8_var*
begin
//#UC START# *4F4740A802A8_4F473F9402D8_impl*
 if (aString = nil) then
  Result := l3CStr('')
 else
 begin
  l_S := aString.AsWStr;
  if (l_S.SLen < cLimit) then
   Result := C(l_S)
  else
   Result := l3CStr(aString);
 end;//aString = nil
//#UC END# *4F4740A802A8_4F473F9402D8_impl*
end;//TtfwCStringFactory.C

class function TtfwCStringFactory.C(aChar: AnsiChar): Il3CString;
//#UC START# *4F50782700AA_4F473F9402D8_var*
//#UC END# *4F50782700AA_4F473F9402D8_var*
begin
//#UC START# *4F50782700AA_4F473F9402D8_impl*
 Result := TtfwCStringArraySing.Instance.Items[Ord(aChar)];
 if (Result = nil) then
 begin
  Result := l3CStr(aChar);
  TtfwCStringArraySing.Instance.Items[Ord(aChar)] := Result;
 end;//Result = nil
//#UC END# *4F50782700AA_4F473F9402D8_impl*
end;//TtfwCStringFactory.C

procedure TtfwCStringFactory.InitFields;
//#UC START# *47A042E100E2_4F473F9402D8_var*
//#UC END# *47A042E100E2_4F473F9402D8_var*
begin
//#UC START# *47A042E100E2_4F473F9402D8_impl*
 inherited;
 Sorted := true;
//#UC END# *47A042E100E2_4F473F9402D8_impl*
end;//TtfwCStringFactory.InitFields

{$IfEnd} //not NoScripts

end.