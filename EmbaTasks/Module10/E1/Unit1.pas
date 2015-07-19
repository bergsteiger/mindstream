unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pbxEx: TPaintBox;
    pnlButtons: TPanel;
    btnSnowMan: TButton;
    procedure btnSnowManClick(Sender: TObject);
  private
    { Private declarations }
    procedure DrawSnowMan;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnSnowManClick(Sender: TObject);
begin
  DrawSnowMan;
end;

procedure TForm1.DrawSnowMan;
begin

end;

end.
