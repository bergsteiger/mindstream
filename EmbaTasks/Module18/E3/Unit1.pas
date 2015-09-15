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
    memResult: TMemo;
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
  array_n_elements = array [1 .. 2 * n] of real;

procedure Input(var ch1, ch2: integer);
begin
  ch1 := StrToInt(fmMain.edtCh1.Text);
  ch2 := StrToInt(fmMain.edtCh2.Text);
end;

procedure FillArray(var a: array_n_elements; rMin, rMax: real);
var
  i: integer;
begin
  randomize;
  For i := 1 to 2 * n do
    a[i] := random * (rMax - rMin) + rMin;
end;

procedure OutputArray1(a: array_n_elements);
var
  i: integer;
begin
  fmMain.memMain.Clear;
  for i := 0 to 2 * n - 1 do
    fmMain.memMain.Lines.Append(FloatToStr(a[i + 1]));
end;

procedure OutputArray2(a: array_n_elements);
var
  i: integer;
begin
  fmMain.memResult.Clear;
  for i := 0 to 2 * n - 1 do
    fmMain.memResult.Lines.Append(FloatToStr(a[i + 1]));
end;

procedure change(var one, two: real);
var
  temp: real;
begin
  temp:=one;
  one:=two;
  two:=temp;
end;

procedure ChangeBeginToEnd(var a : array_n_elements);
var
  i: integer;
begin
  For i := 1 to n do
    change(a[i], a[i + n]);
end;

procedure TfmMain.btnDoItClick(Sender: TObject);
var
  chB, chE: integer;
  a: array_n_elements;
begin
  Input(chB, chE); // Input array value range,
  // from chB to chE (inclusively).
  FillArray(a, chB, chE); // Fill the array with random numbers
  // in the range from chB to chE
  OutputArray1(a); // Output array A into TMemo 1.

  ChangeBeginToEnd(a);

  OutputArray2(a); // Output array A, into TMemo 2.
end;

end.
