unit kwPopEditorParaEnd;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaEnd.pas"
// Начат: 26.10.2011 18:48
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_ParaEnd
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
 TkwPopEditorParaEnd = {final} class(_kwEditorFromStackCursorWord_)
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaEnd
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
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

type _Instance_R_ = TkwPopEditorParaEnd;

{$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
{$IfEnd} //not NoScripts

end.