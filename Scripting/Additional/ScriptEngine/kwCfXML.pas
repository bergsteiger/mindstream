unit kwCFXML;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCFXML.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::CF_XML
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
 TkwCFXML = {final} class(_tfwClipboardFormatWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCFXML
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCFXML;

{$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}

// start class TkwCFXML

procedure TkwCFXML.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FF436960135_var*
//#UC END# *4DAEEDE10285_4FF436960135_var*
begin
//#UC START# *4DAEEDE10285_4FF436960135_impl*
 aCtx.rEngine.PushInt(CF_XML);
//#UC END# *4DAEEDE10285_4FF436960135_impl*
end;//TkwCFXML.DoDoIt

class function TkwCFXML.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CF_XML';
end;//TkwCFXML.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwClipboardFormatWord.imp.pas}
{$IfEnd} //not NoScripts

end.