unit kwPopEditorDeleteRow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorDeleteRow.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_DeleteRow
//
// editor:DeleteRow
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorWithToolsFromStackWord,
  evCustomEditor,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorDeleteRow = {scriptword} class(TkwEditorWithToolsFromStackWord)
  {* editor:DeleteRow }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorDeleteRow
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorDeleteRow

procedure TkwPopEditorDeleteRow.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4ECDF7D402D5_var*
//#UC END# *4F4DD89102E4_4ECDF7D402D5_var*
begin
//#UC START# *4F4DD89102E4_4ECDF7D402D5_impl*
 anEditor.DeleteRow;
//#UC END# *4F4DD89102E4_4ECDF7D402D5_impl*
end;//TkwPopEditorDeleteRow.DoEditorWithTools

class function TkwPopEditorDeleteRow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:DeleteRow';
end;//TkwPopEditorDeleteRow.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_DeleteRow
 TkwPopEditorDeleteRow.RegisterInEngine;
{$IfEnd} //not NoScripts

end.