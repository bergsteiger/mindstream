unit kwPopEditorGetLMargin;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetLMargin.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetLMargin
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
 TkwPopEditorGetLMargin = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetLMargin
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetLMargin

procedure TkwPopEditorGetLMargin.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_5141D01300D2_var*
//#UC END# *4F4CB81200CA_5141D01300D2_var*
begin
//#UC START# *4F4CB81200CA_5141D01300D2_impl*
 aCtx.rEngine.PushInt(anEditor.LMargin);
//#UC END# *4F4CB81200CA_5141D01300D2_impl*
end;//TkwPopEditorGetLMargin.DoWithEditor

class function TkwPopEditorGetLMargin.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetLMargin';
end;//TkwPopEditorGetLMargin.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetLMargin
 TkwPopEditorGetLMargin.RegisterInEngine;
{$IfEnd} //not NoScripts

end.