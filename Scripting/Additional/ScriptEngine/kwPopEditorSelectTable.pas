unit kwPopEditorSelectTable;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "kwPopEditorSelectTable.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_SelectTable
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  nevTools,
  kwEditorFromStackCursorWord,
  evCustomEditorWindow,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _SelectTablePart_Parent_ = TkwEditorFromStackCursorWord;
 {$Include ..\ScriptEngine\SelectTablePart.imp.pas}
 TkwPopEditorSelectTable = {scriptword} class(_SelectTablePart_)
 private
 // private fields
   f_Point : InevBasePoint;
 protected
 // realized methods
   procedure DoCursor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow;
     const aPoint: InevBasePoint); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function SelectTableWholly: Boolean; override;
     {* Вылять таблицу целиком }
   function GetTablePara(const aDocument: InevParaList): InevParaList; override;
     {* Возвращает параграф с таблицей }
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorSelectTable
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  Table_Const,
  evOp,
  evCursorTools,
  CommentPara_Const,
  TextPara_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\SelectTablePart.imp.pas}

// start class TkwPopEditorSelectTable

procedure TkwPopEditorSelectTable.DoCursor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow;
  const aPoint: InevBasePoint);
//#UC START# *50B8BCDF0093_4E2820E701E1_var*
//#UC END# *50B8BCDF0093_4E2820E701E1_var*
begin
//#UC START# *50B8BCDF0093_4E2820E701E1_impl*
 f_Point := aPoint;
 try
  MakeSelection(anEditor);
 finally
  f_Point := nil; 
 end;//try..finally
//#UC END# *50B8BCDF0093_4E2820E701E1_impl*
end;//TkwPopEditorSelectTable.DoCursor

procedure TkwPopEditorSelectTable.Cleanup;
//#UC START# *479731C50290_4E2820E701E1_var*
//#UC END# *479731C50290_4E2820E701E1_var*
begin
//#UC START# *479731C50290_4E2820E701E1_impl*
 f_Point := nil;
 inherited;
//#UC END# *479731C50290_4E2820E701E1_impl*
end;//TkwPopEditorSelectTable.Cleanup

function TkwPopEditorSelectTable.SelectTableWholly: Boolean;
//#UC START# *4C34625E021F_4E2820E701E1_var*
//#UC END# *4C34625E021F_4E2820E701E1_var*
begin
//#UC START# *4C34625E021F_4E2820E701E1_impl*
 Result := True;
//#UC END# *4C34625E021F_4E2820E701E1_impl*
end;//TkwPopEditorSelectTable.SelectTableWholly

function TkwPopEditorSelectTable.GetTablePara(const aDocument: InevParaList): InevParaList;
//#UC START# *4CC818F4022D_4E2820E701E1_var*
var
 l_Inner: InevBasePoint;
//#UC END# *4CC818F4022D_4E2820E701E1_var*
begin
//#UC START# *4CC818F4022D_4E2820E701E1_impl*
 Result := nil;
 l_Inner := f_Point;
 while (l_Inner <> nil) and not l_Inner.AsObject.IsKindOf(k2_typTable) do
  l_Inner := l_Inner.Inner;
 if l_Inner <> nil then
  Result := l_Inner.Obj.AsPara.AsList;
//#UC END# *4CC818F4022D_4E2820E701E1_impl*
end;//TkwPopEditorSelectTable.GetTablePara

class function TkwPopEditorSelectTable.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:SelectTable';
end;//TkwPopEditorSelectTable.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_editor_SelectTable
 TkwPopEditorSelectTable.RegisterInEngine;
{$IfEnd} //not NoScripts

end.