unit l3LineArray;
{* Информация о нарезке на строки. }

{ Библиотека "Эверест" }
{ Автор: Люлин А.В.    }
{ Модуль: l3LineArray - описание массива форматированных строк}
{ Начат: 13.12.96 }
{ $Id: l3LineArray.pas,v 1.12 2012/11/01 07:09:29 lulin Exp $ }

// $Log: l3LineArray.pas,v $
// Revision 1.12  2012/11/01 07:09:29  lulin
// - вычищаем мусор.
//
// Revision 1.11  2011/06/09 17:06:18  lulin
// {RequestLink:269060903}.
//
// Revision 1.10  2009/07/20 11:22:19  lulin
// - заставляем работать F1 после - {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.9  2008/04/23 18:27:44  lulin
// - <K>: 89106529.
//
// Revision 1.8  2008/02/20 18:35:00  lulin
// - упрощаем наследование.
//
// Revision 1.7  2008/01/28 14:41:34  lulin
// - объединил списки и динамические массивы.
//
// Revision 1.6  2007/09/25 07:41:56  lulin
// - убрано ненужное значение параметра по-умолчанию.
//
// Revision 1.5  2007/01/30 15:24:24  lulin
// - текст ноды - теперь более простого типа.
//
// Revision 1.4  2006/11/03 11:00:47  lulin
// - объединил с веткой 6.4.
//
// Revision 1.3.24.3  2006/10/26 12:50:45  lulin
// - используем полиморфизм, вместо выяснения класса объекта.
//
// Revision 1.3.24.2  2006/10/26 10:48:53  lulin
// - избавляемся от преобразования карты форматирования к тегу.
//
// Revision 1.3.24.1  2006/10/26 09:02:31  lulin
// - добавлен интерфейс - список форматированных строк.
//
// Revision 1.3  2005/11/01 15:49:23  lulin
// - bug fix: бывало обращение к несуществующей строке параграфа в результате которого не рисовался документ (CQ OIT5-17516).
//
// Revision 1.2  2005/05/24 13:53:33  lulin
// - rename unit: evFormattedLines -> l3FormattedLines.
//
// Revision 1.1  2005/05/24 13:43:34  lulin
// - rename unit: evLineAr -> l3LineArray.
//
// Revision 1.20  2004/05/31 17:15:30  law
// - cleanup.
//
// Revision 1.19  2004/05/27 14:31:56  law
// - new methods: _Tl3_CBase.IsCacheable, _NeedStoreInPool.
//
// Revision 1.18  2004/04/20 14:53:39  law
// - new method: Tl3PCharLen.InitPart.
// - remove proc: ev_plAssign.
//
// Revision 1.17  2003/09/23 08:37:56  law
// - new prop: IevHyperlink.Hint.
// - rename proc: ev_plAssignNil -> l3AssignNil.
//
// Revision 1.16  2003/05/12 09:20:23  law
// - rename proc: ev_plIsNil -> l3IsNil.
//
// Revision 1.15  2002/07/18 16:28:11  law
// - new method: GetLine.
//
// Revision 1.14  2002/07/18 11:47:58  law
// - new class: _TevBaseLineArray.
//
// Revision 1.13  2002/07/18 10:42:10  law
// - comments.
//
// Revision 1.12  2002/07/09 12:02:20  law
// - rename unit: evUnits -> l3Units.
//
// Revision 1.11  2002/02/06 11:36:42  law
// - bug fix: не всегда учитывалась кодировка исходной строки.
//
// Revision 1.10  2001/06/22 09:07:38  law
// - bug fix: подавление EListError при получении параметров несуществующей строки (что спорно, но пока сделано так).
//
// Revision 1.9  2001/06/19 09:29:50  law
// - new behavior: TevLineArray теперь сделан на основе "динамического" массива.
//
// Revision 1.8  2001/02/26 09:06:49  law
// - сделана обработка переноса слов по слогам.
//
// Revision 1.7  2000/12/15 15:10:36  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  Classes,

  l3Interfaces,
  l3Types,
  l3Base,
  l3String,
  l3DynamicArray,

  l3Units
  ;

type
  TevBaseLineInfo = packed object
   {* Информация о нарезке на строки. }
    public
    // public fields
      B  : Long;
       {* - правая граница строки. }
      LE : Tl3Point;
       {* - размеры строки. }
  end;//TevBaseLineInfo

  TevLineInfo = packed object(TevBaseLineInfo)
   {* Информация о нарезке на строки и их оформлении. }
    public
    // public fields
      FI : Tl3FontIndexes;
       {* - набор индексов шрифта. }
      WC : Long;
       {* - количество слов (пробелов) в строке. }
      AddHyphen : Bool;
       {*- добавлять ли знак переноса. }
  end;{TevLineInfo}
  PevLineInfo = ^TevLineInfo;
  PevBaseLineInfo = ^TevBaseLineInfo;
  PPevLineInfo = ^PevLineInfo;

  TevBaseLineArray = class(Tl3DynamicArray)
   {* Массив нарезок на строки. }
    protected
    // property methods
      function  GetLineWidth(i: Long): Long;
      procedure SetLineWidth(i: Long; Value: Long);
        {-}
      function  GetLineHeight(i: Long): Long;
        {-}
    protected
    // internal methods
      function  pm_GetItemSize: Long;
        override;
        {-}
    public
    // public methods
      procedure Add(B: Long; const LineExtent: Tl3_Point);
        reintroduce;
        {* - добавить информацию о строке. }
      class function IsCacheable: Bool;
        override;
        {-}
      procedure GetLineBorders(const aText: Tl3PCharLen; L: Long; var B1,B2: Long);
        {* - получить информацию о границах строки. }
      function  GetLine(S: Tl3CustomString; i: Long): Tl3PCharLen;
        overload;
        {* - получить i-ю строку. }
      function  GetLine(const S: Tl3PCharLenPrim; i: Long): Tl3PCharLen;
        overload;
        {* - получить i-ю строку. }
    public
    // public properties
      property  LineWidth[i: Long]: Long
        read GetLineWidth
        write SetLineWidth;
        {* - ширина строки. }
      property  LineHeight[i: Long]: Long
        read GetLineHeight;
        {* - высота строки. }
      property  Items;
        {* - элементы массива. }
  end;//TevBaseLineArray

  TevLineArray = class(TevBaseLineArray, Il3Lines)
   {* Массив нарезок на строки. }
    protected
    // property methods
      function  GetLineWordCount(i: Long): Long;
      procedure SetLineWordCount(i: Long; Value: Long);
        {-}
    protected
    // internal methods
      function AsObject: TObject;
        {-}
      function Get_Count: Integer;
        {-}
      function pm_GetItemSize: Long;
        override;
        {-}
    public
    // public methods
      procedure Add(aB              : Long;
                    var aLineExtent : Tl3_Point;
                    aFI             : Tl3FontIndexes;
                    anAddHyphen     : Bool);
        reintroduce;
        overload;
        {* - добавить информацию о строке. }
      procedure Add(B: Long; const LineExtent: Tl3_Point);
        overload;
        {* - добавить информацию о строке. }
      procedure ShiftLines(TL: Long; Len: Long);
        {* - сдвинуть информацию о нарезке. }
    public
    // public properties
      property  LineWordCount[i: Long]: Long
        read GetLineWordCount
        write SetLineWordCount;
        {* - количество слов в строке. }
  end;//TevLineArray

implementation

uses
  l3Const,
  l3Chars
  ;

// start class TevLineArray

procedure TevLineArray.Add(aB              : Long;
                           var aLineExtent : Tl3_Point;
                           aFI             : Tl3FontIndexes;
                           anAddHyphen     : Bool);
  {overload;}
begin
 if (l3_fiSub in aFI) then
  Inc(aLineExtent.P.Y, l3FontIndexDelta);
 if (l3_fiSuper in aFI) then
  Inc(aLineExtent.P.Y, l3FontIndexDelta);
 inherited Add(aB, aLineExtent);
 if (aFI = [l3_fiNone]) then
  aFI := [];
 with PevLineInfo(Items[Pred(Count)])^ do
 begin
  WC := -1; FI := aFI;
  AddHyphen := anAddHyphen;
 end;//PevLineInfo(Items[Pred(Count)])^
end;

procedure TevLineArray.Add(B: Long; const LineExtent: Tl3_Point);
  {overload;}
  {-}
var
 LE : Tl3_Point;
begin
 LE := LineExtent;
 Add(B, LE, [], false);
end;

function  TevLineArray.GetLineWordCount(i: Long): Long;
begin
 try
  Result := PevLineInfo(Items[Pred(i)])^.WC;
 except
  on EListError do Result := 0;
 end;//try..except
end;

procedure TevLineArray.SetLineWordCount(i: Long; Value: Long);
begin
 PevLineInfo(Items[Pred(i)])^.WC := Value;
end;

function TevLineArray.AsObject: TObject;
  {-}
begin
 Result := Self;
end;

function TevLineArray.Get_Count: Integer;
  {-}
begin
 Result := Count;
end;

function TevLineArray.pm_GetItemSize: Long;
  //override;
  {-}
begin
 Result := SizeOf(TevLineInfo);
end;

procedure TevLineArray.ShiftLines(TL: Long; Len: Long);
  {-}
var
 LI  : PevBaseLineInfo;
 LID : Long;
begin
 if (TL <= Count) then begin
  for LID := TL to Count do begin
   LI := Items[Pred(LID)];
   LI^.B := LI^.B + Len;
  end;{for LID..}
 end;{TL <= Count}
end;

// start class TevBaseLineArray

function TevBaseLineArray.GetLineWidth(i: Long): Long;
begin
 try
  Result := PevBaseLineInfo(Items[Pred(i)])^.LE.X;
 except
  on EListError do Result := 0;
 end;//try..except
end;

procedure TevBaseLineArray.SetLineWidth(i: Long; Value: Long);
begin
 PevBaseLineInfo(Items[Pred(i)])^.LE.X := Value;
end;

function TevBaseLineArray.GetLineHeight(i: Long): Long;
begin
 try
  Result := PevBaseLineInfo(Items[Pred(i)])^.LE.Y;
 except
  on EListError do Result := 0;
 end;//try..except
end;

function TevBaseLineArray.pm_GetItemSize: Long;
  //override;
  {-}
begin
 Result := SizeOf(TevBaseLineInfo);
end;

class function TevBaseLineArray.IsCacheable: Bool;
  {override;}
  {-}
begin
 Result := true;
end;

procedure TevBaseLineArray.GetLineBorders(const aText: Tl3PCharLen; L: Long; var B1, B2: Long);
begin
 B1 := 0; B2 := 0;
 if not l3IsNil(aText) then begin
  Dec(L);
  if (L = 0) then
   B1 := 0
  else
   B1 := PevBaseLineInfo(Items[Pred(L)])^.B;
  if (Count = 0) OR (L = Count) then
   B2 := aText.SLen
  else
   B2 := PevBaseLineInfo(Items[L])^.B;
 end;
end;

function TevBaseLineArray.GetLine(S: Tl3CustomString; i: Long): Tl3PCharLen;
begin
 if S.Empty then
  l3AssignNil(Result)
 else
  Result := GetLine(S.AsPCharLen, i); 
end;

function TevBaseLineArray.GetLine(const S: Tl3PCharLenPrim; i: Long): Tl3PCharLen;
  //overload;
  {* - получить i-ю строку. }
var
 O1, O2 : Long;
begin
 if l3IsNil(S) then
  l3AssignNil(Result)
 else
 begin
  Dec(i);
  if (i = 0) then
   O1 := 0
  else
   O1 := PevBaseLineInfo(Items[Pred(i)])^.B;
  if (Count = 0) OR (i = Count) then
   O2 := S.SLen
  else
   O2 := PevBaseLineInfo(Items[i])^.B;
  Result.InitPart(S.S, O1, O2, S.SCodePage);
 end;//l3IsNil(S)
end;

procedure TevBaseLineArray.Add(B: Long; const LineExtent: Tl3_Point);
  {overload;}
  {-}
var
 LI : TevBaseLineInfo;
begin
 LI.B := B; LI.LE := Tl3Point(LineExtent);
 inherited Add(LI);
end;

end.

