unit l3LeakObjects;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3LeakObjects - }
{ Начат: 12.01.2000 15:45 }
{ $Id: l3LeakObjects.pas,v 1.5 2000/12/15 15:19:01 law Exp $ }

// $Log: l3LeakObjects.pas,v $
// Revision 1.5  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms;

type
  Tl3LeakObjectsForm = class(TForm)
    pnButtons: TPanel;
    btOk: TButton;
    btHelp: TButton;
    pnHeader: TPanel;
    memGeneral: TMemo;
    spMemo: TSplitter;
    memClasses: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  end;{Tl3LeakObjectsForm}

implementation

{$R *.DFM}

procedure Tl3LeakObjectsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Action := caNone;
 ModalResult := mrOk;
end;

end.
