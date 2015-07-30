unit kwPopEditorAtTop;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorAtTop.pas"
// Начат: 07.10.2011 20:58
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_AtTop
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
 TkwPopEditorAtTop = {scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorAtTop
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorAtTop

procedure TkwPopEditorAtTop.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4E8F2F9E026F_var*
//#UC END# *4F4CB81200CA_4E8F2F9E026F_var*
begin
//#UC START# *4F4CB81200CA_4E8F2F9E026F_impl*
 aCtx.rEngine.PushBool(anEditor.View.TopAnchor.AtStart);
//#UC END# *4F4CB81200CA_4E8F2F9E026F_impl*
end;//TkwPopEditorAtTop.DoWithEditor

class function TkwPopEditorAtTop.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:AtTop';
end;//TkwPopEditorAtTop.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_AtTop
 TkwPopEditorAtTop.RegisterInEngine;
{$IfEnd} //not NoScripts

end.