unit kwPopEditorSplitCell;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSplitCell.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SplitCell
//
// *Формат:* aOrientation anEditorControl pop:editor:SplitCell
// *Описание:* Разделяет ячейку таблицы. Курсор должен уже находиться в ячейке. Параметры
// aOrientation - Boolean (True - разбивать по вертикали, False - разбивать по горизонтали).
// *Пример:*
// {code}
// True focused:control:push pop:editor:SplitCell
// {code}
// *Результат:* Разбивает ячейку, в которой установлен курсор, по верикали.
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
 TkwPopEditorSplitCell = {final scriptword} class(TkwEditorWithToolsFromStackWord)
  {* *Формат:* aOrientation anEditorControl pop:editor:SplitCell
*Описание:* Разделяет ячейку таблицы. Курсор должен уже находиться в ячейке. Параметры aOrientation - Boolean (True - разбивать по вертикали, False - разбивать по горизонтали).
*Пример:*
[code] 
True focused:control:push pop:editor:SplitCell
[code] 
*Результат:* Разбивает ячейку, в которой установлен курсор, по верикали. }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSplitCell
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  evEditorInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSplitCell

procedure TkwPopEditorSplitCell.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_5028F0180013_var*
var
 l_Cell : IedCell;
 l_Table: IedTable;
//#UC END# *4F4DD89102E4_5028F0180013_var*
begin
//#UC START# *4F4DD89102E4_5028F0180013_impl*
 if aCtx.rEngine.IsTopBool then
 begin
  l_Table := anEditor.Range.Table;
  if (l_Table <> nil) then
  begin
   l_Cell := l_Table.Cell;
   if (l_Cell <> nil) then
    if aCtx.rEngine.PopBool then
     l_Cell.Split(ev_orVertical)
    else
     l_Cell.Split(ev_orHorizontal);
  end;//l_Table <> nil
 end // if aCtx.rEngine.IsTopBool then
 else
  Assert(False, 'Не задано как делить!');
//#UC END# *4F4DD89102E4_5028F0180013_impl*
end;//TkwPopEditorSplitCell.DoEditorWithTools

class function TkwPopEditorSplitCell.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SplitCell';
end;//TkwPopEditorSplitCell.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SplitCell
 TkwPopEditorSplitCell.RegisterInEngine;
{$IfEnd} //not NoScripts

end.