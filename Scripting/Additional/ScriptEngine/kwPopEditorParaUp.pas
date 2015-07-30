unit kwPopEditorParaUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Автор: Люлин А.В.
// Модуль: "kwPopEditorParaUp.pas"
// Начат: 26.10.2011 20:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_ParaUp
//
// Переходит на параграф вверх в редакторе. pop:editor:ParaUp
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
 TkwPopEditorParaUp = {scriptword} class(TkwEditorFromStackCursorWord)
  {* Переходит на параграф вверх в редакторе. pop:editor:ParaUp }
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaUp
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

// start class TkwPopEditorParaUp

procedure TkwPopEditorParaUp.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4EA83B830393_var*
//#UC END# *50B8BCDF0093_4EA83B830393_var*
begin
//#UC START# *50B8BCDF0093_4EA83B830393_impl*
 aPoint.MostInner.ParentPoint.Move(anEditor.View, ev_ocParaUp);
//#UC END# *50B8BCDF0093_4EA83B830393_impl*
end;//TkwPopEditorParaUp.DoCursor

class function TkwPopEditorParaUp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaUp';
end;//TkwPopEditorParaUp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaUp
 TkwPopEditorParaUp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.