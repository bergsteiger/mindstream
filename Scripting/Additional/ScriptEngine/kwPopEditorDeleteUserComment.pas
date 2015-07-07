unit kwPopEditorDeleteUserComment;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorDeleteUserComment.pas"
// Начат: 27.04.2011 14:06
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_DeleteUserComment
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
 TkwPopEditorDeleteUserComment = class(_kwEditorFromStackNextParaWord_)
 protected
 // realized methods
   procedure DoNextPara(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPara: InevPara); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorDeleteUserComment
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  CommentPara_Const,
  LeafPara_Const,
  TextPara_Const,
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

type _Instance_R_ = TkwPopEditorDeleteUserComment;

{$Include ..\ScriptEngine\kwEditorFromStackNextParaWord.imp.pas}

// start class TkwPopEditorDeleteUserComment

procedure TkwPopEditorDeleteUserComment.DoNextPara(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPara: InevPara);
//#UC START# *50BA0CC800CA_4DB7EA830363_var*
var
 l_Res : Boolean;
 l_Op  : InevOp;
//#UC END# *50BA0CC800CA_4DB7EA830363_var*
begin
//#UC START# *50BA0CC800CA_4DB7EA830363_impl*
 l_Res := false;
 if aPara.AsObject.IsKindOf(k2_typCommentPara) then
 begin
  l_Op := anEditor.StartOp;
  try
   if aPara.Edit.Delete(false, l_Op) then
    l_Res := true;
  finally
   l_Op := nil;
  end;//try..finally
 end;//aPara.IsKindOf(k2_typCommentPara)
 aCtx.rEngine.PushBool(l_Res);
//#UC END# *50BA0CC800CA_4DB7EA830363_impl*
end;//TkwPopEditorDeleteUserComment.DoNextPara

class function TkwPopEditorDeleteUserComment.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:DeleteComment';
end;//TkwPopEditorDeleteUserComment.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackNextParaWord.imp.pas}
{$IfEnd} //not NoScripts

end.