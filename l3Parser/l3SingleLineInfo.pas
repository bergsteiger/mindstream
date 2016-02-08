unit l3SingleLineInfo;

{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: evSingleLineInfo - }
{ Начат: 31.05.2004 19:42 }
{ $Id: l3SingleLineInfo.pas,v 1.4 2008/04/23 18:27:44 lulin Exp $ }

// $Log: l3SingleLineInfo.pas,v $
// Revision 1.4  2008/04/23 18:27:44  lulin
// - <K>: 89106529.
//
// Revision 1.3  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.2  2006/11/03 11:00:47  lulin
// - объединил с веткой 6.4.
//
// Revision 1.1.2.3  2006/10/26 12:50:45  lulin
// - используем полиморфизм, вместо выяснения класса объекта.
//
// Revision 1.1.2.2  2006/10/26 10:48:53  lulin
// - избавляемся от преобразования карты форматирования к тегу.
//
// Revision 1.1.2.1  2006/10/26 10:19:31  lulin
// - модуль переехал в базовую библиотеку.
//
// Revision 1.3.14.1.10.2  2006/10/26 10:13:35  lulin
// - добавлен интерфейс - список форматированных строк.
//
// Revision 1.3.14.1.10.1  2006/10/26 09:02:26  lulin
// - добавлен интерфейс - список форматированных строк.
//
// Revision 1.3.14.1  2006/03/14 15:34:39  dinishev
// Подкорректировал работу многострочного поля: корректное отображение при одной строке/пустом редакторе + авторазмер
//
// Revision 1.3  2004/11/01 18:47:50  lulin
// - new behavior: пореже стараемся перераспределять объекты.
//
// Revision 1.2  2004/05/31 16:51:23  law
// - new behavior: по-минимуму сохраняем форматирующую информацию, для параграфов, содержащих только одну строку.
//
// Revision 1.1  2004/05/31 15:48:21  law
// - new unit: evSingleLineInfo.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3Base,
  l3CacheableBase
  ;

type
  Tl3SingleLineInfo = class(Tl3CacheableBase, Il3Lines)
    private
    // internal fields
      f_Width       : Integer;
      f_Height      : Integer;
    protected
    // property methods
      function AsObject: TObject;
        {-}
      function Get_Count: Integer;
        {-}
      function  pm_GetFontIndexes : Tl3FontIndexes;
        virtual;
      procedure pm_SetFontIndexes(aValue : Tl3FontIndexes);
        virtual;
        {-}
    public
    // public methods
      constructor Create(aWidth, aHeight: Long);
        reintroduce;
        {-}
      class function Make(aWidth, aHeight: Long; aFI : Tl3FontIndexes): Tl3SingleLineInfo;
        reintroduce;
        {-}
    public
    // public properties
      property Width: Integer
        read f_Width
        write f_Width;
        {-}
      property Height: Integer
        read f_Height
        write f_Height;
        {-}  
      property FontIndexes: Tl3FontIndexes
        read pm_GetFontIndexes
        write pm_SetFontIndexes;
        {-}
  end;//Tl3SingleLineInfo

  Tl3SingleLineInfo1 = class(Tl3SingleLineInfo)
    private
    // internal fields
      f_FontIndexes : Tl3FontIndexes;
    protected
    // property methods
      function pm_GetFontIndexes : Tl3FontIndexes;
        override;
      procedure pm_SetFontIndexes(aValue : Tl3FontIndexes);
        override;
        {-}
    public
    // public methods
      constructor Create(aWidth, aHeight: Long; aFI : Tl3FontIndexes);
        reintroduce;
        {-}
  end;//Tl3SingleLineInfo1

implementation

// start class Tl3SingleLineInfo

constructor Tl3SingleLineInfo.Create(aWidth, aHeight: Long);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Width := aWidth;
 f_Height := aHeight;
end;

class function Tl3SingleLineInfo.Make(aWidth, aHeight: Long; aFI : Tl3FontIndexes): Tl3SingleLineInfo;
  //reintroduce;
  {-}
begin
 if (aFI = []) OR (aFI = [l3_fiNone]) then
  Result := Create(aWidth, aHeight)
 else
  Result := Tl3SingleLineInfo1.Create(aWidth, aHeight, aFI);
end;

function Tl3SingleLineInfo.AsObject: TObject;
  {-}
begin
 Result := Self;
end;

function Tl3SingleLineInfo.Get_Count: Integer;
  {-}
begin
 Result := 1;
end;

function Tl3SingleLineInfo.pm_GetFontIndexes : Tl3FontIndexes;
  //virtual;
  {-}
begin
 Result := [];
end;

procedure Tl3SingleLineInfo.pm_SetFontIndexes(aValue : Tl3FontIndexes);
  //virtual;
  {-}
begin
end;

// start class Tl3SingleLineInfo1

constructor Tl3SingleLineInfo1.Create(aWidth, aHeight: Long; aFI : Tl3FontIndexes);
  //reintroduce;
  {-}
begin
 inherited Create(aWidth, aHeight);
 f_FontIndexes := aFI;
end;

function Tl3SingleLineInfo1.pm_GetFontIndexes : Tl3FontIndexes;
  //override;
  {-}
begin
 Result := f_FontIndexes;
end;

procedure Tl3SingleLineInfo1.pm_SetFontIndexes(aValue : Tl3FontIndexes);
  //override;
begin
 f_FontIndexes := aValue;
end;

end.

