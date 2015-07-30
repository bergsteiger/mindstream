unit kwPopEditorParaDown;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorParaDown.pas"
// Начат: 20.05.2011 16:52
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ParaDown
//
// Переходит на параграф вниз в редакторе. pop:editor:ParaDown
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
 TkwPopEditorParaDown = {scriptword} class(TkwEditorFromStackCursorWord)
  {* Переходит на параграф вниз в редакторе. pop:editor:ParaDown }
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaDown
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evMsgCode,
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopEditorParaDown

procedure TkwPopEditorParaDown.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4DD663F8004B_var*
//#UC END# *50B8BCDF0093_4DD663F8004B_var*
begin
//#UC START# *50B8BCDF0093_4DD663F8004B_impl*
 aPoint.MostInner.ParentPoint.Move(anEditor.View, ev_ocParaDown);
//#UC END# *50B8BCDF0093_4DD663F8004B_impl*
end;//TkwPopEditorParaDown.DoCursor

class function TkwPopEditorParaDown.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaDown';
end;//TkwPopEditorParaDown.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaDown
 TkwPopEditorParaDown.RegisterInEngine;
{$IfEnd} //not NoScripts

end.