unit kwCompiledLoop;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledLoop.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledLoop
//
// Скомпилироанная версия Loop
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
  kwCompiledWordWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledLoop = class(TkwCompiledWordWorker)
  {* Скомпилироанная версия Loop }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledLoop
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledLoop

procedure TkwCompiledLoop.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBE9F60228_var*
var
 l_I : Integer;
//#UC END# *4DAEEDE10285_4DCBE9F60228_var*
begin
//#UC START# *4DAEEDE10285_4DCBE9F60228_impl*
 for l_I := 0 to Pred(aCtx.rEngine.PopInt) do
  try
   f_Word.DoIt(aCtx);
  except
   on EtfwBreak do
    break;
   on EtfwContinue do
    continue;
  end;//try..except
//#UC END# *4DAEEDE10285_4DCBE9F60228_impl*
end;//TkwCompiledLoop.DoDoIt

{$IfEnd} //not NoScripts

end.