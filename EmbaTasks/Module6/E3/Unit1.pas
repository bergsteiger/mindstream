unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    lbMin: TLabel;
    lbMax: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);

 function Min(A, B: Extended): Extended;
 begin
  if (A > B) then
   Result := B
  else
   Result := A;
 end;

 function Max(A, B: Extended): Extended;
 begin
  if (A < B) then
   Result := B
  else
   Result := A;
 end;

var
 l_V1 : Extended;
 l_V2 : Extended;
 l_V3 : Extended;
begin
 l_V1 := StrToFloat(Edit1.Text);
 l_V2 := StrToFloat(Edit2.Text);
 l_V3 := StrToFloat(Edit3.Text);
 lbMin.Caption := FloatToStr(Min(l_V1, Min(l_V2, l_V3)));
 lbMax.Caption := FloatToStr(Max(l_V1, Max(l_V2, l_V3)));
end;

end.
