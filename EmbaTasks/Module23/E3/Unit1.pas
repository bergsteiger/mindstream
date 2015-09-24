unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    btnStart: TButton;
    lbl1: TLabel;
    edtClock: TEdit;
    tmrMain: TTimer;
    lblDate: TLabel;
    lblDayOfWeek: TLabel;
    procedure btnStartClick(Sender: TObject);
    procedure tmrMainTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  IsCountDown : boolean;

implementation

{$R *.dfm}

procedure TfmMain.btnStartClick(Sender: TObject);
var
  Year, Month, Day, DayOfWeek : Word;
begin
  DecodeDateFully(Now, Year, Month, Day, DayOfWeek);
  lblDate.Caption := lblDate.Caption + IntToStr(Day) + '.' +
                                       IntToStr(Month) + '.' +
                                       IntToStr(Year);
  lblDayOfWeek.Caption := lblDayOfWeek.Caption + IntToStr(DayOfWeek);
  tmrMain.Enabled := True;
end;

procedure TfmMain.tmrMainTimer(Sender: TObject);
begin
  edtClock.Text := TimeToStr(Now);
end;

end.
