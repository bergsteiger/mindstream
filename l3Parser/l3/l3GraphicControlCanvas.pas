unit l3GraphicControlCanvas;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3GraphicControlCanvas -    }
{ Начат: 26.05.2005 17:40             }
{ $Id: l3GraphicControlCanvas.pas,v 1.2 2008/09/01 15:45:05 lulin Exp $ }

// $Log: l3GraphicControlCanvas.pas,v $
// Revision 1.2  2008/09/01 15:45:05  lulin
// - чистка кода.
//
// Revision 1.1  2005/05/26 15:35:10  lulin
// - базовая канва вывода теперь избавлена от знания о контролах управления.
//

{$Include l3Define.inc }

interface

uses
  Graphics,

  Controls,
  
  l3ControlCanvas
  ;

type
  Tl3GraphicControlCanvas = class(Tl3ControlCanvas)
    public
    // public methods
      constructor Create(aControl: TGraphicControl);
        reintroduce;
        {-}
  end;//Tl3GraphicControlCanvas

implementation

// start class Tl3GraphicControlCanvas

type
  THackControl = class(TGraphicControl)
  end;//THackControl

constructor Tl3GraphicControlCanvas.Create(aControl: TGraphicControl);
  //reintroduce;
  {-}
begin
 inherited Create(aControl);
 BackColor := THackControl(aControl).Color;
 Canvas := THackControl(aControl).Canvas;
end;

end.

