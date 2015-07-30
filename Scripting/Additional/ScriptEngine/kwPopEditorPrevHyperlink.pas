unit kwPopEditorPrevHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorPrevHyperlink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_PrevHyperlink
//
// *Формат:* anEditorControl pop:editor:PrevHyperlink
// *Описание:* Переходит на предыдущую гиперссылку. Если такой переход невозможен, то ничего не
// происходит.
// *Пример:*
// {code}
// focused:control:push pop:editor:PrevHyperlink
// {code}
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
 TkwPopEditorPrevHyperlink = {final scriptword} class(TkwEditorWithToolsFromStackWord)
  {* *Формат:* anEditorControl pop:editor:PrevHyperlink
*Описание:* Переходит на предыдущую гиперссылку. Если такой переход невозможен, то ничего не происходит.
*Пример:*
[code] 
focused:control:push pop:editor:PrevHyperlink
[code] }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPrevHyperlink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorPrevHyperlink

procedure TkwPopEditorPrevHyperlink.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F4DD9EB0392_var*
//#UC END# *4F4DD89102E4_4F4DD9EB0392_var*
begin
//#UC START# *4F4DD89102E4_4F4DD9EB0392_impl*
 anEditor.PrevHyperlink(False);
//#UC END# *4F4DD89102E4_4F4DD9EB0392_impl*
end;//TkwPopEditorPrevHyperlink.DoEditorWithTools

class function TkwPopEditorPrevHyperlink.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PrevHyperlink';
end;//TkwPopEditorPrevHyperlink.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_PrevHyperlink
 TkwPopEditorPrevHyperlink.RegisterInEngine;
{$IfEnd} //not NoScripts

end.