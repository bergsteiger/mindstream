unit kwPopEditorScrollLineUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorScrollLineUp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ScrollLineUp
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
 TkwPopEditorScrollLineUp = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorScrollLineUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorScrollLineUp

procedure TkwPopEditorScrollLineUp.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E8D46CD03AF_var*
//#UC END# *4F4CB81200CA_4E8D46CD03AF_var*
begin
//#UC START# *4F4CB81200CA_4E8D46CD03AF_impl*
 anEditor.View.Scroller[True].LineUp(1);
//#UC END# *4F4CB81200CA_4E8D46CD03AF_impl*
end;//TkwPopEditorScrollLineUp.DoWithEditor

class function TkwPopEditorScrollLineUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ScrollLineUp';
end;//TkwPopEditorScrollLineUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ScrollLineUp
 TkwPopEditorScrollLineUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.