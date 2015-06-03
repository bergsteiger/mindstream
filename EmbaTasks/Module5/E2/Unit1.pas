unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    btRed: TButton;
    lbRed: TLabel;
    lbYellow: TLabel;
    lbGreen: TLabel;
    btYellow: TButton;
    btGreen: TButton;
    procedure btRedClick(Sender: TObject);
    procedure btYellowClick(Sender: TObject);
    procedure btGreenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btGreenClick(Sender: TObject);
begin
 lbRed.Visible := false;
 lbYellow.Visible := false;
 lbGreen.Visible := true;
end;

procedure TForm1.btRedClick(Sender: TObject);
begin
 lbRed.Visible := true;
 lbYellow.Visible := false;
 lbGreen.Visible := false;
end;

procedure TForm1.btYellowClick(Sender: TObject);
begin
 lbRed.Visible := false;
 lbYellow.Visible := true;
 lbGreen.Visible := false;
end;

end.
