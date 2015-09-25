unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    lblResult: TLabel;
    pnlBottom: TPanel;
    btnStart: TButton;
    dlgOpen: TOpenDialog;
    dlgSaveResult: TSaveDialog;
    lbl1: TLabel;
    procedure btnStartClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnStartClick(Sender: TObject);
  function SumFromLine(aLine : string) : integer;
  var
    SpacePos, Number, Code  : integer;
    SubStr : string;
  begin
    Result:= 0;
    SpacePos := 1;
    while SpacePos > 0 do
    begin
      aLine := Trim(aLine);
      SpacePos := Pos(' ', aLine);

      if (SpacePos = 0) and (Length(aLine)>0) then
        SubStr := Copy(aLine, 0, Length(aLine))
      else
        SubStr := Copy(aLine, 0, SpacePos - 1);

      Delete(aLine, 1, SpacePos);
      Val(SubStr, Number, Code);

      if Code = 0 then
        Result := Result + Number;
    end;

  end;
var
  FileOpen,
  FileResult: TextFile;

  FilePathOpen,
  FilePathResult,
  Line : string;

  IsOpenFrom,
  IsOpenResult : Boolean;

  Num, SumNum : integer;
begin
  if dlgOpen.Execute then
    IsOpenFrom := True;

  if dlgSaveResult.Execute then
    IsOpenResult := True;

  if (IsOpenFrom and IsOpenResult) then
  begin
    FilePathOpen := dlgOpen.FileName;
    FilePathResult := dlgSaveResult.FileName;

    AssignFile(FileOpen, FilePathOpen);
    Reset(FileOpen);

    AssignFile(FileResult, FilePathResult);
    Rewrite(FileResult);

    SumNum := 0;

    while not Eof(FileOpen) do
    begin
      Readln(FileOpen, Line);

      SumNum := SumNum + SumFromLine(Line);
    end;

    Writeln(FileResult, SumNum);

    CloseFile(FileOpen);
    CloseFile(FileResult);

    lblResult.Caption := 'All right - ' + IntToStr(SumNum);
  end
  else
    lblResult.Caption := 'Some files not open';
end;

end.
