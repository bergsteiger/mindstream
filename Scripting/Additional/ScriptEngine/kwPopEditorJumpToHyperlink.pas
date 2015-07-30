unit kwPopEditorJumpToHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorJumpToHyperlink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_JumpToHyperlink
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorJumpToHyperlink = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorJumpToHyperlink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevNavigation,
  afwNavigation,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
 RunnerError('Не удалось перейти по гиперссылке', aCtx);
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
// Регистрация pop_editor_JumpToHyperlink
 TkwPopEditorJumpToHyperlink.RegisterInEngine;
{$IfEnd} //not NoScripts

end.