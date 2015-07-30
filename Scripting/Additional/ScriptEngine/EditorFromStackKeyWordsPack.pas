unit EditorFromStackKeyWordsPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Everest"
// Модуль: "EditorFromStackKeyWordsPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi::ScriptEngine$Everest::EditorFromStackKeyWords::EditorFromStackKeyWordsPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwPopEditorGetShowDocumentParts,
  kwPopEditorSetShowDocumentParts,
  kwPopEditorSelectCells,
  kwPopEditorNextHyperlink,
  kwPopEditorPrevHyperlink,
  kwPopEditorScrollBottom,
  kwPopEditorScrollTo,
  kwPopEditorWheelScroll,
  kwPopEditorSelectColumn,
  kwPopEditorSelectCellsVertical,
  kwPopEditorMergeTablesWithTimer,
  kwPopEditorMergeCells,
  kwPopEditorJumpToHyperlink,
  kwPopEditorRepaintTableLinesAndCheckWithEtalon,
  kwPopEditorPushParaFromCursor,
  kwPopEditorPrintAcnhor,
  kwPopEditorPrintTableCellsParams,
  kwPopEditorSplitCell,
  kwPopEditorLP2DP,
  kwPopEditorDP2LP,
  kwPopEditorCheckContinueCells,
  kwPopEditorDocumentTailVisible,
  kwPopEditorSetDrawSpecial,
  kwPopEditorGetDrawSpecial,
  kwPopEditorSetWebStyle,
  kwPopEditorGetWebStyle,
  kwPopEditorGetLeftIndentDelta,
  kwPopEditorGetDrawLines,
  kwPopEditorSetDrawLines,
  kwPopEditorScrollLineUp,
  kwPopEditorScrollLineDown,
  kwPopEditorParaDown,
  kwPopEditorParaUp,
  kwPopEditorAtTop,
  kwPopEditorParaEnd,
  kwPopEditorParaHome,
  kwPopEditorSelectTable,
  kwPopEditorSelectAll,
  kwPopEditorSelectPara,
  kwPopEditorHasComment,
  kwPopEditorDeleteUserComment,
  kwPopEditorCurrentText,
  kwPopEditorUpdateCursorFromHotSpot,
  kwPopEditorUpdateCursorFromHotSpotEx,
  kwPopEditorTextToFile,
  kwPopEditorGetSelectionText,
  kwPopEditorGetParaByID,
  kwPopEditorGetSelectionTextInFormat,
  kwPopEditorBlockResize,
  kwPopEditorSelectCellByMouse,
  kwPopEditorSetTextParaStyle,
  kwPopEditorDeleteRow,
  kwPopEditorInsertRow,
  kwPopEditorInsertTable,
  kwPopEditorInsertPageBreak,
  kwPopEditorSplitTable,
  kwPopEditorMergeTables,
  kwPopEditorSetCursorByPoint
  {$If defined(nsTest) AND not defined(NoScripts)}
  ,
  kwPopEditorRepaintAndCheckWithEtalon
  {$IfEnd} //nsTest AND not NoScripts
  ,
  kwPopEditorCopyAndPaste2DocumentBottom,
  kwPopEditorSetAllowRubberTables,
  kwPopEditorGetAllowRubberTables,
  kwPopComboTreeCurrentNode,
  kwPopEditorResizeTableColumn,
  kwPopEditorResizeTableColumnEX,
  kwPopEditorCheckWithEtalon,
  kwPopEditorGetLMargin,
  kwPopEditorGetWrapLimit,
  kwPopEditorBlockResizeEX,
  kwPopEditorPasteRTF,
  kwPopEditorInsertStream,
  kwPopEditorSelectWord,
  kwPopEditorGetModified,
  kwPopEditorPasteEVDTroughClipboard
  {$If defined(nsTest) AND not defined(NoScripts)}
  ,
  kwBeginWaitPrint
  {$IfEnd} //nsTest AND not NoScripts
  
  {$If defined(nsTest) AND not defined(NoScripts)}
  ,
  kwEndWaitPrint
  {$IfEnd} //nsTest AND not NoScripts
  
  ;

{$IfEnd} //not NoScripts
end.