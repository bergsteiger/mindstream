unit u_fmGUITestRunner;

interface

uses
 TestFramework,
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView;

type
 TfmGUITestRunner = class(TForm)
  TestTree: TTreeView;
  btnAddItem: TButton;
  btnGetSelectedItems: TButton;
  procedure btnAddItemClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure btnGetSelectedItemsClick(Sender: TObject);
  procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
 private
 protected
  FSuite: ITest;
  FTests: TInterfaceList;
  procedure SetSuite(Value: ITest);
  procedure InitTree;
  procedure FillTestTree(aTest: ITest); overload;
  procedure FillTestTree(aRootNode: TTreeViewItem; ATest: ITest); overload;
 public
  {: The test suite to be run in this runner }
  property Suite: ITest read FSuite write SetSuite;

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
 l_GUI :TfmGUITestRunner;
begin
// l_GUI := TfmGUITestRunner.create(nil);
//  оменты д€л статьи, что бы мне потом легче было.
 l_GUI := TfmGUITestRunner.Create(nil);
 l_GUI.Suite := aTest;
 l_GUI.Show;
end;

procedure RunRegisteredTestsModeless;
begin
 RunTestModeless(registeredTests)
end;

procedure TraverseTreeItems(const anItem : TTreeViewItem; var ResultList : TList<TTreeViewItem>);
var
 i : Integer;
begin
 if anItem.IsChecked then
  ResultList.Add(anItem);

 for i := 0 to Pred(anItem.Count)  do
  TraverseTreeItems(anItem.Items[i], ResultList);
end;

procedure TraverseTree(const aTree: TTreeView; var ResultList : TList<TTreeViewItem>);
var
 i : integer;
begin
 for i := 0 to Pred(aTree.Count) do
  TraverseTreeItems(aTree.Items[i], ResultList);
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
 ResultList : TList<TTreeViewItem>;
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

procedure TfmGUITestRunner.FillTestTree(aRootNode: TTreeViewItem; ATest: ITest);
var
  TestTests: IInterfaceList;
  i: Integer;
  l_TreeViewItem : TTreeViewItem;
begin
  if ATest = nil then
    EXIT;

  l_TreeViewItem := TTreeViewItem.Create(self);
  l_TreeViewItem.Text := ATest.Name;
  aRootNode.AddObject(l_TreeViewItem);

  FTests.Add(ATest);

  TestTests := ATest.Tests;
  for i := 0 to TestTests.count - 1 do
  begin
    FillTestTree(aRootNode, TestTests[i] as ITest);
  end;
end;

procedure TfmGUITestRunner.FillTestTree(ATest: ITest);
var
  l_TreeViewItem : TTreeViewItem;
begin
  TestTree.Clear;
  FTests.Clear;

  TestTree.BeginUpdate;

  l_TreeViewItem := TTreeViewItem.Create(nil);
  l_TreeViewItem.Text := 'Root';
  TestTree.AddObject(l_TreeViewItem);
  fillTestTree(l_TreeViewItem, Suite);

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
{ FillTestTree(Suite);
Setup;
if HideTestNodesOnOpenAction.Checked then
  HideTestNodesAction.Execute
else
  ExpandAllNodesAction.Execute;
TestTree.Selected := TestTree.Items.GetFirstNode;}
end;

procedure TfmGUITestRunner.SetSuite(Value: ITest);
begin
 //FSuite, ≈щЄ не создана, так как Application.CreateForm на самом деле, если его не пнуть €вно - "не создает сука, нормальных форм, а лишь ссылки на будущие классы.
 // „то соответсвенно вли€ет на члены класса, которые совсем не nil, как им бы положено быть"

 // Ѕочина вылезет в System._IntfCopy(var Dest: IInterface; const Source: IInterface);
 // ј вылезет потому что у нас в Dest будет блокированный указатель, а не nil.

 // ƒаже если мы таку строчку пропишем, это до фени
 FSuite := nil;
 FSuite := value;

 if FSuite <> nil then
  InitTree;
end;

end.
