unit l3LogicalArray;

{ Ѕиблиотека "L3 (Low Level Library)" }
{ јвтор: Ћюлин ј.¬. ©                 }
{ ћодуль: l3LogicalArray -            }
{ Ќачат: 30.05.2005 16:30             }
{ $Id: l3LogicalArray.pas,v 1.9 2015/03/24 15:08:15 voba Exp $ }

// $Log: l3LogicalArray.pas,v $
// Revision 1.9  2015/03/24 15:08:15  voba
// - k:585129136
//
// Revision 1.8  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.7  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.6  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.5  2007/08/14 19:31:59  lulin
// - оптимизируем очистку пам€ти.
//
// Revision 1.4  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков пам€ти.
//
// Revision 1.3  2007/02/27 09:55:02  lulin
// - cleanup.
//
// Revision 1.2  2006/12/06 07:40:44  voba
// - enh увеличил макс. количество элементов в массиве
//
// Revision 1.1  2005/05/30 12:34:48  lulin
// - массив логических значений теперь живет в L3.
//
// Revision 1.9  2005/05/30 12:27:47  lulin
// - "правильно" назван класс.
//
// Revision 1.8  2004/10/06 17:15:13  lulin
// - борьба за кошерность.
//
// Revision 1.7  2003/05/23 17:38:41  voba
// no message
//
// Revision 1.6  2001/08/31 11:02:36  law
// - rename unit: MyUtil -> l3FileUtils.
//
// Revision 1.5  2001/04/05 08:52:17  law
// - cleanup: использование модулей WinTypes и WinProcs заменен на Windows.
//
// Revision 1.4  2001/02/21 13:23:45  law
// - bug fix: изменен алгоритм функции cntBitBuff.
//
// Revision 1.3  2000/12/15 15:36:27  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  SysUtils,

  l3Base,
  l3ProtoObject
  ;

const
  //MaxBitsInArray=524264; {(maxint*2-1)*8; with maxint=32767}
  cMaxBitsInArray = High(Longint);

type
  TLogicOperType = (LogicAND, LogicOR, LogicXOR);
  TSetMode = (smSet, smReset);

  //PWordArray=^TWordArray;
  //TWordArray = array[0..Pred(High(longint))] of word;

  Tl3LogicalArray = class(Tl3ProtoObject)
  private
   fBitSize  : longint; {Bits within the Bitarray}
   fSize     : Longint; {Bytes within the Bitarray}
   fBArray   : PAnsiChar;   {Pointer to bitarray, dynamically initialized}
   fSetCount : Longint;
   Procedure DisposeArray;
   Procedure MakeArray(Value : Longint);

   Procedure SetLogArray(N: Longint; Value : Boolean);
   Function  GetSettedCount : Longint;

  protected
  // internal methods
    procedure   Cleanup;
      override;
      {-}
  public
    procedure   SetNum (ix: longint);
    procedure   ResetNum (ix: longint);
    procedure   SetInterval (ib, ie: longint; aMode : TSetMode);
    procedure   ToggleNum (ix: longint);
    function    TestNum (ix: longint):boolean;
    procedure   LogicConnect(aSecondBArray: Tl3LogicalArray; aConnectMode: TLogicOperType);
    procedure   AllInvert;
    procedure   AllFalse;
    procedure   AllTrue;

    Property    LogArray[N: Longint]: Boolean read TestNum write SetLogArray ; Default;
    Property    ArrayCapacity : Longint read fBitSize Write MakeArray;
    Property    SettedCount : Longint read GetSettedCount;
  end;

implementation

uses
  l3MinMax,
  l3BitArr,
  l3Bits // строго после l3BitArr
  ;

function cntBitBuff(aBuff: PAnsiChar; aSize: Longint): Longint;
                    {eax,         edx}
  register;
  {-}
asm
       or      edx, edx
       jz      @@ret

       dec     edx
       call    l3Bit2Index
       or      eax, eax
       jge     @@ret
       not     eax
@@ret:
end;//asm

procedure SetBitInWord(var Target:word; BitNr:word);
 Begin
  Target:=Target or (1 shl BitNr);
 end;

procedure ClrBitInWord(var Target : Word; BitNr : Word);
 Begin
  Target:=Target and (Not(1 shl BitNr));
 end;

procedure InvertBitInWord(var Target : Word; BitNr : Word);
 Begin
  Target:=Target xor (1 shl BitNr);
 end;

function TstBitInWord(Target, BitNr: Word) : Boolean;
 Begin
  TstBitInWord:=Target and (1 shl BitNr) <> 0;
 end;

// start class Tl3LogicalArray 

procedure Tl3LogicalArray.Cleanup;
begin
 DisposeArray;
 inherited;
end;

Procedure Tl3LogicalArray.MakeArray(Value : Longint);
 var
  lNewBitSize  : Longint;
  lNewSize     : Longint;
  lNewBArray    : PAnsiChar;
 Begin
  If Value = fBitSize then Exit;
  If Value <= 0 then
  begin
   DisposeArray;
   FSetCount := 0;
   Exit;
  end;

  lNewBitSize := Min(Value, cMaxBitsInArray);

  lNewSize := ((lNewBitSize + 31) div 32) * 4; //размер в байтах, но кратно Longint
  if fSize <> lNewSize then
  begin
   if lNewSize <> 0 then
    l3System.GetLocalMemZ(lNewBArray, lNewSize)
   else
    lNewBArray := Nil;

   if fBArray <> nil then
   begin
    l3Move(fBArray^, lNewBArray^, Min(lNewSize, fSize));
    //!! ѕри расширении массива надо учитывать, что за последним элементом еще некоторое количество неиспользуемых бит,
    // которые не об€зательно нулевые, т к некоторые операции работают с целыми байтами - LogicConnect, AllInvert, AllFalse, AllTrue
    {V FSetCount correct need!!!}
    DisposeArray;
   end
   else
    FSetCount := 0;

   fBArray := lNewBArray;
   fSize := lNewSize;
  end;

  fBitSize := lNewBitSize;
 end;

procedure Tl3LogicalArray.DisposeArray;
begin
 l3System.FreeLocalMem(fBArray);
 fBArray:=Nil;
 fSize := 0;
 fBitSize := 0;
end;

procedure Tl3LogicalArray.SetInterval(ib, ie: Longint; aMode : TSetMode);
Var
 I : Longint;
 Wb, We : Longint;
 lMask : Byte;

 procedure SetBitsInByte(aByteNum : Longint; aFirstBitNum, aLastBitNum : Byte);
 var
  lMask : Byte;
  iByte : Byte;
 begin
  lMask := 0;
  for iByte := aFirstBitNum to aLastBitNum do
   lMask := lMask + (1 shl iByte);

  if aMode = smSet then
   Byte(fBArray[aByteNum]) := Byte(fBArray[aByteNum]) or lMask
  else
   Byte(fBArray[aByteNum]) := Byte(fBArray[aByteNum]) and not lMask;
 end;

Begin
 if Ib > Ie then l3Swap(ib, ie);
 if Ib < 0 then Ib := 0;
 if Ie >= fBitSize then Ie := pred(fBitSize);
 if Ie < 0 then Exit;

 // номера первого и последнего байтов где все биты надо взводить
 Wb := (Ib + 7) div 8;
 We := (Ie div 8);

 if aMode = smSet then
  lMask := $FF
 else
  lMask := $00;

 //взводим целыми байтами
 if We > Wb then
  l3FillChar(fBArray[Wb], (We - Wb), lMask);

 //теперь разберемс€ с началом
 I := (Ib div 8) * 8 + 7; //последний бит в первом байте
 If I > Ie then I := Ie;  // Ib и Ie в одном байте

 SetBitsInByte(Ib div 8,  // байт с Ib
               Ib mod 8,  // номер бита дл€ Ib
               I mod 8    // номер бита дл€ I
               );

 if I <> Ie then // осталс€ хвост
  SetBitsInByte(Ie div 8,  // байт с Ie
                0,         // c первого бита
                Ie mod 8   // номер бита дл€ Ie
                );

 if (FSetCount = 0) and (aMode = smSet) then
  fSetCount := Ie - Ib + 1
 else
 if (fSetCount = fBitSize) and (aMode = smReset) then
  fSetCount := fBitSize - (Ie - Ib + 1)
 else
  fSetCount := -1;
end;

procedure Tl3LogicalArray.AllFalse;
{Clear the whole bitarray}
begin
 l3FillChar(fBArray^, fSize, 0);
 FSetCount := 0;
end;

procedure Tl3LogicalArray.AllTrue;
{Clear the whole bitarray}
 Begin
  l3FillChar(fBArray^, fSize, $FF);
  FSetCount := fBitSize;
 end;

procedure Tl3LogicalArray.AllInvert;
{Invert the whole bitarray}
var
 I       : Longint;
 lBArray : PAnsiChar;
begin
 lBArray := fBArray;
 for I := 0 to Pred(fSize div 4) do
 begin
  PLongint(lBArray)^ := not PLongint(lBArray)^;
  Inc(lBArray, 4);
 end;
 FSetCount := fBitSize - fSetCount;
end;

procedure Tl3LogicalArray.LogicConnect (aSecondBArray: Tl3LogicalArray; aConnectMode: TLogicOperType);
{Logical connect two bitarrays. They must be the same size}
var
  I : Longint;
  lBArray : PAnsiChar;
  lSecondBArray : PAnsiChar;
begin
 if (fBitSize > 0) and (aSecondBArray.fBitSize > 0) then
 begin
  lBArray := fBArray;
  lSecondBArray := aSecondBArray.fBArray;
  case aConnectMode of
   LogicAND :
    for I := 0 to Pred(Min(fSize, aSecondBArray.fSize) div 4) do
    begin
     PLongint(lBArray)^ := PLongint(lBArray)^ and PLongint(lSecondBArray)^;
     Inc(lBArray, 4);
     Inc(lSecondBArray, 4);
    end;

   LogicOR :
    for I := 0 to Pred(Min(fSize, aSecondBArray.fSize) div 4) do
    begin
     PLongint(lBArray)^ := PLongint(lBArray)^ or PLongint(lSecondBArray)^;
     Inc(lBArray, 4);
     Inc(lSecondBArray, 4);
    end;

   LogicXOR :
    for I := 0 to Pred(Min(fSize, aSecondBArray.fSize) div 4) do
    begin
     PLongint(lBArray)^ := PLongint(lBArray)^ xor PLongint(lSecondBArray)^;
     Inc(lBArray, 4);
     Inc(lSecondBArray, 4);
    end;
  end;
  fSetCount := -1;
 end;
end;

procedure Tl3LogicalArray.SetNum(Ix: Longint);
var
 lLongNum : PLongint;
 lBitNum  : Byte;
begin
 if (Ix >= 0) and (Ix < fBitSize) then
 begin
  lLongNum := PLongint(fBArray + Ix div 8);
  lBitNum  := Ix mod 8;
  if not l3TestBit(lLongNum^, lBitNum) then
  begin
   l3SetBit(lLongNum^, lBitNum);
   Inc(FSetCount);
  end;
 end;
end;

procedure Tl3LogicalArray.ResetNum(Ix: Longint);
var
 lLongNum : PLongint;
 lBitNum  : Byte;
begin
 if (Ix >= 0) and (Ix < fBitSize) then
 begin
  lLongNum := PLongint(fBArray + Ix div 8);
  lBitNum  := Ix mod 8;
  if l3TestBit(lLongNum^, lBitNum) then
  begin
   l3ClearBit(lLongNum^, lBitNum);
   Dec(FSetCount);
  end;
 end;
end;

procedure Tl3LogicalArray.ToggleNum(Ix: Longint);
var
 lLongNum : PLongint;
 lBitNum  : Byte;
begin
 if (Ix >= 0) and (Ix < fBitSize) then
 begin
  lLongNum := PLongint(fBArray + Ix div 8);
  lBitNum  := Ix mod 8;
  l3InvertBit(lLongNum^, lBitNum);
  if l3TestBit(lLongNum^, lBitNum) then
   Inc(fSetCount)
  else
   Dec(fSetCount);
 end;
end;

function Tl3LogicalArray.TestNum(ix: longint): boolean;
  {-}
begin
 if (Ix >= 0) and (Ix < fBitSize) then
  Result := l3TestBit(PLongint(fBArray + Ix div 8)^, Ix mod 8)
 else
  Result := False;
end;

procedure Tl3LogicalArray.SetLogArray(N: Longint; Value : Boolean);
begin
 if Value then
  SetNum(N)
 else
  ResetNum(N);
end;

function Tl3LogicalArray.GetSettedCount : Longint;
begin
 if FSetCount < 0 then
  fSetCount := cntBitBuff(PAnsiChar(fBArray), fBitSize);
 Result := fSetCount;
end;

end.



