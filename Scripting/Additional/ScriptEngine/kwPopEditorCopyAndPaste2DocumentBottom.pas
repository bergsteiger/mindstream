unit kwPopEditorCopyAndPaste2DocumentBottom;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorCopyAndPaste2DocumentBottom.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_CopyAndPaste2DocumentBottom
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
 _ClipboardOperations_Parent_ = _kwEditorFromStackWord_;
 {$Include ..\ScriptEngine\ClipboardOperations.imp.pas}
 TkwPopEditorCopyAndPaste2DocumentBottom = class(_ClipboardOperations_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorCopyAndPaste2DocumentBottom
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms,
  l3Base,
  evOp,
  l3InternalInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorCopyAndPaste2DocumentBottom;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.