unit kwParaCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwParaCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::MoveMouseByPara::TkwParaCoordsToScreen
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  nevControl,
  kwEditorFromStackWord,
  l3Units,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _Para2Point_Parent_ = TkwEditorFromStackWord;
 {$Include w:\common\components\gui\Garant\Everest\EditorUsers\Para2Point.imp.pas}
 _kwParaCoordsToScreenUses_Parent_ = _Para2Point_;
 {$Include ..\ScriptEngine\kwParaCoordsToScreenUses.imp.pas}
 TkwParaCoordsToScreen = {abstract} class(_kwParaCoordsToScreenUses_)
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   function GetInnerPara(const aView: InevInputView;
    const aDocument: InevPara): InevPara; override;
     {* Возвращает параграф, относительно которого будет рассчитываться точка для выделения }
 protected
 // protected fields
   f_Point : InevBasePoint;
 end;//TkwParaCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include w:\common\components\gui\Garant\Everest\EditorUsers\Para2Point.imp.pas}

{$Include ..\ScriptEngine\kwParaCoordsToScreenUses.imp.pas}

type
  TnevControlFriend = {abstract} class(TnevControl)
   {* Друг для TnevControl }
  end;//TnevControlFriend

// start class TkwParaCoordsToScreen

procedure TkwParaCoordsToScreen.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F955027033B_var*
var
 l_l3Pt: Tl3Point;
 l_EditorCorner: TPoint;
//#UC END# *4F4CB81200CA_4F955027033B_var*
begin
//#UC START# *4F4CB81200CA_4F955027033B_impl*
 l_EditorCorner := anEditor.ClientToScreen(Point(0, 0));

 f_Point := anEditor.Selection.Cursor;
 try
  l_l3Pt := TranslatePara2Point(anEditor);
  with TPoint(TnevControlFriend(anEditor).LP2DP(l_l3Pt)) do
  begin
   aCtx.rEngine.PushInt(l_EditorCorner.X + X);
   aCtx.rEngine.PushInt(l_EditorCorner.Y + Y);
  end;
 finally
  f_Point := nil;
 end;
//#UC END# *4F4CB81200CA_4F955027033B_impl*
end;//TkwParaCoordsToScreen.DoWithEditor

function TkwParaCoordsToScreen.GetInnerPara(const aView: InevInputView;
  const aDocument: InevPara): InevPara;
//#UC START# *4BF4E6A00093_4F955027033B_var*
//#UC END# *4BF4E6A00093_4F955027033B_var*
begin
//#UC START# *4BF4E6A00093_4F955027033B_impl*
 Result := f_Point.MostInner.Obj^.AsPara;
//#UC END# *4BF4E6A00093_4F955027033B_impl*
end;//TkwParaCoordsToScreen.GetInnerPara

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwParaCoordsToScreen
 TkwParaCoordsToScreen.RegisterClass;
{$IfEnd} //not NoScripts

end.