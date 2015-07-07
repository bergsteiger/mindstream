unit kwPopEditorGetShowDocumentParts;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorGetShowDocumentParts.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_GetShowDocumentParts
//
// *Формат:* anEditorControl pop:editor:GetShowDocumentParts
// *Описание:* Помещает значение свойства редактора ShowDocumentParts (отображать структуру
// документа) в стек.
// *Пример:*
// {code}
// focused:control:push pop:editor:GetShowDocumentParts
// .
// {code}
// *Результат:* В засимости от значения поля в будет напечатано значение "true" или "false"
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
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 TkwPopEditorGetShowDocumentParts = {final} class(_kwEditorFromStackWord_)
  {* *Формат:* anEditorControl pop:editor:GetShowDocumentParts
*Описание:* Помещает значение свойства редактора ShowDocumentParts (отображать структуру документа) в стек.
*Пример:*
[code] 
focused:control:push pop:editor:GetShowDocumentParts
.
[code] 
*Результат:* В засимости от значения поля в будет напечатано значение "true" или "false" }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetShowDocumentParts
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

type _Instance_R_ = TkwPopEditorGetShowDocumentParts;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorGetShowDocumentParts

procedure TkwPopEditorGetShowDocumentParts.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4CB5C50249_var*
//#UC END# *4F4CB81200CA_4F4CB5C50249_var*
begin
//#UC START# *4F4CB81200CA_4F4CB5C50249_impl*
 aCtx.rEngine.PushBool(anEditor.ShowDocumentParts);
//#UC END# *4F4CB81200CA_4F4CB5C50249_impl*
end;//TkwPopEditorGetShowDocumentParts.DoWithEditor

class function TkwPopEditorGetShowDocumentParts.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetShowDocumentParts';
end;//TkwPopEditorGetShowDocumentParts.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.