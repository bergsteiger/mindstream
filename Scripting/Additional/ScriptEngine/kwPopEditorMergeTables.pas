unit kwPopEditorMergeTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorMergeTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_MergeTables
//
// editor:MergeTables
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
 TkwPopEditorMergeTables = class(_kwEditorWithToolsFromStackWord_)
  {* editor:MergeTables }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorMergeTables
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

type _Instance_R_ = TkwPopEditorMergeTables;

{$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.