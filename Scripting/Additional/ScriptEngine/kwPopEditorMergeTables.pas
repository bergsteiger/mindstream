unit kwPopEditorMergeTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorMergeTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_MergeTables
//
// editor:MergeTables
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
 TkwPopEditorMergeTables = {scriptword} class(TkwEditorWithToolsFromStackWord)
  {* editor:MergeTables }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorMergeTables
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evEditorInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorMergeTables

procedure TkwPopEditorMergeTables.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F1FDAEA032E_var*
var
 l_Table: IedTable;
//#UC END# *4F4DD89102E4_4F1FDAEA032E_var*
begin
//#UC START# *4F4DD89102E4_4F1FDAEA032E_impl*
 l_Table := anEditor.Range.Table;
 if l_Table = nil then
  Assert(False, 'Курсор не находится в таблице.')
 else
  aCtx.rCaller.Check(l_Table.Merge(anEditor.TextSource.Indicator), 'Объединение таблицы закончелось неудачей.')
//#UC END# *4F4DD89102E4_4F1FDAEA032E_impl*
end;//TkwPopEditorMergeTables.DoEditorWithTools

class function TkwPopEditorMergeTables.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:MergeTables';
end;//TkwPopEditorMergeTables.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_MergeTables
 TkwPopEditorMergeTables.RegisterInEngine;
{$IfEnd} //not NoScripts

end.