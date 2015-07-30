unit kwPopEditorPrintTableCellsParams;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Ѕиблиотека "ScriptEngine$Everest"
// ћодуль: "kwPopEditorPrintTableCellsParams.pas"
// –одные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::pop_editor_PrintTableCellsParams
//
// *‘ормат:* anEditorControl pop:editor:PrintTableCellsParams
// *ќписание:* ѕечатает структуру информацию €чеек таблицы: тип объединени€, если объединенна€, то
// номер €чейки в строке сверху, номер €чейки в строке снизу и номер начальной €чейки/номер строки,
// где эта €чейка. –езультат выводитс€ в обычный файл вывода результатов.
// *ѕример:*
// {code}
// focused:control:push pop:editor:PrintTableCellsParams
// {code}
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwEditorFromStackWord,
  nevTools,
  tfwScriptingInterfaces,
  evCustomEditorWindow
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _kwEditorGetTableFromCursor_Parent_ = TkwEditorFromStackWord;
 {$Include ..\ScriptEngine\kwEditorGetTableFromCursor.imp.pas}
 TkwPopEditorPrintTableCellsParams = {final scriptword} class(_kwEditorGetTableFromCursor_)
  {* *‘ормат:* anEditorControl pop:editor:PrintTableCellsParams
*ќписание:* ѕечатает структуру информацию €чеек таблицы: тип объединени€, если объединенна€, то номер €чейки в строке сверху, номер €чейки в строке снизу и номер начальной €чейки/номер строки, где эта €чейка. –езультат выводитс€ в обычный файл вывода результатов.
*ѕример:*
[code] 
focused:control:push pop:editor:PrintTableCellsParams
[code] }
 protected
 // realized methods
   procedure DoWithEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); override;
 protected
 // overridden protected methods
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
  Table_Const
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// –егистраци€ pop_editor_PrintTableCellsParams
 TkwPopEditorPrintTableCellsParams.RegisterInEngine;
{$IfEnd} //not NoScripts

end.