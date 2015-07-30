unit kwPopEditorDocumentTailVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorDocumentTailVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_DocumentTailVisible
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
 TkwPopEditorDocumentTailVisible = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorDocumentTailVisible
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorDocumentTailVisible

procedure TkwPopEditorDocumentTailVisible.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_509CAB9A0135_var*
//#UC END# *4F4CB81200CA_509CAB9A0135_var*
begin
//#UC START# *4F4CB81200CA_509CAB9A0135_impl*
 aCtx.rEngine.PushBool(anEditor.View.IsDocumentTailVisible);
//#UC END# *4F4CB81200CA_509CAB9A0135_impl*
end;//TkwPopEditorDocumentTailVisible.DoWithEditor

class function TkwPopEditorDocumentTailVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:DocumentTailVisible';
end;//TkwPopEditorDocumentTailVisible.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_DocumentTailVisible
 TkwPopEditorDocumentTailVisible.RegisterInEngine;
{$IfEnd} //not NoScripts

end.