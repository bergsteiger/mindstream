(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
unit    m2HASLib; {$R *.res}


{$I m2Define.inc}

 interface


 uses
         Windows,
        SysUtils,

        m2AddDbg,
        m2AddPrc,
        m2RESLib;


 const
        Cm2HASVersionCRC=         $0001;

        Cm2HASVersion=            Cm2HASVersionCRC;

        Cm2HASDefCount=           $4000;
        Cm2HASDefSize=            High(LongInt);


 type
        Pm2HASTable16=            ^Tm2HASTable16;
        Tm2HASTable16=            packed array[$00..$ff] of Word;

        Pm2HASTable32=            ^Tm2HASTable32;
        Tm2HASTable32=            packed array[$00..$ff] of LongInt;

        Tm2HASUpdateProc16=       function(const AHash: Word;
                                           const ABuff: PAnsiChar;
                                           const ASize: LongInt;
                                           const ATable: Pm2HASTable16
                                          ): Word;

        Tm2HASUpdateProc32=       function(const AHash: LongInt;
                                           const ABuff: PAnsiChar;
                                           const ASize: LongInt;
                                           const ATable: Pm2HASTable32
                                          ): LongInt;

        Pm2HASVersionItem=        ^Tm2HASVersionItem;
        Tm2HASVersionItem=        packed record

                                   RRHnd16: THandle;
                                   RSeed16: Pm2HASTable16;
                                   RProc16: Tm2HASUpdateProc16;

                                   RRHnd32: THandle;
                                   RSeed32: Pm2HASTable32;
                                   RProc32: Tm2HASUpdateProc32;

                                  end;

        Pm2HASVersionArray=       ^Tm2HASVersionArray;
        Tm2HASVersionArray=       packed array [1..Cm2HASVersion] of Tm2HASVersionItem;


 function    m2HASUpdate16        (const AHash: Word;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt;
                                   const AVersion: Word
                                  ): Word;

 function    m2HASUpdate32        (const AHash: LongInt;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt;
                                   const AVersion: Word
                                  ): LongInt;


 implementation


 function    _UpdateProc160001    (const AHash: Word;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt;
                                   const ATable: Pm2HASTable16
                                  ): Word; forward;

 function    _UpdateProc320001    (const AHash: LongInt;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt;
                                   const ATable: Pm2HASTable32
                                  ): LongInt; forward;


 const
        CResourcePrefix=          'm2HAS';

        CMagic16Seed=             Word(-1);
        CMagic32Seed=             LongInt(-1);


 var
        GVersionArray:            Tm2HASVersionArray = ((RRHnd16: 0; RSeed16: nil; RProc16: _UpdateProc160001; RRHnd32: 0; RSeed32: nil; RProc32: _UpdateProc320001)
                                                       );


 function    _UpdateProc160001(const AHash: Word;
                               const ABuff: PAnsiChar;
                               const ASize: LongInt;
                               const ATable: Pm2HASTable16
                              ): Word;
 type
        P16to08=                  ^T16to08;
        T16to08=                  packed record

                                   RLoByte: Byte;
                                   RHiByte: Byte;

                                  end;
 var
        LBuff:                    PAnsiChar;
        LHash:                    Word;
        LSize:                    LongInt;
 begin

  Result:=AHash;

  if ((ABuff <> nil) and (ASize <> 0) and (ATable <> nil))
   then
    begin

     LBuff:=ABuff;
     LSize:=ASize;

     Result:=Result xor CMagic16Seed;

     while (LSize <> 0) do
      begin

       LHash:=Word(LBuff^);

       P16to08(@LHash)^.RLoByte:=P16to08(@LHash)^.RLoByte xor P16to08(@Result)^.RHiByte;

       P16to08(@Result)^.RHiByte:=P16to08(@Result)^.RLoByte;
       P16to08(@Result)^.RLoByte:=P16to08(@LHash)^.RHiByte;

       Result:=Result xor ATable^[P16to08(@LHash)^.RLoByte];

       Inc(LongInt(LBuff));

       Dec(LSize);

      end;

     Result:=Result xor CMagic16Seed;

    end;

 end;

 function    _UpdateProc320001(const AHash: LongInt;
                               const ABuff: PAnsiChar;
                               const ASize: LongInt;
                               const ATable: Pm2HASTable32
                              ): LongInt;
 type
        P16to08=                  ^T16to08;
        T16to08=                  packed record

                                   RLoByte: Byte;
                                   RHiByte: Byte;

                                  end;

        P32to16=                  ^T32to16;
        T32to16=                  packed record

                                   RLoWord: Word;
                                   RHiWord: Word;

                                  end;
 var
        LBuff:                    PAnsiChar;
        LHash:                    LongInt;
        LSize:                    LongInt;
 begin

  Result:=AHash;

  if ((ABuff <> nil) and (ASize <> 0) and (ATable <> nil))
   then
    begin

     LBuff:=ABuff;
     LSize:=ASize;

     Result:=Result xor CMagic32Seed;

     while (LSize <> 0) do
      begin

       LHash:=LongInt(LBuff^);

       P32to16(@LHash)^.RLoWord:=P32to16(@LHash)^.RLoWord xor P32to16(@Result)^.RHiWord;

       P32to16(@Result)^.RHiWord:=P32to16(@Result)^.RLoWord;
       P32to16(@Result)^.RLoWord:=P32to16(@LHash)^.RHiWord;

       Result:=Result xor ATable^[P16to08(@LHash)^.RLoByte];

       Inc(LongInt(LBuff));

       Dec(LSize);

      end;

     Result:=Result xor CMagic32Seed;

    end;

 end;

 function    _CheckVersion(const AVersion: Word
                          ): LongBool;
 begin

  Result:=((AVersion > 0) and (AVersion <= Cm2HASVersion));

 end;

 procedure   _AllocData16(const AVersion: Word
                         );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed16:=Pm2HASTable16(m2RESAllocRCDATA(RRHnd16,CResourcePrefix+Format('16_%.4x',[AVersion])));

   end;

 end;

 procedure   _FreeData16(const AVersion: Word
                        );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed16:=Pm2HASTable16(m2RESFreeRCDATA(RRHnd16));

   end;

 end;

 procedure   _AllocData32(const AVersion: Word
                         );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed32:=Pm2HASTable32(m2RESAllocRCDATA(RRHnd32,CResourcePrefix+Format('32_%.4x',[AVersion])));

   end;

 end;

 procedure   _FreeData32(const AVersion: Word
                        );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed32:=Pm2HASTable32(m2RESFreeRCDATA(RRHnd32));

   end;

 end;

 function    m2HASUpdate16(const AHash: Word;
                           const ABuff: PAnsiChar;
                           const ASize: LongInt;
                           const AVersion: Word
                          ): Word;
 begin

  m2CheckValue(_CheckVersion(AVersion));

  with GVersionArray[AVersion] do
   begin

    Result:=RProc16(AHash,ABuff,ASize,RSeed16);

   end;

 end;

 function    m2HASUpdate32(const AHash: LongInt;
                           const ABuff: PAnsiChar;
                           const ASize: LongInt;
                           const AVersion: Word
                          ): LongInt;
 begin

  m2CheckValue(_CheckVersion(AVersion));

  with GVersionArray[AVersion] do
   begin

    Result:=RProc32(AHash,ABuff,ASize,RSeed32);

   end;

 end;


 {$I *.inc}


end.

