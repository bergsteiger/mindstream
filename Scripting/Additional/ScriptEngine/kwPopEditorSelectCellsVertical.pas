unit kwPopEditorSelectCellsVertical;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSelectCellsVertical.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectCellsVertical
//
// *Формат:* aStartCell aStartRow aFinshCell aFinishRow anEditorControl
// pop:editor:SelectCellsVertical
// *Описание:* Выделяет диапазон ячеек с помощью мыши начиная от начальной (aStartCell, aRowCell)
// до конечной (aFinishCell, aFinishRow). Курсор должен уже находится в таблице. Положение курсора
// в таблице не имеет значения. Параметры aStartCell aStartRow aFinshCell aFinishRow - Integer
// *Пример:*
// {code}
// 0 0 2 2 focused:control:push pop:editor:SelectCellsVertical
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
 TkwPopEditorSelectCellsVertical = {final scriptword} class(TkwSelectCellsWord)
  {* *Формат:* aStartCell aStartRow aFinshCell aFinishRow anEditorControl pop:editor:SelectCellsVertical
*Описание:* Выделяет диапазон ячеек с помощью мыши начиная от начальной (aStartCell, aRowCell) до конечной (aFinishCell, aFinishRow). Курсор должен уже находится в таблице. Положение курсора в таблице не имеет значения. Параметры aStartCell aStartRow aFinshCell aFinishRow - Integer
*Пример:*
[code] 
0 0 2 2 focused:control:push pop:editor:SelectCellsVertical
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
 end;//TkwPopEditorSelectCellsVertical
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorSelectCellsVertical

function TkwPopEditorSelectCellsVertical.IsVertical: Boolean;
//#UC START# *4F6042D20081_4F6044140356_var*
//#UC END# *4F6042D20081_4F6044140356_var*
begin
//#UC START# *4F6042D20081_4F6044140356_impl*
 Result := True;
//#UC END# *4F6042D20081_4F6044140356_impl*
end;//TkwPopEditorSelectCellsVertical.IsVertical

class function TkwPopEditorSelectCellsVertical.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectCellsVertical';
end;//TkwPopEditorSelectCellsVertical.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectCellsVertical
 TkwPopEditorSelectCellsVertical.RegisterInEngine;
{$IfEnd} //not NoScripts

end.