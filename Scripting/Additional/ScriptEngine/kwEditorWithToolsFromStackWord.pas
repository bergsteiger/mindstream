unit kwEditorWithToolsFromStackWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEditorWithToolsFromStackWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwEditorWithToolsFromStackWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evCustomEditor,
  tfwScriptingInterfaces,
  kwEditorFromStackWord,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwEditorWithToolsFromStackWord = {abstract} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); virtual; abstract;
 end;//TkwEditorWithToolsFromStackWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwEditorWithToolsFromStackWord

procedure TkwEditorWithToolsFromStackWord.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4DD85E0165_var*
//#UC END# *4F4CB81200CA_4F4DD85E0165_var*
begin
//#UC START# *4F4CB81200CA_4F4DD85E0165_impl*
 DoEditorWithTools(aCtx, anEditor as TevCustomEditor);
//#UC END# *4F4CB81200CA_4F4DD85E0165_impl*
end;//TkwEditorWithToolsFromStackWord.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEditorWithToolsFromStackWord
 TkwEditorWithToolsFromStackWord.RegisterClass;
{$IfEnd} //not NoScripts

end.