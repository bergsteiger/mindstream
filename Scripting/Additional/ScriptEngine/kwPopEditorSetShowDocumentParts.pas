unit kwPopEditorSetShowDocumentParts;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSetShowDocumentParts.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SetShowDocumentParts
//
// *Формат:* aValue anEditorControl pop:editor:SetShowDocumentParts
// *Описание:* Устанавливает свойство ShowDocumentParts (отображать структуру документа). Значение
// aValue булевского типа.
// *Пример:*
// {code}
// true focused:control:push pop:editor:SetShowDocumentParts
// {code}
// *Результат:* В редакторе будет отображаться структура документа.
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
 TkwPopEditorSetShowDocumentParts = {final} class(_kwEditorFromStackWord_)
  {* *Формат:* aValue anEditorControl pop:editor:SetShowDocumentParts
*Описание:* Устанавливает свойство ShowDocumentParts (отображать структуру документа). Значение aValue булевского типа.
*Пример:*
[code] 
true focused:control:push pop:editor:SetShowDocumentParts
[code] 
*Результат:* В редакторе будет отображаться структура документа. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetShowDocumentParts
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

type _Instance_R_ = TkwPopEditorSetShowDocumentParts;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorSetShowDocumentParts

procedure TkwPopEditorSetShowDocumentParts.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F4CB59F0116_var*
//#UC END# *4F4CB81200CA_4F4CB59F0116_var*
begin
//#UC START# *4F4CB81200CA_4F4CB59F0116_impl*
 if aCtx.rEngine.IsTopBool then
  anEditor.ShowDocumentParts := aCtx.rEngine.PopBool
 else
  Assert(False, 'Не задано значение для anEditor.ShowDocumentParts');
//#UC END# *4F4CB81200CA_4F4CB59F0116_impl*
end;//TkwPopEditorSetShowDocumentParts.DoWithEditor

class function TkwPopEditorSetShowDocumentParts.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetShowDocumentParts';
end;//TkwPopEditorSetShowDocumentParts.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.