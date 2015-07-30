unit kwEditorFromStackTableColumnResize;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwEditorFromStackTableColumnResize.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::TkwEditorFromStackTableColumnResize
//
// Вспомогательное слово для изменение размера колонок таблиц
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  kwEditorFromStackCursorWord,
  Classes,
  evCustomEditorWindow,
  l3Units,
  nevGUIInterfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _ColumnResizeByMouse_Parent_ = TkwEditorFromStackCursorWord;
 {$Include w:\common\components\gui\Garant\Everest\EditorUsers\ColumnResizeByMouse.imp.pas}
 TkwEditorFromStackTableColumnResize = {abstract} class(_ColumnResizeByMouse_)
  {* Вспомогательное слово для изменение размера колонок таблиц }
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
 protected
 // protected fields
   f_TablePara : InevParaList;
   f_Engine : Pointer;
 end;//TkwEditorFromStackTableColumnResize
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Table_Const,
  evConst,
  l3Base,
  evOp,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include w:\common\components\gui\Garant\Everest\EditorUsers\ColumnResizeByMouse.imp.pas}

// start class TkwEditorFromStackTableColumnResize

procedure TkwEditorFromStackTableColumnResize.DoCursor(const aCtx: TtfwContext;
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
end;//TkwEditorFromStackTableColumnResize.DoCursor

procedure TkwEditorFromStackTableColumnResize.Cleanup;
//#UC START# *479731C50290_4E37F5B402A5_var*
//#UC END# *479731C50290_4E37F5B402A5_var*
begin
//#UC START# *479731C50290_4E37F5B402A5_impl*
 f_Engine := nil;
 inherited;
//#UC END# *479731C50290_4E37F5B402A5_impl*
end;//TkwEditorFromStackTableColumnResize.Cleanup

function TkwEditorFromStackTableColumnResize.GetInnerPara(const aView: InevInputView;
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
end;//TkwEditorFromStackTableColumnResize.GetInnerPara

procedure TkwEditorFromStackTableColumnResize.GetColumnAndRow(var aCol: Integer;
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
end;//TkwEditorFromStackTableColumnResize.GetColumnAndRow

function TkwEditorFromStackTableColumnResize.GetDelta: Integer;
//#UC START# *4E32CA5E0115_4E37F5B402A5_var*
//#UC END# *4E32CA5E0115_4E37F5B402A5_var*
begin
//#UC START# *4E32CA5E0115_4E37F5B402A5_impl*
 Result := ItfwScriptEngine(f_Engine).PopInt;
//#UC END# *4E32CA5E0115_4E37F5B402A5_impl*
end;//TkwEditorFromStackTableColumnResize.GetDelta

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwEditorFromStackTableColumnResize
 TkwEditorFromStackTableColumnResize.RegisterClass;
{$IfEnd} //not NoScripts

end.