unit kwPopEditorSelectColumn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSelectColumn.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectColumn
//
// *Формат:* aColID anEditorControl pop:editor:SelectCells
// *Описание:* Выделяет колонку таблицы. Курсор должен уже находится в таблице. Положение курсора в
// таблице не имеет значения. Параметры aColID - Integer
// *Пример:*
// {code}
// 2 focused:control:push pop:editor:SelectCells
// {code}
// *Результат:* Выделяет вторую колонку.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  nevTools,
  tfwScriptingInterfaces,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwEditorGetTableFromCursor_Parent_ = TkwEditorFromStackWord;
 {$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}
 TkwPopEditorSelectColumn = {final scriptword} class(_kwEditorGetTableFromCursor_)
  {* *Формат:* aColID anEditorControl pop:editor:SelectCells
*Описание:* Выделяет колонку таблицы. Курсор должен уже находится в таблице. Положение курсора в таблице не имеет значения. Параметры aColID - Integer
*Пример:*
[code] 
2 focused:control:push pop:editor:SelectCells
[code] 
*Результат:* Выделяет вторую колонку. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectColumn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evCursorTools,
  Table_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}

// start class TkwPopEditorSelectColumn

procedure TkwPopEditorSelectColumn.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F548EC7007E_var*
var
 l_ColID      : Integer;
 l_TablePoint : InevBasePoint;
//#UC END# *4F4CB81200CA_4F548EC7007E_var*
begin
//#UC START# *4F4CB81200CA_4F548EC7007E_impl*
 l_TablePoint := GetTablePoint(aCtx, anEditor.Selection.Cursor);
 if aCtx.rEngine.IsTopInt then
  l_ColID := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задан номер колонки!'); 
 evSelectTableColumn(anEditor.Selection, l_TablePoint.Obj^.AsPara.AsList, l_ColID);
//#UC END# *4F4CB81200CA_4F548EC7007E_impl*
end;//TkwPopEditorSelectColumn.DoWithEditor

class function TkwPopEditorSelectColumn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectColumn';
end;//TkwPopEditorSelectColumn.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectColumn
 TkwPopEditorSelectColumn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.