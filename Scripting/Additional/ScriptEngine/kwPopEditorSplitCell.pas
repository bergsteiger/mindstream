unit kwPopEditorSplitCell;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSplitCell.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SplitCell
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
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evCustomEditor,
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
 TkwPopEditorSplitCell = {final} class(_kwEditorWithToolsFromStackWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSplitCell
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  evEditorInterfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorSplitCell;

{$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.