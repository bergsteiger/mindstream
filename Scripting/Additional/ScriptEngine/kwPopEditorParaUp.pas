unit kwPopEditorParaUp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaUp.pas"
// Начат: 26.10.2011 20:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_ParaUp
//
// Переходит на параграф вверх в редакторе. pop:editor:ParaUp
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
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
 TkwPopEditorParaUp = class(_kwEditorFromStackCursorWord_)
  {* Переходит на параграф вверх в редакторе. pop:editor:ParaUp }
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaUp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evMsgCode,
  evOp,
  TextPara_Const,
  CommentPara_Const,
  Windows,
  evParaTools,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorParaUp;

{$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
{$IfEnd} //not NoScripts

end.