unit kwPopEditorGetSelectionTextInFormat;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorGetSelectionTextInFormat.pas"
// Начат: 14.11.2011 16:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_GetSelectionTextInFormat
//
// Получает текст параграфа в указанном формате
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
 TkwPopEditorGetSelectionTextInFormat = {scriptword} class(TkwEditorFromStackWord)
  {* Получает текст параграфа в указанном формате }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
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
  evdMarkEliminator
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация pop_editor_GetSelectionTextInFormat
 TkwPopEditorGetSelectionTextInFormat.RegisterInEngine;
{$IfEnd} //not NoScripts

end.