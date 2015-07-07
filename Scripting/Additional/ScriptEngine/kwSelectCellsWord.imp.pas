{$IfNDef kwSelectCellsWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSelectCellsWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwSelectCellsWord
//
// Примесь выделения мышью части таблицы в редакторе.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwSelectCellsWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwEditorGetTableFromCursor_Parent_ = _kwEditorFromStackWord_;
 {$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}
 _kwSelectCellsWord_ = {mixin} class(_kwEditorGetTableFromCursor_)
  {* Примесь выделения мышью части таблицы в редакторе. }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // protected methods
   function IsVertical: Boolean; virtual; abstract;
     {* При выделении мышь движется сверху вниз. }
 end;//_kwSelectCellsWord_
{$IfEnd} //not NoScripts

{$Else kwSelectCellsWord_imp}

{$IfNDef kwSelectCellsWord_imp_impl}
{$Define kwSelectCellsWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

{$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}

// start class _kwSelectCellsWord_

procedure _kwSelectCellsWord_.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_4F604272014E_var*
const
 cnSelectionStep = 500;
var
 l_Map           : InevMap;
 l_l3Pt          : Tl3Point;
 l_Keys          : TevMouseState;
 l_Point         : InevBasePoint;
 l_Effect        : TevMouseEffect;
 l_StartRow      : Integer;
 l_StartCell     : Integer;
 l_FinishRow     : Integer;
 l_FinishCell    : Integer;
 l_Coordiante    : Integer;
 l_TablePoint    : InevBasePoint;
 l_FinishCoord   : Integer;
 l_EditorHotSpot : IevHotSpot;
//#UC END# *4F4CB81200CA_4F604272014E_var*
begin
//#UC START# *4F4CB81200CA_4F604272014E_impl*
 if aCtx.rEngine.IsTopInt then
  l_FinishRow := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана строка таблицы, где оканчивается выделение.');
 if aCtx.rEngine.IsTopInt then
  l_FinishCell := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана ячейка таблицы, где оканчивается выделение.');
 if aCtx.rEngine.IsTopInt then
  l_StartRow := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана строка таблицы, где начинается выделение.');
 if aCtx.rEngine.IsTopInt then
  l_StartCell := aCtx.rEngine.PopInt
 else
  Assert(False, 'Не задана ячейка таблицы, где начинается выделение.');
 l_TablePoint := GetTablePoint(aCtx, anEditor.Selection.Cursor);
 with anEditor do
 begin
  l_Point := l_TablePoint.Obj^.AsPara.AsList.Para[l_StartRow].AsList.Para[l_StartCell].AsList.Para[0].MakePoint;
  l_Map := View.MapByPoint(l_Point);
 end; // with anEditor do
 Assert(l_Map <> nil);
 l_l3Pt := l3Point(l_Map.Bounds.Left + 3 * evEpsilon, l_Map.Bounds.Top + 3 * evEpsilon);
 l_EditorHotSpot := anEditor.HotSpotClass.Make(anEditor, nil);
 try
  // Щелкаем левой кнопкой...
  l3FillChar(l_Effect, SizeOf(l_Effect), 0);
  l_Effect.rNeedAsyncLoop := True;
  l3FillChar(l_Keys, SizeOf(l_Keys), 0);
  l_Keys.rKeys := [];
  l_Keys.rInitialPoint := l_l3Pt;
  l_Keys.rPoint := l_l3Pt;
  l_EditorHotSpot.LButtonDown(anEditor.View, l_Keys, l_Effect);
  // Сдвигаем мышь...
  if IsVertical then
   l_Coordiante := l_l3Pt.Y
  else
   l_Coordiante := l_l3Pt.X;
  with anEditor do
  begin
   l_Point := l_TablePoint.Obj^.AsPara.AsList.Para[l_FinishRow].AsList.Para[l_FinishCell].AsList.Para[0].MakePoint;
   l_Map := View.MapByPoint(l_Point);
  end; // with anEditor do
  l_l3Pt := l3Point(l_Map.Bounds.Right - 3 * evEpsilon, l_Map.Bounds.Bottom - 2 * evEpsilon);
  if IsVertical then
   l_FinishCoord := l_l3Pt.Y
  else
   l_FinishCoord := l_l3Pt.X;
  l_Keys.rInMove := true;
  while l_Coordiante < l_FinishCoord do
  begin
   if IsVertical then
    l_Keys.rPoint := l3Point(l_l3Pt.X, l_Coordiante)
   else
    l_Keys.rPoint := l3Point(l_Coordiante, l_l3Pt.Y);
   l_EditorHotSpot.MouseMove(anEditor.View, l_Keys);
   Inc(l_Coordiante, cnSelectionStep);
  end; // while l_X < l_FinishX do
  l_EditorHotSpot.LButtonUp(anEditor.View, l_Keys);
 finally
  l_EditorHotSpot := nil;
 end;
//#UC END# *4F4CB81200CA_4F604272014E_impl*
end;//_kwSelectCellsWord_.DoWithEditor

{$IfEnd} //not NoScripts

{$Else  kwSelectCellsWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwSelectCellsWord_imp_impl}
{$EndIf kwSelectCellsWord_imp}
