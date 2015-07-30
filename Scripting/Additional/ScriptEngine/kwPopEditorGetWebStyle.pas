unit kwPopEditorGetWebStyle;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetWebStyle.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetWebStyle
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
 TkwPopEditorGetWebStyle = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetWebStyle
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetWebStyle

procedure TkwPopEditorGetWebStyle.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50AC93F30052_var*
//#UC END# *4F4CB81200CA_50AC93F30052_var*
begin
//#UC START# *4F4CB81200CA_50AC93F30052_impl*
 aCtx.rEngine.PushBool(anEditor.WebStyle)
//#UC END# *4F4CB81200CA_50AC93F30052_impl*
end;//TkwPopEditorGetWebStyle.DoWithEditor

class function TkwPopEditorGetWebStyle.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetWebStyle';
end;//TkwPopEditorGetWebStyle.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetWebStyle
 TkwPopEditorGetWebStyle.RegisterInEngine;
{$IfEnd} //not NoScripts

end.