unit kwPopEditorMergeTablesWithTimer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorMergeTablesWithTimer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_MergeTablesWithTimer
//
// *Формат:* anEditorControl pop:editor:MergeTablesWithTimer
// *Описание:* Объединяет таблицы в редакторе. Поведение полностью аналогично команде "Объединить
// таблицы" в Арчи/Эвересте. Является расширением слова {Requestlink:330696438} но с возможностью
// замера времени выполнения.
// *Пример:*
// {code}
// focused:control:push pop:editor:MergeTablesWithTimer
// {code}
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
 TkwPopEditorMergeTablesWithTimer = {final scriptword} class(TkwEditorWithToolsFromStackWord)
  {* *Формат:* anEditorControl pop:editor:MergeTablesWithTimer
*Описание:* Объединяет таблицы в редакторе. Поведение полностью аналогично команде "Объединить таблицы" в Арчи/Эвересте. Является расширением слова [Requestlink:330696438] но с возможностью замера времени выполнения.
*Пример:*
[code] 
focused:control:push pop:editor:MergeTablesWithTimer
[code] }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorMergeTablesWithTimer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evEditorInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorMergeTablesWithTimer

procedure TkwPopEditorMergeTablesWithTimer.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F6ACEB60189_var*
var
 l_Table: IedTable;
//#UC END# *4F4DD89102E4_4F6ACEB60189_var*
begin
//#UC START# *4F4DD89102E4_4F6ACEB60189_impl*
 aCtx.rCaller.StartTimer;
 try
  l_Table := anEditor.Range.Table;
  if l_Table = nil then
   Assert(False, 'Курсор не находится в таблице.')
  else
   aCtx.rCaller.Check(l_Table.Merge(anEditor.TextSource.Indicator), 'Объединение таблицы закончелось неудачей.')
 finally
  aCtx.rCaller.StopTimer('Объединение таблиц', 'Перемещение таблицы', l_Table <> nil);
 end;
//#UC END# *4F4DD89102E4_4F6ACEB60189_impl*
end;//TkwPopEditorMergeTablesWithTimer.DoEditorWithTools

class function TkwPopEditorMergeTablesWithTimer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:MergeTablesWithTimer';
end;//TkwPopEditorMergeTablesWithTimer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_MergeTablesWithTimer
 TkwPopEditorMergeTablesWithTimer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.