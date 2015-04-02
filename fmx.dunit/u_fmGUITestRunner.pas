unit u_fmGUITestRunner;

interface

uses
 TestFramework,
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView, FMX.ListView.Types, FMX.ListView, System.Generics.Collections,
 FMX.DUnit.Interfaces, System.Actions, FMX.ActnList, FMX.Controls.Presentation,
  FMX.Edit
 ;

type
 TDoSomethingWithNode = reference to procedure (const aItem: TTreeViewItem);

type
 TfmGUITestRunner = class(TForm, ITestListener, ImsLog)
  ToolBar1: TToolBar;
  btRunAllTest: TSpeedButton;
  pnlMain: TPanel;
  tvTestTree: TTreeView;
  pnlBottom: TPanel;
  lvFailureListView: TListView;
  lblTime: TLabel;
  btnUncheckAll: TSpeedButton;
  lblErros: TLabel;
  lblErrorCount: TLabel;
  lblFailure: TLabel;
  lblFailureCount: TLabel;
  lblTimeCount: TLabel;
  lblRunned: TLabel;
  btnDeleteEtalon: TSpeedButton;
  btnSelectFailed: TSpeedButton;
  btnDiff: TSpeedButton;
  chkIsUseDiffer: TCheckBox;
  actlstMain: TActionList;
  actRunAllTest: TAction;
  actRunDiff: TAction;
  actCheckAll: TAction;
  actUncheckAll: TAction;
  actSelectFailed: TAction;
  actDelEtalons: TAction;
  edtSearch: TEdit;
  btnCheckAll: TSpeedButton;
  btnFirst: TSpeedButton;
  btnSearchNext: TSpeedButton;
  actSearchFirst: TAction;
  actSearchNext: TAction;
  procedure FormCreate(Sender: TObject);
  procedure tvTestTreeChangeCheck(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure chkIsUseDifferChange(Sender: TObject);
  procedure actRunAllTestExecute(Sender: TObject);
  procedure actRunDiffExecute(Sender: TObject);
  procedure actCheckAllExecute(Sender: TObject);
  procedure actUncheckAllExecute(Sender: TObject);
  procedure actSelectFailedExecute(Sender: TObject);
  procedure actDelEtalonsExecute(Sender: TObject);
  procedure actSearchFirstExecute(Sender: TObject);
  procedure actSearchNextExecute(Sender: TObject);
 protected
  FSuite: ITest;
  FTests: TInterfaceList;
  FTestResult: TTestResult;
  FSelectedTests: TInterfaceList;
  FTotalTime: Int64;
  f_Runned : Integer;
  f_GlobalIndex : integer;

  procedure SetSuite(aValue: ITest);
  procedure InitTree;
  procedure FillTestTree(aTest: ITest); overload;
  procedure RunTheTest(aTest: ITest);

  function NodeToTest(aNode: TTreeViewItem): ITest;
  function TestToNode(test: ITest): TTreeViewItem;

  procedure SetError(const aNode: ITest);
  procedure SetFailed(const aNode: ITest);
  procedure SetSuccess(const aNode: ITest);
  procedure SetTreeNodeFont(aNode: TTreeViewItem; aColor: TAlphaColor); overload;
  procedure SetTreeNodeFont(const aNode: ITest; aColor: TAlphaColor); overload;

  function AddFailureNode(aFailure: TTestFailure; anError: Boolean): TListViewItem;

  procedure SetNodeEnabled(aNode: TTreeViewItem; aValue: Boolean);

  procedure ClearResult;

  procedure TraverseTree(const aTree: TTreeView; aLambda: TDoSomethingWithNode);
  procedure SetFailure(aFailure: TTestFailure; anError: Boolean);
  procedure UnCheckAllTest;
  procedure TraverseUp(const aNode: TTreeViewItem; aLambda: TDoSomethingWithNode);
 public
  property Suite: ITest
   read FSuite
   write SetSuite;
  property TestResult: TTestResult read FTestResult write FTestResult;
  destructor Destroy; override;

  // IListener
  procedure TestingStarts;
  procedure StartTest(aTest: ITest);

  procedure AddSuccess(aTest: ITest);
  procedure AddError(aFailure: TTestFailure);
  procedure AddFailure(aFailure: TTestFailure);

  procedure EndTest(test: ITest);
  procedure TestingEnds(aTestResult: TTestResult);

  function ShouldRunTest(aTest: ITest): Boolean;
  // IStatusListener
  procedure Status(aTest: ITest; const aMessage: string);
 end;

type
 TTestNode = class(TTreeViewItem)
  private
   f_Test: ITest;
   f_Failed: Boolean;
  public
   constructor Create(aParent: TFmxObject; const aTest: ITest);
   property Test: ITest
    read f_Test;
   property Failed: Boolean
    read f_Failed
    write f_Failed;
 end;//TTestNode

procedure RunTestModeless(aTest: ITest);
procedure RunRegisteredTestsModeless;

const
 c_ConfigFile = '.DUnit.ini';

implementation

uses
 System.TypInfo,
 FMX.DUnit.msAppLog,
 FMX.DUnit.Settings
 ;

{$R *.fmx}

procedure RunTestModeless(aTest: ITest);
var
 l_GUI: TfmGUITestRunner;
begin
 l_GUI := TfmGUITestRunner.Create(Application);
 l_GUI.Suite := aTest;
 l_GUI.Show;
end;

procedure RunRegisteredTestsModeless;
begin
 RunTestModeless(registeredTests)
end;

const
 c_ColorOk = TAlphaColorRec.Green;
 c_ColorError = TAlphaColorRec.Red;
 c_ColorFailure = TAlphaColorRec.Fuchsia;

procedure TfmGUITestRunner.SetError(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorError);
end;

procedure TfmGUITestRunner.SetFailed(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorFailure);
end;

procedure TfmGUITestRunner.SetFailure(aFailure: TTestFailure; anError: Boolean);
begin
 if anError then
  SetError(aFailure.failedTest)
 else
  SetFailed(aFailure.failedTest);

 AddFailureNode(aFailure, anError);
end;

procedure TfmGUITestRunner.actCheckAllExecute(Sender: TObject);
begin
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem)
  begin
   assert(aNode <> nil);
   aNode.IsChecked := True;
  end
 );
end;

procedure TfmGUITestRunner.actDelEtalonsExecute(Sender: TObject);
begin
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem)
  var
   l_Test : ImsEtalonsHolder;
  begin
   assert(aNode <> nil);
   if (aNode.IsChecked and
       Supports(NodeToTest(aNode), ImsEtalonsHolder, l_Test)) then
    l_Test.DeleteEtalonFile(Self);
  end
 );
end;

procedure TfmGUITestRunner.actRunAllTestExecute(Sender: TObject);
begin
 if Suite = nil then
  Exit;
 ClearResult;
 RunTheTest(Suite);
end;

procedure TfmGUITestRunner.actRunDiffExecute(Sender: TObject);
var
 l_Prev : Boolean;
begin
 //ClearResult;
 l_Prev := TmsDUnitSettings.Instance.IsUseDiffer;
 TmsDUnitSettings.Instance.IsUseDiffer := true;
 try
  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem)
   var
    l_Test : ITest;
    l_EtalonsHolder : ImsEtalonsHolder;
   begin
    assert(aNode <> nil);
    if aNode.IsChecked then
    begin
     l_Test := NodeToTest(aNode);
     if Supports(l_Test, ImsEtalonsHolder, l_EtalonsHolder) then
     try
      if l_EtalonsHolder.RunDiff(Self) then
       SetSuccess(l_Test);
     except
      SetError(l_Test);
     end;//try..finally
    end;//aNode.IsChecked
   end
  );//TraverseTree
 finally
  TmsDUnitSettings.Instance.IsUseDiffer := l_Prev;
 end;//try..finally
end;

procedure TfmGUITestRunner.actSearchFirstExecute(Sender: TObject);
var
 l_Item: TTreeViewItem;
 l_I: Integer;
 l_TestName, l_SearchText : string;
begin
 l_SearchText := edtSearch.Text;
 if l_SearchText = '' then Exit;

 for l_I := 0 to tvTestTree.GlobalCount - 1 do
 begin
  l_Item := tvTestTree.ItemByGlobalIndex(l_I);
  l_TestName := l_Item.Text;

  l_TestName := LowerCase(l_TestName);
  l_SearchText := LowerCase(l_SearchText);

  if pos(l_SearchText, l_TestName)>0 then
  begin
   l_Item.IsSelected := True;
   f_GlobalIndex := l_I;
   Exit;
  end;
 end;
end;

procedure TfmGUITestRunner.actSearchNextExecute(Sender: TObject);
var
 l_Item: TTreeViewItem;
 l_I : Integer;
 l_TestName, l_SearchText : string;
begin
 l_SearchText := edtSearch.Text;
 if l_SearchText = '' then Exit;

 l_Item := tvTestTree.Selected;
 for l_I := f_GlobalIndex + 1 to tvTestTree.GlobalCount - 1 do
 begin
  l_Item := tvTestTree.ItemByGlobalIndex(l_I);
  l_TestName := l_Item.Text;

  l_TestName := LowerCase(l_TestName);
  l_SearchText := LowerCase(l_SearchText);

  if pos(l_SearchText, l_TestName)>0 then
  begin
   l_Item.IsSelected := True;
   f_GlobalIndex := l_I;
   Exit;
  end;
 end;
end;

procedure TfmGUITestRunner.actSelectFailedExecute(Sender: TObject);
begin
 UnCheckAllTest;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem)
  begin
   if (aNode as TTestNode).Failed then
   begin
    TraverseUp(aNode,
     procedure (const aNode: TTreeViewItem)
     begin
      aNode.IsChecked := True;
     end
    );
   end;//(aNode as TTestNode).Failure
  end
 );
end;

procedure TfmGUITestRunner.actUncheckAllExecute(Sender: TObject);
begin
 UnCheckAllTest;
end;

procedure TfmGUITestRunner.AddError(aFailure: TTestFailure);
begin
 SetFailure(aFailure, true);
end;

procedure TfmGUITestRunner.AddFailure(aFailure: TTestFailure);
begin
 SetFailure(aFailure, false);
end;

function TfmGUITestRunner.AddFailureNode(aFailure: TTestFailure; anError: Boolean): TListViewItem;
var
 l_Item: TListViewItem;
 l_Node: TTreeViewItem;
begin
 assert(assigned(aFailure));
 l_Item := lvFailureListView.Items.Add;

 l_Node := TestToNode(aFailure.failedTest);
 Assert(l_Node <> nil);
 (l_Node as TTestNode).Failed := True;
 l_Item.Text := l_Node.ParentItem.Text + '.' + aFailure.failedTest.Name + '; ' +
                aFailure.thrownExceptionName + '; ' + aFailure.thrownExceptionMessage + '; ' +
                aFailure.LocationInfo + '; ' + aFailure.AddressInfo + '; ' +
                aFailure.StackTrace;

 while l_Node <> nil do
 begin
  l_Node.Expand;
  l_Node := l_Node.ParentItem;
 end; // l_Node <> nil

 Result := l_Item;
end;

procedure TfmGUITestRunner.SetSuccess(const aNode: ITest);
begin
 SetTreeNodeFont(aNode, c_ColorOk);
end;

procedure TfmGUITestRunner.AddSuccess(aTest: ITest);
begin
 assert(assigned(aTest));
 SetSuccess(aTest);
end;


procedure TfmGUITestRunner.UnCheckAllTest;
begin
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem)
  begin
   assert(aNode <> nil);
   aNode.IsChecked := False;
  end
 );
end;

procedure TfmGUITestRunner.chkIsUseDifferChange(Sender: TObject);
begin
 TmsDUnitSettings.Instance.IsUseDiffer := chkIsUseDiffer.IsChecked;
end;

procedure TfmGUITestRunner.TraverseTree(const aTree: TTreeView; aLambda: TDoSomethingWithNode);

 procedure TraverseNode(const aNode: TTreeViewItem);
 var
  l_Index: Integer;
 begin
  for l_Index := 0 to Pred(aNode.Count) do
   TraverseNode(aNode.Items[l_Index]);
  aLambda(aNode);
 end;

var
 l_Index: Integer;
begin
 for l_Index := 0 to Pred(aTree.Count) do
  TraverseNode(aTree.Items[l_Index]);
end;

procedure TfmGUITestRunner.TraverseUp(const aNode: TTreeViewItem;
                                            aLambda: TDoSomethingWithNode);
var
 l_Node : TTreeViewItem;
begin
 l_Node := aNode;
 repeat
  aLambda(l_Node);
  l_Node := l_Node.ParentItem;
 until (l_Node = nil);
end;

procedure TfmGUITestRunner.ClearResult;
begin
 lvFailureListView.ClearItems;
 f_Runned := 0;
 TraverseTree(tvTestTree,
  procedure (const aNode: TTreeViewItem)
  begin
   SetTreeNodeFont(aNode, TAlphaColorRec.Black)
  end
 );
end;

destructor TfmGUITestRunner.Destroy;
begin
 FSuite.SaveConfiguration(ParamStr(0) + c_ConfigFile, True, False);
 Suite := nil;
 inherited;
end;

procedure TfmGUITestRunner.EndTest(test: ITest);

   function FormatElapsedTime(milli: Int64):string;
   var
     h,nn,ss,zzz: Cardinal;
   begin
     h := milli div 3600000;
     milli := milli mod 3600000;
     nn := milli div 60000;
     milli := milli mod 60000;
     ss := milli div 1000;
     milli := milli mod 1000;
     zzz := milli;
     Result := Format('%d:%2.2d:%2.2d.%3.3d', [h, nn, ss, zzz]);
   end;

begin
 lblTimeCount.Text:= FormatElapsedTime (FTestResult.TotalTime);
 lblErrorCount.Text:= IntToStr(FTestResult.ErrorCount);
 lblFailureCount.Text:= IntToStr(FTestResult.FailureCount);
 Inc(f_Runned);
 lblRunned.Text := IntToStr(f_Runned);
end;

constructor TTestNode.Create(aParent: TFmxObject; const aTest: ITest);
begin
 inherited Create(aParent);
 IsChecked := True;
 f_Test := aTest;
 Text := aTest.Name;
 aParent.AddObject(Self);
 aTest.GUIObject := Self;
end;

procedure TfmGUITestRunner.FillTestTree(aTest: ITest);
 procedure DoFillTestTree(aRootNode: TTestNode);
 var
  l_TestTests: IInterfaceList;
  l_Index: Integer;
  l_Node: TTestNode;
 begin//DoFillTestTree
  l_TestTests := aRootNode.Test.Tests;
  for l_Index := 0 to l_TestTests.Count - 1 do
   DoFillTestTree(TTestNode.Create(aRootNode, (l_TestTests[l_Index] as ITest)));
 end;//DoFillTestTree

begin
 tvTestTree.Clear;
 tvTestTree.BeginUpdate;
 try
  DoFillTestTree(TTestNode.Create(tvTestTree, Suite));
 finally
  tvTestTree.EndUpdate;
 end;//try..finally
end;

procedure TfmGUITestRunner.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 inherited;
 tvTestTree.ShowCheckboxes := True;
end;

procedure TfmGUITestRunner.InitTree;
begin
 FillTestTree(Suite);
 tvTestTree.ExpandAll;
end;

function TfmGUITestRunner.NodeToTest(aNode: TTreeViewItem): ITest;
begin
 Result := (aNode As TTestNode).Test;
end;

procedure TfmGUITestRunner.RunTheTest(aTest: ITest);
var
 l_Test : ImsEtalonsHolder;
begin
 TestResult := TTestResult.Create;
 try
  TestResult.addListener(self);
  aTest.run(TestResult);
 finally
  // FErrorCount := TestResult.ErrorCount;
  // FFailureCount := TestResult.FailureCount;
  FreeAndNil(FTestResult);
 end; // try..finnaly
end;

procedure TfmGUITestRunner.SetSuite(aValue: ITest);
begin
 FSuite := aValue;
 if (FSuite <> nil) then
 begin
  // Проставляет всем тестам из набора Enabled := False, если находит их в конфиге
  FSuite.LoadConfiguration(ParamStr(0) + c_ConfigFile, True, False);
  InitTree;

  TraverseTree(tvTestTree,
   procedure (const aNode: TTreeViewItem)
   var
    l_Test : ITest;
   begin
    l_Test := NodeToTest(aNode);

    assert(l_Test <> nil);

    if l_Test.Enabled then
    begin
     aNode.IsChecked := True;

     TraverseUp(aNode,
      procedure (const aParentNode: TTreeViewItem)
      begin
       aParentNode.IsChecked := True;
      end
     );
    end // l_Test.Enabled
    else
     aNode.IsChecked := False;
   end
  );
 end; // FSuite <> nil
end;

procedure TfmGUITestRunner.SetTreeNodeFont(const aNode: ITest; aColor: TAlphaColor);
begin
 SetTreeNodeFont(TestToNode(aNode), aColor);
end;

procedure TfmGUITestRunner.SetTreeNodeFont(aNode: TTreeViewItem; aColor: TAlphaColor);
begin
 // Пока не укажешь какие из настроек стиля разрешены к работе, они работать не будут
 aNode.StyledSettings := aNode.StyledSettings -
{$IF DEFined(VER270) OR DEFined(VER280)} [TStyledSetting.FontColor, TStyledSetting.Style];
{$ENDIF}
{$IFDEF VER260} [TStyledSetting.ssFontColor, TStyledSetting.ssStyle]
 ;
{$ENDIF}
 aNode.Font.Style := [TFontStyle.fsBold];
 aNode.FontColor := aColor;
end;

function TfmGUITestRunner.ShouldRunTest(aTest: ITest): Boolean;
var
 l_Test: ITest;
begin
 l_Test := aTest;
 Result := l_Test.Enabled
end;

procedure TfmGUITestRunner.StartTest(aTest: ITest);
var
 l_Node: TTreeViewItem;
begin
 assert(assigned(TestResult));
 assert(assigned(aTest));

 l_Node := TestToNode(aTest);

 assert(assigned(l_Node));
end;

procedure TfmGUITestRunner.Status(aTest: ITest; const aMessage: string);
begin
 assert(False);
end;

procedure TfmGUITestRunner.TestingEnds(aTestResult: TTestResult);
begin
end;

procedure TfmGUITestRunner.TestingStarts;
begin
end;

function TfmGUITestRunner.TestToNode(test: ITest): TTreeViewItem;
begin
 assert(assigned(test));

 Result := test.GUIObject as TTreeViewItem;

 assert(assigned(Result));
end;

procedure TfmGUITestRunner.tvTestTreeChangeCheck(Sender: TObject);
var
 l_Node :TTreeViewItem;
 l_IsChecked : Boolean;
begin
 if not (Sender is TTreeViewItem) then Exit;
 l_Node := Sender as TTreeViewItem;
 l_IsChecked := l_Node.IsChecked;

 TraverseUp(l_Node,
  procedure (const l_Node: TTreeViewItem)
  begin
   if l_IsChecked then
    l_Node.IsChecked := l_IsChecked;
   SetNodeEnabled(l_Node, l_Node.IsChecked);
  end
  );
end;

procedure TfmGUITestRunner.SetNodeEnabled(aNode: TTreeViewItem; aValue: Boolean);
var
 l_Test: ITest;
begin
 l_Test := NodeToTest(aNode);
 if l_Test <> nil then
  l_Test.Enabled := aValue;
end;

end.

