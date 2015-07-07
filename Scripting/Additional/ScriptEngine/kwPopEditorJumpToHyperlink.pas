unit kwPopEditorJumpToHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorJumpToHyperlink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_JumpToHyperlink
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
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 TkwPopEditorJumpToHyperlink = {final} class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorJumpToHyperlink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevNavigation,
  afwNavigation,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorJumpToHyperlink;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorJumpToHyperlink

procedure TkwPopEditorJumpToHyperlink.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F75BC5F03A0_var*
var
 l_Hyperlink : IevHyperlink;
//#UC END# *4F4CB81200CA_4F75BC5F03A0_var*
begin
//#UC START# *4F4CB81200CA_4F75BC5F03A0_impl*
 if Supports(anEditor.Selection, IevHyperlink, l_Hyperlink) then
  if IevMonikerSink(anEditor).JumpTo([], l_Hyperlink As IevMoniker) then
   Exit;
 RunnerAssert(false, 'Не удалось перейти по гиперссылке', aCtx);
//#UC END# *4F4CB81200CA_4F75BC5F03A0_impl*
end;//TkwPopEditorJumpToHyperlink.DoWithEditor

class function TkwPopEditorJumpToHyperlink.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:JumpToHyperlink';
end;//TkwPopEditorJumpToHyperlink.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.