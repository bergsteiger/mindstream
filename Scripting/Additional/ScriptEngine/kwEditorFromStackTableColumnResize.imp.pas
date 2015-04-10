{$IfNDef kwEditorFromStackTableColumnResize_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEditorFromStackTableColumnResize.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::kwEditorFromStackTableColumnResize
//
// Вспомогательное слово для изменение размера колонок таблиц
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwEditorFromStackTableColumnResize_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
 _ColumnResizeByMouse_Parent_ = _kwEditorFromStackCursorWord_;
 {$Include w:\common\components\rtl\Garant\EditorUsers\ColumnResizeByMouse.imp.pas}
 _kwEditorFromStackTableColumnResize_ = {mixin} class(_ColumnResizeByMouse_)
  {* Вспомогательное слово для изменение размера колонок таблиц }
 private
 // private fields
   f_TablePara : InevParaList;
   f_Engine : Pointer;
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetInnerPara(const aView: InevInputView;
    const aDocument: InevPara): InevPara; override;
     {* Возвращает параграф, относительно которого будет рассчитываться точка для выделения }
   procedure GetColumnAndRow(var aCol: Integer;
     var aRow: Integer); override;
   function GetDelta: Integer; override;
 end;//_kwEditorFromStackTableColumnResize_
{$IfEnd} //not NoScripts

{$Else kwEditorFromStackTableColumnResize_imp}

{$IfNDef kwEditorFromStackTableColumnResize_imp_impl}
{$Define kwEditorFromStackTableColumnResize_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}

{$Include w:\common\components\rtl\Garant\EditorUsers\ColumnResizeByMouse.imp.pas}

// start class _kwEditorFromStackTableColumnResize_

procedure _kwEditorFromStackTableColumnResize_.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4E37F5B402A5_var*
var
 l_Point : InevBasePoint;
//#UC END# *50B8BCDF0093_4E37F5B402A5_var*
begin
//#UC START# *50B8BCDF0093_4E37F5B402A5_impl*
 f_Engine := Pointer(aCtx.rEngine);
 l_Point := aPoint;
 while not l_Point.AsObject.IsKindOf(k2_typTable) do
 begin
  l_Point := l_Point.Inner;
  RunnerAssert(l_Point <> nil, 'Курсор не в таблице.', aCtx);
 end; // while not f_Cursor.IsKindOf(k2_typTable) do
 f_TablePara := l_Point.Obj^.AsPara.AsList;
 SelectColumn(anEditor);
//#UC END# *50B8BCDF0093_4E37F5B402A5_impl*
end;//_kwEditorFromStackTableColumnResize_.DoCursor

procedure _kwEditorFromStackTableColumnResize_.Cleanup;
//#UC START# *479731C50290_4E37F5B402A5_var*
//#UC END# *479731C50290_4E37F5B402A5_var*
begin
//#UC START# *479731C50290_4E37F5B402A5_impl*
 f_Engine := nil;
 inherited;
//#UC END# *479731C50290_4E37F5B402A5_impl*
end;//_kwEditorFromStackTableColumnResize_.Cleanup

function _kwEditorFromStackTableColumnResize_.GetInnerPara(const aView: InevInputView;
  const aDocument: InevPara): InevPara;
//#UC START# *4BF4E6A00093_4E37F5B402A5_var*
var
 l_Col : Integer;
 l_Row : Integer;
//#UC END# *4BF4E6A00093_4E37F5B402A5_var*
begin
//#UC START# *4BF4E6A00093_4E37F5B402A5_impl*
 GetColumnAndRow(l_Col, l_Row);
 try
  Result := f_TablePara.Para[l_Row].AsList.Para[l_Col];
 finally
  f_TablePara := nil;
 end;
//#UC END# *4BF4E6A00093_4E37F5B402A5_impl*
end;//_kwEditorFromStackTableColumnResize_.GetInnerPara

procedure _kwEditorFromStackTableColumnResize_.GetColumnAndRow(var aCol: Integer;
  var aRow: Integer);
//#UC START# *4E32CA35008A_4E37F5B402A5_var*
//#UC END# *4E32CA35008A_4E37F5B402A5_var*
begin
//#UC START# *4E32CA35008A_4E37F5B402A5_impl*
 with ItfwScriptEngine(f_Engine) do
 begin
  aRow := PopInt;
  aCol := PopInt;
 end; // with ItfwScriptEngine(f_Engine) do
//#UC END# *4E32CA35008A_4E37F5B402A5_impl*
end;//_kwEditorFromStackTableColumnResize_.GetColumnAndRow

function _kwEditorFromStackTableColumnResize_.GetDelta: Integer;
//#UC START# *4E32CA5E0115_4E37F5B402A5_var*
//#UC END# *4E32CA5E0115_4E37F5B402A5_var*
begin
//#UC START# *4E32CA5E0115_4E37F5B402A5_impl*
 Result := ItfwScriptEngine(f_Engine).PopInt;
//#UC END# *4E32CA5E0115_4E37F5B402A5_impl*
end;//_kwEditorFromStackTableColumnResize_.GetDelta

{$IfEnd} //not NoScripts

{$Else  kwEditorFromStackTableColumnResize_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackCursorWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwEditorFromStackTableColumnResize_imp_impl}
{$EndIf kwEditorFromStackTableColumnResize_imp}
