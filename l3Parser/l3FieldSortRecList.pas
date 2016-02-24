unit l3FieldSortRecList;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3RecList -                 }
{ Начат: 25.04.2006 09:30             }
{ $Id: l3FieldSortRecList.pas,v 1.6 2014/10/09 13:54:40 voba Exp $ }

// $Log: l3FieldSortRecList.pas,v $
// Revision 1.6  2014/10/09 13:54:40  voba
//  k:565492100
//
// Revision 1.5  2013/04/03 15:28:56  lulin
// - портируем.
//
// Revision 1.4  2009/09/29 12:58:18  voba
// - add procedure SortBy - изменение набора полей для сортировки и собственно сортировка
// - нумерация полей для сортировки теперь начинается с 1
//
// Revision 1.3  2009/09/25 10:30:06  voba
// - add инверсия сортировки
//
// Revision 1.2  2008/03/13 12:55:27  voba
// - add  function FindRecord
//
// Revision 1.1  2008/02/22 18:26:37  lulin
// - доперевёл списки на модель.
//
// Revision 1.25  2008/02/22 16:57:43  lulin
// - упорядочиваем примеси.
//
// Revision 1.24  2008/02/20 18:17:06  lulin
// - восстановлен поиск в списках записей.
//
// Revision 1.23  2008/02/20 17:40:17  lulin
// - убрано ненужное значение параметра по-умолчанию.
//
// Revision 1.22  2008/02/19 14:58:59  lulin
// - переводим сортировку списков на новые, менее виртуальные, рельсы.
//
// Revision 1.21  2008/02/19 11:06:00  lulin
// - восстановил всякие экзотические поиски в списках объектов.
//
// Revision 1.20  2008/02/13 11:31:05  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.19  2008/02/12 11:42:56  lulin
// - методы для сохранения списка переехали на примесь.
//
// Revision 1.18  2008/01/29 11:15:40  lulin
// - рисуем базовые объекты.
//
// Revision 1.17  2008/01/28 14:41:34  lulin
// - объединил списки и динамические массивы.
//
// Revision 1.16  2008/01/18 10:35:31  lulin
// - <TDN>: 13.
//
// Revision 1.15  2007/11/08 08:56:36  voba
// - add comment
//
// Revision 1.14  2007/11/06 12:33:19  voba
// - add comment
//
// Revision 1.13  2007/08/29 19:21:12  lulin
// - упрощаем поиск в списках.
//
// Revision 1.12  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.11  2007/03/21 08:12:37  voba
// - new beh.  в Tl3FieldSortRecList можно задать поля для сортировки\поиска
//
// Revision 1.10  2007/02/27 09:55:02  lulin
// - cleanup.
//
// Revision 1.9  2006/12/08 10:25:08  lulin
// - bug fix: падали при удалении элемента.
//
// Revision 1.8  2006/11/17 15:28:46  voba
// - add   function  Tl3BaseRecList.FindPart
//
// Revision 1.7  2006/09/22 06:22:27  voba
// - add constructor Tl3FieldSortRecList.CreateFrom
//
// Revision 1.6  2006/08/28 11:40:56  voba
// - bug fix
//
// Revision 1.5  2006/05/04 13:01:58  lulin
// - сделан список с сортировкой записей по первым нескольким полям.
//
// Revision 1.4  2006/05/04 12:46:10  voba
// - _ItemSize теперь property
//
// Revision 1.3  2006/04/28 06:46:59  lulin
// - опубликована функция сравнения элемента списка с данными.
//
// Revision 1.2  2006/04/25 08:09:26  lulin
// - сделан полноценный редактируемый список, для хранения записей фиксированной длинны.
//
// Revision 1.1  2006/04/25 07:26:28  lulin
// - упорядочена работа с сортировкой списков и поиском в них.
// - начат класс, для хранения записей фиксированного размера.
//

{$Include l3Define.inc }

interface

uses
  l3Types,
  l3RecList
  ;

type
  Tl3FieldSortRecList = class(Tl3RecList)
    private
    // internal fields
      f_FieldSize : TSmallIntArray;
      f_FieldOffs : TLongArray;
      f_SortFields : TSmallIntArray;
    protected
    // internal methods
      function  DoCompare(const A;
                          const B;
                          aFldCount : Cardinal): Integer;
        override;
        {* - aFldCount - количество сравниваемых полей}

        //!! Подавать на поиск нужно заполненную запись по структуре аналогичную хранимой записи
        //!! Особенно это касается списков с нетривиальным aSortFields
        //!! Скажем, если в качестве сортировки используется второе поле записи,
        //!! то неверно подать для поиска только его, т к в процедуре сравнения
        //!! считаются смещения полей относительно начала записи
    public
    // public methods
      constructor Create(anItemSize       : Integer;
                         const aFieldSize : array of SmallInt;
                         const aSortFields : array of Smallint
                         );
        reintroduce;
        overload;
         {* - Создает список c длиной записи anItemSize,
              длинами полей в aFieldSize.
              Номера полей для сортировки и последовательность их сравнения указаны в aSortFields (нумерация c 1),
              если номер отрицательный, то сортировка в обратном порядке
              если aSortFields = [], то сравниваются все поля, указанные в aFieldSize последовательно}

      constructor Create(anItemSize       : Integer;
                         const aFieldSize : array of SmallInt
                         );
        reintroduce;
        overload;
         {* - Создает список c длиной записи anItemSize,
              длинами полей в aFieldSize.
              Сортировка по всем полям последовательно}

      constructor CreateFrom(aDonorList : Tl3FieldSortRecList;
                             const aFieldNumbers : array of SmallInt);
        {* - Создает список и копирует в него данные из aDonorList,
             номера полей указаны в aFieldNum, нумерация c 0}

      function FindRecord(const aFindData; out theIndex: Integer): Boolean;

      procedure SortBy(const aSortFields : array of Smallint);
  end;//Tl3FieldSortRecList

implementation

uses
  SysUtils,
  Math,
  l3Base,
  l3MinMax,
  l3ProtoPtrRecListPrim,
  m2MemLib
  ;

// start class Tl3FieldSortRecList

constructor Tl3FieldSortRecList.Create(anItemSize       : Integer;
                                       const aFieldSize : array of Smallint
                                       );
begin
 Create(anItemSize, aFieldSize, []);
end;

constructor Tl3FieldSortRecList.Create(anItemSize       : Integer;
                                       const aFieldSize : array of Smallint;
                                       const aSortFields : array of Smallint
                                       );
  //reintroduce;
  {-}
var
 I : Integer;
 lOffs : Integer;
begin
 inherited Create(anItemSize);
 f_FieldSize := l3SmallIntArray(aFieldSize);
 if Length(aSortFields) = 0 then
 begin
  SetLength(f_SortFields, Length(f_FieldSize));
  for I := 0 to High(f_SortFields) do
   f_SortFields[I] := Succ(I);
 end
 else
  f_SortFields := l3SmallIntArray(aSortFields);

 SetLength(f_FieldOffs, Length(f_FieldSize));
 lOffs := 0;
 for I := 0 to Pred(Length(f_FieldOffs)) do
 begin
  f_FieldOffs[I] := lOffs;
  Inc(lOffs, f_FieldSize[I]);
 end;
end;

procedure Tl3FieldSortRecList.SortBy(const aSortFields : array of Smallint);
var
 I : Integer;
begin
 if Length(aSortFields) = 0 then
 begin
  SetLength(f_SortFields, Length(f_FieldSize));
  for I := 0 to High(f_SortFields) do
   f_SortFields[I] := Succ(I);
 end
 else
  f_SortFields := l3SmallIntArray(aSortFields);

 Sort;
end;

constructor Tl3FieldSortRecList.CreateFrom(aDonorList : Tl3FieldSortRecList;
                          const aFieldNumbers : array of SmallInt);

var
 l_Index     : Integer;
 l_ListIndex : Integer;
 l_Size      : SmallInt;
 l_FieldSize : TSmallIntArray;
 lCurOffset  : Integer;

 function lFieldOffset(aFieldNumber : Integer) : Integer;
 var
  I : Integer;
 begin
  Result := 0;
  for I := 0 to Pred(aFieldNumber) do
   Inc(Result, aDonorList.f_FieldSize[I]);
 end;

begin
 l_Size := 0;
 SetLength(l_FieldSize, Length(aFieldNumbers));
 for l_Index := Low(aFieldNumbers) to High(aFieldNumbers) do
 begin
  Inc(l_Size, f_FieldSize[aFieldNumbers[l_Index]]);
  l_FieldSize[l_Index] := f_FieldSize[aFieldNumbers[l_Index]];
 end;

 Create(l_Size, l_FieldSize);

 Count := aDonorList.Count;

 lCurOffset := 0;

 for l_Index := Low(aFieldNumbers) to High(aFieldNumbers) do
 begin
  for l_ListIndex := 0 to aDonorList.Count do
   l3Move((PAnsiChar(aDonorList.ItemSlot(l_ListIndex)) + lFieldOffset(aFieldNumbers[l_Index]))^,
        (PAnsiChar(ItemSlot(l_ListIndex)) + lCurOffset)^,
        f_FieldSize[aFieldNumbers[l_Index]]);

  Inc(lCurOffset, f_FieldSize[aFieldNumbers[l_Index]]);
 end;
end;


function Tl3FieldSortRecList.DoCompare(const A;
                                       const B;
                                       aFldCount : Cardinal): Integer;
  //override;
  {-}

function lCompareField(const A;
                       const B;
                       aSize  : Integer): Integer;
  {-}
begin
 Case aSize of
  SizeOf(Byte) :
   Result := Integer(Byte(A)) - Integer(Byte(B));
  SizeOf(SmallInt) :
   Result := Integer(Word(A)) - Integer(Word(B));
  SizeOf(LongInt) :
   Result := Sign(Int64(Cardinal(A)) - Int64(Cardinal(B)));
  SizeOf(Int64) :
   Result := Sign(Int64(A) - Int64(B));
  else
   Result := m2MEMCompare(@A, @B, aSize);
 end;//Case aSize
end;

var
 l_Index  : Integer;
 l_MaxIndex : Integer;

 l_Offs   : Integer;
 l_Size   : SmallInt;
 l_InvSort: TValueSign;
 l_A, l_B : PAnsiChar;
 l_FldID  : SmallInt;

begin
 Result := 0;
 l_A := @A;
 l_B := @B;

 if aFldCount = 0 then
  l_MaxIndex := High(f_SortFields)
 else
  l_MaxIndex := Min(High(f_SortFields), Pred(aFldCount));

 for l_Index := Low(f_SortFields) to l_MaxIndex do
 begin
  l_FldID := f_SortFields[l_Index];
  l_InvSort := IfThen(l_FldID < 0, -1, 1); //Sign(l_FldID);
  l_FldID := Pred(Abs(l_FldID));
  l_Size := f_FieldSize[l_FldID];
  l_Offs := f_FieldOffs[l_FldID];
  Assert(l_Size > 0);
  Result := l_InvSort * lCompareField((l_A + l_Offs)^,
                          (l_B + l_Offs)^,
                          l_Size);
  if (Result <> 0) then
   Exit;
 end;//for l_Index
end;


function Tl3FieldSortRecList.FindRecord(const aFindData; out theIndex: Integer): Boolean;
type
 PVOID = ^VOID;
begin
 Result := FindData(PVOID(@aFindData)^, theIndex);

end;

end.

