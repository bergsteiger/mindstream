unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
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
var
 l_V1 : Extended;
 l_V2 : Extended;
begin
 l_V1 := StrToFloat(Edit1.Text);
 l_V2 := StrToFloat(Edit2.Text);
 if (l_V1 < l_V2) then
 begin
  Edit1.Text := FloatToStr((l_V1 + l_V2) / 2);
  Edit2.Text := FloatToStr((l_V1 * l_V2) * 3);
 end//l_V1 < l_V2
 else
 begin
  Edit2.Text := FloatToStr((l_V1 + l_V2) / 2);
  Edit1.Text := FloatToStr((l_V1 * l_V2) * 3);
 end;//l_V1 < l_V2
end;

end.
