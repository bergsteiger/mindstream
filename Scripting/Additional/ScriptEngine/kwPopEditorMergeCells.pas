unit kwPopEditorMergeCells;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorMergeCells.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_MergeCells
//
// *Формат:* aMergeType anEditorControl pop:editor:MergeCells
// *Описание:* Объединяет выделенные ячейки таблицы. Параметры: aMergeType - Integer - константы
// см. ArchiSystem.script (ed_maAll , ed_maHorz и ed_maVert).
// *Пример:*
// {code}
// (ed_maAll focused:control:push pop:editor:MergeCells
// {code}
// *Результат:* Объединяет выделенный диапазон ячеек.
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
 TkwPopEditorMergeCells = {final scriptword} class(TkwEditorWithToolsFromStackWord)
  {* *Формат:* aMergeType anEditorControl pop:editor:MergeCells
*Описание:* Объединяет выделенные ячейки таблицы. Параметры: aMergeType - Integer - константы см. ArchiSystem.script (ed_maAll , ed_maHorz и ed_maVert).
*Пример:*
[code] 
(ed_maAll focused:control:push pop:editor:MergeCells
[code] 
*Результат:* Объединяет выделенный диапазон ячеек. }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorMergeCells
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evEditorInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorMergeCells

procedure TkwPopEditorMergeCells.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F759F1803AF_var*
var
 l_Table     : IedTable;
 l_Range     : IedRange;
 l_Cells     : IedCells;
 l_MergeType : Integer;
//#UC END# *4F4DD89102E4_4F759F1803AF_var*
begin
//#UC START# *4F4DD89102E4_4F759F1803AF_impl*
 l_Range := anEditor.Range;
 if l_Range <> nil then
 begin
  l_Table := l_Range.Table;
  if l_Table <> nil then
   l_Cells := l_Table.Cells
  else
   Assert(False, 'Не удалось получить таблицу!'); 
  if aCtx.rEngine.IsTopInt then
   l_MergeType := aCtx.rEngine.PopInt
  else
   Assert(False, 'Не задан тип объединения'); 
  if l_Cells <> nil then
   l_Cells.Merge(TedMergeAlgorythm(l_MergeType))
  else
   Assert(False, 'Не удалось получить диапазон ячеек!')
 end // if l_Range <> nil then
 else
  Assert(False, 'Не удалось получить выделение.'); 
//#UC END# *4F4DD89102E4_4F759F1803AF_impl*
end;//TkwPopEditorMergeCells.DoEditorWithTools

class function TkwPopEditorMergeCells.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:MergeCells';
end;//TkwPopEditorMergeCells.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_MergeCells
 TkwPopEditorMergeCells.RegisterInEngine;
{$IfEnd} //not NoScripts

end.