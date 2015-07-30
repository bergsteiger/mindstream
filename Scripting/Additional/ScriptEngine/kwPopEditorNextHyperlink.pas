unit kwPopEditorNextHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorNextHyperlink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_NextHyperlink
//
// *Формат:* anEditorControl pop:editor:NextHyperlink
// *Описание:* Переходит на следущую гиперссылку. Если такой переход невозможен, то ничего не
// происходит.
// *Пример:*
// {code}
// focused:control:push pop:editor:NextHyperlink
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
 TkwPopEditorNextHyperlink = {final scriptword} class(TkwEditorWithToolsFromStackWord)
  {* *Формат:* anEditorControl pop:editor:NextHyperlink
*Описание:* Переходит на следущую гиперссылку. Если такой переход невозможен, то ничего не происходит.
*Пример:*
[code] 
focused:control:push pop:editor:NextHyperlink
[code] }
 protected
 // realized methods
   procedure DoEditorWithTools(const aCtx: TtfwContext;
     anEditor: TevCustomEditor); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorNextHyperlink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorNextHyperlink

procedure TkwPopEditorNextHyperlink.DoEditorWithTools(const aCtx: TtfwContext;
  anEditor: TevCustomEditor);
//#UC START# *4F4DD89102E4_4F4DD9B8016A_var*
//#UC END# *4F4DD89102E4_4F4DD9B8016A_var*
begin
//#UC START# *4F4DD89102E4_4F4DD9B8016A_impl*
 anEditor.NextHyperlink(False);
//#UC END# *4F4DD89102E4_4F4DD9B8016A_impl*
end;//TkwPopEditorNextHyperlink.DoEditorWithTools

class function TkwPopEditorNextHyperlink.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:NextHyperlink';
end;//TkwPopEditorNextHyperlink.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_NextHyperlink
 TkwPopEditorNextHyperlink.RegisterInEngine;
{$IfEnd} //not NoScripts

end.