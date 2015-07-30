unit kwPopEditorGetLeftIndentDelta;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetLeftIndentDelta.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetLeftIndentDelta
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
 TkwPopEditorGetLeftIndentDelta = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetLeftIndentDelta
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetLeftIndentDelta

procedure TkwPopEditorGetLeftIndentDelta.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50AE54F001B4_var*
//#UC END# *4F4CB81200CA_50AE54F001B4_var*
begin
//#UC START# *4F4CB81200CA_50AE54F001B4_impl*
 aCtx.rEngine.PushInt(anEditor.LeftIndentDelta);
//#UC END# *4F4CB81200CA_50AE54F001B4_impl*
end;//TkwPopEditorGetLeftIndentDelta.DoWithEditor

class function TkwPopEditorGetLeftIndentDelta.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetLeftIndentDelta';
end;//TkwPopEditorGetLeftIndentDelta.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetLeftIndentDelta
 TkwPopEditorGetLeftIndentDelta.RegisterInEngine;
{$IfEnd} //not NoScripts

end.