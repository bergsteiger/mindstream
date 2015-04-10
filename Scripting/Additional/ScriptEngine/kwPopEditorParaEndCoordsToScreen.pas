unit kwPopEditorParaEndCoordsToScreen;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorParaEndCoordsToScreen.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::MoveMouseByPara::pop_editor_ParaEndCoordsToScreen
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
  evCustomEditorWindow,
  nevTools,
  nevControl,
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord,
  l3Units
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}
 TkwPopEditorParaEndCoordsToScreen = {final} class(_ParaCoordsToScreen_)
 private
 // private fields
   f_Editor : TevCustomEditorWindow;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetPoint(const aMap: InevMap): Tl3Point; override;
     {* Возвращает точку, на которую нужно спозиционироваться. }
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorParaEndCoordsToScreen
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  evMsgCode,
  evOp,
  Types,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorParaEndCoordsToScreen;

{$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}

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
  with TPoint(TnevControlHack(f_Editor).LP2DP(l_l3Pt)) do
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
 {$Include ..\ScriptEngine\ParaCoordsToScreen.imp.pas}
{$IfEnd} //not NoScripts

end.