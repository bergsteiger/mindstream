unit kwFileOpenWrite;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileOpenWrite.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_OpenWrite
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwFileOpenWrite = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileOpenWrite
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwFile,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFileOpenWrite;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFileOpenWrite

procedure TkwFileOpenWrite.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD8250023_var*
//#UC END# *4DAEEDE10285_4F4FD8250023_var*
begin
//#UC START# *4DAEEDE10285_4F4FD8250023_impl*
 aCtx.rEngine.PushFile(TtfwFile.MakeWrite(aCtx.rCaller.ResolveOutputFilePath(aCtx.rEngine.PopDelphiString)));
//#UC END# *4DAEEDE10285_4F4FD8250023_impl*
end;//TkwFileOpenWrite.DoDoIt

class function TkwFileOpenWrite.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:OpenWrite';
end;//TkwFileOpenWrite.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.