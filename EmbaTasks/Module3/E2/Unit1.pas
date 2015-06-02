unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    F: TButton;
    Edit1: TEdit;
    C: TButton;
    procedure FClick(Sender: TObject);
    procedure CClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.CClick(Sender: TObject);
begin
 Label1.Caption := FloatToStr((StrToFloat(Edit1.Text) - 32) * 5/9);
end;

procedure TForm1.FClick(Sender: TObject);
begin
 Label1.Caption := FloatToStr(StrToFloat(Edit1.Text) * 9/5 + 32);
end;

end.
