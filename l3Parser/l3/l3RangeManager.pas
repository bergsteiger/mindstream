unit l3RangeManager;

{ ќбъект дл€ управлени€ диапазоном чисел }
{ јвтор: ∆учков јнтон                    }

{ $Id: l3RangeManager.pas,v 1.34 2013/04/19 13:08:17 lulin Exp $ }

// $Log: l3RangeManager.pas,v $
// Revision 1.34  2013/04/19 13:08:17  lulin
// - портируем.
//
// Revision 1.33  2011/04/29 13:42:02  fireton
// - поддержка Il3RangeTool
// - форматирование кода
//
// Revision 1.32  2010/12/08 19:04:29  lulin
// {RequestLink:228688602}.
// - закругл€ем край у строки ввода.
//
// Revision 1.31  2010/03/23 13:15:29  fireton
// - избавились от Finish в записи
//
// Revision 1.30  2010/03/16 18:42:38  lulin
// {RequestLink:197494962}.
// - добавлены комментарии.
//
// Revision 1.29  2010/03/16 18:35:48  lulin
// {RequestLink:197494962}.
// - удал€ем ненужное.
//
// Revision 1.28  2010/03/16 18:13:39  lulin
// {RequestLink:197494962}.
// - избегаем ненужного перераспределени€ пам€ти.
//
// Revision 1.27  2010/03/16 17:26:09  lulin
// {RequestLink:197494962}.
// - используем более простого предка.
// - утилитный метод €вно делаем таковым.
//
// Revision 1.26  2010/03/16 17:15:27  lulin
// {RequestLink:197494962}.
// [$197496797].
//
// Revision 1.24  2010/03/16 16:29:43  lulin
// {RequestLink:197494962}.
// - чистка кода.
//
// Revision 1.23  2010/03/16 16:25:54  lulin
// {RequestLink:197494962}.
// - используем итератор по "словам".
//
// Revision 1.21  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.20  2007/12/05 16:54:12  lulin
// - cleanup.
//
// Revision 1.19  2007/12/05 15:52:52  lulin
// - cleanup.
//
// Revision 1.18  2007/07/24 19:21:13  lulin
// - скомпилировалс€ F1 с модулем l3Interfaces, сгенерированным с модели.
//
// Revision 1.17  2007/03/28 19:42:59  lulin
// - Ёлѕаковский редактор переводим на строки с кодировкой.
//
// Revision 1.16  2007/02/05 09:07:08  lulin
// - cleanup.
//
// Revision 1.15  2006/06/20 11:43:45  oman
// - fix: Ќекорректно обрабатывались слишком большие числа (cq21386)
//
// Revision 1.14  2006/03/06 12:03:09  oman
// - new behavior: указание "правильного" провисани€ ресурсов при добавлении объектов в кэш
//
// Revision 1.13  2005/01/18 10:02:56  fireton
// - типизируем эксепшн
//
// Revision 1.12  2004/12/30 11:46:34  lulin
// - интерфейсы относ€щиес€ к Preview переехали в библиотеку _AFW.
//
// Revision 1.11  2004/12/28 07:03:46  fireton
// - bug fix: подчистка кода Confine
//
// Revision 1.10  2004/12/27 17:23:32  lulin
// - new behavior: в первом приближении вернул печать диапазона (пока без открытых интервалов).
//
// Revision 1.9  2004/06/17 08:53:01  voba
// - bug fix
//
// Revision 1.8  2004/02/27 15:03:20  fireton
// - добавлена поддержка '_' (нижн€€ часть граф. образа)
//
// Revision 1.7  2004/02/02 09:11:24  fireton
// - bugfix: починен GetCount - не должен теперь умирать при пустом массиве
//
// Revision 1.6  2004/01/14 15:06:36  fireton
// - add: добавлен метод Confine - ограничить диапазон по Max/Min
//
// Revision 1.5  2004/01/12 12:21:00  fireton
// - полностью переработанна€ логика.
//   теперь строитс€ массив не значений (которых может быть очень много), а диапазонов
//
// Revision 1.4  2004/01/09 13:48:17  fireton
// - добавлено IndexOfPage
//
// Revision 1.3  2004/01/09 10:06:42  fireton
// - change behaviour: провер€етс€ на правильность теперь внешн€€ строка, а парсинг выполн€етс€
//   сразу по присваиванию строки в SourceStr
//
// Revision 1.2  2004/01/08 15:18:57  law
// - cleanup: поправил форматирование.
//
// Revision 1.1  2004/01/08 14:34:42  fireton
// - первый выпуск
//

interface

uses
  SysUtils,

  l3Interfaces,
  l3InternalInterfaces,
  l3Base,
  l3CProtoObject
  ;

type

  ERangeManagerParseError = class (Exception);

  TRMRange = record
   rRange    : Tl3Range;
   rLastIndex: Integer;
  end;//TRMRange

  Tl3RangeManager = class(Tl3CProtoObject, Il3RangeManager, Il3RangeTool)
    private
    // internal fields
      f_PagesArr   : array of TRMRange;
      f_SrcString  : AnsiString;
      {$IfNDef Nemesis}
      f_BottomSide : Boolean;
      {$EndIf  Nemesis}
    protected
    // property methods
      function  Get_Count: Integer;
        {-}
      function  Get_IndexOfPage(aPage: Integer): Integer;
        {-}
      function  Get_Pages(aIndex: Integer): Integer;
        {-}
      procedure SetSrcString(const aValue: AnsiString);
        {-}
      // методы Il3RangeTool
      function pm_GetRangeCount: Integer;
        {-}
      function Get_Ranges(Index: Integer): Tl3Range;
        {-}
    protected
      procedure Cleanup;
       override;
    // internal methods
      function  HasPage(anIndex: Integer): Boolean;
        {-}
      procedure Reindex;
        {-}
    public
    // public methods
      constructor Create;
        {-}
      class function Make(const aStr: AnsiString = ''): Il3RangeManager;
        reintroduce;
        {-}
      {$IfNDef Nemesis}
      class function  CheckSource(const aSrcStr: AnsiString): Integer;
        {-}
      {$EndIf  Nemesis}  
      procedure Confine(aMin, aMax: Integer);
        {-}
      procedure ParseSource;
        {-}
    public
    // public properties
      property Count: Integer
        read Get_Count;
        {-}
      property IndexOfPage[Page: Integer]: Integer
        read Get_IndexOfPage;
        {-}
      property Pages[Index: Integer]: Integer
        read Get_Pages;
        default;
        {-}
      property SrcString: AnsiString
        read f_SrcString
        write SetSrcString;
        {-}
      {$IfNDef Nemesis}
      property BottomSide: Boolean
        read f_BottomSide
        write f_BottomSide;
        {-}
      {$EndIf  Nemesis}  
  end;//Tl3RangeManager

implementation

uses
  rxStrUtils,

  l3Types,
  l3String
  ;

resourcestring
 serrParseError = 'Range Manager parsing error';

// start class Tl3RangeManager

constructor Tl3RangeManager.Create;
begin
 inherited;
 f_SrcString := '';
 f_PagesArr := nil;
end;

class function Tl3RangeManager.Make(const aStr: AnsiString = ''): Il3RangeManager;
  //reintroduce;
  {-}
var
 l_M : Tl3RangeManager;
begin
 if (aStr = '') then
  Result := nil
 else
 begin
  l_M := Create;
  try
   l_M.SrcString := aStr;
   Result := l_M;
  finally
   l3Free(l_M);
  end;//try..finally
 end;//aStr = ''
end;

{$IfNDef Nemesis}
class function Tl3RangeManager.CheckSource(const aSrcStr: AnsiString): Integer;
var
 l_NewPage: Integer;
 l_LastPage: Integer;
 I: Integer;
 l_IsRange, l_MustBeANumber: Boolean;
 l_LastNumPos: Integer;

 procedure OmitSpaces;
 begin
  while (aSrcStr[I] in [' ','_']) and (I <= Length(aSrcStr)) do
   Inc(I);
 end;

 function ParseNumber: Integer;
 var
  l_NumS : AnsiString;
 begin
  l_NumS := '';
  OmitSpaces;
  l_LastNumPos := I;
  try
   while (I <= Length(aSrcStr)) do
   begin
    if not (aSrcStr[I] in [' ',',','-','0'..'9']) then // parsing error
    begin
     Result := -I;
     Exit;
    end;
    if aSrcStr[I] in [' ',',','-'] then
    begin
     if l_NumS <> '' then
     begin
      Result := StrToInt(l_NumS);
      l_MustBeANumber := False;
      Exit;
     end
     else
     begin
      Result := -I;
      Exit;
     end;
    end;
    l_NumS := l_NumS + aSrcStr[I];
    Inc(I);
   end;
   if (l_NumS = '') then
   begin
    if l_MustBeANumber then
     Result := -I
    else
     Result := 0;
   end
   else
   begin
    Result := StrToInt(l_NumS);
    l_MustBeANumber := False;
   end;
  except
   on EConvertError do
    Result := -1;
  end;
 end;

begin
 Result := -1;
 I := 1;
 l_LastPage := 0;
 l_IsRange := False;
 l_MustBeANumber := True;
 while I <= Length(aSrcStr) do
 begin
  if l_LastPage > 0 then // т.е. если это число не первое в р€ду
  begin
   OmitSpaces;
   if I <= Length(aSrcStr) then
   begin
    if aSrcStr[I] in ['-',','] then
    begin
     if aSrcStr[I] = '-' then
     begin
      if l_IsRange then
      begin
       Result := I; // error
       Exit;
      end
      else
       l_IsRange := True;
     end
     else
      l_IsRange := False;
     Inc(I);
     l_MustBeANumber := True;
    end
    else
    begin
     Result := I;
     Exit;
    end;
   end;
  end;

  if I <= Length(aSrcStr) then
  begin
   l_NewPage := ParseNumber;
   if l_NewPage < 0 then
   begin
    Result := I; // error
    Exit;
   end;
   if l_NewPage > 0 then
    if l_LastPage > l_NewPage then
    begin
     Result := l_LastNumPos; // error (число меньше чем предыдущее)
     Exit;
    end
    else
    begin
     l_LastPage := l_NewPage;
     Result := 0;
    end;
  end;
 end;
 if l_MustBeANumber then
  Result := Length(aSrcStr);
end;
{$EndIf  Nemesis}

procedure Tl3RangeManager.Confine(aMin, aMax: Integer);

 procedure DelRange(aIdx: Integer);
 var
  I: Integer;
 begin
  if Length(f_PagesArr) > 1 then
   for I := aIdx to Length(f_PagesArr)-2 do
    f_PagesArr[I] := f_PagesArr[I+1];
  SetLength(f_PagesArr, Length(f_PagesArr)-1);
 end;

begin
 //confine by minimum
 while (Length(f_PagesArr) > 0) and (f_PagesArr[0].rRange.rStart < aMin) do
 begin
  if f_PagesArr[0].rRange.rStart + f_PagesArr[0].rRange.rLength - 1 < aMin then
   DelRange(0)
  else
  begin
   f_PagesArr[0].rRange.rLength := f_PagesArr[0].rRange.rLength - (aMin - f_PagesArr[0].rRange.rStart);
   f_PagesArr[0].rRange.rStart := aMin;
  end;
 end;
 //confine by maximum
 while (Length(f_PagesArr) > 0) and (f_PagesArr[Length(f_PagesArr)-1].rRange.rStart > aMax) do
  SetLength(f_PagesArr, Length(f_PagesArr)-1);
 if (Length(f_PagesArr) > 0) then
  with f_PagesArr[Length(f_PagesArr)-1].rRange do
   if rStart + rLength - 1 > aMax then
    rLength := aMax - rStart + 1;
 Reindex;
end;

function Tl3RangeManager.Get_Count: Integer;
begin
 if f_PagesArr = nil then
  Result := 0
 else 
  Result := f_PagesArr[Length(f_PagesArr)-1].rLastIndex;
end;

function Tl3RangeManager.Get_IndexOfPage(aPage: Integer): Integer;
var
 I: Integer;
begin
 Result := -1;
 for I := 0 to Length(f_PagesArr)-1 do
 with f_PagesArr[I] do
 begin
  if (aPage >= rRange.rStart) and (aPage <= rRange.rStart + rRange.rLength - 1) then
  begin
   Result := rLastIndex - (rRange.rStart + rRange.rLength - 1 - aPage);
   Break;
  end;
 end;
end;

function Tl3RangeManager.Get_Pages(aIndex: Integer): Integer;
var
 I, K: Integer;
begin
 if (aIndex >= 1) and (aIndex <= Count) then
  for I := 0 to Length(f_PagesArr)-1 do
  begin
   if aIndex <= f_PagesArr[I].rLastIndex then
   begin
    K := f_PagesArr[I].rLastIndex - aIndex;
    with f_PagesArr[I].rRange do
     Result := rStart + (rLength - K - 1);
    Exit;
   end;
  end;
 raise ERangeError.Create(Format('Tl3RangeManager.GetPages - index (%d) out of range', [aIndex]));
end;

procedure Tl3RangeManager.ParseSource;
const
 cWhite = [#9, #32];
 
var
 J : Integer;
 l_IndCount: Integer;

 procedure AddRange(aPageStart, aLength: Integer);
 begin//AddRange
  f_PagesArr[J].rRange.rStart  := aPageStart;
  f_PagesArr[J].rRange.rLength := aLength;
  l_IndCount := l_IndCount + aLength;
  f_PagesArr[J].rLastIndex := l_IndCount;
  Inc(J);
  if J = Length(f_PagesArr) then
   SetLength(f_PagesArr, Length(f_PagesArr)+10);
 end;//AddRange

 function DoWord(const aStr: Tl3PCharLen; IsLast: Boolean): Boolean;

  function ToInt(const aStr: Tl3WString): Integer;
  begin
   Result := l3StrToInt(l3Trim(aStr, cWhite));
  end;

  procedure Split(var theFirst : Tl3WString;
                  out theTail  : Tl3WString;
                  aDelim       : AnsiChar);
  begin
   theTail := l3FindChar(aDelim, theFirst);
   theFirst := l3RTrim(theFirst, [aDelim]);
  end;

 const
  cDelim = '-';
 var
  l_First  : Tl3WString;
  l_Tail   : Tl3WString;
  l_FirstN : Integer;
  l_LastN  : Integer;
 begin//DoWord
  Result := true;
  l_First := aStr;
  Split(l_First, l_Tail, cDelim);
  if l3IsNil(l_Tail) then
   // - "слово" одно
   AddRange(ToInt(l_First), 1)
  else
  begin
   if not l3HasChar(cDelim, l_Tail) then
   begin
    // - "слов" два
    l_FirstN := ToInt(l_First);
    l_LastN  := ToInt(l_Tail);
    if l_LastN >= l_FirstN then
     AddRange(l_FirstN, l_LastN - l_FirstN + 1)
    else
     raise ERangeManagerParseError.Create(serrParseError); // второе число меньше первого = ошибка
   end
   else
    // - "слов" больше двух
    raise ERangeManagerParseError.Create(serrParseError);
  end;//l3IsNil(l_Tail)
 end;//DoWord

var
 l_S : Tl3PCharLen;
 {$IfNDef Nemesis}
 l_ErrPos : Integer;
 {$EndIf  Nemesis}
begin
 {$IfNDef Nemesis}
 l_ErrPos := CheckSource(f_SrcString);
 if (l_ErrPos <> 0) then
  raise ERangeManagerParseError.Create(serrParseError+' in position '+IntToStr(l_ErrPos));
 {$EndIf  Nemesis}
 l_S := l3Trim(l3PCharLen(f_SrcString), cWhite);
 f_PagesArr := nil;
 SetLength(f_PagesArr, 3);
 {$IfNDef Nemesis}
 f_BottomSide := l3IsChar(l_S, 0, '_');
 if f_BottomSide then
  l_S.Shift(1);
 {$EndIf Nemesis}
 J := 0;
 l_IndCount := 0;
 l3ParseWordsExF(l_S, l3L2WA(@DoWord), [',']);
 SetLength(f_PagesArr, J);
end;

procedure Tl3RangeManager.Reindex;
var
 I: Integer;
 l_Idx: Integer;
begin
 l_Idx := 0;
 for I := 0 to Length(f_PagesArr)-1 do
 begin
  l_Idx := l_Idx + f_PagesArr[I].rRange.rLength;
  f_PagesArr[I].rLastIndex := l_Idx;
 end;
end;

function Tl3RangeManager.HasPage(anIndex: Integer): Boolean;
  {-}
begin
 Result := (IndexOfPage[anIndex] > 0);
end;
  
procedure Tl3RangeManager.SetSrcString(const aValue: AnsiString);
begin
 f_SrcString := aValue;
 ParseSource;
end;

procedure Tl3RangeManager.Cleanup;
begin
 f_PagesArr := nil;
 inherited;
end;

function Tl3RangeManager.pm_GetRangeCount: Integer;
begin
 Result := Length(f_PagesArr);
end;

function Tl3RangeManager.Get_Ranges(Index: Integer): Tl3Range;
begin
 Result := f_PagesArr[Index].rRange;
end;

end.
