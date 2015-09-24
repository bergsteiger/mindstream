unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    pnlTop: TPanel;
    btnCompute: TButton;
    lbl1: TLabel;
    edtEnterDate: TEdit;
    lblResult: TLabel;
    procedure btnComputeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

procedure TfmMain.btnComputeClick(Sender: TObject);
var
  YearBetween, MonthBetween, DayBetween,
  YearEnter, MonthEnter, DayEnter,
  YearNow, MonthNow, DayNow : Word;
  EnterDate : TDateTime;
begin
  EnterDate := StrToDate(edtEnterDate.Text);

  DecodeDate(EnterDate, YearEnter, MonthEnter, DayEnter);
  DecodeDate(Now, YearNow, MonthNow, DayNow);

  YearBetween := abs(YearEnter - YearNow);
  MonthBetween := abs(MonthEnter - MonthNow);
  DayBetween := abs(DayEnter - DayNow);

  lblResult.Caption := 'Year = ' + IntToStr(YearBetween)+
                       ' Month = ' + IntToStr(MonthBetween) +
                       ' Day = ' + IntToStr(DayBetween);
end;


end.
