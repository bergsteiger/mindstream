unit m0LZOLib;

(*
//
// module:  m0lzolib.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0lzolib.pas,v 1.1 2014/08/20 16:31:25 lulin Exp $
//
*)

{$Include m0Define.inc}

{$IfNDef m0NotMultiThreadLZO}
 {$Define m0MultiThreadLZO}
{$EndIf  m0NotMultiThreadLZO}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  l3Except,
  
  m0Const,
  //m0AddTyp,
  m0S32Lib,
  m0MEMLib,
  //m0HASLib,
  //m0ARCLib,
  m0BCBRTL
  ;

const
  Cm0LZOLibINoError = $0000;

  Cm0LZOLibEError     = $0200;
  Cm0LZOLibEOutOfMemory = $0201;
  Cm0LZOLibENotCompress = $0202;
  Cm0LZOLibEInputOvr  = $0203;
  Cm0LZOLibEOutputOvr = $0204;
  Cm0LZOLibELookBehindOvr = $0205;
  Cm0LZOLibEEOFNotFound = $0206;
  Cm0LZOLibEInputNotCons = $0207;

type
  Em0LZOLibGeneral = class(El3Exception);

(*  Pm0LZOLibBuffer = ^Tm0LZOLibBuffer;

  Tm0LZOLibBuffer = packed record

    RPos: LongInt;
    RCRC: LongInt;
    RBody: packed array
    [0..Cm0MaxLongInt - Succ(2 * SizeOf(LongInt))] of AnsiChar;

  end;//Tm0LZOLibBuffer

  Pm0LZOLibHandle = ^Tm0LZOLibHandle;

  Tm0LZOLibHandle = packed record

    RStreamHandle: Tm0ARCLibStreamHandle;

    ROrigSize: LongInt;
    ROrigBuff: Pm0LZOLibBuffer;

    RCompSize: LongInt;
    RCompBuff: Pm0LZOLibBuffer;

    RReadEOF: LongBool;

  end;//Tm0LZOLibHandle*)

function m0LZOInitLibrary: Word; external;

function m0LZOCompressBuffSize(ASize: LongInt): LongInt; external;

function m0LZOCompress(ADest: Pointer; var ADLen: LongInt; ASour: Pointer;
  ASLen: LongInt): Word; external;

function m0LZODecompress(ADest: Pointer; var ADLen: LongInt;
  ASour: Pointer; ASLen: LongInt): Word; external;


(*procedure m0LZOInitHandle(var AHandle: Pm0LZOLibHandle;
  ARProc: Tm0ARCLibStreamRProc; AWProc: Tm0ARCLibStreamWProc; ASelf: Pointer);*)

(*procedure m0LZODoneHandle(var AHandle: Pm0LZOLibHandle);*)


(*procedure m0LZODeflateInit(AHandle: Pm0LZOLibHandle);*)

(*procedure m0LZODeflate(AHandle: Pm0LZOLibHandle; ABuff: Pointer; ASize: LongInt);*)

(*procedure m0LZODeflateFlush(AHandle: Pm0LZOLibHandle);*)

(*procedure m0LZODeflateDone(AHandle: Pm0LZOLibHandle);*)


(*procedure m0LZOInflateInit(AHandle: Pm0LZOLibHandle);*)

(*procedure m0LZOInflate(AHandle: Pm0LZOLibHandle; ABuff: Pointer; var ASize: LongInt);*)

(*procedure m0LZOInflateRest(AHandle: Pm0LZOLibHandle);*)

(*procedure m0LZOInflateEOF(AHandle: Pm0LZOLibHandle);*)

(*procedure m0LZOInflateDone(AHandle: Pm0LZOLibHandle);*)


implementation

{$L *.obj}

uses
  l3Memory,
  l3ExceptionsLog,

  m2MemLib
  ;

{ -- unit.private -- }

resourcestring
{$IFDEF _m0LANGUAGE_ENG}


        SEError                   = 'General error';
        SEOutOfMemory             = 'Out of memory';
        SENotCompress             = 'Not compressible';
        SEInputOvr                = 'Input overrun';
        SEOutputOvr               = 'Output overrun';
        SELookBehindOvr           = 'Lookbehind overrun';
        SEEOFNotFound             = 'End of file not found';
        SEInputNotCons            = 'Input not consumed';
        SEBadBlockCRC             = 'Data CRC error: 0x%.8x';
        SEWriteError              = 'Data write error';
        SEReadError               = 'Data read error';
{$ENDIF}
{$IFDEF _m0LANGUAGE_RUS}


        SEError                   = 'Общая ошибка';
        SEOutOfMemory             = 'Недостаточно памяти';
        SENotCompress             = 'Не сжимающийся';
        SEInputOvr                = 'Входные данные выходят за нормальный предел';
        SEOutputOvr               = 'Выходные данные выходят за нормальный предел';
        SELookBehindOvr           = 'Просмотренные данные выходят за нормальный предел';
        SEEOFNotFound             = 'Конец файла не найден';
        SEInputNotCons            = 'Входные данные не расходуется';
        SEBadBlockCRC             = 'Ошибка CRC данных: 0x%.8x';
        SEWriteError              = 'Ошибка записи данных';
        SEReadError               = 'Ошибка чтения данных';
{$ENDIF}


(*{$IfDef m0MultiThreadLZO}
var
  GThreadSafe: TRTLCriticalSection;

{$EndIf m0MultiThreadLZO}*)

function _ErrorToString(AError: Word): string;
type
  TErrorStringArray = packed array[Cm0LZOLibEError..Cm0LZOLibEInputNotCons]
    of string;
const
  CErrorStringArray: TErrorStringArray = (SEError,
    SEOutOfMemory,
    SENotCompress,
    SEInputOvr,
    SEOutputOvr,
    SELookBehindOvr,
    SEEOFNotFound,
    SEInputNotCons
    );
begin

  if ((AError >= Cm0LZOLibEError) and (AError <= Cm0LZOLibEInputNotCons)) then
  begin

    Result := CErrorStringArray[AError];

  end
  else
  begin

    Result := m0EXCUnknownError(AError);

  end;

end;

(*procedure _AllocBuff(AHandle: Pm0LZOLibHandle);
begin

  with AHandle^ do
  begin

    ROrigSize := $00008000;
    RCompSize := m0LZOCompressBuffSize(ROrigSize);

    mgBuffers.AllocItem(Pointer(ROrigBuff), SizeOf(ROrigBuff^) -
      SizeOf(ROrigBuff^.RBody) + ROrigSize, 0);
    try
      mgBuffers.AllocItem(Pointer(RCompBuff), SizeOf(RCompBuff^) -
        SizeOf(RCompBuff^.RBody) + RCompSize, 0);
    except
      mgBuffers.FreeItem(Pointer(ROrigBuff));
      raise;
    end;//try..except

  end;

end;*)

(*procedure _FreeBuff(AHandle: Pm0LZOLibHandle);
begin
  with AHandle^ do
    try
      mgBuffers.FreeItem(Pointer(RCompBuff));
    finally
      mgBuffers.FreeItem(Pointer(ROrigBuff));
    end;//try..finally
end;*)

procedure _Initialization;
var
  LResult: Word;
begin

  LResult := m0LZOInitLibrary;

  if (LResult <> Cm0LZOLibINoError) then
   raise Em0LZOLibGeneral.Create(_ErrorToString(LResult));

(*  {$IfDef m0MultiThreadLZO}
  InitializeCriticalSection(GThreadSafe);
  {$EndIf m0MultiThreadLZO}*)

end;

(*{$IfDef m0MultiThreadLZO}
procedure _Finalization;
begin
  DeleteCriticalSection(GThreadSafe);
end;
{$EndIf m0MultiThreadLZO}*)


 { -- unit.public -- }

(*procedure m0LZOInitHandle(var AHandle: Pm0LZOLibHandle;
  ARProc: Tm0ARCLibStreamRProc; AWProc: Tm0ARCLibStreamWProc; ASelf: Pointer);
begin

  {$IFDEF _m0USEEXTGETMEM1}


  m0MEMAlloc(Pointer(AHandle),SizeOf(AHandle^),#000,Cm0MEMLibNoCache);
  

{$Else  _m0USEEXTGETMEM1}
  m0ArcHandleBuffers.AllocItem(Pointer(aHandle), SizeOf(Tm0LZOLibHandle), 0);
  {$EndIF _m0USEEXTGETMEM1}

  with AHandle^ do
  begin

    with RStreamHandle do
    begin

      RRProc := ARProc;
      RWProc := AWProc;

      RSelf := ASelf;

    end;

  end;

end;*)

(*procedure m0LZODoneHandle(var AHandle: Pm0LZOLibHandle);
begin

  {$IFDEF _m0USEEXTGETMEM1}
  m0MEMFree(Pointer(AHandle));
  {$Else  _m0USEEXTGETMEM1}
  m0ArcHandleBuffers.FreeItem(Pointer(AHandle));
  {$EndIF _m0USEEXTGETMEM1}

end;*)

(*procedure m0LZODeflateInit(AHandle: Pm0LZOLibHandle);
begin

  _AllocBuff(AHandle);

end;*)

(*procedure m0LZODeflate(AHandle: Pm0LZOLibHandle; ABuff: Pointer; ASize: LongInt);
var
  LCompress: LongInt;
  LOffset:   LongInt;
  LResult:   Word;
  LSize1:    LongInt;
  LSize2:    LongInt;
  LSize3:    LongInt;
begin

  with AHandle^ do
  begin

    with ROrigBuff^ do
    begin

      LSize1  := 0;
      LOffset := 0;

      while ((ASize <> 0) or (ABuff = nil)) do
      begin

        if (ABuff <> nil) then
        begin

          LSize1 := m0S32Min(ROrigSize - RPos, ASize);

          m2MEMCopy( @RBody[RPos], Pointer(LongInt(ABuff) + LOffset), LSize1);

          Inc(LOffset, LSize1);
          Inc(RPos, LSize1);

        end;

        if ((RPos = ROrigSize) or ((ABuff = nil) and (RPos <> 0))) then
        begin

           {$IfDef m0MultiThreadLZO}
          if IsMultiThread then
          begin

            EnterCriticalSection(GThreadSafe);

          end;
          try
           {$EndIf m0MultiThreadLZO}

            LResult := m0LZOCompress( @RCompBuff^.RBody, LCompress, @RBody, RPos);

            if (LResult <> Cm0LZOLibINoError) then
            begin

              raise Em0LZOLibGeneral.Create(_ErrorToString(LResult));

            end;

           {$IfDef m0MultiThreadLZO}
          finally

            if IsMultiThread then
            begin

              LeaveCriticalSection(GThreadSafe);

            end;

          end;
           {$EndIf m0MultiThreadLZO}

          if (RPos < (LCompress + SizeOf(RCRC))) then
          begin

            LSize2 := RPos + SizeOf(RCRC) + SizeOf(RPos);
            LSize3 := RPos;

            RCRC := m0HASUpdate32(RPos, @RBody, RPos, Cm0HASLibVersionCRC);

            Inc(RPos, SizeOf(RCRC));
            RPos := LongInt(LongWord(RPos) or $80000000);

            with RStreamHandle do
            begin

              if (RWProc(ROrigBuff, LSize2, LSize3, RSelf) <> LSize2) then
              begin

                raise Em0LZOLibGeneral.Create(SEWriteError);

              end;

            end;

          end
          else
          begin

            with RCompBuff^ do
            begin

              RPos := LCompress;

              LSize2 := RPos + SizeOf(RCRC) + SizeOf(RPos);
              LSize3 := ROrigBuff^.RPos;

              RCRC := m0HASUpdate32(RPos, @RBody, RPos, Cm0HASLibVersionCRC);

              Inc(RPos, SizeOf(RCRC));

            end;

            with RStreamHandle do
            begin

              if (RWProc(RCompBuff, LSize2, LSize3, RSelf) <> LSize2) then
              begin

                raise Em0LZOLibGeneral.Create(SEWriteError);

              end;

            end;

          end;

          RPos := 0;

        end;

        if (ABuff = nil) then
        begin

          Break;

        end;

        Dec(ASize, LSize1);

      end;

    end;

  end;

end;*)

(*procedure m0LZODeflateFlush(AHandle: Pm0LZOLibHandle);
begin
 m0LZODeflate(AHandle, nil, 0);
end;*)

(*procedure m0LZODeflateDone(AHandle: Pm0LZOLibHandle);
begin

  try

    m0LZODeflateFlush(AHandle);

    with AHandle^ do
    begin

      with RStreamHandle do
      begin

        with ROrigBuff^ do
        begin

          if (RWProc(ROrigBuff, SizeOf(RPos), 0, RSelf) <> SizeOf(RPos)) then
          begin

            raise Em0LZOLibGeneral.Create(SEWriteError);

          end;

        end;

      end;

    end;

  finally

    _FreeBuff(AHandle);

  end;

end;*)

(*procedure m0LZOInflateInit(AHandle: Pm0LZOLibHandle);
begin
  _AllocBuff(AHandle);
end;*)

(*procedure m0LZOInflate(AHandle: Pm0LZOLibHandle; ABuff: Pointer; var ASize: LongInt);
var
  LCRC1:   LongInt;
  LCRC2:   LongInt;
  LDecompress: LongInt;
  LOffset: LongInt;
  LResult: Word;
  LSize:   LongInt;
begin

  with AHandle^ do
  begin

    with RCompBuff^ do
    begin

      LOffset := 0;

      while (((ASize <> 0) or (ABuff = nil)) and not (RReadEOF)) do
      begin

        if ((ROrigBuff^.RPos = RPos) or (ABuff = nil)) then
        begin

          LSize := SizeOf(RPos);

          with RStreamHandle do
          begin

            if (RRProc(RCompBuff, LSize, RSelf) <> LSize) then
            begin

              raise Em0LZOLibGeneral.Create(SEReadError);

            end;

          end;

          if (RPos = 0) then
          begin

            RReadEOF := True;
            Break;

          end;

          if ((LongWord(RPos) and $80000000) <> 0) then
          begin

            LSize := RPos and $7fffffff;
            RPos  := LSize - SizeOf(RCRC);

            with ROrigBuff^ do
            begin

              with RStreamHandle do
              begin

                if (RRProc(Pointer(LongInt(ROrigBuff) + SizeOf(RPos)), LSize, RSelf) <>
                  LSize) then
                begin

                  raise Em0LZOLibGeneral.Create(SEReadError);

                end;

              end;

              Dec(LSize, SizeOf(RCRC));

              LCRC1 := m0HASUpdate32(LSize, @RBody, LSize, Cm0HASLibVersionCRC);
              LCRC2 := RCRC;

            end;

            if ((LCRC1 <> LCRC2) and (LCRC2 <> 0)) then
            begin

              raise Em0LZOLibGeneral.Create(Format(SEBadBlockCRC, [LCRC1]));

            end;

          end
          else
          begin

            LSize := RPos;

            with RStreamHandle do
            begin

              if (RRProc(Pointer(LongInt(RCompBuff) + SizeOf(RPos)), LSize, RSelf) <>
                LSize) then
              begin

                raise Em0LZOLibGeneral.Create(SEReadError);

              end;

            end;

            Dec(LSize, SizeOf(RCRC));

            LCRC1 := m0HASUpdate32(LSize, @RBody, LSize, Cm0HASLibVersionCRC);
            LCRC2 := RCRC;

            if ((LCRC1 <> LCRC2) and (LCRC2 <> 0)) then
            begin

              raise Em0LZOLibGeneral.Create(Format(SEBadBlockCRC, [LCRC1]));

            end;

              {$IfDef m0MultiThreadLZO}
            if IsMultiThread then
            begin

              EnterCriticalSection(GThreadSafe);

            end;
            try
              {$EndIf m0MultiThreadLZO}

              LResult := m0LZODecompress( @ROrigBuff^.RBody, LDecompress, @RBody, LSize);

              if (LResult <> Cm0LZOLibINoError) then
              begin

                raise Em0LZOLibGeneral.Create(_ErrorToString(LResult));

              end;

              {$IfDef m0MultiThreadLZO}
            finally

              if IsMultiThread then
              begin

                LeaveCriticalSection(GThreadSafe);

              end;

            end;
              {$EndIf m0MultiThreadLZO}

            RPos := LDecompress;

          end;

          ROrigBuff^.RPos := 0;

        end;

        if (ABuff = nil) then
         Break;

        LSize := m0S32Min(RPos - ROrigBuff^.RPos, ASize);

        with ROrigBuff^ do
        begin

          m2MEMCopy(Pointer(LongInt(ABuff) + LOffset), @RBody[RPos], LSize);
          Inc(RPos, LSize);

        end;

        Inc(LOffset, LSize);
        Dec(ASize, LSize);

      end;

      ASize := LOffset;

    end;

  end;

end;*)

(*procedure m0LZOInflateRest(AHandle: Pm0LZOLibHandle);
var
  LSize: LongInt;
begin

  LSize := 0;

  AHandle^.RReadEOF := False;
  m0LZOInflate(AHandle, nil, LSize);

end;*)

(*procedure m0LZOInflateEOF(AHandle: Pm0LZOLibHandle);
begin
  AHandle^.RReadEOF := True;
end;

procedure m0LZOInflateDone(AHandle: Pm0LZOLibHandle);
begin
  _FreeBuff(AHandle);
end;*)

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0lzolib.pas initialization enter'); {$EndIf}
(*  mgBuffers := l3NewMemoryChain($00008000 + ($00008000 div 5));*)
{$IFNDEF _m0USEEXTGETMEM1}
(*  m0ArcHandleBuffers := l3NewMemoryChain(SizeOf(Tm0LZOLibHandle));*)
{$EndIF  _m0USEEXTGETMEM1}
  _Initialization;
{$IfDef m0MultiThreadLZO}
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0lzolib.pas initialization leave'); {$EndIf}
(*finalization
  _Finalization;*)
{$EndIf m0MultiThreadLZO}

end.
