{$IfNDef ParaCoordsToScreen_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/ParaCoordsToScreen.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MoveMouseByPara::ParaCoordsToScreen
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define ParaCoordsToScreen_imp}
{$If not defined(NoScripts)}
 TnevControlHack = {abstract} class(TnevControl)
 end;//TnevControlHack

 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _Para2Point_Parent_ = _kwEditorFromStackWord_;
 {$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}
 _ParaCoordsToScreen_ = {mixin} class(_Para2Point_)
 private
 // private fields
   f_Point : InevBasePoint;
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   function GetInnerPara(const aView: InevInputView;
    const aDocument: InevPara): InevPara; override;
     {* Возвращает параграф, относительно которого будет рассчитываться точка для выделения }
 end;//_ParaCoordsToScreen_
{$IfEnd} //not NoScripts

{$Else ParaCoordsToScreen_imp}

{$IfNDef ParaCoordsToScreen_imp_impl}
{$Define ParaCoordsToScreen_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

{$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}

// start class _ParaCoordsToScreen_

procedure _ParaCoordsToScreen_.DoWithEditor(const aCtx: TtfwContext;
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
  with TPoint(TnevControlHack(anEditor).LP2DP(l_l3Pt)) do
  begin
   aCtx.rEngine.PushInt(l_EditorCorner.X + X);
   aCtx.rEngine.PushInt(l_EditorCorner.Y + Y);
  end;
 finally
  f_Point := nil;
 end;
//#UC END# *4F4CB81200CA_4F955027033B_impl*
end;//_ParaCoordsToScreen_.DoWithEditor

function _ParaCoordsToScreen_.GetInnerPara(const aView: InevInputView;
  const aDocument: InevPara): InevPara;
//#UC START# *4BF4E6A00093_4F955027033B_var*
//#UC END# *4BF4E6A00093_4F955027033B_var*
begin
//#UC START# *4BF4E6A00093_4F955027033B_impl*
 Result := f_Point.MostInner.Obj^.AsPara;
//#UC END# *4BF4E6A00093_4F955027033B_impl*
end;//_ParaCoordsToScreen_.GetInnerPara

{$IfEnd} //not NoScripts

{$Else  ParaCoordsToScreen_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf ParaCoordsToScreen_imp_impl}
{$EndIf ParaCoordsToScreen_imp}
