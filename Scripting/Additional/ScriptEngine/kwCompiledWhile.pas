unit kwCompiledWhile;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWhile.pas"
// Начат: 12.05.2011 17:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWhile
//
// Скомпилированная версия While
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
 TkwCompiledWhile = class(TkwCompiledWordWorker)
  {* Скомпилированная версия While }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledWhile
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledWhile

procedure TkwCompiledWhile.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCBE1DD0337_var*
var
 l_Lambda : TtfwWord;
//#UC END# *4DAEEDE10285_4DCBE1DD0337_var*
begin
//#UC START# *4DAEEDE10285_4DCBE1DD0337_impl*
 l_Lambda := (aCtx.rEngine.PopObj As TtfwWord);
 while true do
 begin
  l_Lambda.DoIt(aCtx);
  if not aCtx.rEngine.PopBool then
   break;
  try
   f_Word.DoIt(aCtx);
  except
   on EtfwBreak do
    break;
   on EtfwContinue do
    continue;
  end;//try..except
 end;//while true
//#UC END# *4DAEEDE10285_4DCBE1DD0337_impl*
end;//TkwCompiledWhile.DoDoIt

{$IfEnd} //not NoScripts

end.