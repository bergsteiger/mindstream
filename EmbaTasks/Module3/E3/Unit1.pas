unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    kph: TButton;
    Edit1: TEdit;
    mps: TButton;
    procedure kphClick(Sender: TObject);
    procedure mpsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.mpsClick(Sender: TObject);
begin
 Label1.Caption := FloatToStr(StrToFloat(Edit1.Text) * 1000 / 3600);
end;

procedure TForm1.kphClick(Sender: TObject);
begin
 Label1.Caption := FloatToStr(StrToFloat(Edit1.Text) / 1000 * 3600);
end;

end.
