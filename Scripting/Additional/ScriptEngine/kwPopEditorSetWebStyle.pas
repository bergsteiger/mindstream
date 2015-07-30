unit kwPopEditorSetWebStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSetWebStyle.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SetWebStyle
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
 TkwPopEditorSetWebStyle = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetWebStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorSetWebStyle

procedure TkwPopEditorSetWebStyle.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50AC938D0201_var*
//#UC END# *4F4CB81200CA_50AC938D0201_var*
begin
//#UC START# *4F4CB81200CA_50AC938D0201_impl*
 if aCtx.rEngine.IsTopBool then
  anEditor.WebStyle := aCtx.rEngine.PopBool
 else
  RunnerError('Не задано значение флага WebStyle!', aCtx);
//#UC END# *4F4CB81200CA_50AC938D0201_impl*
end;//TkwPopEditorSetWebStyle.DoWithEditor

class function TkwPopEditorSetWebStyle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetWebStyle';
end;//TkwPopEditorSetWebStyle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SetWebStyle
 TkwPopEditorSetWebStyle.RegisterInEngine;
{$IfEnd} //not NoScripts

end.