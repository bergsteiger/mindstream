unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlMain: TPanel;
    memMain: TMemo;
    pnlTop: TPanel;
    edtCh1: TEdit;
    edtCh2: TEdit;
    memPositiveNum: TMemo;
    memNegative: TMemo;
    procedure btnDoItClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

{$R *.dfm}

Const
  n = 20;

Type
  array_n_elements = array [1 .. n] of integer;

procedure SetArrayRange(var ch1, ch2: integer);
begin
  ch1 := StrToInt(fmMain.edtCh1.Text);
  ch2 := StrToInt(fmMain.edtCh2.Text);
end;

procedure FillArray(var a: array_n_elements; rMin, rMax: integer);
var
  i: integer;
begin
  randomize;
  For i := 1 to n do
    a[i] := random(rMax - rMin) + rMin;
end;

procedure OutputArray(a: array_n_elements; n: integer);
var
  i: integer;
begin
  fmMain.memMain.Lines.Clear;
  for i := 0 to n - 1 do
    fmMain.memMain.Lines.Append(IntToStr(a[i + 1]));
end;

function max(a: array_n_elements): integer;
var
  i, m: integer;
begin
  m := a[1];
  for i := 1 to n do
    if a[i] > m then
      m := a[i];
  max := m;
end;

procedure TfmMain.btnDoItClick(Sender: TObject);
var
  rMin, rMax: integer;
  Amax: integer;
  a: array_n_elements;
begin
  SetArrayRange(rMin, rMax);
  //Set range of array values
  FillArray(a, rMin, rMax); //Fill array with numbers from the specified	range
  OutputArray(a, n); //Output array
  Amax:=max(a); //Find maximal element Amax
  //lblAmax.Caption:=IntToStr(Amax); //Output Amax end
end;
end.
