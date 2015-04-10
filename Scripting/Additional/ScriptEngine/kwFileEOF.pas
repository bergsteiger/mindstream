unit kwFileEOF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileEOF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_EOF
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
 TkwFileEOF = {final} class(_tfwFileWord_)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileEOF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFileEOF;

{$Include ..\ScriptEngine\tfwFileWord.imp.pas}

// start class TkwFileEOF

procedure TkwFileEOF.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F507FED0030_var*
//#UC END# *4F5084CF033E_4F507FED0030_var*
begin
//#UC START# *4F5084CF033E_4F507FED0030_impl*
 aCtx.rEngine.PushBool(aFile.EOF);
//#UC END# *4F5084CF033E_4F507FED0030_impl*
end;//TkwFileEOF.DoFile

class function TkwFileEOF.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:EOF';
end;//TkwFileEOF.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
{$IfEnd} //not NoScripts

end.