unit kwDeleteFilesByMask;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDeleteFilesByMask.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FileProcessing::DeleteFilesByMask
//
// DeleteFilesByMask - очищает директорию.
// *Формат:* aMask aDirName DeleteFilesByMask
// * aDirName  - имя директории.
// * aMask - маска, по которой отбираются файлы.
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
 TkwDeleteFilesByMask = {final} class(_tfwAutoregisteringWord_)
  {* DeleteFilesByMask - очищает директорию.
*Формат:* aMask aDirName DeleteFilesByMask
* aDirName  - имя директории.
* aMask - маска, по которой отбираются файлы. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDeleteFilesByMask
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

type _Instance_R_ = TkwDeleteFilesByMask;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
   RunnerAssert(False, 'Не задана маска файлов для удаления!', aCtx);
 end
 else
  RunnerAssert(False, 'Не задана папка для удаления файлов!', aCtx);
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.