unit kwPopEditorSetAllowRubberTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSetAllowRubberTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SetAllowRubberTables
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorSetAllowRubberTables = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetAllowRubberTables
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevBase
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация pop_editor_SetAllowRubberTables
 TkwPopEditorSetAllowRubberTables.RegisterInEngine;
{$IfEnd} //not NoScripts

end.