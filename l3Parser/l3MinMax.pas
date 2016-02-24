Unit l3MinMax;

interface

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3MinMax - }
{ Начат: 01.12.95 16:28 }
{ $Id: l3MinMax.pas,v 1.8 2014/05/20 16:49:24 lulin Exp $ }

// $Log: l3MinMax.pas,v $
// Revision 1.8  2014/05/20 16:49:24  lulin
// - пытаемся восстановить компилируемость под XE.
//
// Revision 1.7  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.6  2011/09/07 12:47:02  fireton
// - Min64 и Max64
//
// Revision 1.5  2007/12/05 15:38:06  lulin
// - удалены ненужные файлы.
//
// Revision 1.4  2001/10/26 13:10:27  law
// - new procs: MinIntValue и MaxIntValue.
//
// Revision 1.3  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

(*uses
  l3Types
  ;*)

function Max(A, B: LongInt): LongInt;
function Max64(A, B: Int64): Int64;
function Min(A, B: LongInt): LongInt;
function Min64(A, B: Int64): Int64;
function ULongComp(A, B: LongInt): ShortInt;
  {-сравнивает два длинных целых без учета знака}
function CardinalDec(A: Cardinal; Delta: Cardinal): Cardinal;
  {-}
function MinIntValue(const Data: array of Integer): Integer;
  {-}
function MaxIntValue(const Data: array of Integer): Integer;
  {-}
function MaxFloat(const Values: array of Extended): Extended;  

(*
function Min(X, Y: Integer): Integer;
function Max(X, Y: Integer): Integer;
function MaxWord(X, Y: Word): Word;
function MinWord(X, Y: Word): Word;
function MaxLong(A, B: LongInt): LongInt;
function MinLong(A, B: LongInt): LongInt;
function BComp(const P1,P2; Len: Word): Boolean;
*)

implementation

function CardinalDec(A: Cardinal; Delta: Cardinal): Cardinal;
  {-}
begin
 if (A > Delta) then
  Result := A - Delta
 else
  Result := 0;
end;

function Min(A, B: LongInt): LongInt;
begin
 if (A < B) then Result := A else Result := B;
end;

function Min64(A, B: Int64): Int64;
begin
 if (A < B) then Result := A else Result := B;
end;

function Max(A, B: LongInt): LongInt;
begin
 if (A > B) then Result := A else Result := B;
end;

function Max64(A, B: Int64): Int64;
begin
 if (A > B) then Result := A else Result := B;
end;

{$IfDef Win32}
function ULongComp(A, B: LongInt): ShortInt;
                   {eax, edx}
  register;
  {-сравнивает два длинных целых без учета знака}
asm
        xor     ecx, ecx
        cmp     eax, edx
        je      @@ret
        jb      @@Dec
        inc     ecx
        jmp     @@ret
@@Dec:
        dec     ecx
@@ret:
        mov     eax, ecx
end;
{$Else  Win32}
function ULongComp(A, B: LongInt): ShortInt;
  assembler;
  {-сравнивает два длинных целых без учета знака}
asm
        xor     cl, cl
db $66; mov     ax, word ptr ss:[A]
db $66; mov     dx, word ptr ss:[B]
db $66; cmp     ax, dx
        je      @@ret
        jb      @@Dec
        inc     cl
        jmp     @@ret
@@Dec:
        dec     cl
@@ret:
        mov     al, cl
end;{asm}
{$EndIf Win32}

function MinIntValue(const Data: array of Integer): Integer;
var
  I: Integer;
begin
  Result := Data[Low(Data)];
  for I := Low(Data) + 1 to High(Data) do
    if Result > Data[I] then
      Result := Data[I];
end;

function MaxIntValue(const Data: array of Integer): Integer;
var
  I: Integer;
begin
  Result := Data[Low(Data)];
  for I := Low(Data) + 1 to High(Data) do
    if Result < Data[I] then
      Result := Data[I];
end;

(*function Min(X, Y: Integer): Integer;
{$IFDEF WIN32}
begin
 if (X < Y) then Result := X else Result := Y;
end;
{$ELSE WIN32}
assembler;
asm
        MOV     AX,X
        CMP     AX,Y
        JLE     @@1
        MOV     AX,Y
@@1:
end;
{$ENDIF WIN32}

function Max(X, Y: Integer): Integer;
{$IFDEF WIN32}
begin
 if (X > Y) then Result := X else Result := Y;
end;
{$ELSE WIN32}
assembler;
asm
        MOV     AX,X
        CMP     AX,Y
        JGE     @@1
        MOV     AX,Y
@@1:
end;
{$ENDIF WIN32}

function MinWord(X, Y: Word): Word;
{$IFDEF WIN32}
begin
 if (X < Y) then Result := X else Result := Y;
end;
{$ELSE WIN32}
assembler;
asm
        MOV     AX,X
        CMP     AX,Y
        JBE     @@1
        MOV     AX,Y
@@1:
end;
{$ENDIF WIN32}

function MaxWord(X, Y: Word): Word;
{$IFDEF WIN32}
begin
 if (X > Y) then Result := X else Result := Y;
end;
{$ELSE WIN32}
assembler;
asm
        MOV     AX,X
        CMP     AX,Y
        JAE     @@1
        MOV     AX,Y
@@1:
end;
{$ENDIF WIN32}

{
function MaxLong(A, B: LongInt): LongInt; assembler;
asm
        MOV     DX, Word(A+2)
        MOV     AX, Word(A)
        CMP     DX, Word(B+2)
        JL      @yes
        JG      @no
        CMP     AX, Word(B)
        JGE     @no
@yes:
        MOV     DX, Word(B+2)
        MOV     AX, Word(B)
@no:
end;

function MinLong(A, B: LongInt): LongInt; assembler;
asm
        MOV     DX, Word(A+2)
        MOV     AX, Word(A)
        CMP     DX, Word(B+2)
        JG      @yes
        JL      @no
        CMP     AX, Word(B)
        JLE     @no
@yes:
        MOV     DX, Word(B+2)
        MOV     AX, Word(B)
@no:
end;
}

function MinLong(A, B: LongInt): LongInt;
begin
 if (A < B) then MinLong := A else MinLong := B;
end;

function MaxLong(A, B: LongInt): LongInt;
begin
 if (A > B) then MaxLong := A else MaxLong := B;
end;

function BComp(const P1,P2; Len: Word): Boolean;
var
 S1 : PAnsiChar;
 S2 : PAnsiChar;
 i  : integer;
begin
 Result := true;
 S1 := PAnsiChar(@P1); S2 := PAnsiChar(@P2);
 for i := 0 to Len-1 do
  if (S1[i]<>S2[i]) then begin
   Result := false;
   Exit;
  end;
end;
*)

function MaxFloat(const Values: array of Extended): Extended;
var
  I: Cardinal;
begin
  Result := Values[0];
  for I := 0 to High(Values) do
    if Values[I] > Result then Result := Values[I];
end;

end.
