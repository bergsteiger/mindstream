unit kwPopEditorScrollLineDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorScrollLineDown.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ScrollLineDown
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
 TkwPopEditorScrollLineDown = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorScrollLineDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorScrollLineDown

procedure TkwPopEditorScrollLineDown.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E8D46FA0168_var*
//#UC END# *4F4CB81200CA_4E8D46FA0168_var*
begin
//#UC START# *4F4CB81200CA_4E8D46FA0168_impl*
 anEditor.View.Scroller[True].LineDown(1);
//#UC END# *4F4CB81200CA_4E8D46FA0168_impl*
end;//TkwPopEditorScrollLineDown.DoWithEditor

class function TkwPopEditorScrollLineDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ScrollLineDown';
end;//TkwPopEditorScrollLineDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ScrollLineDown
 TkwPopEditorScrollLineDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.