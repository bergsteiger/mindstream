unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfmMain = class(TForm)
    btnDoIt: TButton;
    pnlMain: TPanel;
    memMain: TMemo;
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

procedure TfmMain.btnDoItClick(Sender: TObject);
  function PlMin(numStr:integer):integer;
  var
   Index,Min : integer;
  begin
    Min:=NumStr;//Пусть строка, стоящая на месте num_str, минимальна

    //Для всех строк, начиная с номера num_str
    for Index := Min + 1 to memMain.Lines.Count - 1 do
      //Если текущая строка меньше минимальной, то
      if memMain.Lines[Index] < memMain.Lines[Min] then
        Min:=Index;//Переопределяем место минимальной строки

    PlMin:=Min;//Значению функции присваиваем место мин-ной строки
  end;

var
  Index, MinLineIndex:integer;
begin
   for Index:=0 to memMain.Lines.Count - 1 do
   //Для каждой строки из поля
   begin
     //просмотра
     MinLineIndex:=plmin(Index);
     //находим место мин. строки, начиная с Index-ного номера
     memMain.Lines.Exchange(Index, MinLineIndex);//меняем ее с текущей.
   end;
end;

end.
