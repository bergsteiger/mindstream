unit kwPopEditorGetDrawSpecial;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetDrawSpecial.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetDrawSpecial
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
 TkwPopEditorGetDrawSpecial = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetDrawSpecial
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorGetDrawSpecial

procedure TkwPopEditorGetDrawSpecial.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_50AC81130153_var*
//#UC END# *4F4CB81200CA_50AC81130153_var*
begin
//#UC START# *4F4CB81200CA_50AC81130153_impl*
 aCtx.rEngine.PushBool(anEditor.DrawSpecial);
//#UC END# *4F4CB81200CA_50AC81130153_impl*
end;//TkwPopEditorGetDrawSpecial.DoWithEditor

class function TkwPopEditorGetDrawSpecial.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetDrawSpecial';
end;//TkwPopEditorGetDrawSpecial.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_GetDrawSpecial
 TkwPopEditorGetDrawSpecial.RegisterInEngine;
{$IfEnd} //not NoScripts

end.