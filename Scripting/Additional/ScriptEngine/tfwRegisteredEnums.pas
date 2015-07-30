unit tfwRegisteredEnums;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwRegisteredEnums.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ConstantsRegistration::TtfwRegisteredEnums
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwTypeInfoList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwRegisteredEnums = class(TtfwTypeInfoList)
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwRegisteredEnums;
    {- возвращает экземпляр синглетона. }
 end;//TtfwRegisteredEnums
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwRegisteredEnums

var g_TtfwRegisteredEnums : TtfwRegisteredEnums = nil;

procedure TtfwRegisteredEnumsFree;
begin
 l3Free(g_TtfwRegisteredEnums);
end;

class function TtfwRegisteredEnums.Instance: TtfwRegisteredEnums;
begin
 if (g_TtfwRegisteredEnums = nil) then
 begin
  l3System.AddExitProc(TtfwRegisteredEnumsFree);
  g_TtfwRegisteredEnums := Create;
 end;
 Result := g_TtfwRegisteredEnums;
end;


class function TtfwRegisteredEnums.Exists: Boolean;
 {-}
begin
 Result := g_TtfwRegisteredEnums <> nil;
end;//TtfwRegisteredEnums.Exists

{$IfEnd} //not NoScripts

end.