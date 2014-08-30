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
  procedure btnAdditemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
 private
  { Private declarations }
 public
  { Public declarations }
 end;

var
 fmGUITestRunner: TfmGUITestRunner;

implementation

{$R *.fmx}

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

 tvTests.EndUpdate;
 tvTests.InvalidateContentSize;
end;

procedure TfmGUITestRunner.FormCreate(Sender: TObject);
begin
 tvTests.ShowCheckboxes := True;
end;

end.
