unit kwPureDir;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPureDir.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::PureDir
//
// RenameFile - очищает директорию.
// *Формат:* aDirName PureDir
// * aDirName  - имя директории.
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
 TkwPureDir = {final} class(_tfwAutoregisteringWord_)
  {* RenameFile - очищает директорию.
*Формат:* aDirName PureDir
* aDirName  - имя директории. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPureDir
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3FileUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPureDir;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.