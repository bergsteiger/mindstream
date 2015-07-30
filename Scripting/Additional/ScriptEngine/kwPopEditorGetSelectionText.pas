unit kwPopEditorGetSelectionText;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetSelectionText.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetSelectionText
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
 TkwPopEditorGetSelectionText = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetSelectionText
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evParaTools
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorGetSelectionText

procedure TkwPopEditorGetSelectionText.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EAFDEE000EC_var*
//#UC END# *4F4CB81200CA_4EAFDEE000EC_var*
begin
//#UC START# *4F4CB81200CA_4EAFDEE000EC_impl*
 aCtx.rEngine.PushString(EvAsString(anEditor.View.Control.Selection.GetBlock.Data));
//#UC END# *4F4CB81200CA_4EAFDEE000EC_impl*
end;//TkwPopEditorGetSelectionText.DoWithEditor

class function TkwPopEditorGetSelectionText.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetSelectionText';
end;//TkwPopEditorGetSelectionText.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetSelectionText
 TkwPopEditorGetSelectionText.RegisterInEngine;
{$IfEnd} //not NoScripts

end.