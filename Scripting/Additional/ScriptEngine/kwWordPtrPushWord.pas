unit kwWordPtrPushWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwWordPtrPushWord.pas"
// Начат: 12.02.2012 16:21
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwWordPtrPushWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwWordPtrWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWordPtrPushWord = class(TkwWordPtrWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwWordPtrPushWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwWordPtrPushWord

procedure TkwWordPtrPushWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F37AEBB0209_var*
//#UC END# *4DAEEDE10285_4F37AEBB0209_var*
begin
//#UC START# *4DAEEDE10285_4F37AEBB0209_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(f_Word));
//#UC END# *4DAEEDE10285_4F37AEBB0209_impl*
end;//TkwWordPtrPushWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwWordPtrPushWord
 TkwWordPtrPushWord.RegisterClass;
{$IfEnd} //not NoScripts

end.