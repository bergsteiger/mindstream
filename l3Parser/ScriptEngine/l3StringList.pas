unit l3StringList;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3StringList -              }
{ Начат: 06.02.2008 12:58             }
{ $Id: l3StringList.pas,v 1.17 2012/03/14 11:34:46 lulin Exp $ }

// $Log: l3StringList.pas,v $
// Revision 1.17  2012/03/14 11:34:46  lulin
// {RequestLink:344754594}
//
// Revision 1.16  2009/07/21 13:03:52  lulin
// - более правильно приводим к константным строкам.
//
// Revision 1.15  2008/03/03 20:06:08  lulin
// - <K>: 85721135.
//
// Revision 1.14  2008/02/21 16:32:54  lulin
// - cleanup.
//
// Revision 1.13  2008/02/19 14:58:59  lulin
// - переводим сортировку списков на новые, менее виртуальные, рельсы.
//
// Revision 1.12  2008/02/18 19:05:12  lulin
// - распиливаем поиск.
//
// Revision 1.11  2008/02/18 11:07:54  lulin
// - выпилил часть виртуальной функциональности списков.
//
// Revision 1.10  2008/02/13 16:03:14  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.9  2008/02/13 12:26:22  lulin
// - <TDN>: 72.
//
// Revision 1.8  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.7  2008/02/12 17:23:04  lulin
// - метод чтения элемента списка переехал на примесь.
//
// Revision 1.6  2008/02/12 15:01:31  lulin
// - вычищен тип элементов списка.
//
// Revision 1.5  2008/02/12 14:39:42  lulin
// - методы для чтения списка переехали на примесь.
//
// Revision 1.4  2008/02/12 11:42:56  lulin
// - методы для сохранения списка переехали на примесь.
//
// Revision 1.3  2008/02/12 10:31:25  lulin
// - избавляемся от излишнего метода на базовом классе.
//
// Revision 1.2  2008/02/06 12:32:23  lulin
// - базовый список ссылок на объекты переехал в отдельный файл.
//
// Revision 1.1  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//

{$Include l3Define.inc }

interface

uses
  Classes,
  
  l3Interfaces,
  l3Types,
  l3Base,
  l3StringListPrim,
  l3StringList2
  ;

type
  Tl3StringList = class(Tl3StringList2)
    protected
    // property methods
      function  GetW(anIndex: Integer): Tl3WString;
      procedure PutW(anIndex: Integer; const aValue: Tl3WString);
        {-}
      function  Get_ItemC(anIndex: Integer): Il3CString;
      procedure Set_ItemC(anIndex: Integer; const aValue: Il3CString);
        {-}
    protected
    // internal methods
      function  CStrToItem(const aStr: Il3CString): Tl3CustomString;
        virtual;
        {-}
    public
    // public methods
      function  IndexOf(const aSt: Tl3WString): Integer;
        reintroduce;
        overload;
        {-}
      function  IndexOf(const aSt: Il3CString): Integer;
        reintroduce;
        overload;
        {-}
      function  IndexOf(const S: string): Integer;
        reintroduce;
        overload;
        {-}
      function  Add(const Item: Il3CString): Long;
        overload;
        {* - добавить в список строку. }
      function  Add(const Item: String): Long;
        overload;
        {* - добавить в список строку. }
      procedure Insert(Index: Long; const Item: Tl3WString);
        overload;
      procedure Insert(Index: Long; const Item: Il3CString);
        overload;
        {* - вставить в список строку. }
      procedure Insert(aIndex: Integer; const aStr: string);
        overload;
        {-}
    public
    // public properties
      property ItemW[anIndex: Integer]: Tl3WString
        read GetW
        write PutW;
        {* - элементы списка. }
      property ItemC[anIndex: Integer]: Il3CString
        read Get_ItemC
        write Set_ItemC;
        {* - элементы списка. }
  end;//Tl3StringList

implementation

uses
  l3String,
  l3Chars
  ;

// start class Tl3StringList

function Tl3StringList.IndexOf(const aSt: Tl3WString): Integer;
  //overload;
  {-}
begin
 if not FindData(aSt, Result) then
  Result := -1;
end;

function Tl3StringList.IndexOf(const aSt: Il3CString): Integer;
  //reintroduce;
  //overload;
  {-}
begin
 if not FindData(l3PCharLen(aSt), Result) then
  Result := -1;
end;

function Tl3StringList.IndexOf(const S: string): Integer;
  {-}
begin
 if not FindData(S, Result) then
  Result := -1;
end;

function Tl3StringList.Add(const Item: Il3CString): Long;
  //overload;
var
 l_S : Tl3CustomString;
begin
 l_S := CStrToItem(Item);
 try
  Result := Add(l_S);
 finally
  l3Free(l_S);
 end;//try..finally
end;

function Tl3StringList.Add(const Item: String): Long;
  //overload;
  {* - добавить в список строку. }
begin
 Result := Add(l3PCharLen(Item));
end;

procedure Tl3StringList.Insert(Index: Long; const Item: Tl3WString);
  {overload;}
  {-}
var
 l_S : Tl3CustomString;
begin
 l_S := WStrToItem(Item);
 try
  Insert(Index, l_S);
 finally
  l3Free(l_S);
 end;{try..finally}
end;

procedure Tl3StringList.Insert(Index: Long; const Item: Il3CString);
  //overload;
var
 l_S : Tl3CustomString;
begin
 l_S := CStrToItem(Item);
 try
  Insert(Index, l_S);
 finally
  l3Free(l_S);
 end;//try..finally
end;

procedure Tl3StringList.Insert(aIndex: Integer; const aStr: string);
  //overload;
  {-}
begin
 Insert(aIndex, l3PCharLen(aStr));
end;

function Tl3StringList.CStrToItem(const aStr: Il3CString): Tl3CustomString;
  //virtual;
  {-}
begin
 Result := Tl3IntfString.Make(aStr);
end;

function Tl3StringList.GetW(anIndex: Integer): Tl3WString;
  {-}
begin
 Result := Items[anIndex].AsWStr;
end;

procedure Tl3StringList.PutW(anIndex: Integer; const aValue: Tl3WString);
  {-}
begin
 Items[anIndex].AsWStr := aValue;
end;

function Tl3StringList.Get_ItemC(anIndex: Integer): Il3CString;
  {-}
var
 l_S : Tl3PrimString;  
begin
 l_S := Items[anIndex];
 if (l_S = nil) then
  Result := nil
 else
 if l3IFail(l_S.QueryInterface(Il3CString, Result)) then
  Assert(false);
end;

procedure Tl3StringList.Set_ItemC(anIndex: Integer; const aValue: Il3CString);
  {-}
var
 l_S : Tl3CustomString;
begin
 l_S := CStrToItem(aValue);
 try
  Items[anIndex] := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

end.

