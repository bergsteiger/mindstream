unit u_fmGUITestRunner;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView;

type
 TfmGUITestRunner = class(TForm)
  tvTests: TTreeView;
    btnAddItem: TButton;
    btnGetSelectedItems: TButton;
  procedure btnAddItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGetSelectedItemsClick(Sender: TObject);
 private
  { Private declarations }
 public
  { Public declarations }
 end;

var
 fmGUITestRunner: TfmGUITestRunner;

implementation

uses
 System.Generics.Collections;
{$R *.fmx}

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
 tvTests.BeginUpdate;

 l_TreeViewItem := TTreeViewItem.Create(self);
 l_TreeViewItem.Text := 'Item' + IntToStr(tvTests.GlobalCount);

 if tvTests.Selected = nil then
  tvTests.AddObject(l_TreeViewItem)
 else
  tvTests.Selected.AddObject(l_TreeViewItem);

 tvTests.InvalidateContentSize;
 tvTests.EndUpdate;
end;

procedure TfmGUITestRunner.btnGetSelectedItemsClick(Sender: TObject);
var
 ResultList : TList<TTreeViewItem>;
 l_Item: TTreeViewItem;
 l_ResutlMsg: string;
begin
 ResultList := TList<TTreeViewItem>.Create;

 TraverseTree(tvTests, ResultList);

 for l_Item in ResultList do
  l_ResutlMsg := l_ResutlMsg + l_Item.Text + ';';

 ShowMessage(l_ResutlMsg);

 FreeAndNil(ResultList);
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 tvTests.ShowCheckboxes := True;
end;

end.
