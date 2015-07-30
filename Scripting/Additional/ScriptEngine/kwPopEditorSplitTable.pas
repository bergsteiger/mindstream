unit kwPopEditorSplitTable;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSplitTable.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SplitTable
//
// editor:SplitTable
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
 TkwPopEditorSplitTable = {scriptword} class(TkwEditorWithToolsFromStackWord)
  {* editor:SplitTable }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSplitTable
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evEditorInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSplitTable

procedure TkwPopEditorSplitTable.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F1FD328000F_var*
var
 l_Table: IedTable;
//#UC END# *4F4DD89102E4_4F1FD328000F_var*
begin
//#UC START# *4F4DD89102E4_4F1FD328000F_impl*
 l_Table := anEditor.Range.Table;
 if l_Table = nil then
  Assert(False, 'Курсор не находится в таблице.')
 else
  aCtx.rCaller.Check(l_Table.Split(anEditor.TextSource.Indicator), 'Разделение таблицы закончелось неудачей.')
//#UC END# *4F4DD89102E4_4F1FD328000F_impl*
end;//TkwPopEditorSplitTable.DoEditorWithTools

class function TkwPopEditorSplitTable.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SplitTable';
end;//TkwPopEditorSplitTable.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SplitTable
 TkwPopEditorSplitTable.RegisterInEngine;
{$IfEnd} //not NoScripts

end.