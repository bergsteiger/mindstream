unit kwPopEditorGetAllowRubberTables;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetAllowRubberTables.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetAllowRubberTables
//
// editor:GetAllowRubberTables
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
 TkwPopEditorGetAllowRubberTables = {scriptword} class(TkwEditorFromStackWord)
  {* editor:GetAllowRubberTables }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetAllowRubberTables
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetAllowRubberTables

procedure TkwPopEditorGetAllowRubberTables.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F1E6F18032A_var*
//#UC END# *4F4CB81200CA_4F1E6F18032A_var*
begin
//#UC START# *4F4CB81200CA_4F1E6F18032A_impl*
 aCtx.rEngine.PushInt(Ord(anEditor.AllowRubberTables));
//#UC END# *4F4CB81200CA_4F1E6F18032A_impl*
end;//TkwPopEditorGetAllowRubberTables.DoWithEditor

class function TkwPopEditorGetAllowRubberTables.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetAllowRubberTables';
end;//TkwPopEditorGetAllowRubberTables.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetAllowRubberTables
 TkwPopEditorGetAllowRubberTables.RegisterInEngine;
{$IfEnd} //not NoScripts

end.