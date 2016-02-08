unit l3ExprContainer;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3ExprContainer -           }
{ Начат: 12.11.2007 17:48             }
{ $Id: l3ExprContainer.pas,v 1.5 2015/05/20 12:09:22 dinishev Exp $ }

// $Log: l3ExprContainer.pas,v $
// Revision 1.5  2015/05/20 12:09:22  dinishev
// Cleanup
//
// Revision 1.4  2008/07/15 20:23:35  lulin
// - при рисовании формулы учитываем выделение.
//
// Revision 1.3  2008/07/15 18:38:56  lulin
// - чистка кода.
//
// Revision 1.2  2008/07/15 18:32:33  lulin
// - рефакторинг отрисовки формул - код обобщён.
//
// Revision 1.1  2007/11/12 17:00:55  lulin
// - попытка рисования формул без кеширования (пока безуспешно).
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Units,
  l3GraphicContainer
  ;

type
  Tl3ExprContainer = class(Tl3SizeableGraphicContainer)
    protected
    // internal methods
      procedure StretchDraw(const R: Tl3Rect; const aCanvas: Il3Canvas);
        override;
        {-}
  end;//Tl3ExprContainer

implementation

uses
  Graphics
  ;

// start class Tl3ExprContainer

procedure Tl3ExprContainer.StretchDraw(const R: Tl3Rect; const aCanvas: Il3Canvas);
  //override;
  {-}
begin
 if (f_Renderer <> nil) then
 begin
  aCanvas.PushWO;
  try
   aCanvas.FillRect(l3Rect(0, 0, InchWidth, InchHeight));
   f_Renderer.Render(aCanvas.Canvas, aCanvas.EffectiveColors);
  finally
   aCanvas.PopWO;
  end;//try..finally
 end;//f_Renderer <> nil
end;

end.

