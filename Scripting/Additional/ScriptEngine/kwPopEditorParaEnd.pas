unit kwPopEditorParaEnd;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorParaEnd.pas"
// Начат: 26.10.2011 18:48
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ParaEnd
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
 TkwPopEditorParaEnd = {final scriptword} class(TkwEditorFromStackCursorWord)
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaEnd
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

// start class TkwPopEditorParaEnd

procedure TkwPopEditorParaEnd.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4F732C5C00BD_var*
//#UC END# *50B8BCDF0093_4F732C5C00BD_var*
begin
//#UC START# *50B8BCDF0093_4F732C5C00BD_impl*
 aPoint.MostInner.Move(anEditor.View, ev_ocParaEnd);
//#UC END# *50B8BCDF0093_4F732C5C00BD_impl*
end;//TkwPopEditorParaEnd.DoCursor

class function TkwPopEditorParaEnd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaEnd';
end;//TkwPopEditorParaEnd.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaEnd
 TkwPopEditorParaEnd.RegisterInEngine;
{$IfEnd} //not NoScripts

end.