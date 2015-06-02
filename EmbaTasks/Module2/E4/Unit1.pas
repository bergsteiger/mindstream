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
    procedure BackColor1Click(Sender: TObject);
    procedure BackColor2Click(Sender: TObject);
    procedure BackColor3Click(Sender: TObject);
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
 Label1.Enabled := true;
 Label2.Enabled := false;
 Label3.Enabled := false;
end;

procedure TForm1.BackColor2Click(Sender: TObject);
begin
 Label1.Enabled := false;
 Label2.Enabled := true;
 Label3.Enabled := false;
end;

procedure TForm1.BackColor3Click(Sender: TObject);
begin
 Label1.Enabled := false;
 Label2.Enabled := false;
 Label3.Enabled := true;
end;

end.
