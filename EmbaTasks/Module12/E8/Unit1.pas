unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtMain: TEdit;
    btnMain: TButton;
    lblResult: TLabel;
    procedure btnMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMainClick(Sender: TObject);
var
  TmpStr, ResultWord : string;
  i : integer;
begin
  TmpStr := edtMain.Text;

  for i := length(TmpStr) downto 1 do
    ResultWord := ResultWord + TmpStr[i];

  edtMain.Text := ResultWord;
end;

end.
