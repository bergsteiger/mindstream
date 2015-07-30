unit kwPopEditorCopyAndPaste2DocumentBottom;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorCopyAndPaste2DocumentBottom.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_CopyAndPaste2DocumentBottom
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
 _ClipboardOperations_Parent_ = TkwEditorFromStackWord;
 {$Include ..\ScriptEngine\ClipboardOperations.imp.pas}
 TkwPopEditorCopyAndPaste2DocumentBottom = {scriptword} class(_ClipboardOperations_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCopyAndPaste2DocumentBottom
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  evOp,
  l3InternalInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\ClipboardOperations.imp.pas}

// start class TkwPopEditorCopyAndPaste2DocumentBottom

procedure TkwPopEditorCopyAndPaste2DocumentBottom.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E2835DE00FD_var*
//#UC END# *4F4CB81200CA_4E2835DE00FD_var*
begin
//#UC START# *4F4CB81200CA_4E2835DE00FD_impl*
 CopyAndPaste2DocumentBottom(anEditor);
//#UC END# *4F4CB81200CA_4E2835DE00FD_impl*
end;//TkwPopEditorCopyAndPaste2DocumentBottom.DoWithEditor

class function TkwPopEditorCopyAndPaste2DocumentBottom.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CopyAndPaste2DocumentBottom';
end;//TkwPopEditorCopyAndPaste2DocumentBottom.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_CopyAndPaste2DocumentBottom
 TkwPopEditorCopyAndPaste2DocumentBottom.RegisterInEngine;
{$IfEnd} //not NoScripts

end.