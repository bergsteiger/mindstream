unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    edtMain: TEdit;
    btnMain: TButton;
    procedure btnMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnMainClick(Sender: TObject);
var
  InStr, OutStr,
  SecondWord, ThirdWord : string;
begin
  InStr := edtMain.Text;
  OutStr := Copy(InStr, 1, Pos(' ', InStr) - 1);
  Delete(InStr, 1, pos(' ',InStr));

  SecondWord := Copy(InStr, 1, Pos(' ', InStr) - 1);
  Delete(InStr, 1, pos(' ',InStr));

  ThirdWord := InStr;
  Delete(InStr, 1, pos(' ',InStr));

  OutStr := OutStr + ' ' + ThirdWord + ' ' + SecondWord;

  edtMain.Text := OutStr;
end;

end.
