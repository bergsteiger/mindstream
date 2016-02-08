unit l3FormattedLines;
{* Список отформатированных строк. }

{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: l3FormattedLines - }
{ Начат: 18.07.2002 16:59 }
{ $Id: l3FormattedLines.pas,v 1.27 2014/02/18 13:34:30 lulin Exp $ }

// $Log: l3FormattedLines.pas,v $
// Revision 1.27  2014/02/18 13:34:30  lulin
// - избавляемся от ненужного списка.
//
// Revision 1.26  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.25  2012/10/26 19:42:24  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.24  2011/05/23 14:25:46  dinishev
// Bug fix: не открывались документы в Арчи в векте.
//
// Revision 1.23  2011/05/19 10:36:07  lulin
// {RequestLink:266409354}.
//
// Revision 1.22  2011/05/18 18:01:07  lulin
// {RequestLink:266409354}.
//
// Revision 1.21  2009/07/21 15:10:18  lulin
// - bug fix: не собирался и не работал Архивариус в ветке.
//
// Revision 1.20  2008/02/20 18:35:00  lulin
// - упрощаем наследование.
//
// Revision 1.19  2008/02/20 10:47:13  lulin
// - удалена ненужная базовая функция очистки.
//
// Revision 1.18  2008/02/05 09:58:12  lulin
// - выделяем базовые объекты в отдельные файлы и переносим их на модель.
//
// Revision 1.17  2007/10/29 14:16:06  oman
// - fix: Более правильная починка ЦК16480 (cq27213)
//
// Revision 1.16  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.15  2007/04/17 13:26:32  lulin
// - bug fix: надписи на кнопках иногда нарезались не по словам, а внутри слова (CQ OIT5-25068).
//
// Revision 1.14  2007/04/09 08:30:28  lulin
// - переименовываем класс в соответствии с библиотекой.
//
// Revision 1.13  2007/04/09 08:14:33  lulin
// - cleanup.
//
// Revision 1.12  2007/04/09 07:12:17  lulin
// - bug fix: неправильно обращались с юникодными символами.
//
// Revision 1.11  2007/04/03 14:18:12  lulin
// - не пытаемся переформатировать однострочные заголовки.
//
// Revision 1.10  2007/04/03 13:52:56  lulin
// - увеличиваем ширину кнопки так, чтобы текст в итоге влез, без всяких многоточий.
//
// Revision 1.9  2007/03/26 11:23:23  voba
// - bug fix от Шуры
//
// Revision 1.8  2007/01/30 15:24:24  lulin
// - текст ноды - теперь более простого типа.
//
// Revision 1.7  2007/01/10 15:22:25  lulin
// - cleanup.
//
// Revision 1.6  2006/12/01 15:51:04  lulin
// - cleanup.
//
// Revision 1.5  2006/01/31 13:59:01  mmorozov
// - add comments;
//
// Revision 1.4  2006/01/31 13:55:56  mmorozov
// - bugfix: при разбиении текста на строки, последовательно идущие символы конца строки (#10) и перевода каретки (#13) в любом порядке воспринимаются как перевод строки (CQ: 16480);
//
// Revision 1.3  2005/09/08 11:56:41  fireton
// - откат предыдущих изменений (надо)
//
// Revision 1.2  2005/09/08 11:51:40  fireton
// - change: TextExtend заменен на KerningTextExtend при подсчете размеров текста
//
// Revision 1.1  2005/05/24 13:53:33  lulin
// - rename unit: evFormattedLines -> l3FormattedLines.
//
// Revision 1.18.4.2  2005/05/24 13:43:29  lulin
// - rename unit: evLineAr -> l3LineArray.
//
// Revision 1.18.4.1  2005/05/18 12:42:46  lulin
// - отвел новую ветку.
//
// Revision 1.17.2.2  2005/05/18 12:32:08  lulin
// - очередной раз объединил ветку с HEAD.
//
// Revision 1.17.2.1  2005/04/28 09:18:29  lulin
// - объединил с веткой B_Tag_Box.
//
// Revision 1.17.4.1  2005/04/26 14:30:39  lulin
// - ускоряем l3Free и _l3Use.
//
// Revision 1.18  2005/04/28 15:03:37  lulin
// - переложил ветку B_Tag_Box в HEAD.
//
// Revision 1.17.4.1  2005/04/26 14:30:39  lulin
// - ускоряем l3Free и _l3Use.
//
// Revision 1.17  2005/04/07 13:45:23  mmorozov
// bugfix: для пустой строки в MesuareStr не вычислялся размер (используем AverageCharHeight);
//
// Revision 1.16  2005/03/29 17:03:39  lulin
// - пытаемся поменьше делать телодвижений при имерении длины строки.
//
// Revision 1.15  2005/02/22 12:27:39  lulin
// - рефакторинг работы с Tl3Point и Tl3Rect.
//
// Revision 1.14  2005/02/18 18:59:20  lulin
// - bug fix: параграф-дерево неправильно форматировался для вывода по принтерной канве.
//
// Revision 1.13  2005/02/18 18:06:32  lulin
// - вызываем более быстрый метод поиска конца нарезаемой строки.
//
// Revision 1.12  2004/12/09 12:49:51  lulin
// - bug fix: в Unicode-строках не учитывались Enter'ы.
//
// Revision 1.11  2004/12/08 08:49:39  lulin
// - bug fix: было зависание при маленьких ширинах.
//
// Revision 1.10  2004/12/07 10:21:29  lulin
// - добавлен Assert(aWidth >= 0).
//
// Revision 1.9  2004/12/04 11:54:05  mmorozov
// bugfix: при разбиении текста по доступной ширине не правильно вычислялась длинна строки для unicode строк;
//
// Revision 1.8  2004/06/02 07:51:09  law
// - bug fix: не собирался AllEverestComponents.
//
// Revision 1.7  2004/04/20 08:04:45  law
// - bug fix: не компилировалось, в связи с изменениями Tl3PCharLen для Unicode.
//
// Revision 1.6  2003/05/12 09:20:23  law
// - rename proc: ev_plIsNil -> l3IsNil.
//
// Revision 1.5  2003/04/15 15:13:57  law
// - bug fix: не компилировался Эверест.
//
// Revision 1.4  2002/07/23 11:05:23  law
// - new behavior: нарезаем на строки с учетом еще и cc_HardEnter.
//
// Revision 1.3  2002/07/19 05:38:36  law
// - new behavior: сделана нарезка на строки с учетом cc_SoftEnter.
//
// Revision 1.2  2002/07/18 16:29:27  law
// - new behavior: сделана нарезка на строки (пока без учета cc_SoftEnter).
//
// Revision 1.1  2002/07/18 13:06:46  law
// - new unit: evFormattedLines.
//

{$Include l3Define.inc }

interface

uses
  l3Types,
  l3Interfaces,
  l3InternalInterfaces,
  l3Base,
  l3ObjectRefList,
  l3ProtoObjectRefList,
  l3ProtoPersistentRefList
  ;

type
  Tl3FormattedLines = class(Tl3ProtoObjectRefList, Il3MultiLines)
   {* Список отформатированных строк. }
    private
    // internal fields
      f_HasBreakInWord : Boolean;
    public
    // public methods
      constructor Create;
        reintroduce;
        {-}
      function FormatLine(const aCanvas : Il3InfoCanvas;
                          aLine         : Long;
                          const aStr    : Tl3PCharLenPrim;
                          aWidth        : Long;
                          const aMeasureCanvas : Il3InfoCanvas = nil): Tl3Inch;
        {-}
      function IsSingle: Boolean;
        {-}  
      function HasBreakInWord: Boolean;
        {-}
  end;//Tl3FormattedLines

implementation

uses
  l3Chars,
  l3Units,
  l3Utils,
  l3String,
  l3LineArray
  ;

// start class Tl3FormattedLines

constructor Tl3FormattedLines.Create;
  //reintroduce;
  {-}
begin
 f_HasBreakInWord := false;
 Make;
end;

function Tl3FormattedLines.FormatLine(const aCanvas : Il3InfoCanvas;
                                      aLine         : Long;
                                      const aStr    : Tl3PCharLenPrim;
                                      aWidth        : Long;
                                      const aMeasureCanvas : Il3InfoCanvas = nil): Tl3Inch;
  {-}

 procedure AddEmpty;
 begin//AddEmpty
  if (aLine >= Count) then
   Count := Succ(aLine);
  Items[aLine] := nil;
 end;//AddEmpty

 function AddLines: TevBaseLineArray;
 begin//AddLines
  if (aLine >= Count) then
   Count := Succ(aLine);
  Result := Items[aLine] As TevBaseLineArray;
  if (Result = nil) then
  begin
   Result := TevBaseLineArray.Create;
   try
    Items[aLine] := Result;
   finally
    Result := Result.Free;
   end;//try..finally
  end//Result = nil
  else
   Result.Count := 0;
 end;//AddLines

 function AveHeight: Integer;
 begin//
  if (aMeasureCanvas = nil) OR (aMeasureCanvas = aCanvas) then
   Result := aCanvas.AverageCharHeight
  else
  begin
   aMeasureCanvas.Font := aCanvas.Font;
   Result := aMeasureCanvas.AverageCharHeight;
  end;//aMeasureCanvas = nil
 end;//AveHeight

var
 l_Extent : Tl3Point;

 procedure MeasureStr(const aStr : Tl3PCharLenPrim;
                      aEnter     : Boolean);
 var
  lCanvas : Il3InfoCanvas;
 begin//MeasureStr
  l3FillChar(l_Extent, SizeOf(l_Extent), 0);
  if (aMeasureCanvas = nil) OR (aMeasureCanvas = aCanvas) then
   lCanvas := aCanvas
  else
  begin
   aMeasureCanvas.Font := aCanvas.Font;
   lCanvas := aMeasureCanvas;
  end;
  if l3IsNil(aStr) then
   l_Extent.Y := lCanvas.AverageCharHeight
  else
   l_Extent := lCanvas.TextExtent(aStr);
  if aEnter then
   Inc(l_Extent.P.X, 2 * lCanvas.AverageCharWidth);
 end;//MeasureStr

var
 l_WrappedStr : Tl3PCharLen;
 l_Lines      : TevBaseLineArray;
 l_Str        : Tl3PCharLen;

 procedure DoAdd(aEnter: Boolean);
 begin//DoAdd
  MeasureStr(l_WrappedStr, aEnter);
  if (aStr.SCodePage = CP_Unicode) then
   l_Lines.Add((l_Str.S - aStr.S) div SizeOf(WideChar), l_Extent)
  else
   l_Lines.Add(l_Str.S - aStr.S, l_Extent);
  Inc(Result, l_Extent.Y);
 end;//DoAdd

var
 l_SoftEnterCount : Long;
 l_WrapPos        : Long;
 l_SoftEnterIndex : Long; {-позиция SoftEnter'а}
 l_NoTabs         : Boolean;
 l_Char           : AnsiChar;
 l_NextChar       : AnsiChar;
 l_CRLFAdjust     : Long;
begin
 //Assert(aWidth >= 0);
 with aCanvas do
 begin
  if (aWidth < AverageCharWidth) then
  begin
   Result := AveHeight;
   AddEmpty;
  end//aWidth < AverageCharWidth
  else
  if l3IsNil(aStr) then
  begin
   Result := AveHeight;
   AddEmpty;
  end//l3IsNil(aStr)
  else
  begin
   l_Extent := TextExtent(aStr);
   l_SoftEnterCount := l3CountOfChar(cc_SoftEnter, aStr);
   Inc(l_SoftEnterCount, l3CountOfChar(cc_HardEnter, aStr));
   if (l_Extent.X > aWidth) OR (l_SoftEnterCount > 0) then
   begin
    // - здесь нарезаем на строки
    Result := 0;
    Tl3PCharLenPrim(l_Str) := aStr;
    l_Lines := AddLines;
    l_NoTabs := false;
    while (l_Str.SLen > 0) do
    begin
     l_WrapPos := Pos2IndexQ(aWidth, l_Str, l_NoTabs);
     //l_WrapPos := Pos2Index(aWidth, l_Str);
     l_WrappedStr := l_Str;
     if (l_WrapPos = 0) then
     begin
      // - защита от бесконечного цикла
      if (Result = 0) then
      begin
       Result := AveHeight;
       AddEmpty;
      end;//Result = 0
      break; 
     end;//l_WrapPos = 0
     with l_WrappedStr do
     begin
      if (l_WrapPos >= l_Str.SLen) then
       SLen := l_WrapPos
      else
       SLen := l3Utils.l3FindNextLine(l_WrappedStr, l_WrapPos);
      if (l_SoftEnterCount > 0) then
      begin
       {-еще есть SoftEnter'ы - надо их обработать}
       l_SoftEnterIndex := l3CharSetPresentEx(S, l_WrapPos, [cc_SoftEnter, cc_HardEnter], SCodePage);
       if (l_SoftEnterIndex >= 0) then
       begin
        Dec(l_SoftEnterCount);
        if SCodePage = CP_Unicode then
         l_Char := l3WideToChar(PWideChar(S)[l_SoftEnterIndex])
        else
         l_Char := PAnsiChar(S)[l_SoftEnterIndex];
        if l_SoftEnterIndex < SLen then
        begin
         if SCodePage = CP_Unicode then
          l_NextChar := l3WideToChar(PWideChar(S)[l_SoftEnterIndex + 1])
         else
          l_NextChar := PAnsiChar(S)[l_SoftEnterIndex + 1];
        end
        else
         l_NextChar := #0;
        if (l_Char = cc_HardEnter) and (l_NextChar = cc_SoftEnter) then
         l_CRLFAdjust := 1
        else
         l_CRLFAdjust := 0;
        SLen := l_SoftEnterIndex;
        l_Str.InitPart(S,
                       l_SoftEnterIndex + 1 + l_CRLFAdjust,
                       l_Str.SLen - (SLen + 1) + l_SoftEnterIndex + 1,
                       SCodePage);
        DoAdd(True);
        if (l_Str.SLen = 0) then
         break // - строка закончилась
        else
         continue; // - продолжаем форматировать остаток строки
       end;{l_SoftEnterIndex >= 0}
      end;{l_SoftEnterCount > 0}
      l_Str.Shift(SLen);
     end;//with l_WrappedStr
     if (l_Str.SLen > 0) AND not l3IsChar(l_WrappedStr, l_WrappedStr.SLen - 1, cc_HardSpace) then
      f_HasBreakInWord := true;
     DoAdd(False);
   end;//while (l_Str.SLen > 0)
   end
   else
   begin
    MeasureStr(aStr, false);
    Result := l_Extent.Y;
    AddEmpty;
   end;//l_Extent.X > aWidth
  end;//l3IsNil(aStr)
 end;//with aCanvas
end;

function Tl3FormattedLines.IsSingle: Boolean;
  {-}
begin
 Result := (Count < 1) OR
           (First = nil) OR
           (TevBaseLineArray(First).Count <= 1);
end;

function Tl3FormattedLines.HasBreakInWord: Boolean;
  {-}
begin
 Result := f_HasBreakInWord;
end;

end.

