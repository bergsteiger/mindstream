unit kwPureDir;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwPureDir.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::PureDir
//
// RenameFile - очищает директорию.
// *Формат:* aDirName PureDir
// * aDirName  - имя директории.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TkwPureDir = {final scriptword} class(TtfwRegisterableWord)
  {* RenameFile - очищает директорию.
*Формат:* aDirName PureDir
* aDirName  - имя директории. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPureDir
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3FileUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPureDir

procedure TkwPureDir.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5124682C039E_var*
//#UC END# *4DAEEDE10285_5124682C039E_var*
begin
//#UC START# *4DAEEDE10285_5124682C039E_impl*
 if aCtx.rEngine.IsTopString then
  PureDir(aCtx.rEngine.PopDelphiString)
 else
  Assert(False, 'Не задано имя директории!');
//#UC END# *4DAEEDE10285_5124682C039E_impl*
end;//TkwPureDir.DoDoIt

class function TkwPureDir.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'PureDir';
end;//TkwPureDir.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация PureDir
 TkwPureDir.RegisterInEngine;
{$IfEnd} //not NoScripts

end.