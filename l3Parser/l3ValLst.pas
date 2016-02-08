unit l3ValLst;
{* Список значений. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3ValLst -                  }
{ Начат: 15.10.1999 14:35             }
{ $Id: l3ValLst.pas,v 1.13 2010/02/27 10:12:37 lulin Exp $ }

// $Log: l3ValLst.pas,v $
// Revision 1.13  2010/02/27 10:12:37  lulin
// {RequestLink:193822954}.
// - упрощаем структуры.
//
// Revision 1.12  2009/12/28 16:24:03  lulin
// - определяем локализуемые строки на модели.
//
// Revision 1.11  2008/02/19 11:06:00  lulin
// - восстановил всякие экзотические поиски в списках объектов.
//
// Revision 1.10  2008/02/13 16:03:14  lulin
// - убраны излишне гибкие методы поиска.
//
// Revision 1.9  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.8  2001/09/11 10:12:55  law
// - new behavior: реализован метод Assign для Tl3NamedString.
//
// Revision 1.7  2001/07/27 15:46:05  law
// - comments: xHelpGen.
//
// Revision 1.6  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  Classes,

  l3Types,
  l3Base,
  l3Dict,
  l3PrimString
  ;

type
  Tl3NamedString = class(Tl3String)
   {* Строка с привязанным к ней значением. }
    private
    {property fields}
      f_Value : string;
    public
    // public methods
      procedure AssignString(P: Tl3PrimString);
        override;
        {-}
    public
    {public properties}
      property Value: string
        read f_Value
        write f_Value;
        {* - привезанное значение. }
  end;{Tl3NamedString}

  Tl3CustomValueList = class(Tl3Dictionary)
   {* Список значений. }
    protected
    {property methods}
      function  pm_GetValues(const Name: string): string;
      procedure pm_SetValues(const Name, Value: string);
        {-}
//   function StringItemClass: Rl3String; override;
    public
    {public properties}
      property Values[const Name: string]: string
        read pm_GetValues
        write pm_SetValues;
        {* - значения. }
  end;{Tl3CustomValueList}

  Tl3ValueList = class(Tl3CustomValueList)
   {*! Список значений. Для конечного использования. }
    public
    {public properties}
      property Values;
        default;
        {-}
  end;{Tl3ValueList}

implementation

// start class Tl3CustomValueList

function Tl3CustomValueList.pm_GetValues(const Name: string): string;
  {-}
var
 i : Long;
begin
 if FindData(Name, i) then
  Result := Tl3NamedString(Items[i]).Value
 else
  Result := '';
end;

procedure Tl3CustomValueList.pm_SetValues(const Name, Value: string);
  {-}
var
 i  : Long;
 NS : Tl3NamedString;
begin
 if FindData(Name, i) then
  Tl3NamedString(Items[i]).Value := Value
 else begin
  NS := Tl3NamedString.Create{StringItemClass.Create As Tl3NamedString};
  try
   NS.AsString := Name;
   NS.Value := Value;
   Add(NS);
  finally
   l3Free(NS);
  end;{try..finally}
 end;
end;

(*function Tl3CustomValueList.StringItemClass: Rl3String;
begin
 Result := Tl3NamedString;
end;*)

// start class Tl3NamedString

procedure Tl3NamedString.AssignString(P: Tl3PrimString);
  //override;
  {-}
begin
 inherited;
 if (P Is Tl3NamedString) then
  Value := Tl3NamedString(P).Value;
end;

end.

