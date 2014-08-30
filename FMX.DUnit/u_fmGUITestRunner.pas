unit u_fmGUITestRunner;

interface

uses
 System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
 FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
 FMX.Layouts, FMX.TreeView;

type
 TfmGUITestRunner = class(TForm)
  tvTests: TTreeView;
  btnAdditem: TButton;
    btnGetSelectedItems: TButton;
  procedure btnAdditemClick(Sender: TObject);
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

{$R *.fmx}

procedure TraverseTree(const aTree : TTreeViewItem; var ResultMessage : string);
var
 i : Integer;
begin
 for i := 0 to Pred(aTree.Count)  do
 begin
  if aTree.Items[i].IsChecked
   then ResultMessage := ResultMessage + aTree.Items[i].Text + ';';

  TraverseTree(aTree.Items[i], ResultMessage);
 end;
end;

procedure TfmGUITestRunner.btnAdditemClick(Sender: TObject);
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
 l_ResutlMsg : string;
 i : integer;
begin
 l_ResutlMsg := '';
 for i := 0 to Pred(tvTests.Count) do
 begin
  if tvTests.Items[i].IsChecked then
   l_ResutlMsg := l_ResutlMsg + tvTests.Items[i].Text + ';';
  TraverseTree(tvTests.Items[i], l_ResutlMsg);
 end;

 ShowMessage(l_ResutlMsg);
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 tvTests.ShowCheckboxes := True;
end;

end.
