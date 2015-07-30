unit tfwCStringArraySing2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwCStringArraySing2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CString::TtfwCStringArraySing2
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwCStringArray
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCStringArraySing2 = class(TtfwCStringArray)
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwCStringArraySing2;
    {- возвращает экземпляр синглетона. }
 end;//TtfwCStringArraySing2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwCStringArraySing2

var g_TtfwCStringArraySing2 : TtfwCStringArraySing2 = nil;

procedure TtfwCStringArraySing2Free;
begin
 l3Free(g_TtfwCStringArraySing2);
end;

class function TtfwCStringArraySing2.Instance: TtfwCStringArraySing2;
begin
 if (g_TtfwCStringArraySing2 = nil) then
 begin
  l3System.AddExitProc(TtfwCStringArraySing2Free);
  g_TtfwCStringArraySing2 := Create;
 end;
 Result := g_TtfwCStringArraySing2;
end;


class function TtfwCStringArraySing2.Exists: Boolean;
 {-}
begin
 Result := g_TtfwCStringArraySing2 <> nil;
end;//TtfwCStringArraySing2.Exists

{$IfEnd} //not NoScripts

end.