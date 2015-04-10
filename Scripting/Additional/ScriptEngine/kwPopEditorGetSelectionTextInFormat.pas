unit kwPopEditorGetSelectionTextInFormat;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorGetSelectionTextInFormat.pas"
// Начат: 14.11.2011 16:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_GetSelectionTextInFormat
//
// Получает текст параграфа в указанном формате
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
 TkwPopEditorGetSelectionTextInFormat = class(_kwEditorFromStackWord_)
  {* Получает текст параграфа в указанном формате }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorGetSelectionTextInFormat
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Utils,
  nevBase,
  evParaTools,
  evdBlockNameAdder,
  evdDocumentMarksEliminator,
  evdMarkEliminator,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorGetSelectionTextInFormat;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

// start class TkwPopEditorGetSelectionTextInFormat

procedure TkwPopEditorGetSelectionTextInFormat.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EC10AB3000A_var*
var
 l_F : Integer;
 l_G : InevTagGenerator;
//#UC END# *4F4CB81200CA_4EC10AB3000A_var*
begin
//#UC START# *4F4CB81200CA_4EC10AB3000A_impl*
 if aCtx.rEngine.IsTopString then
  l_F := l3GetClipboardByFormatName(aCtx.rEngine.PopDelphiString)
 else
  l_F := aCtx.rEngine.PopInt;
 l_G := nil;
 TevdBlockNameAdder.SetTo(l_G);
 TevdMarkEliminator.SetTo(l_G);
 TevdDocumentMarksEliminator.SetTo(l_G);
 aCtx.rEngine.PushString(EvAsString(anEditor.View.Control.Selection.GetBlock.Data,
                                    l_F,
                                    false,
                                    l_G));
//#UC END# *4F4CB81200CA_4EC10AB3000A_impl*
end;//TkwPopEditorGetSelectionTextInFormat.DoWithEditor

class function TkwPopEditorGetSelectionTextInFormat.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:GetSelectionTextInFormat';
end;//TkwPopEditorGetSelectionTextInFormat.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.