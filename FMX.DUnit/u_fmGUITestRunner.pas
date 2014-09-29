unit u_fmGUITestRunner;

interface

uses
 TestFramework,
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView;

type
 TfmGUITestRunner = class(TForm, ITestListener)
  TestTree: TTreeView;
  btnAddItem: TButton;
  btnGetSelectedItems: TButton;
  ToolBar1: TToolBar;
  btRunAllTest: TSpeedButton;
  procedure btnAddItemClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure btnGetSelectedItemsClick(Sender: TObject);
  procedure FormDestroy(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure btRunAllTestClick(Sender: TObject);
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

  procedure UpdateStatus(const fullUpdate:Boolean);

  function  NodeToTest(node :TTreeViewItem) :ITest;
  function  TestToNode(test :ITest) :TTreeViewItem;
  function  SelectedTest :ITest;
  procedure ListSelectedTests;
 public
  { : The test suite to be run in this runner }
  property Suite: ITest read FSuite write SetSuite;
  property TestResult: TTestResult read FTestResult write FTestResult;

  // IListener
  procedure TestingStarts;
  procedure StartTest(test: ITest);

  procedure AddSuccess(test: ITest);
  procedure AddError(error: TTestFailure);
  procedure AddFailure(Failure: TTestFailure);

  procedure EndTest(test: ITest);
  procedure TestingEnds(testResult :TTestResult);

  function  ShouldRunTest(test :ITest):Boolean;
  // IStatusListener
  procedure Status(test :ITest; const Msg :string);
 end;

procedure RunTestModeless(aTest: ITest);
procedure RunRegisteredTestsModeless;

var
 fmGUITestRunner: TfmGUITestRunner;

implementation

uses
 System.Generics.Collections;
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

procedure TfmGUITestRunner.btRunAllTestClick(Sender: TObject);
begin
 ShowMessage('RunAll');
 if Suite = nil then
  EXIT;

 // Setup;
 RunTheTest(Suite);
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
begin
 if aTest = nil then
  EXIT;

 l_TreeViewItem := TTreeViewItem.Create(self);
 l_TreeViewItem.Text := aTest.Name;
 l_TreeViewItem.IsChecked := True;

 if aRootNode = nil then
  TestTree.AddObject(l_TreeViewItem)
 else
  aRootNode.AddObject(l_TreeViewItem);

 FTests.Add(aTest);

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
begin
 assert(False);
end;

procedure TfmGUITestRunner.RunTheTest(aTest: ITest);
begin
 TestResult := TTestResult.create;
 try
   TestResult.addListener(self);
   aTest.run(TestResult);
 finally
//FErrorCount := TestResult.ErrorCount;
//FFailureCount := TestResult.FailureCount;
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

function TfmGUITestRunner.ShouldRunTest(test: ITest): Boolean;
begin
 if FSelectedTests = nil then
   Result := test.Enabled
 else
   Result := FSelectedTests.IndexOf(test as ITest) >= 0;
end;

procedure TfmGUITestRunner.StartTest(test: ITest);
var
  node :TTreeViewItem;
begin
 assert(False);
  assert(assigned(TestResult));
  assert(assigned(test));
  node := TestToNode(test);
  assert(assigned(node));
//  SetTreeNodeImage(node, imgRunning);
{  if ShowTestedNodeAction.Checked then
  begin
    MakeNodeVisible(node);
    TestTree.Update;
  end;
  ClearStatusMessage;}
  UpdateStatus(False);
end;

procedure TfmGUITestRunner.Status(test: ITest; const Msg: string);
begin
 assert(False);
end;

procedure TfmGUITestRunner.TestingEnds(testResult: TTestResult);
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
 assert(False);
end;

procedure TfmGUITestRunner.UpdateStatus(const fullUpdate: Boolean);
begin
 assert(False);
end;

end.
