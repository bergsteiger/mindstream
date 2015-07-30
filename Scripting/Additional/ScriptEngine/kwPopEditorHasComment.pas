unit kwPopEditorHasComment;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorHasComment.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_HasComment
//
// editor:HasComment. Помещает в стек true, если текущий параграф содержит комментарий.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackNextParaWord,
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorHasComment = {scriptword} class(TkwEditorFromStackNextParaWord)
  {* editor:HasComment. Помещает в стек true, если текущий параграф содержит комментарий. }
 protected
 // realized methods
   procedure DoNextPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorHasComment
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

// start class TkwPopEditorHasComment

procedure TkwPopEditorHasComment.DoNextPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0CC800CA_4DD0F87600ED_var*
//#UC END# *50BA0CC800CA_4DD0F87600ED_var*
begin
//#UC START# *50BA0CC800CA_4DD0F87600ED_impl*
 aCtx.rEngine.PushBool(aPara.AsObject.IsKindOf(k2_typCommentPara));
//#UC END# *50BA0CC800CA_4DD0F87600ED_impl*
end;//TkwPopEditorHasComment.DoNextPara

class function TkwPopEditorHasComment.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:HasComment';
end;//TkwPopEditorHasComment.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_HasComment
 TkwPopEditorHasComment.RegisterInEngine;
{$IfEnd} //not NoScripts

end.