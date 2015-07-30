unit kwMedianBacket;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMedianBacket.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::MedianBacket
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMedianBacket = {abstract scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwMedianBacket
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwMedianBacket

procedure TkwMedianBacket.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52D7DD7A0120_var*
//#UC END# *4DAEEDE10285_52D7DD7A0120_var*
begin
//#UC START# *4DAEEDE10285_52D7DD7A0120_impl*
 if not aCtx.rWordCompilingNow.AcceptMedianBracket(Self, PtfwContext(@aCtx)^) then
  CompilerAssert(false, 'Непарная средняя скобка', aCtx);
//#UC END# *4DAEEDE10285_52D7DD7A0120_impl*
end;//TkwMedianBacket.DoDoIt

function TkwMedianBacket.IsImmediate: Boolean;
 {-}
begin
 Result := true;
end;//TkwMedianBacket.IsImmediate

{$IfEnd} //not NoScripts

end.