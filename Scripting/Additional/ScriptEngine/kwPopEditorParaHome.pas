unit kwPopEditorParaHome;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorParaHome.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ParaHome
//
// В начало параграфа
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackCursorWord,
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorParaHome = {final scriptword} class(TkwEditorFromStackCursorWord)
  {* В начало параграфа }
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaHome
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorParaHome

procedure TkwPopEditorParaHome.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4F73173A01D7_var*
//#UC END# *50B8BCDF0093_4F73173A01D7_var*
begin
//#UC START# *50B8BCDF0093_4F73173A01D7_impl*
 aPoint.MostInner.Move(anEditor.View, ev_ocParaHome);
//#UC END# *50B8BCDF0093_4F73173A01D7_impl*
end;//TkwPopEditorParaHome.DoCursor

class function TkwPopEditorParaHome.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaHome';
end;//TkwPopEditorParaHome.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaHome
 TkwPopEditorParaHome.RegisterInEngine;
{$IfEnd} //not NoScripts

end.