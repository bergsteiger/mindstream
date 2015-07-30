unit kwPopEditorSetDrawLines;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSetDrawLines.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SetDrawLines
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
 TkwPopEditorSetDrawLines = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetDrawLines
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorSetDrawLines

procedure TkwPopEditorSetDrawLines.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F3270710357_var*
//#UC END# *4F4CB81200CA_4F3270710357_var*
begin
//#UC START# *4F4CB81200CA_4F3270710357_impl*
  RunnerAssert(aCtx.rEngine.IsTopBool, 'Не задан флаг для DrawLines!', aCtx);
  anEditor.Selection.DrawLines := aCtx.rEngine.PopBool
//#UC END# *4F4CB81200CA_4F3270710357_impl*
end;//TkwPopEditorSetDrawLines.DoWithEditor

class function TkwPopEditorSetDrawLines.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetDrawLines';
end;//TkwPopEditorSetDrawLines.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SetDrawLines
 TkwPopEditorSetDrawLines.RegisterInEngine;
{$IfEnd} //not NoScripts

end.