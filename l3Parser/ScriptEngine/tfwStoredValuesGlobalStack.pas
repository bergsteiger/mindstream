unit tfwStoredValuesGlobalStack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStoredValuesGlobalStack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::TtfwStoredValuesGlobalStack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStoredValuesStack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStoredValuesGlobalStack = class(TtfwStoredValuesStack)
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwStoredValuesGlobalStack;
    {- возвращает экземпляр синглетона. }
 end;//TtfwStoredValuesGlobalStack
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwStoredValuesGlobalStack

var g_TtfwStoredValuesGlobalStack : TtfwStoredValuesGlobalStack = nil;

procedure TtfwStoredValuesGlobalStackFree;
begin
 l3Free(g_TtfwStoredValuesGlobalStack);
end;

class function TtfwStoredValuesGlobalStack.Instance: TtfwStoredValuesGlobalStack;
begin
 if (g_TtfwStoredValuesGlobalStack = nil) then
 begin
  l3System.AddExitProc(TtfwStoredValuesGlobalStackFree);
  g_TtfwStoredValuesGlobalStack := Create;
 end;
 Result := g_TtfwStoredValuesGlobalStack;
end;


class function TtfwStoredValuesGlobalStack.Exists: Boolean;
 {-}
begin
 Result := g_TtfwStoredValuesGlobalStack <> nil;
end;//TtfwStoredValuesGlobalStack.Exists

{$IfEnd} //not NoScripts

end.