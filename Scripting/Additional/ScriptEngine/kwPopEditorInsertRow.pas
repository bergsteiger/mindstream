unit kwPopEditorInsertRow;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorInsertRow.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_InsertRow
//
// editor:InsertRow
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
 TkwPopEditorInsertRow = {scriptword} class(TkwEditorWithToolsFromStackWord)
  {* editor:InsertRow }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorInsertRow
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorInsertRow

procedure TkwPopEditorInsertRow.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4ECDF79002CD_var*
//#UC END# *4F4DD89102E4_4ECDF79002CD_var*
begin
//#UC START# *4F4DD89102E4_4ECDF79002CD_impl*
 anEditor.InsertRow;
//#UC END# *4F4DD89102E4_4ECDF79002CD_impl*
end;//TkwPopEditorInsertRow.DoEditorWithTools

class function TkwPopEditorInsertRow.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:InsertRow';
end;//TkwPopEditorInsertRow.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_InsertRow
 TkwPopEditorInsertRow.RegisterInEngine;
{$IfEnd} //not NoScripts

end.