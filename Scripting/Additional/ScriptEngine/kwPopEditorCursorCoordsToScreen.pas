unit kwPopEditorCursorCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorCursorCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::MoveMouseByPara::pop_editor_CursorCoordsToScreen
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  evCustomEditorWindow,
  nevControl,
  kwParaCoordsToScreen,
  l3Units,
  nevTools,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopEditorCursorCoordsToScreen = {final scriptword} class(TkwParaCoordsToScreen)
 private
 // private fields
   f_Editor : TevCustomEditorWindow;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 end;//TkwPopEditorCursorCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type
  TnevControlFriend = {abstract} class(TnevControl)
   {* Друг для TnevControl }
  end;//TnevControlFriend

// start class TkwPopEditorCursorCoordsToScreen

procedure TkwPopEditorCursorCoordsToScreen.Cleanup;
//#UC START# *479731C50290_4FABE1110175_var*
//#UC END# *479731C50290_4FABE1110175_var*
begin
//#UC START# *479731C50290_4FABE1110175_impl*
 f_Editor := nil;
 inherited;
//#UC END# *479731C50290_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.Cleanup

function TkwPopEditorCursorCoordsToScreen.GetPoint(const aMap: InevMap): Tl3Point;
//#UC START# *4C3C927B027E_4FABE1110175_var*
var
 l_DeltaX: Integer;
 l_DeltaY: Integer;
//#UC END# *4C3C927B027E_4FABE1110175_var*
begin
//#UC START# *4C3C927B027E_4FABE1110175_impl*
 l_DeltaX := f_Point.DeltaX(f_Editor.View, f_Editor.View.RootMap);
 l_DeltaY := f_Point.MostInner.AsLeaf.PaintOffsetY(f_Editor.View, aMap.FI);
 Result := l3Point(l_DeltaX, aMap.Bounds.Top + l_DeltaY);
//#UC END# *4C3C927B027E_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.GetPoint

class function TkwPopEditorCursorCoordsToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:CursorCoordsToScreen';
end;//TkwPopEditorCursorCoordsToScreen.GetWordNameForRegister

procedure TkwPopEditorCursorCoordsToScreen.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4FABE1110175_var*
var
 l_l3Pt: Tl3Point;
 l_EditorCorner: TPoint;
//#UC END# *4F4CB81200CA_4FABE1110175_var*
begin
//#UC START# *4F4CB81200CA_4FABE1110175_impl*
 f_Editor := anEditor;
 
 f_Point := f_Editor.Selection.Cursor.ClonePoint(f_Editor.View);
 try
  l_EditorCorner := f_Editor.ClientToScreen(Point(0, 0));
 
  l_l3Pt := TranslatePara2Point(f_Editor);
  with TPoint(TnevControlFriend(f_Editor).LP2DP(l_l3Pt)) do
  begin
   aCtx.rEngine.PushInt(l_EditorCorner.X + X);
   aCtx.rEngine.PushInt(l_EditorCorner.Y + Y);
  end;
 finally
  f_Point := nil;
 end;
//#UC END# *4F4CB81200CA_4FABE1110175_impl*
end;//TkwPopEditorCursorCoordsToScreen.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_CursorCoordsToScreen
 TkwPopEditorCursorCoordsToScreen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.