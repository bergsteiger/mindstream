unit l3EndingList;
{* Список окончаний. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3EndingList -              }
{ Начат: 25.03.2002 14:27 }
{ $Id: l3EndingList.pas,v 1.11 2008/03/20 09:48:40 lulin Exp $ }

// $Log: l3EndingList.pas,v $
// Revision 1.11  2008/03/20 09:48:40  lulin
// - cleanup.
//
// Revision 1.10  2008/02/20 14:06:42  lulin
// - удалены избыточные операции сравнения.
//
// Revision 1.9  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.8  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.7  2007/08/30 11:45:04  lulin
// - удален ненужный модуль.
//
// Revision 1.6  2006/05/04 11:01:26  lulin
// - поправлен тип длины строки.
// - вычищены "старые" методы работы с памятью и строками.
//
// Revision 1.5  2004/06/02 14:04:30  law
// - удален конструктор Tl3VList.MakeSortedEx.
//
// Revision 1.4  2004/06/01 14:23:13  law
// - удалены конструкторы Tl3VList.MakeLongint, MakeLongintSorted - пользуйтесь _Tl3LongintList.
//
// Revision 1.3  2002/04/03 14:36:55  law
// - comments: xHelpGen.
//
// Revision 1.2  2002/03/26 16:31:14  law
// - bug fix: изменен алгоритм поиска окончания.
//
// Revision 1.1  2002/03/25 14:39:23  law
// - cleanup: избавляемся от ненужных регулярных выражений.
//

{$I l3Define.inc }

interface

uses
  l3Types,
  l3Interfaces,
  l3Base,
  l3StringList
  ;

type
  Tl3EndingList = class(Tl3StringList)
   {* Список окончаний. }
    protected
    // internal methods
      function  CompareEndings(const A, B : Tl3WString;
                               aSortIndex : Tl3SortIndex = l3_siNative): Long;
        {-}
    public
    // public methods
      constructor Create(const theEndings: String);
        reintroduce;
        {* - создает список окончаний. Окончания д. б. разделены символом '|'.}
      function InWord(const aWord      : Tl3PCharLen;
                      out EndingOffset : Cardinal): Bool;
        {* - проверяет входит ли одно из окончаний в слово. }
  end;//Tl3EndingList

implementation

uses
  SysUtils,
  StrUtils,

  l3String
  , l3PrimString;

// start class Tl3EndingList

constructor Tl3EndingList.Create(const theEndings: String);
  //reintroduce;
  {-}
var
 l_Endings : String;
 l_Pos     : Long;
begin
 MakeSorted;
 l_Endings := theEndings;
 while (l_Endings <> '') do begin
  l_Pos := Pos('|', l_Endings);
  if (l_Pos = 0) then begin
   Add(ANSIUpperCase(ReverseString(l_Endings)));
   break;
  end else begin
   Add(ANSIUpperCase(ReverseString(Copy(l_Endings, 1, Pred(l_Pos)))));
   System.Delete(l_Endings, 1, l_Pos);
  end;//l_Pos = 0
 end;//while (l_Endings <> '')
end;
  
function Tl3EndingList.CompareEndings(const A, B : Tl3WString;
                                      aSortIndex : Tl3SortIndex = l3_siNative): Long;
  {-}
var
 l_S1       : Tl3WString; // окончание
 l_S2       : Tl3WString; // слово
 l_Index1   : Long;
 l_Index2   : Long;
begin
 l_S1 := A;
 l_S2 := B;
 Result := -1;
 l_Index1 := 0;
 for l_Index2 := Pred(l_S2.SLen) downto 0 do begin
  Result := Long(l_S1.S[l_Index1]) - Long(l_S2.S[l_Index2]);
  if (Result <> 0) then
   break;
  if (l_Index1 = Pred(l_S1.SLen)) then
   if (Result = 0) then
    Exit
   else
    break;
   // - достигнут конец окончания
  Inc(l_Index1); 
 end;//for l_Index2
 if (Result = 0) AND (l_Index1 <= Pred(l_S1.SLen)) then
  // - слово меньше окончания
  Result := 1;
end;

function Tl3EndingList.InWord(const aWord      : Tl3PCharLen;
                              out EndingOffset : Cardinal): Bool;
  {-}
var
 l_FoundLen  : Long;
 l_Len       : Long;
 l_Index     : Long;
 l_Ending    : Tl3PrimString;
begin
 Result := false;
 l_FoundLen := 0;
 for l_Index := Lo to Hi do
 begin
  l_Ending := Items[l_Index];
  if (CompareEndings(l_Ending.AsWStr, aWord) = 0) then
  begin
   Result := true;
   l_Len := l_Ending.AsWStr.SLen;
   if (l_Len > l_FoundLen) then
    l_FoundLen := l_Len;
  end;//CompareEndings..
 end;//for l_Index
 if Result then
  EndingOffset := aWord.SLen - l_FoundLen;
end;

end.

