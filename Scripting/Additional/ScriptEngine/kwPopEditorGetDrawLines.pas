unit kwPopEditorGetDrawLines;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetDrawLines.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetDrawLines
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
 TkwPopEditorGetDrawLines = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetDrawLines
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetDrawLines

procedure TkwPopEditorGetDrawLines.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F3270D1009E_var*
//#UC END# *4F4CB81200CA_4F3270D1009E_var*
begin
//#UC START# *4F4CB81200CA_4F3270D1009E_impl*
 aCtx.rEngine.PushBool(anEditor.Selection.DrawLines);
//#UC END# *4F4CB81200CA_4F3270D1009E_impl*
end;//TkwPopEditorGetDrawLines.DoWithEditor

class function TkwPopEditorGetDrawLines.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetDrawLines';
end;//TkwPopEditorGetDrawLines.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetDrawLines
 TkwPopEditorGetDrawLines.RegisterInEngine;
{$IfEnd} //not NoScripts

end.