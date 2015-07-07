unit kwFileWriteWStr;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileWriteWStr.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_WriteWStr
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
 TkwFileWriteWStr = {final} class(_tfwFileWord_)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteWStr
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

type _Instance_R_ = TkwFileWriteWStr;

{$Include ..\ScriptEngine\tfwFileWord.imp.pas}

// start class TkwFileWriteWStr

procedure TkwFileWriteWStr.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FE2FE0284_var*
//#UC END# *4F5084CF033E_4F4FE2FE0284_var*
begin
//#UC START# *4F5084CF033E_4F4FE2FE0284_impl*
 if aCtx.rEngine.IsTopString then
  aFile.WriteWStr(l3PCharLen(aCtx.rEngine.PopString))
 else
  aFile.WriteWStr(aCtx.rEngine.PopWStr);
//#UC END# *4F5084CF033E_4F4FE2FE0284_impl*
end;//TkwFileWriteWStr.DoFile

class function TkwFileWriteWStr.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteWStr';
end;//TkwFileWriteWStr.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
{$IfEnd} //not NoScripts

end.