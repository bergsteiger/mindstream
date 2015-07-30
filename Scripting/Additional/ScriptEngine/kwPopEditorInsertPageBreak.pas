unit kwPopEditorInsertPageBreak;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorInsertPageBreak.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_InsertPageBreak
//
// editor:InsertPageBreak
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorWithToolsFromStackWord,
  evCustomEditor,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorInsertPageBreak = {scriptword} class(TkwEditorWithToolsFromStackWord)
  {* editor:InsertPageBreak }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorInsertPageBreak
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evdTypes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorInsertPageBreak

procedure TkwPopEditorInsertPageBreak.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4ED7772B01F3_var*
//#UC END# *4F4DD89102E4_4ED7772B01F3_var*
begin
//#UC START# *4F4DD89102E4_4ED7772B01F3_impl*
 if aCtx.rEngine.IsTopInt then
  anEditor.InsertPageBreak(True, TevPageOrientation(aCtx.rEngine.PopInt))
 else
  RunnerError('Не задана ориентация раздела!', aCtx)
//#UC END# *4F4DD89102E4_4ED7772B01F3_impl*
end;//TkwPopEditorInsertPageBreak.DoEditorWithTools

class function TkwPopEditorInsertPageBreak.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:InsertSectionBreak';
end;//TkwPopEditorInsertPageBreak.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_InsertPageBreak
 TkwPopEditorInsertPageBreak.RegisterInEngine;
{$IfEnd} //not NoScripts

end.