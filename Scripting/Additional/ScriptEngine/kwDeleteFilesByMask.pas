unit kwDeleteFilesByMask;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwDeleteFilesByMask.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::FileProcessing::DeleteFilesByMask
//
// DeleteFilesByMask - очищает директорию.
// *Формат:* aMask aDirName DeleteFilesByMask
// * aDirName  - имя директории.
// * aMask - маска, по которой отбираются файлы.
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
 TkwDeleteFilesByMask = {final scriptword} class(TtfwRegisterableWord)
  {* DeleteFilesByMask - очищает директорию.
*Формат:* aMask aDirName DeleteFilesByMask
* aDirName  - имя директории.
* aMask - маска, по которой отбираются файлы. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDeleteFilesByMask
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3FileUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwDeleteFilesByMask

procedure TkwDeleteFilesByMask.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5135F182020A_var*
var
 l_Mask   : AnsiString;
 l_Folder : AnsiString;
//#UC END# *4DAEEDE10285_5135F182020A_var*
begin
//#UC START# *4DAEEDE10285_5135F182020A_impl*
 if aCtx.rEngine.IsTopString then
 begin
  l_Folder := aCtx.rEngine.PopDelphiString;
  if aCtx.rEngine.IsTopString then
  begin
   l_Mask := aCtx.rEngine.PopDelphiString;
   DeleteFilesByMask(l_Folder, l_Mask);
  end // if aCtx.rEngine.IsTopString then
  else
   RunnerError('Не задана маска файлов для удаления!', aCtx);
 end
 else
  RunnerError('Не задана папка для удаления файлов!', aCtx);
//#UC END# *4DAEEDE10285_5135F182020A_impl*
end;//TkwDeleteFilesByMask.DoDoIt

class function TkwDeleteFilesByMask.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DeleteFilesByMask';
end;//TkwDeleteFilesByMask.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация DeleteFilesByMask
 TkwDeleteFilesByMask.RegisterInEngine;
{$IfEnd} //not NoScripts

end.