{$IfNDef SelectTablePart_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "SelectTablePart.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: Impurity::Class Shared Delphi::ScriptEngine$Everest::MixIns::SelectTablePart
//
// Выделить часть таблицы
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define SelectTablePart_imp}
{$If not defined(NoScripts)}
 _SelectTablePart_ = {mixin} class(_SelectTablePart_Parent_)
  {* Выделить часть таблицы }
 protected
 // protected methods
   procedure MakeSelection(aText: TevCustomEditorWindow);
     {* Выделить по заданным параметрам. }
   function GetSelection(const aView: InevView;
     const aTable: InevPara): InevRange;
     {* Получить выделение по заданным "координатам". }
   function NeedSelection: Boolean; virtual;
     {* Нужно ли чего-нибудь выделять. }
   function GetTablePara(const aDocument: InevParaList): InevParaList; virtual;
     {* Возвращает параграф с таблицей }
   procedure GetSelectParam(out aStartRow: Integer;
    out aStartCell: Integer;
    out aFinishRow: Integer;
    out aFinishCell: Integer); virtual;
     {* Получить "координаты" точек выделения. }
   function SelectColumn(var aColID: Integer): Boolean; virtual;
     {* Выделить колонку aColID }
   function SelectTableWholly: Boolean; virtual;
     {* Вылять таблицу целиком }
 end;//_SelectTablePart_
{$Else}

 _SelectTablePart_ = _SelectTablePart_Parent_;

{$IfEnd} //not NoScripts

{$Else SelectTablePart_imp}

{$If not defined(NoScripts)}

// start class _SelectTablePart_

procedure _SelectTablePart_.MakeSelection(aText: TevCustomEditorWindow);
//#UC START# *4CC8163F034F_4CC815A00031_var*
var
 l_ColID     : Integer;
 l_Block     : InevRange;
 l_Selection : InevSelection;
//#UC END# *4CC8163F034F_4CC815A00031_var*
begin
//#UC START# *4CC8163F034F_4CC815A00031_impl*
 if NeedSelection then
 begin
  l_Selection := aText.Selection;
  if (l_Selection <> nil) then
  begin
   if SelectColumn(l_ColID) then
    evSelectTableColumn(l_Selection, GetTablePara(aText.Document), l_ColID)
   else
    if SelectTableWholly then
     evSelectTablePara(l_Selection, GetTablePara(aText.Document))
    else
    begin
     l_Block := GetSelection(aText.View, GetTablePara(aText.Document));
     l_Selection.Select(l_Block, false);
    end;
  end; // if (l_Selection <> nil) then
 end; // if NeedSelection then
//#UC END# *4CC8163F034F_4CC815A00031_impl*
end;//_SelectTablePart_.MakeSelection

function _SelectTablePart_.GetSelection(const aView: InevView;
  const aTable: InevPara): InevRange;
//#UC START# *4CC81818005F_4CC815A00031_var*
var
 l_Start  : InevBasePoint;
 l_Finish : InevBasePoint;
 l_Para   : InevParaList;
 l_StRow  : Integer;
 l_StCell : Integer;
 l_FinRow : Integer;
 l_FinCell: Integer;
//#UC END# *4CC81818005F_4CC815A00031_var*
begin
//#UC START# *4CC81818005F_4CC815A00031_impl*
 GetSelectParam(l_StRow, l_StCell, l_FinRow, l_FinCell);
 l_Start := aTable.AsList.Para[l_StRow].MakePoint;
 l_Start.SetEntryPoint(l_StCell + 1);
 if l_Start.HasInner then
  l_Start.Inner.Move(aView, ev_ocTopLeft);
 l_Start := l_Start.PointToParent(aTable);
 l_Para := aTable.AsList.Para[l_FinRow].AsList;
 l_Finish := l_Para.MakePoint;
 l_Finish.SetEntryPoint(l_FinCell + 1);
 if l_Finish.HasInner then
  l_Finish.Inner.Move(aView, ev_ocBottomRight);
 l_Finish := l_Finish.PointToParent(aTable);
 Result := aTable.Range(l_Start, l_Finish);
//#UC END# *4CC81818005F_4CC815A00031_impl*
end;//_SelectTablePart_.GetSelection

function _SelectTablePart_.NeedSelection: Boolean;
//#UC START# *4CC8189D02DF_4CC815A00031_var*
//#UC END# *4CC8189D02DF_4CC815A00031_var*
begin
//#UC START# *4CC8189D02DF_4CC815A00031_impl*
 Result := True;
//#UC END# *4CC8189D02DF_4CC815A00031_impl*
end;//_SelectTablePart_.NeedSelection

function _SelectTablePart_.GetTablePara(const aDocument: InevParaList): InevParaList;
//#UC START# *4CC818F4022D_4CC815A00031_var*
//#UC END# *4CC818F4022D_4CC815A00031_var*
begin
//#UC START# *4CC818F4022D_4CC815A00031_impl*
 Result := aDocument.Para[0].AsList;
//#UC END# *4CC818F4022D_4CC815A00031_impl*
end;//_SelectTablePart_.GetTablePara

procedure _SelectTablePart_.GetSelectParam(out aStartRow: Integer;
  out aStartCell: Integer;
  out aFinishRow: Integer;
  out aFinishCell: Integer);
//#UC START# *4CC81D4101AC_4CC815A00031_var*
//#UC END# *4CC81D4101AC_4CC815A00031_var*
begin
//#UC START# *4CC81D4101AC_4CC815A00031_impl*
 aStartRow := 0;
 aStartCell := 0;
 aFinishRow := 0;
 aFinishCell := 0;
//#UC END# *4CC81D4101AC_4CC815A00031_impl*
end;//_SelectTablePart_.GetSelectParam

function _SelectTablePart_.SelectColumn(var aColID: Integer): Boolean;
//#UC START# *4C9874060367_4CC815A00031_var*
//#UC END# *4C9874060367_4CC815A00031_var*
begin
//#UC START# *4C9874060367_4CC815A00031_impl*
 Result := False;
 aColID := 0;
//#UC END# *4C9874060367_4CC815A00031_impl*
end;//_SelectTablePart_.SelectColumn

function _SelectTablePart_.SelectTableWholly: Boolean;
//#UC START# *4C34625E021F_4CC815A00031_var*
//#UC END# *4C34625E021F_4CC815A00031_var*
begin
//#UC START# *4C34625E021F_4CC815A00031_impl*
 Result := False;
//#UC END# *4C34625E021F_4CC815A00031_impl*
end;//_SelectTablePart_.SelectTableWholly

{$IfEnd} //not NoScripts

{$EndIf SelectTablePart_imp}
