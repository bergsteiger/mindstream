unit kwPopEditorSelectCells;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSelectCells.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectCells
//
// *Формат:* aStartCell aStartRow aFinshCell aFinishRow anEditorControl pop:editor:SelectCells
// *Описание:* Выделяет диапазон ячеек с помощью мыши начиная от начальной (aStartCell, aRowCell)
// до конечной (aFinishCell, aFinishRow). Курсор должен уже находится в таблице. Положение курсора
// в таблице не имеет значения. Параметры aStartCell aStartRow aFinshCell aFinishRow - Integer
// *Пример:*
// {code}
// 0 0 2 2 focused:control:push pop:editor:SelectCells
// {code}
// *Результат:* Выделяет диапазон ячеек в таблице от (0, 0) до (2, 2) у текущего редактора.
// *Примечание:* В каждой ячейке должен быть только один параграф, иначе выделение будет
// неправильным.
// *Примечание 2:* Текст в начальной ячейке должен быть выровнен по левому краю. Иначе  появится
// сообщение об ошибке.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwSelectCellsWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorSelectCells = {final scriptword} class(TkwSelectCellsWord)
  {* *Формат:* aStartCell aStartRow aFinshCell aFinishRow anEditorControl pop:editor:SelectCells
*Описание:* Выделяет диапазон ячеек с помощью мыши начиная от начальной (aStartCell, aRowCell) до конечной (aFinishCell, aFinishRow). Курсор должен уже находится в таблице. Положение курсора в таблице не имеет значения. Параметры aStartCell aStartRow aFinshCell aFinishRow - Integer
*Пример:*
[code] 
0 0 2 2 focused:control:push pop:editor:SelectCells
[code] 
*Результат:* Выделяет диапазон ячеек в таблице от (0, 0) до (2, 2) у текущего редактора.
*Примечание:* В каждой ячейке должен быть только один параграф, иначе выделение будет неправильным.
*Примечание 2:* Текст в начальной ячейке должен быть выровнен по левому краю. Иначе  появится сообщение об ошибке. }
 protected
 // realized methods
   function IsVertical: Boolean; override;
     {* При выделении мышь движется сверху вниз. }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectCells
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorSelectCells

function TkwPopEditorSelectCells.IsVertical: Boolean;
//#UC START# *4F6042D20081_4F4DD643008C_var*
//#UC END# *4F6042D20081_4F4DD643008C_var*
begin
//#UC START# *4F6042D20081_4F4DD643008C_impl*
 Result := False;
//#UC END# *4F6042D20081_4F4DD643008C_impl*
end;//TkwPopEditorSelectCells.IsVertical

class function TkwPopEditorSelectCells.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectCells';
end;//TkwPopEditorSelectCells.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectCells
 TkwPopEditorSelectCells.RegisterInEngine;
{$IfEnd} //not NoScripts

end.