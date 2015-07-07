unit kwPopEditorParaHome;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaHome.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_ParaHome
//
// В начало параграфа
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
 TkwPopEditorParaHome = {final} class(_kwEditorFromStackCursorWord_)
  {* В начало параграфа }
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaHome
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

type _Instance_R_ = TkwPopEditorParaHome;

{$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}

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
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
{$IfEnd} //not NoScripts

end.