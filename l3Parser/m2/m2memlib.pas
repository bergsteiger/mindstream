unit m2MEMLib;
{* Утилиты для работы с памятью. }

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
// $Id: m2memlib.pas,v 1.5 2014/08/21 07:15:07 lulin Exp $

// $Log: m2memlib.pas,v $
// Revision 1.5  2014/08/21 07:15:07  lulin
// - чистим код.
//
// Revision 1.4  2014/08/21 07:02:10  lulin
// - чистим код.
//
// Revision 1.3  2012/01/11 17:29:59  lulin
// {RequestLink:326769483}
//
// Revision 1.2  2009/03/19 16:28:28  lulin
// [$139443095].
//
// Revision 1.1  2008/02/22 17:10:08  lulin
// - библиотека переехала.
//
// Revision 1.2  2007/12/10 15:33:04  lulin
// - cleanup.
//
// Revision 1.1  2007/12/07 11:51:05  lulin
// - переезд.
//
// Revision 1.14  2007/08/15 11:09:18  lulin
// - bug fix: AV при построении print-preview. Не проверяли указатели на nil (CQ OIT5-26373).
//
// Revision 1.13  2007/08/14 15:19:30  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.12  2006/05/04 13:00:47  lulin
// - сделана функция сравнения кусков памяти как чисел.
//
// Revision 1.11  2006/05/04 12:10:59  lulin
// - bug fix: функция сравнения работала не как вычитание.
//
// Revision 1.10  2006/05/04 11:01:32  lulin
// - поправлен тип длины строки.
// - вычищены "старые" методы работы с памятью и строками.
//
// Revision 1.9  2004/06/25 16:47:28  migel
// - change/fix: для совместимости с win9x перешли на собственную реализацию `Interlocked*` функций.
//
// Revision 1.8  2004/04/20 09:06:39  law
// - cleanup.
//
// Revision 1.7  2004/04/20 08:59:59  law
// - cleanup.
//
// Revision 1.6  2004/04/20 08:05:56  law
// - bug fix: не учитывали, что памяти может быть больше чем 2Гб.
//
// Revision 1.5  2002/04/02 13:53:37  law
// - new behavior: пытаемся оптимизировать функцию сравнения кусков памяти.
//
// Revision 1.4  2001/10/30 09:56:31  law
// - new directive: m2AllocSize.
//
// Revision 1.3  2001/10/24 08:22:08  law
// - new behavior: получение и освобождение памяти сделано через библиотеку L3.
//
// Revision 1.2  2001/10/18 12:10:32  law
// - comments: xHelpGen.
//

{$I m2Define.inc}

interface

uses
  Windows,
  SysUtils,

  ActiveX,

  m2AddDbg,
  m2AddRdr,
  m2S32Lib
  ;

function m2MEMPhusAvail: Int64;
  {* - возвращает размер доступной физической памяти. }
procedure m2MEMCoTaskAlloc(var ADest   : Pointer;
                           const ASize : LongInt);
  {* - распределяет общую память для COM. }
procedure m2MEMCoTaskFree(var ADest: Pointer);
  {* - освобождает общую память для COM. }
procedure m2MEMAlloc(var ADest   : Pointer;
                     const ASize : LongInt;
                     const AByte : SmallInt = -1);
  {* - распределяет локальную память. }
procedure m2MEMFree(var ADest: Pointer);
  {* - освобождает локальную память. }
function m2MEMCopy(const ADest : Pointer;
                   const ASour : Pointer;
                   const ASize : LongInt): Pointer;
  {* - копирует локальную память. }
procedure m2MEMFill(const ADest : Pointer;
                    const ASize : LongInt;
                    const AByte : Byte);
  {* - заполняет локальную память значением. }
function m2MEMCompare(const ADest : Pointer;
                      const ASour : Pointer;
                      const ASize : LongInt): Integer;
  overload;
  {* - сравнивает два куска памяти. }
function m2MEMCompare(const ADest : Pointer;
                      const ADLen : LongInt;
                      const ASour : Pointer;
                      const ASLen : LongInt): Integer;
  overload;
  {* - сравнивает два куска памяти. }
function m2CompareNum(const A;
                      const B;
                      aSize  : Integer): Integer;
  {-}

implementation

uses
  Math,
  
  l3Base,
  l3Memory
  ;


function m2MEMPhusAvail: Int64;
var
 LMemoryStatus: TMemoryStatus;
begin
 LMemoryStatus.dwLength := SizeOf(LMemoryStatus);
 GlobalMemoryStatus(LMemoryStatus);
 Result:= LMemoryStatus.dwAvailPhys;
end;

procedure m2MEMCoTaskAlloc(var   ADest: Pointer;
                           const ASize: LongInt);
begin
 if (ASize <> 0) then
 begin
  try
   ADest := CoTaskMemAlloc(ASize);
   if (ADest = nil) then
    OutOfMemoryError;
  except
   ADest:=nil;
   raise;
  end;//try..except
 end//ASize <> 0
 else
  ADest:=nil;
end;

procedure m2MEMCoTaskFree(var   ADest: Pointer);
begin
 try
  CoTaskMemFree(ADest);
 finally
  ADest := nil;
 end;//try..finally
end;

procedure m2MEMAlloc(var   ADest: Pointer;
                     const ASize: LongInt;
                     const AByte: SmallInt);
begin
 l3System.GetLocalMem(aDest, aSize);
 if (aByte <> LongInt(-1)) then
  m2MEMFill(aDest, aSize, Byte(aByte));
end;

procedure m2MEMFree(var   ADest: Pointer);

begin
 l3System.FreeLocalMem(aDest);
end;

function m2MEMCopy(const ADest : Pointer;
                   const ASour : Pointer;
                   const ASize : LongInt): Pointer;
begin
 if (aDest <> nil) AND (aSour <> nil) then
  l3Move(ASour^, ADest^, ASize);
 Result := aDest;
end;

procedure m2MEMFill(const ADest: Pointer;
                    const ASize: LongInt;
                    const AByte: Byte);
asm
               and   eax,eax
               je    @@01
               and   edx,edx
               je    @@01
               push  edi
               mov   edi,eax
               mov   ch,cl
               mov   ax,cx
               shl   eax,$10
               mov   ax,cx
               mov   ecx,edx
               shr   ecx,$2
               rep   stosd
               mov   ecx,edx
               and   ecx,$3
               rep   stosb
               pop   edi
                
  @@01:

end;

function m2MEMCompare(const ADest : Pointer; // eax
                      const ASour : Pointer; // edx
                      const ASize : LongInt  // ecx
                      ): Integer;
asm
                jecxz @@ZeroRes      // - сравнивать 0 байт
                or    eax, eax
                jne   @@DestNotNull  // - aDest <> nil
                or    edx, edx
                je    @@ret          // - aSour = nil - оба указателя nil eax уже 0
                xor   eax, eax       // - aSour <> nil - возвращаем -1
                dec   eax
                jmp   @@ret
 @@DestNotNull:
                or    edx, edx
                jne   @@SourNotNull
                xor   eax, eax       // - aDest = nil - возвращаем +1
                inc   eax
                jmp   @@ret
 @@SourNotNull:
                cmp   eax, edx
                jne   @@Cont         // - указатели не равны сравниваем содержимое
 @@ZeroRes:     xor   eax, eax
                jmp   @@ret
 @@Cont:
                PUSH    ESI
                PUSH    EDI
                MOV     ESI, eax
                MOV     EDI, edx
                MOV     EDX, ECX
                XOR     EAX, EAX
                SHR     ECX, 1
                SHR     ECX, 1
                REPE    CMPSD           // - сравниваем машинные слова
                JE      @@ContCompare   // - все одинаково

                inc     eax
                ja      @@EndCompare
                or      eax, -1
                jmp     @@EndCompare
 @@ContCompare:
                MOV     ECX, EDX
                AND     ecx, 3
                REPE    CMPSB           // - сравниваем байты
                JE      @@EndCompare

                inc    eax
                ja     @@EndCompare
                or     eax, -1

 @@EndCompare:
                POP     EDI
                POP     ESI
 @@ret:

end;

function m2MEMCompare(const ADest : Pointer;
                      const ADLen : LongInt;
                      const ASour : Pointer;
                      const ASLen : LongInt): Integer;
begin
 Result := m2S32Compare(ADLen,ASLen);
 if (Result = 0) then
  Result := m2MEMCompare(ADest, ASour, ADLen);
end;

function m2CompareNum(const A;
                      const B;
                      aSize  : Integer): Integer;
  {-}
begin
 Case aSize of
  SizeOf(ShortInt) :
   Result := ShortInt(A) - ShortInt(B);
  SizeOf(SmallInt) :
   Result := SmallInt(A) - SmallInt(B);
  SizeOf(LongInt) :
   Result := LongInt(A) - LongInt(B);
  SizeOf(Int64) :
   Result := Sign(Int64(A) - Int64(B));
  else
  begin
   Assert(false);
   Result := 0;
  end;//else
 end;//Case aSize
end;

{$I m2MEMLib.inc}

end.

