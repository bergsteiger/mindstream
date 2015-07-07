unit kwFileReadWStrLn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileReadWStrLn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_ReadWStrLn
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
 TkwFileReadWStrLn = {final} class(_tfwFileWord_)
 protected
 // realized methods
   procedure DoFile(const aFile: ItfwFile;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileReadWStrLn
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

type _Instance_R_ = TkwFileReadWStrLn;

{$Include ..\ScriptEngine\tfwFileWord.imp.pas}

// start class TkwFileReadWStrLn

procedure TkwFileReadWStrLn.DoFile(const aFile: ItfwFile;
  const aCtx: TtfwContext);
//#UC START# *4F5084CF033E_4F4FE2B70138_var*
//#UC END# *4F5084CF033E_4F4FE2B70138_var*
begin
//#UC START# *4F5084CF033E_4F4FE2B70138_impl*
 aCtx.rEngine.PushWStr(aFile.ReadWStrLn);
//#UC END# *4F5084CF033E_4F4FE2B70138_impl*
end;//TkwFileReadWStrLn.DoFile

class function TkwFileReadWStrLn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:ReadWStrLn';
end;//TkwFileReadWStrLn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwFileWord.imp.pas}
{$IfEnd} //not NoScripts

end.