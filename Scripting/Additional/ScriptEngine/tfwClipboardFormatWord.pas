unit tfwClipboardFormatWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "tfwClipboardFormatWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::SchemaWords::TtfwClipboardFormatWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evTypes,
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwClipboardFormatWord = {abstract} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   function GetFormat: TevFormat; virtual; abstract;
 end;//TtfwClipboardFormatWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwClipboardFormatWord

procedure TtfwClipboardFormatWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5052EB370166_var*
//#UC END# *4DAEEDE10285_5052EB370166_var*
begin
//#UC START# *4DAEEDE10285_5052EB370166_impl*
 aCtx.rEngine.PushInt(GetFormat);
//#UC END# *4DAEEDE10285_5052EB370166_impl*
end;//TtfwClipboardFormatWord.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwClipboardFormatWord
 TtfwClipboardFormatWord.RegisterClass;
{$IfEnd} //not NoScripts

end.