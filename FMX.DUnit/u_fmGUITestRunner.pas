unit u_fmGUITestRunner;

interface

uses
 TestFramework,
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView, FMX.ListView.Types, FMX.ListView;

type
 TfmGUITestRunner = class(TForm, ITestListener)
  TestTree: TTreeView;
  btnAddItem: TButton;
  btnGetSelectedItems: TButton;
  ToolBar1: TToolBar;
  btRunAllTest: TSpeedButton;
  btnAddListViewItem: TButton;
  lvResult: TListView;
  btnNodeToTest: TButton;
    btnTestToNode: TButton;
  procedure btnAddItemClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure btnGetSelectedItemsClick(Sender: TObject);
  procedure FormDestroy(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure btRunAllTestClick(Sender: TObject);
  procedure btnAddListViewItemClick(Sender: TObject);
  procedure btnNodeToTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnTestToNodeClick(Sender: TObject);
 protected
  FSuite: ITest;
  FTests: TInterfaceList;
  FSelectedTests: TInterfaceList;
  FTestResult: TTestResult;
  FTotalTime: Int64;

  procedure SetSuite(Value: ITest);
  procedure InitTree;
  procedure FillTestTree(aTest: ITest); overload;
  procedure FillTestTree(aRootNode: TTreeViewItem; aTest: ITest); overload;
  procedure RunTheTest(aTest: ITest);

  procedure UpdateStatus(const fullUpdate: Boolean);

  function NodeToTest(node: TTreeViewItem): ITest;
  function TestToNode(test: ITest): TTreeViewItem;
  function SelectedTest: ITest;
  procedure ListSelectedTests;

  procedure SetupGUINodes(aNode: TTreeViewItem);
 public
  { : The test suite to be run in this runner }
  property Suite: ITest read FSuite write SetSuite;
  property TestResult: TTestResult read FTestResult write FTestResult;

  // IListener
  procedure TestingStarts;
  procedure StartTest(aTest: ITest);

  procedure AddSuccess(test: ITest);
  procedure AddError(error: TTestFailure);
  procedure AddFailure(Failure: TTestFailure);

  procedure EndTest(test: ITest);
  procedure TestingEnds(TestResult: TTestResult);

  function ShouldRunTest(test: ITest): Boolean;
  // IStatusListener
  procedure Status(test: ITest; const Msg: string);
 end;

procedure RunTestModeless(aTest: ITest);
procedure RunRegisteredTestsModeless;

var
 fmGUITestRunner: TfmGUITestRunner;

implementation

uses
 System.Generics.Collections,
 System.Rtti,
 System.TypInfo;
{$R *.fmx}

procedure RunTestModeless(aTest: ITest);
var
 l_GUI: TfmGUITestRunner;
begin
 l_GUI := TfmGUITestRunner.Create(nil);
 l_GUI.Suite := aTest;
 l_GUI.Show;
end;

procedure RunRegisteredTestsModeless;
begin
 RunTestModeless(registeredTests)
end;

procedure TraverseTreeItems(const anItem: TTreeViewItem; var ResultList: TList<TTreeViewItem>);
var
 i: Integer;
begin
 if anItem.IsChecked then
  ResultList.Add(anItem);

 for i := 0 to Pred(anItem.Count) do
  TraverseTreeItems(anItem.Items[i], ResultList);
end;

procedure TraverseTree(const aTree: TTreeView; var ResultList: TList<TTreeViewItem>);
var
 i: Integer;
begin
 for i := 0 to Pred(aTree.Count) do
  TraverseTreeItems(aTree.Items[i], ResultList);
end;

procedure TfmGUITestRunner.AddError(error: TTestFailure);
begin
 assert(False);
end;

procedure TfmGUITestRunner.AddFailure(Failure: TTestFailure);
begin
 assert(False);
end;

procedure TfmGUITestRunner.AddSuccess(test: ITest);
begin
 assert(False);
end;

procedure TfmGUITestRunner.btnAddItemClick(Sender: TObject);
var
 l_TreeViewItem: TTreeViewItem;
begin
 TestTree.BeginUpdate;

 l_TreeViewItem := TTreeViewItem.Create(self);
 l_TreeViewItem.Text := 'Item' + IntToStr(TestTree.GlobalCount);

 if TestTree.Selected = nil then
  TestTree.AddObject(l_TreeViewItem)
 else
  TestTree.Selected.AddObject(l_TreeViewItem);

 TestTree.InvalidateContentSize;
 TestTree.EndUpdate;
end;

procedure TfmGUITestRunner.btnAddListViewItemClick(Sender: TObject);
var
 l_Item: TListViewItem;
begin
 lvResult.BeginUpdate;
 l_Item := lvResult.Items.Add;
 l_Item.Text := 'Result';
 lvResult.EndUpdate;
end;

procedure TfmGUITestRunner.btnGetSelectedItemsClick(Sender: TObject);
var
 ResultList: TList<TTreeViewItem>;
 l_Item: TTreeViewItem;
 l_ResutlMsg: string;
begin
 ResultList := TList<TTreeViewItem>.Create;

 TraverseTree(TestTree, ResultList);

 for l_Item in ResultList do
  l_ResutlMsg := l_ResutlMsg + l_Item.Text + ';';

 ShowMessage(l_ResutlMsg);

 FreeAndNil(ResultList);
end;

procedure TfmGUITestRunner.btnNodeToTestClick(Sender: TObject);
var
 l_TTreeViewItem: TTreeViewItem;
 l_Test: ITest;
begin
 l_TTreeViewItem := TestTree.Selected;
 assert(l_Test = nil);
 l_Test := NodeToTest(l_TTreeViewItem);
 ShowMessage(l_Test.Name);
end;

procedure TfmGUITestRunner.btRunAllTestClick(Sender: TObject);
begin
 ShowMessage('RunAll');
 if Suite = nil then
  EXIT;

 // Setup;
 RunTheTest(Suite);
end;

procedure TfmGUITestRunner.btnTestToNodeClick(Sender: TObject);
begin
 ShowMessage((TestToNode(FTests.Items[2] as ITest)).Text);
end;

procedure TfmGUITestRunner.EndTest(test: ITest);
begin
 assert(False);
end;

procedure TfmGUITestRunner.FillTestTree(aRootNode: TTreeViewItem; aTest: ITest);
var
 TestTests: IInterfaceList;
 i: Integer;
 l_TreeViewItem: TTreeViewItem;
 l_TestValue: TValue;
begin
 if aTest = nil then
  EXIT;

 l_TreeViewItem := TTreeViewItem.Create(self);
 l_TreeViewItem.IsChecked := True;

 // TValue.Make(@aTest, TypeInfo(Integer),  FTests.Add(aTest));
 // l_TreeViewItem.Data := FTests.Add(aTest);

 l_TreeViewItem.Tag := FTests.Add(aTest);
 l_TreeViewItem.Text := aTest.Name;

 if aRootNode = nil then
  TestTree.AddObject(l_TreeViewItem)
 else
  aRootNode.AddObject(l_TreeViewItem);

 TestTests := aTest.Tests;
 for i := 0 to TestTests.Count - 1 do
 begin
  FillTestTree(l_TreeViewItem, TestTests[i] as ITest);
 end;
end;

procedure TfmGUITestRunner.FillTestTree(aTest: ITest);
begin
 TestTree.Clear;
 FTests.Clear;

 TestTree.BeginUpdate;

 FillTestTree(nil, Suite);

 TestTree.EndUpdate;
end;

procedure TfmGUITestRunner.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Application.Terminate;
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 inherited;
 TestTree.ShowCheckboxes := True;

 FTests := TInterfaceList.Create;
end;

procedure TfmGUITestRunner.FormDestroy(Sender: TObject);
begin
 Suite := nil;
 FreeAndNil(FTests);
 inherited;
end;

procedure TfmGUITestRunner.FormShow(Sender: TObject);
var
 i: integer;
 l_Test : ITest;
begin
 for i := 0 to Pred(TestTree.Count) do
 begin
  l_Test := NodeToTest(TestTree.Items[i]);
  assert(Assigned(l_Test));
  l_Test.GUIObject := TestTree.Items[i];
  SetupGUINodes(TestTree.Items[i]);
 end;

end;

procedure TfmGUITestRunner.InitTree;
begin
 FTests.Clear;
 FillTestTree(Suite);
 TestTree.ExpandAll;
end;

procedure TfmGUITestRunner.ListSelectedTests;
begin
 assert(False);
end;

function TfmGUITestRunner.NodeToTest(node: TTreeViewItem): ITest;
var
 l_Test: ITest;
 l_Value: TValue;
 l_Index: Integer;
begin
 assert(node.Tag >= 0);
 l_Index := node.Tag;
 Result := FTests[l_Index] as ITest;
end;

procedure TfmGUITestRunner.RunTheTest(aTest: ITest);
begin
 TestResult := TTestResult.Create;
 try
  TestResult.addListener(self);
  aTest.run(TestResult);
 finally
  // FErrorCount := TestResult.ErrorCount;
  // FFailureCount := TestResult.FailureCount;
  FreeAndNil(FTestResult);
 end;
end;

function TfmGUITestRunner.SelectedTest: ITest;
begin
 assert(False);
end;

procedure TfmGUITestRunner.SetSuite(Value: ITest);
begin
 FSuite := Value;

 if FSuite <> nil then
  InitTree;
end;

procedure TfmGUITestRunner.SetupGUINodes(aNode: TTreeViewItem);
var
 l_Node: TTreeViewItem;
 l_Test: ITest;

 i: Integer;
begin
 for i := 0 to Pred(aNode.Count) do
 begin
  l_Test := NodeToTest(aNode.Items[i]);
  assert(Assigned(l_Test));
  l_Test.GUIObject := aNode.Items[i];
  SetupGUINodes(aNode.Items[i]);
 end;
end;

function TfmGUITestRunner.ShouldRunTest(test: ITest): Boolean;
begin
 Result := True;
 { if FSelectedTests = nil then
   Result := test.Enabled
   else
   Result := FSelectedTests.IndexOf(test as ITest) >= 0; }
end;

procedure TfmGUITestRunner.StartTest(aTest: ITest);
var
 l_Node: TTreeViewItem;
begin
 assert(assigned(TestResult));
 assert(assigned(aTest));
 l_Node := TestToNode(aTest);
 assert(assigned(l_Node));
 // SetTreeNodeImage(node, imgRunning);
 { if ShowTestedNodeAction.Checked then
   begin
   MakeNodeVisible(node);
   TestTree.Update;
   end;
   ClearStatusMessage; }
 UpdateStatus(False);
end;

procedure TfmGUITestRunner.Status(test: ITest; const Msg: string);
begin
 assert(False);
end;

procedure TfmGUITestRunner.TestingEnds(TestResult: TTestResult);
begin
 assert(False);
end;

procedure TfmGUITestRunner.TestingStarts;
begin
 FTotalTime := 0;
 UpdateStatus(True);
end;

function TfmGUITestRunner.TestToNode(test: ITest): TTreeViewItem;
begin
  assert(assigned(test));

  Result := test.GUIObject as TTreeViewItem;

  assert(assigned(Result));
end;

procedure TfmGUITestRunner.UpdateStatus(const fullUpdate: Boolean);
begin
 assert(False);
end;

end.
