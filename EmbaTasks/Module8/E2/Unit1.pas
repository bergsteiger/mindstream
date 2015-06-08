unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    A1: TEdit;
    B1: TEdit;
    C1: TEdit;
    A2: TEdit;
    B2: TEdit;
    C2: TEdit;
    Button1: TButton;
    P1: TLabel;
    S1: TLabel;
    P2: TLabel;
    S2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
