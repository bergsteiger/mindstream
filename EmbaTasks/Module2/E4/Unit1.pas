unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    BackColor1: TButton;
    BackColor2: TButton;
    BackColor3: TButton;
    ForeColor3: TButton;
    ForeColor2: TButton;
    ForeColor1: TButton;
    Size1: TButton;
    Size2: TButton;
    Size3: TButton;
    Name1: TButton;
    Name2: TButton;
    Name3: TButton;
    procedure BackColor1Click(Sender: TObject);
    procedure BackColor2Click(Sender: TObject);
    procedure BackColor3Click(Sender: TObject);
    procedure ForeColor1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BackColor1Click(Sender: TObject);
begin
 Label1.Color := clRed;
end;

procedure TForm1.BackColor2Click(Sender: TObject);
begin
 Label1.Color := clBtnFace;
end;

procedure TForm1.BackColor3Click(Sender: TObject);
begin
 Label1.Color := clWhite;
end;

procedure TForm1.ForeColor1Click(Sender: TObject);
begin
 Label1.Font.Color := clBlue;
end;

end.
