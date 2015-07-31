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
  TmpStr, ResultString,
  SecondWord, ThirdWord : string;
begin
  TmpStr := edtMain.Text;
  ResultString := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
  Delete(TmpStr, 1, pos(' ',TmpStr));

  SecondWord := Copy(TmpStr, 1, Pos(' ', TmpStr) - 1);
  Delete(TmpStr, 1, pos(' ',TmpStr));

  ThirdWord := TmpStr;
  Delete(TmpStr, 1, pos(' ',TmpStr));

  ResultString := ResultString + ' ' + ThirdWord + ' ' + SecondWord;

  edtMain.Text := ResultString;
end;

end.
