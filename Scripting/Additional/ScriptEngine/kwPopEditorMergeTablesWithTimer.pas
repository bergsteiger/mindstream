unit kwPopEditorMergeTablesWithTimer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorMergeTablesWithTimer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_MergeTablesWithTimer
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
 TkwPopEditorMergeTablesWithTimer = {final} class(_kwEditorWithToolsFromStackWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorMergeTablesWithTimer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evEditorInterfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorMergeTablesWithTimer;

{$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.