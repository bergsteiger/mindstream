unit l3StringFormatter;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Инишев Д.А. © }
{ Модуль: l3StringFormatter - }
{ Начат: 20.09.06 19:00 }
{ $Id: l3StringFormatter.PAS,v 1.8 2014/02/13 10:12:59 lulin Exp $ }

// $Log: l3StringFormatter.PAS,v $
// Revision 1.8  2014/02/13 10:12:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.7  2013/12/25 15:10:36  lulin
// {RequestLink:509706011}
// - перетрясаем модель.
//
// Revision 1.6  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.5  2007/12/24 13:25:49  lulin
// - модуль l3InternalInterfaces полностью перенесен на модель.
//
// Revision 1.4  2007/07/11 12:11:59  dinishev
// Cleanup
//
// Revision 1.3  2006/12/01 15:51:04  lulin
// - cleanup.
//
// Revision 1.2  2006/11/13 16:35:04  dinishev
// Bug fix: иногда выливали не все пробелы из-за чего ехали границы таблиц
//
// Revision 1.1  2006/09/21 12:25:41  dinishev
// new interface: Il3StringFormatter
//

{$Include l3Define.inc }

interface

uses
 l3Base,
 l3Types,
 l3InternalInterfaces,
 l3ProtoObject
 ;

type
 Tl3StringFormatted = class(Tl3ProtoObject, Il3StringFormatter)
 protected
  f_String       : Tl3String;
   {* - Форматируемая строка. }
  f_CurrSpacePos : Long; 
   {* - Позиция текущего найденного пробела. }
  f_CurrSpaceCnt : Long;
   {* - Текущее количество добавляемых пробелов. }
 protected 
  procedure DoBeforeFormatting; 
   virtual;
    {* - Действия перед началом форматирования строки. }
  procedure DoBeforeInsertSpaces; 
   virtual;
    {* - Действия перед вставкой пробелов. }
  procedure DoAfterInsertSpaces; 
   virtual;
    {* - Действия после вставкой пробелов. }
 protected   
  // - interfaces methods
  // Il3StringFormatter
  procedure FixWidth(aString    : TObject; 
                     aDelta           : Long; 
                     var aSpacesCount : Long);
    {-}
 end;

implementation

uses
 l3Chars, 
 l3String,
 l3StringEx;

{ Tl3StringFormatted }

procedure Tl3StringFormatted.DoAfterInsertSpaces;
begin

end;

procedure Tl3StringFormatted.DoBeforeFormatting;
begin

end;

procedure Tl3StringFormatted.DoBeforeInsertSpaces;
begin

end;

procedure Tl3StringFormatted.FixWidth(aString    : TObject;
                                      aDelta           : Long; 
                                      var aSpacesCount : Long);
  {-}
var
 l_WordCount    : Long;
 l_PCharString  : PAnsiChar;
 l_CharIndex    : Long;
 l_CurrPos      : Long;
 l_SpacesCount  : Long;
 l_Div          : Integer;
 l_StringLength : Long;
 l_Delta        : Long;
begin
 f_String := aString as Tl3String;
 l_StringLength := f_String.Len;
 if (l_StringLength > 0) and (aSpacesCount > 0) then
 begin
  l_PCharString := f_String.St;
  l_WordCount := l3CountOfChar(cc_HardSpace, l3PCharLen(l_PCharString, l_StringLength, f_String.CodePage));
  if (l_WordCount > 0) then
  begin
   if (f_String.CodePage = CP_Unicode) then
    l_Div := 2
   else
    l_Div := 1; 
   l_CurrPos := 0;
   l_SpacesCount := aSpacesCount;
   DoBeforeFormatting;
   while (l_SpacesCount > 0) AND (l_WordCount > 0) do 
   begin
    l_Delta := (l_PCharString - f_String.St) div l_Div;
    l_CharIndex := ev_lpCharIndex(cc_HardSpace, 
                                  l3PCharLen(l_PCharString, 
                                             l_StringLength - l_Delta, 
                                             f_String.CodePage));
    f_CurrSpaceCnt := l_SpacesCount div l_WordCount;
    f_CurrSpacePos := l_CharIndex + l_Delta;
    DoBeforeInsertSpaces;
    f_String.Insert(cc_HardSpace, f_CurrSpacePos, f_CurrSpaceCnt);
    DoAfterInsertSpaces;
    Dec(l_SpacesCount, f_CurrSpaceCnt);
    Dec(l_WordCount);
    Inc(l_CurrPos, l_CharIndex);
    Inc(l_CurrPos, f_CurrSpaceCnt);
    Inc(l_CurrPos);
    l_PCharString := f_String.St + l_CurrPos * l_Div;
   end;//while (l_SpacesCount > 0) AND (l_WordCount > 0) do 
   //Не все пробелы могли быть использованы (для обычного txt это не верно, но 
   //для NRSC с текстом со ссылками такая ситуация возможна.  
   if (l_SpacesCount > 0) then
     f_String.Append(cc_HardSpace, l_SpacesCount);
  end//if (l_WordCount > 0) then
  else
   aSpacesCount := 0; //- Сигнализируем, что мы не добили пробелами
 end;//if (l_StringLength > 0) and (aSpacesCount > 0) then
end;

end.

