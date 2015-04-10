unit kwFileWriteWStrLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileWriteWStrLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_WriteWStrLn
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
 TkwFileWriteWStrLn = {final} class(_tfwFileWord_)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileWriteWStrLn
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

type _Instance_R_ = TkwFileWriteWStrLn;

{$Include ..\ScriptEngine\tfwFileWord.imp.pas}

// start class TkwFileWriteWStrLn

procedure TkwFileWriteWStrLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FE2D70193_var*
//#UC END# *4F5084CF033E_4F4FE2D70193_var*
begin
//#UC START# *4F5084CF033E_4F4FE2D70193_impl*
 aFile.WriteWStrLn(aCtx.rEngine.PopWStr);
//#UC END# *4F5084CF033E_4F4FE2D70193_impl*
end;//TkwFileWriteWStrLn.DoFile

class function TkwFileWriteWStrLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:WriteWStrLn';
end;//TkwFileWriteWStrLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
{$IfEnd} //not NoScripts

end.