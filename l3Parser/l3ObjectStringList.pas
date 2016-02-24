unit l3ObjectStringList;
{* Реализация списка строк со связанными интерфейсами.}

{ Библиотека "L3 (Low Level Library)"                                      }
{ Автор: Люлин А.В. ©                                                      }
{ Модуль: l3ObjectStringList - список строк со связанными объектами        }
{ Начат: 03.12.2003                                                        }
{ $Id: l3ObjectStringList.pas,v 1.15 2014/02/13 12:35:07 lulin Exp $}

// $Log: l3ObjectStringList.pas,v $
// Revision 1.15  2014/02/13 12:35:07  lulin
// - рефакторим безликие списки.
//
// Revision 1.14  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.13  2008/02/20 17:23:09  lulin
// - упрощаем строки.
//
// Revision 1.12  2008/02/18 19:05:12  lulin
// - распиливаем поиск.
//
// Revision 1.11  2008/02/13 16:03:14  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.10  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.9  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.8  2007/03/01 08:39:52  lulin
// - не копируем данные строки, если их держит интерфейс строки.
//
// Revision 1.7  2007/02/28 18:50:55  lulin
// - используем полиморфизм базового класса строки, вместо приведения типа.
//
// Revision 1.6  2006/03/27 13:20:13  lulin
// - cleanup.
//
// Revision 1.5  2005/11/11 12:31:00  fireton
// - add: добавлен метод Insert в _Tl3ObjectStringList
//
// Revision 1.4  2005/06/01 16:22:35  lulin
// - remove unit: evIntf.
//
// Revision 1.3  2004/06/02 15:41:54  law
// - bug fix: используем "правильные" списки.
//
// Revision 1.2  2004/06/01 14:56:42  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.1  2003/12/03 16:32:46  demon
// - new object: Cписок строк со связанными интерфейсами
//

{$Include l3Define.inc }

interface

uses
  l3Base,
  l3Types,
  l3StringList,
  l3ProtoObject
  ;

type
  Tl3ObjectStringList = class(Tl3StringList)
  {*! Класс реализующий список строк со связанными объектами.}
   private
    function  pm_getObjects(anIndex: LongInt): TObject;
    procedure pm_setObjects(anIndex: LongInt; aValue: TObject);
    function  pm_getStrings(anIndex: LongInt): String;
    protected
    // internal methods
      function  StringItemClass: Rl3String;
        override;
        {-}
   public
    function Add(const aSt: String; const anObj: Tl3ProtoObject): Long; overload;
     {* - добавляет в список строчку с объектом.}

    procedure Insert(Index: Long; const aSt: String; const anObj: Tl3ProtoObject); overload;
     {* - вставляет в нужную позицию в списке строчку с объектом.}

    function FindObject(const aSt: String): TObject;
     {* - ищет объект по значению строки.}

    function IndexOf(const aSt: String): LongInt;
     reintroduce;
     {* - возвращает индекс строки. Если строка не найдена, то возвращается -1}

    property Objects[anIndex: LongInt]: TObject
      read  pm_getObjects
      write pm_setObjects;

    property Strings[anIndex: LongInt]: String
      read  pm_getStrings;
  end;//Tl3ObjectStringList

implementation

uses
  l3String;

// start class Tl3ObjectStringList

function Tl3ObjectStringList.StringItemClass: Rl3String;
  //override;
  {-}
begin
 Result := Tl3ObjRefString;
end;

function Tl3ObjectStringList.Add(const aSt   : String;
                                 const anObj : Tl3ProtoObject): Long;
var
 l_St : Tl3ObjRefString;
begin
 l_St := Tl3ObjRefString.Make(l3PCharLen(aSt), anObj);
 try
  Result := Add(l_St);
 finally
  l3Free(l_St);
 end;{try..finally}
end;

function Tl3ObjectStringList.pm_getObjects(anIndex: LongInt): TObject;
begin
 Result := Items[anIndex].LinkedObject;
end;

procedure Tl3ObjectStringList.pm_setObjects(anIndex: LongInt; aValue: TObject);
begin
 Items[anIndex].LinkedObject := aValue;
end;

function Tl3ObjectStringList.pm_getStrings(anIndex: LongInt): String;
begin
 Result := Items[anIndex].AsString;
end;

function Tl3ObjectStringList.FindObject(const aSt: String): TObject;
var
 l_Index : Long;
begin
 if FindData(aSt, l_Index, SortIndex) then
 begin
  Result := Tl3CustomString(Items[l_Index]).LinkedObject;
 end
 else
  Result := nil;
end;

function Tl3ObjectStringList.IndexOf(const aSt: String): LongInt;
begin
 if not FindData(aSt, Result, SortIndex) then
  Result := -1;
end;

procedure Tl3ObjectStringList.Insert(Index: Long; const aSt: String; const anObj: Tl3ProtoObject);
var
 l_St : Tl3ObjRefString;
begin
 l_St := Tl3ObjRefString.Make(l3PCharLen(aSt), anObj);
 try
  Insert(Index, l_St);
 finally
  l3Free(l_St);
 end;{try..finally}
end;

end.
