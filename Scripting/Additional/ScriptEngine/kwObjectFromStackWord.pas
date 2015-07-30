unit kwObjectFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Автор: Люлин А.В.
// Модуль: "kwObjectFromStackWord.pas"
// Начат: 26.01.2012 14:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTL bindings::TkwObjectFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwObjectFromStackWord = {abstract} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); virtual; abstract;
 end;//TkwObjectFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwObjectFromStackWord

procedure TkwObjectFromStackWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F212BA80137_var*
//#UC END# *4DAEEDE10285_4F212BA80137_var*
begin
//#UC START# *4DAEEDE10285_4F212BA80137_impl*
 DoObject(aCtx.rEngine.PopObj, aCtx);
//#UC END# *4DAEEDE10285_4F212BA80137_impl*
end;//TkwObjectFromStackWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwObjectFromStackWord
 TkwObjectFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.