unit kwPopEditorSelectWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSelectWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectWord
//
// Выделить слово, на котором установлен курсор в редакторе.
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
 TkwPopEditorSelectWord = {final scriptword} class(TkwEditorFromStackWord)
  {* Выделить слово, на котором установлен курсор в редакторе. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorSelectWord

procedure TkwPopEditorSelectWord.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_52F34CCE025E_var*
//#UC END# *4F4CB81200CA_52F34CCE025E_var*
begin
//#UC START# *4F4CB81200CA_52F34CCE025E_impl*
 anEditor.Select(ev_stWord);
//#UC END# *4F4CB81200CA_52F34CCE025E_impl*
end;//TkwPopEditorSelectWord.DoWithEditor

class function TkwPopEditorSelectWord.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectWord';
end;//TkwPopEditorSelectWord.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectWord
 TkwPopEditorSelectWord.RegisterInEngine;
{$IfEnd} //not NoScripts

end.