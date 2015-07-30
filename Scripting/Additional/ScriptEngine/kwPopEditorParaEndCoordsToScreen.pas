unit kwPopEditorParaEndCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorParaEndCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::MoveMouseByPara::pop_editor_ParaEndCoordsToScreen
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
 TkwPopEditorParaEndCoordsToScreen = {final scriptword} class(TkwParaCoordsToScreen)
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
 end;//TkwPopEditorParaEndCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evMsgCode,
  evOp,
  Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type
  TnevControlFriend = {abstract} class(TnevControl)
   {* Друг для TnevControl }
  end;//TnevControlFriend

// start class TkwPopEditorParaEndCoordsToScreen

procedure TkwPopEditorParaEndCoordsToScreen.Cleanup;
//#UC START# *479731C50290_4F265392010B_var*
//#UC END# *479731C50290_4F265392010B_var*
begin
//#UC START# *479731C50290_4F265392010B_impl*
 f_Editor := nil;
 inherited;
//#UC END# *479731C50290_4F265392010B_impl*
end;//TkwPopEditorParaEndCoordsToScreen.Cleanup

function TkwPopEditorParaEndCoordsToScreen.GetPoint(const aMap: InevMap): Tl3Point;
//#UC START# *4C3C927B027E_4F265392010B_var*
var
 l_DeltaX: Integer;
//#UC END# *4C3C927B027E_4F265392010B_var*
begin
//#UC START# *4C3C927B027E_4F265392010B_impl*
 l_DeltaX := f_Point.DeltaX(f_Editor.View, f_Editor.View.RootMap);
 Result := l3Point(l_DeltaX, aMap.Bounds.Bottom);
//#UC END# *4C3C927B027E_4F265392010B_impl*
end;//TkwPopEditorParaEndCoordsToScreen.GetPoint

class function TkwPopEditorParaEndCoordsToScreen.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:ParaEndCoordsToScreen';
end;//TkwPopEditorParaEndCoordsToScreen.GetWordNameForRegister

procedure TkwPopEditorParaEndCoordsToScreen.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F265392010B_var*
var
 l_l3Pt: Tl3Point;
 l_EditorCorner: TPoint;
 
 l_Map: InevMap;
 l_Para: InevPara;
 l_Op: InevOp;
 
 l_Indent, l_DeltaX: Integer;
//#UC END# *4F4CB81200CA_4F265392010B_var*
begin
//#UC START# *4F4CB81200CA_4F265392010B_impl*
 f_Editor := anEditor;
 
 try
  l_Op := f_Editor.StartOp(ev_msgMove);
  try
   f_Point := f_Editor.Selection.Cursor.ClonePoint(f_Editor.View);
   f_Point.MostInner.Move(f_Editor.View, ev_ocBottomRight, l_Op);
  finally
   l_Op := nil;
  end;

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
//#UC END# *4F4CB81200CA_4F265392010B_impl*
end;//TkwPopEditorParaEndCoordsToScreen.DoWithEditor

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_ParaEndCoordsToScreen
 TkwPopEditorParaEndCoordsToScreen.RegisterInEngine;
{$IfEnd} //not NoScripts

end.