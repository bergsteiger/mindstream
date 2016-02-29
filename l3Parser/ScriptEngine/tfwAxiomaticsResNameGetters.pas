unit tfwAxiomaticsResNameGetters;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwAxiomaticsResNameGetters.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptedAxiomatics::TtfwAxiomaticsResNameGetters
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwAxiomaticsResNameGetterList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwAxiomaticsResNameGetters = class(TtfwAxiomaticsResNameGetterList)
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwAxiomaticsResNameGetters;
    {- возвращает экземпляр синглетона. }
 end;//TtfwAxiomaticsResNameGetters
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base {a}
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}


// start class TtfwAxiomaticsResNameGetters

var g_TtfwAxiomaticsResNameGetters : TtfwAxiomaticsResNameGetters = nil;

procedure TtfwAxiomaticsResNameGettersFree;
begin
 l3Free(g_TtfwAxiomaticsResNameGetters);
end;

class function TtfwAxiomaticsResNameGetters.Instance: TtfwAxiomaticsResNameGetters;
begin
 if (g_TtfwAxiomaticsResNameGetters = nil) then
 begin
  l3System.AddExitProc(TtfwAxiomaticsResNameGettersFree);
  g_TtfwAxiomaticsResNameGetters := Create;
 end;
 Result := g_TtfwAxiomaticsResNameGetters;
end;


class function TtfwAxiomaticsResNameGetters.Exists: Boolean;
 {-}
begin
 Result := g_TtfwAxiomaticsResNameGetters <> nil;
end;//TtfwAxiomaticsResNameGetters.Exists

{$IfEnd} //not NoScripts

end.