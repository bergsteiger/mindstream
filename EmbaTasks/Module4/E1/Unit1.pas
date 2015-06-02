unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    lbInt: TLabel;
    DoIt: TButton;
    Edit1: TEdit;
    lbFrac: TLabel;
    procedure DoItClick(Sender: TObject);
    procedure MinusClick(Sender: TObject);
    procedure MulClick(Sender: TObject);
    procedure DivideClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MulClick(Sender: TObject);
begin
 lbResult.Caption := FloatToStr(StrToFloat(Edit1.Text) * StrToFloat(Edit2.Text));
end;

procedure TForm1.DoItClick(Sender: TObject);
begin
 lbResult.Caption := FloatToStr(StrToFloat(Edit1.Text) + StrToFloat(Edit2.Text));
end;

procedure TForm1.DivideClick(Sender: TObject);
begin
 lbResult.Caption := FloatToStr(StrToFloat(Edit1.Text) / StrToFloat(Edit2.Text));
end;

procedure TForm1.MinusClick(Sender: TObject);
begin
 lbResult.Caption := FloatToStr(StrToFloat(Edit1.Text) - StrToFloat(Edit2.Text));
end;

end.
