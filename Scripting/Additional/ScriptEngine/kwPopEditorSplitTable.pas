unit kwPopEditorSplitTable;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSplitTable.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SplitTable
//
// editor:SplitTable
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
 TkwPopEditorSplitTable = class(_kwEditorWithToolsFromStackWord_)
  {* editor:SplitTable }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSplitTable
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

type _Instance_R_ = TkwPopEditorSplitTable;

{$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.