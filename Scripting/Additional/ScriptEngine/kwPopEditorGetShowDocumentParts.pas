unit kwPopEditorGetShowDocumentParts;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorGetShowDocumentParts.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetShowDocumentParts
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
 TkwPopEditorGetShowDocumentParts = {final scriptword} class(TkwEditorFromStackWord)
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
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetShowDocumentParts
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация pop_editor_GetShowDocumentParts
 TkwPopEditorGetShowDocumentParts.RegisterInEngine;
{$IfEnd} //not NoScripts

end.