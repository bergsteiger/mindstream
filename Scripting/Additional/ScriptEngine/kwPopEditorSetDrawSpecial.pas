unit kwPopEditorSetDrawSpecial;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSetDrawSpecial.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SetDrawSpecial
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
 TkwPopEditorSetDrawSpecial = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetDrawSpecial
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorSetDrawSpecial

procedure TkwPopEditorSetDrawSpecial.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50AC80B90149_var*
//#UC END# *4F4CB81200CA_50AC80B90149_var*
begin
//#UC START# *4F4CB81200CA_50AC80B90149_impl*
 if aCtx.rEngine.IsTopBool then
  anEditor.DrawSpecial := aCtx.rEngine.PopBool
 else
  RunnerError('Не задан флаг для DrawSpecial', aCtx)
//#UC END# *4F4CB81200CA_50AC80B90149_impl*
end;//TkwPopEditorSetDrawSpecial.DoWithEditor

class function TkwPopEditorSetDrawSpecial.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetDrawSpecial';
end;//TkwPopEditorSetDrawSpecial.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SetDrawSpecial
 TkwPopEditorSetDrawSpecial.RegisterInEngine;
{$IfEnd} //not NoScripts

end.