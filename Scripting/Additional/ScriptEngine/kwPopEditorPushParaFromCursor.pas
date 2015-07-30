unit kwPopEditorPushParaFromCursor;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorPushParaFromCursor.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_PushParaFromCursor
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
 TkwPopEditorPushParaFromCursor = {final scriptword} class(TkwEditorFromStackWord)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPushParaFromCursor
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwPopEditorPushParaFromCursor

procedure TkwPopEditorPushParaFromCursor.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4FBC957D0167_var*
//#UC END# *4F4CB81200CA_4FBC957D0167_var*
begin
//#UC START# *4F4CB81200CA_4FBC957D0167_impl*
 aCtx.rEngine.PushIntf(anEditor.Selection.Cursor.MostInner.Obj^.AsPara);
//#UC END# *4F4CB81200CA_4FBC957D0167_impl*
end;//TkwPopEditorPushParaFromCursor.DoWithEditor

class function TkwPopEditorPushParaFromCursor.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PushParaFromCursor';
end;//TkwPopEditorPushParaFromCursor.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_PushParaFromCursor
 TkwPopEditorPushParaFromCursor.RegisterInEngine;
{$IfEnd} //not NoScripts

end.