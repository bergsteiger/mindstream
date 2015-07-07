unit kwPopEditorSetAllowRubberTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSetAllowRubberTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SetAllowRubberTables
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
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 TkwPopEditorSetAllowRubberTables = class(_kwEditorFromStackWord_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetAllowRubberTables
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevBase,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorSetAllowRubberTables;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorSetAllowRubberTables

procedure TkwPopEditorSetAllowRubberTables.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F1E6EEA01BF_var*
var
 l_TableType: Integer;
//#UC END# *4F4CB81200CA_4F1E6EEA01BF_var*
begin
//#UC START# *4F4CB81200CA_4F1E6EEA01BF_impl*
 if aCtx.rEngine.IsTopInt then
 begin
  l_TableType := aCtx.rEngine.PopInt;
  anEditor.AllowRubberTables := TnevRubberTablesMode(l_TableType);
 end // if aCtx.rEngine.IsTopInt then
 else
  Assert(False, 'Не задан тип вида таблиц!')
//#UC END# *4F4CB81200CA_4F1E6EEA01BF_impl*
end;//TkwPopEditorSetAllowRubberTables.DoWithEditor

class function TkwPopEditorSetAllowRubberTables.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetAllowRubberTables';
end;//TkwPopEditorSetAllowRubberTables.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.