unit kwPopEditorSetCursorByPoint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorSetCursorByPoint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_SetCursorByPoint
//
// editor:SetCursorByPoint
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
  tfwRegisterableWord,
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _Para2Point_Parent_ = _kwEditorFromStackWord_;
 {$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}
 TkwPopEditorSetCursorByPoint = class(_Para2Point_)
  {* editor:SetCursorByPoint }
 private
 // private fields
   f_Point : InevBasePoint;
   f_DeltaX : Integer;
   f_DeltaY : Integer;
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
   function GetInnerPara(const aView: InevInputView;
    const aDocument: InevPara): InevPara; override;
     {* Возвращает параграф, относительно которого будет рассчитываться точка для выделения }
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSetCursorByPoint
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevGUIInterfaces,
  l3Base,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorSetCursorByPoint;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

{$Include w:\common\components\rtl\Garant\EditorUsers\Para2Point.imp.pas}

// start class TkwPopEditorSetCursorByPoint

procedure TkwPopEditorSetCursorByPoint.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4EA922390373_var*
var
 l_Effect        : TevMouseEffect;
 l_Keys          : TevMouseState;
 l_l3Pt          : Tl3Point;
 l_EditorHotSpot : IevHotSpot;
//#UC END# *4F4CB81200CA_4EA922390373_var*
begin
//#UC START# *4F4CB81200CA_4EA922390373_impl*
 if aCtx.rEngine.IsTopInt then
  f_DeltaY := aCtx.rEngine.PopInt
 else
  RunnerAssert(False, 'Не задана дельта к координате Y.', aCtx);
 if aCtx.rEngine.IsTopInt then
  f_DeltaX := aCtx.rEngine.PopInt
 else
  RunnerAssert(False, 'Не задана дельта к координате X.', aCtx);
 f_Point := anEditor.Selection.Cursor;
 l_l3Pt := TranslatePara2Point(anEditor);
 l_EditorHotSpot := anEditor.HotSpotClass.Make(anEditor, nil);
 try
  l3FillChar(l_Effect, SizeOf(l_Effect), 0);
  l_Effect.rNeedAsyncLoop := True;
  l3FillChar(l_Keys, SizeOf(l_Keys), 0);
  l_Keys.rKeys := [];
  l_Keys.rInitialPoint := l_l3Pt;
  l_Keys.rPoint := l_l3Pt;
  l_EditorHotSpot.LButtonDown(anEditor.View, l_Keys, l_Effect);
  l_EditorHotSpot.LButtonUp(anEditor.View, l_Keys);
 finally
  l_EditorHotSpot := nil;
 end;
//#UC END# *4F4CB81200CA_4EA922390373_impl*
end;//TkwPopEditorSetCursorByPoint.DoWithEditor

function TkwPopEditorSetCursorByPoint.GetInnerPara(const aView: InevInputView;
  const aDocument: InevPara): InevPara;
//#UC START# *4BF4E6A00093_4EA922390373_var*
//#UC END# *4BF4E6A00093_4EA922390373_var*
begin
//#UC START# *4BF4E6A00093_4EA922390373_impl*
 Result := f_Point.MostInner.Obj^.AsPara;
 f_Point := nil;
//#UC END# *4BF4E6A00093_4EA922390373_impl*
end;//TkwPopEditorSetCursorByPoint.GetInnerPara

function TkwPopEditorSetCursorByPoint.GetPoint(const aMap: InevMap): Tl3Point;
//#UC START# *4C3C927B027E_4EA922390373_var*
//#UC END# *4C3C927B027E_4EA922390373_var*
begin
//#UC START# *4C3C927B027E_4EA922390373_impl*
 Result := l3Point(aMap.Bounds.Right - f_DeltaX, aMap.Bounds.Bottom - f_DeltaY);
//#UC END# *4C3C927B027E_4EA922390373_impl*
end;//TkwPopEditorSetCursorByPoint.GetPoint

class function TkwPopEditorSetCursorByPoint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SetCursorByPoint';
end;//TkwPopEditorSetCursorByPoint.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.