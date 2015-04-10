unit kwFileOpenRead;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFileOpenRead.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::file_OpenRead
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
 TkwFileOpenRead = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFileOpenRead
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

type _Instance_R_ = TkwFileOpenRead;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFileOpenRead

procedure TkwFileOpenRead.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD7F8009C_var*
//#UC END# *4DAEEDE10285_4F4FD7F8009C_var*
begin
//#UC START# *4DAEEDE10285_4F4FD7F8009C_impl*
 aCtx.rEngine.PushFile(TtfwFile.MakeRead(aCtx.rCaller.ResolveInputFilePath(aCtx.rEngine.PopDelphiString)));
//#UC END# *4DAEEDE10285_4F4FD7F8009C_impl*
end;//TkwFileOpenRead.DoDoIt

class function TkwFileOpenRead.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'file:OpenRead';
end;//TkwFileOpenRead.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.