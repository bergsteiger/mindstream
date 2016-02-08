unit l3InterfacedStringList;
{* Реализация списка строк со связанными интерфейсами.}

{ Библиотека "L3 (Low Level Library)"                                      }
{ Автор: Люлин А.В. ©                                                      }
{ Модуль: l3InterfacedStringList - список строк со связанными интерфейсами }
{ Начат: 09.10.2003                                                        }
{ $Id: l3InterfacedStringList.pas,v 1.14 2008/03/20 09:48:40 lulin Exp $ }

// $Log: l3InterfacedStringList.pas,v $
// Revision 1.14  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.13  2008/02/18 19:05:12  lulin
// - распиливаем поиск.
//
// Revision 1.12  2008/02/13 16:03:14  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.11  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.10  2007/04/02 07:06:33  lulin
// - bug fix: создавались элементы неправильного типа.
//
// Revision 1.9  2007/02/13 10:10:31  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.8  2007/02/02 12:25:40  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.7  2007/01/29 12:53:55  lulin
// - cleanup.
//
// Revision 1.6  2004/06/02 15:41:54  law
// - bug fix: используем "правильные" списки.
//
// Revision 1.5  2004/06/01 14:56:42  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.4  2003/10/23 18:52:05  step
// Добавлен комментарий
//
// Revision 1.3  2003/10/22 16:50:04  step
// Добавлен метод IndexOf
//
// Revision 1.2  2003/10/15 13:42:27  demon
// - add: property Strings[anIndex: LongInt] в объекте Tl3InterfacedStringList
//
// Revision 1.1  2003/10/09 14:47:48  demon
// - new: Класс реализующий список строк со связанными интерфейсами.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Base,
  l3StringList,
  l3Types
  ;

type
  Tl3InterfacedString = class(Tl3String)
  {*! Класс реализующий строки с возможностью хранения интерфейса.}
   private
    f_ObjInterface : IUnknown;

    function  pm_getObjInterface: IUnknown;
    procedure pm_setObjInterface(aValue: IUnknown);
   protected
    procedure Cleanup;
     override;
   public
    constructor Make(const aSt: Tl3PCharLen; const anIntf: IUnknown);
     overload;
    {* - создает новую строку как копию aSt. }

    property Intf: IUnknown
      read pm_getObjInterface
      write pm_setObjInterface;
  end;//Tl3InterfacedString

  Tl3InterfacedStringList = class(Tl3StringList)
  {*! Класс реализующий список строк со связанными интерфейсами.}
   private
    function  pm_getObjInterfaces(anIndex: LongInt): IUnknown;
    procedure pm_setObjInterfaces(anIndex: LongInt; aValue: IUnknown);
    function  pm_getStrings(anIndex: LongInt): String;
    protected
    // internal methods
      function  StringItemClass: Rl3String;
        override;
        {-}
      function  CStrToItem(const aStr: Il3CString): Tl3CustomString;
        override;
        {-}
   public

    function Add(const aSt    : Il3CString;
                 const anIntf : IUnknown): Long;
     overload;
    function Add(const aSt    : Tl3WString;
                 const anIntf : IUnknown): Long;
     overload;
     {* - добавляет в список строчку с интерфейсом.}

    function FindInterface(const aSt: Tl3WString): IUnknown;
     {* - ищет интерфейс по значению строки.}

    function IndexOf(const aSt: String): LongInt;
     reintroduce;
     {* - возвращает индекс строки. Если строка не найдена, то возвращается -1}

    property ObjInterfaces[anIndex: LongInt]: IUnknown
      read  pm_getObjInterfaces
      write pm_setObjInterfaces;
      
    property Strings[anIndex: LongInt]: String
      read  pm_getStrings;
  end;//Tl3InterfacedStringList

implementation

uses
  l3String;

// start class Tl3InterfacedString

constructor Tl3InterfacedString.Make(const aSt: Tl3PCharLen;
                                     const anIntf: IUnknown);
begin
 Make(aSt, false);
 f_ObjInterface := anIntf;
end;

procedure Tl3InterfacedString.Cleanup;
begin
 f_ObjInterface := nil;
 inherited;
end;

function Tl3InterfacedString.pm_getObjInterface: IUnknown;
begin
 Result := f_ObjInterface;
end;

procedure Tl3InterfacedString.pm_setObjInterface(aValue: IUnknown);
begin
 f_ObjInterface := aValue;
end;

// start class Tl3InterfacedStringList

function Tl3InterfacedStringList.Add(const aSt    : Il3CString;
                                     const anIntf : IUnknown): Long;
 //overload;
begin
 Result := inherited Add(aSt);
 Tl3InterfacedString(Items[Result]).Intf := anIntf;
end;

function Tl3InterfacedStringList.Add(const aSt    : Tl3WString;
                                     const anIntf : IUnknown): Long;
  {-}
begin
 Result := inherited Add(aSt);
 Tl3InterfacedString(Items[Result]).Intf := anIntf;
end;

function Tl3InterfacedStringList.pm_getObjInterfaces(anIndex: LongInt): IUnknown;
begin
 Result := Tl3InterfacedString(Items[anIndex]).Intf;
end;

procedure Tl3InterfacedStringList.pm_setObjInterfaces(anIndex: LongInt; aValue: IUnknown);
begin
 Tl3InterfacedString(Items[anIndex]).Intf := aValue;
end;

function Tl3InterfacedStringList.pm_getStrings(anIndex: LongInt): String;
begin
 Result := Items[anIndex].AsString;
end;

function Tl3InterfacedStringList.StringItemClass: Rl3String;
  //override;
  {-}
begin
 Result := Tl3InterfacedString;
end;

function Tl3InterfacedStringList.CStrToItem(const aStr: Il3CString): Tl3CustomString;
  //override;
  {-}
begin
 Result := Tl3InterfacedString.Make(l3PCHarLen(aStr));
end;

function Tl3InterfacedStringList.FindInterface(const aSt: Tl3WString): IUnknown;
var
 l_Index : Long;
begin
 if FindData(aSt, l_Index, SortIndex) then
 begin
  Result := Tl3InterfacedString(Items[l_Index]).Intf;
 end
 else
  Result := nil;
end;

function Tl3InterfacedStringList.IndexOf(const aSt: String): LongInt;
begin
 if not FindData(aSt, Result, SortIndex) then
  Result := -1;
end;

end.
