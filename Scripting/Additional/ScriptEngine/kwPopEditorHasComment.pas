unit kwPopEditorHasComment;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorHasComment.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_HasComment
//
// editor:HasComment. Помещает в стек true, если текущий параграф содержит комментарий.
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
  nevTools,
  evCustomEditorWindow,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackNextParaWord.imp.pas}
 TkwPopEditorHasComment = class(_kwEditorFromStackNextParaWord_)
  {* editor:HasComment. Помещает в стек true, если текущий параграф содержит комментарий. }
 protected
 // realized methods
   procedure DoNextPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorHasComment
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  LeafPara_Const,
  TextPara_Const,
  CommentPara_Const,
  Windows,
  evParaTools,
  evOp,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorHasComment;

{$Include ..\ScriptEngine\kwEditorFromStackNextParaWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackNextParaWord.imp.pas}
{$IfEnd} //not NoScripts

end.