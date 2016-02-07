unit l3BitmapDataObject;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3BitmapDataObject -        }
{ Начат: 21.12.2006 16:42             }
{ $Id: l3BitmapDataObject.pas,v 1.7 2007/10/23 12:12:09 lulin Exp $ }

// $Log: l3BitmapDataObject.pas,v $
// Revision 1.7  2007/10/23 12:12:09  lulin
// - используем интерфейс вместо объекта.
//
// Revision 1.6  2007/10/22 13:51:33  lulin
// - метафайл копируем в буфер обмена напрямую, а не через битмап.
//
// Revision 1.5  2007/10/22 11:31:34  lulin
// - выделен базовый контейнер графики.
//
// Revision 1.4  2006/12/27 17:25:53  lulin
// - автоматизируем поддержку графических форматов.
//
// Revision 1.3  2006/12/27 16:54:39  lulin
// - cleanup.
//
// Revision 1.2  2006/12/27 14:39:21  lulin
// - упрощена работа со списками форматов.
//
// Revision 1.1  2006/12/21 14:28:00  lulin
// - картинку копируем в буфер обмена теперь тоже посредством объекта данных.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3InternalInterfaces,
  l3Base,
  l3DataObject,
  l3GraphicContainer
  ;

type
  Tl3BitmapDataObject = class(Tl3DataObject)
    private
    // internal fields
      f_Bitmap : Tl3GraphicContainer;
    protected
    // internal methods
      function  Bitmap: Il3Bitmap;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(const aBitmap: Il3Bitmap);
        reintroduce;
        {-}
      class function Make(const aBitmap: Il3Bitmap): IDataObject;
        {-}
  end;//Tl3BitmapDataObject

implementation

uses
  l3BitmapContainer,
  l3MetafileContainer
  ;
  
constructor Tl3BitmapDataObject.Create(const aBitmap: Il3Bitmap);
  //reintroduce;
  {-}
var
 l_F : Tl3ClipboardFormats;
begin
 if (aBitmap = nil) then
  l_F := nil
 else
 begin
  if aBitmap.IsMF then
   f_Bitmap := Tl3MetafileContainer.Create
  else
   f_Bitmap := Tl3BitmapContainer.Create;
  aBitmap.AssignTo(f_Bitmap.Graphic);
  l_F := l3FormatArray([CF_HDROP]);
 end;//aBitmap <> nil
 inherited Create(l_F);
end;
  
class function Tl3BitmapDataObject.Make(const aBitmap: Il3Bitmap): IDataObject;
  {-}
var
 l_DO : Tl3BitmapDataObject;
begin
 l_DO := Create(aBitmap);
 try
  Result := l_DO;
 finally
  l3Free(l_DO);
 end;//try..finally
end;

procedure Tl3BitmapDataObject.Cleanup;
  //override;
  {-}
begin
 l3Free(f_Bitmap);
 inherited;
end;

function Tl3BitmapDataObject.Bitmap: Il3Bitmap;
  //override;
  {-}
begin
 Result := f_Bitmap;
end;

end.

