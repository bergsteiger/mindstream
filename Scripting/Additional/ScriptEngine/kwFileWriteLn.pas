unit kwFileWriteLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileWriteLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_WriteLn
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
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
 TkwFileWriteLn = {final} class(_tfwFileWord_)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteLn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3String,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFileWriteLn;

{$Include ..\ScriptEngine\tfwFileWord.imp.pas}

// start class TkwFileWriteLn

procedure TkwFileWriteLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FD9100262_var*
//#UC END# *4F5084CF033E_4F4FD9100262_var*
begin
//#UC START# *4F5084CF033E_4F4FD9100262_impl*
 aFile.WriteLn(aCtx.rEngine.PopString);
//#UC END# *4F5084CF033E_4F4FD9100262_impl*
end;//TkwFileWriteLn.DoFile

class function TkwFileWriteLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteLn';
end;//TkwFileWriteLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
{$IfEnd} //not NoScripts

end.