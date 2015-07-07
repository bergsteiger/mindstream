unit kwPopEditorPrevHyperlink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorPrevHyperlink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_PrevHyperlink
//
// *Формат:* anEditorControl pop:editor:PrevHyperlink
// *Описание:* Переходит на предыдущую гиперссылку. Если такой переход невозможен, то ничего не
// происходит.
// *Пример:*
// {code}
// focused:control:push pop:editor:PrevHyperlink
// {code}
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evCustomEditor,
  tfwScriptingInterfaces,
  evCustomEditorWindow,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
 TkwPopEditorPrevHyperlink = {final} class(_kwEditorWithToolsFromStackWord_)
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
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPrevHyperlink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorPrevHyperlink;

{$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorWithToolsFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.