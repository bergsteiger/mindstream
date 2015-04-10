unit kwPopEditorPrintTableCellsParams;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopEditorPrintTableCellsParams.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EditorFromStackKeyWords::pop_editor_PrintTableCellsParams
//
// *Формат:* anEditorControl pop:editor:PrintTableCellsParams
// *Описание:* Печатает структуру информацию ячеек таблицы: тип объединения, если объединенная, то
// номер ячейки в строке сверху, номер ячейки в строке снизу и номер начальной ячейки/номер строки,
// где эта ячейка. Результат выводится в обычный файл вывода результатов.
// *Пример:*
// {code}
// focused:control:push pop:editor:PrintTableCellsParams
// {code}
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
  tfwScriptingInterfaces,
  Controls,
  Classes,
  tfwRegisterableWord,
  nevTools
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
 _kwEditorGetTableFromCursor_Parent_ = _kwEditorFromStackWord_;
 {$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}
 TkwPopEditorPrintTableCellsParams = {final} class(_kwEditorGetTableFromCursor_)
  {* *Формат:* anEditorControl pop:editor:PrintTableCellsParams
*Описание:* Печатает структуру информацию ячеек таблицы: тип объединения, если объединенная, то номер ячейки в строке сверху, номер ячейки в строке снизу и номер начальной ячейки/номер строки, где эта ячейка. Результат выводится в обычный файл вывода результатов.
*Пример:*
[code] 
focused:control:push pop:editor:PrintTableCellsParams
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopEditorPrintTableCellsParams
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  nevBase,
  nevFormatInfoUtils,
  l3Base,
  SysUtils,
  nevFacade,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  afwFacade,
  Forms,
  Table_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopEditorPrintTableCellsParams;

{$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}

{$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}

// start class TkwPopEditorPrintTableCellsParams

procedure TkwPopEditorPrintTableCellsParams.DoWithEditor(const aCtx: TtfwContext;
  anEditor: TevCustomEditorWindow);
//#UC START# *4F4CB81200CA_5028D0B602D0_var*
var
 l_TableFI: TnevFormatInfoPrim;

 function lp_DoRow(const aRow: InevPara; anRowIndex: TnevParaIndex): Boolean;

  function lp_DoCell(const aCell: InevPara; anCellIndex: TnevParaIndex): Boolean;
  var
   l_NCell: InevPara;
  begin
   aCtx.rCaller.Print(l3CStr(Format('---Cell = %d ---', [anCellIndex])));
   aCtx.rCaller.Print(l3CStr(Format('Merge Status = %d', [Ord(aCell.OverlapType)])));
   aCtx.rCaller.Print(l3CStr(Format('ChildrenCount = %d', [Ord(aCell.AsObject.ChildrenCount)])));
   if aCell.OverlapType = otLower then
   begin
    l_NCell := EvGetHeadCell(l_TableFI, aCell, False);
    if l_NCell <> nil then
     aCtx.rCaller.Print(l3CStr(Format('Header Cell PID, Owner Row PID = %d, %d', [l_NCell.PID, l_NCell.OwnerPara.PID])));
    l_NCell := EvGetContinueCell(l_TableFI, aCell, True);
    if l_NCell <> nil then
     aCtx.rCaller.Print(l3CStr(Format('Upper Continue Cell PID = %d', [l_NCell.PID])));
   end; // if aCell.OverlapType = ot_Lower then
   if aCell.OverlapType > otNone then
   begin
    l_NCell := EvGetContinueCell(l_TableFI, aCell, False);
    if l_NCell <> nil then
     aCtx.rCaller.Print(l3CStr(Format('Lower Continue Cell PID = %d', [l_NCell.PID])));
   end; // if aCell.OverlapType > ot_None then
   aCtx.rCaller.Print(l3CStr('-------'));
   Result := True;
  end;

 begin//DoChild
  aCtx.rCaller.Print(l3CStr(Format('---Row = %d ---', [anRowIndex])));
  aRow.AsList.IterateParaF(nevL2PIA(@lp_DoCell));
  aCtx.rCaller.Print(l3CStr('-------'));
  Result := True;
 end;//DoChild

var
 l_TablePoint : InevBasePoint;
//#UC END# *4F4CB81200CA_5028D0B602D0_var*
begin
//#UC START# *4F4CB81200CA_5028D0B602D0_impl*
 l_TablePoint := GetTablePoint(aCtx, anEditor.Selection.Cursor);
 l_TableFI := anEditor.View.FormatInfoByPoint(l_TablePoint);
 aCtx.rCaller.Print(l3CStr(Format('---Table = %d ---', [l_TablePoint.Obj.PID])));
 l_TablePoint.Obj^.AsPara.AsList.IterateParaF(nevL2PIA(@lp_DoRow));
 aCtx.rCaller.Print(l3CStr('-------'));
//#UC END# *4F4CB81200CA_5028D0B602D0_impl*
end;//TkwPopEditorPrintTableCellsParams.DoWithEditor

class function TkwPopEditorPrintTableCellsParams.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:editor:PrintTableCellsParams';
end;//TkwPopEditorPrintTableCellsParams.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwEditorFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.