unit m2XLTLib;
{* ”тилиты дл€ преобразовани€ строковых буферов. } 

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
{ $Id: m2xltlib.pas,v 1.1 2008/02/22 17:10:08 lulin Exp $ }

// $Log: m2xltlib.pas,v $
// Revision 1.1  2008/02/22 17:10:08  lulin
// - библиотека переехала.
//
// Revision 1.2  2007/12/10 15:33:04  lulin
// - cleanup.
//
// Revision 1.1  2007/12/07 11:51:05  lulin
// - переезд.
//
// Revision 1.4  2005/10/11 12:23:38  lulin
// - попытки ускорить функцию подн€ти€ регистра при поиске.
//
// Revision 1.3  2001/10/18 11:17:19  law
// - new call format: изменен формат вызова m2XLTConvertBuffEx.
//
// Revision 1.2  2001/10/17 09:05:57  law
// - new impl: написана ассемблерна€ реализаци€ m2XLTConvertBuffEx.
//

{$R *.res}

{$Include m2Define.inc}

interface

uses
  Windows,
  SysUtils,

  m2AddPrc,
  m2RESLib
  ;

 const
        Cm2XLTOem2Ansi=           $0001;
         {* - идентификатор таблицы преобразовани€ OEM в ANSI. }
        Cm2XLTAnsi2Oem=           $0002;
         {* - идентификатор таблицы преобразовани€ ANSI в OEM. }
        Cm2XLTOem2Upper=          $0003;
         {* - идентификатор таблицы преобразовани€ OEM в верхний регистр. }
        Cm2XLTOem2Lower=          $0004;
         {* - идентификатор таблицы преобразовани€ OEM в нижний регистр. }
        Cm2XLTAnsi2Upper=         $0005;
         {* - идентификатор таблицы преобразовани€ ANSI в верхний регистр. }
        Cm2XLTAnsi2Lower=         $0006;
         {* - идентификатор таблицы преобразовани€ ANSI в нижний регистр. }
        Cm2XLTOemRus2Eng=         $0007;
         {* - идентификатор таблицы преобразовани€ русских букв в английские дл€ OEM. }
        Cm2XLTOemEng2Rus=         $0008;
         {* - идентификатор таблицы преобразовани€ английских букв в русские дл€ OEM. }
        Cm2XLTAnsiRus2Eng=        $0009;
         {* - идентификатор таблицы преобразовани€ русских букв в английские дл€ ANSI. }
        Cm2XLTAnsiEng2Rus=        $000a;
         {* - идентификатор таблицы преобразовани€ английских букв в русские дл€ ANSI. }
        Cm2XLTOem2Swap=           $000b;
         {* - идентификатор таблицы преобразовани€ нижнего регистра в верхний и наоборот дл€ OEM. }
        Cm2XLTAnsi2Swap=          $000c;
         {* - идентификатор таблицы преобразовани€ нижнего регистра в верхний и наоборот дл€ ANSI. }
        Cm2XLTOem2Special=        $000d;
         {* - идентификатор таблицы преобразовани€ OEM в OEMLite (см. CP_OEMLite). }

        Cm2XLTVersion=            Cm2XLTOem2Special;


 type
        Pm2XLTTable08=            ^Tm2XLTTable08;
        Tm2XLTTable08=            packed array[$00..$ff] of Byte;
         {* “аблица преобразовани€ символов. }

        Pm2XLTVersionItem = ^Tm2XLTVersionItem;
        Tm2XLTVersionItem = packed
        record
         RSeed08: Pm2XLTTable08;
         RRHnd08: THandle;
        end;//Tm2XLTVersionItem

        Pm2XLTVersionArray=       ^Tm2XLTVersionArray;
        Tm2XLTVersionArray=       packed array [1..Cm2XLTVersion] of Tm2XLTVersionItem;


 procedure   m2XLTConvertBuff     (const ABuff: PAnsiChar;
                                   const ASize: LongInt;
                                   const AVersion: Word
                                  );
  {* - преобразует aBuff согласно таблице с идентификатором aVersion (см. Cm2XLTOem2Ansi). }

 procedure   m2XLTConvertBuffEx   (ABuff        : PAnsiChar;
                                   ASize        : LongInt;
                                   const ATable : Tm2XLTTable08
                                  );
  {* - преобразует aBuff согласно таблице aTable. }

 function    m2XLTConvertOem2Ansi (const AOemCp: LongBool;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt
                                  ): PAnsiChar;
  {* - преобразует aBuff из OEM в ANSI. }

 function    m2XLTConvertAnsi2Oem (const AAnsiCp: LongBool;
                                   const ABuff: PAnsiChar;
                                   const ASize: LongInt
                                  ): PAnsiChar;
  {* - преобразует aBuff из ANSI в OEM. }


 var
        GVersionArray:            Tm2XLTVersionArray = ((RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0),
                                                        (RSeed08: nil; RRHnd08: 0)
                                                       );


implementation


 const
        CResourcePrefix=          'm2XLT';


 procedure   _AllocData08(const AVersion: Word
                         );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed08:=Pm2XLTTable08(m2RESAllocRCDATA(RRHnd08,CResourcePrefix+Format('08_%.4x',[AVersion])));

   end;

 end;

 procedure   _FreeData08(const AVersion: Word
                        );
 begin

  with GVersionArray[AVersion] do
   begin

    RSeed08:=Pm2XLTTable08(m2RESFreeRCDATA(RRHnd08));

   end;

 end;

 procedure   m2XLTConvertBuff(const ABuff: PAnsiChar;
                              const ASize: LongInt;
                              const AVersion: Word
                             );
 begin

  if ((AVersion > 0) and (AVersion <= Cm2XLTVersion))
   then
    begin

     m2XLTConvertBuffEx(ABuff,ASize,GVersionArray[AVersion].RSeed08^);

    end;

 end;

procedure   m2XLTConvertBuffEx(ABuff        : PAnsiChar;      // eax
                               ASize        : LongInt;        // edx
                               const ATable : Tm2XLTTable08   // ecx
                              );

asm
     jecxz @ret
     or    eax, eax
     jz    @ret
     or    edx, edx
     jz    @ret
     push  ebx
     mov   ebx, ecx
     mov   ecx, edx
     mov   edx, eax
@1:  mov   al,  [edx]
     {$IfDef Delphi6}
     xlatb
     {$Else  Delphi6}
     xlat
     {$EndIf Delphi6}
     mov   [edx], al
     inc   edx
     loop  @1
     pop   ebx
@ret:
end;
(*
 var
        LBuff:                    PAnsiChar;
        LSize:                    LongInt;
 begin

  if ((ABuff <> nil) and (ASize <> 0) and (ATable <> nil))
   then
    begin

     LBuff:=ABuff;
     LSize:=ASize;

     while (LSize <> 0) do
      begin

       LBuff^:=AnsiChar(ATable^[Ord(LBuff^)]);

       Inc(LongInt(LBuff));

       Dec(LSize);

      end;

    end;

 end;*)

 function    m2XLTConvertOem2Ansi(const AOemCp: LongBool;
                                  const ABuff: PAnsiChar;
                                  const ASize: LongInt
                                 ): PAnsiChar;
 begin

  Result:=ABuff;

  if AOemCp
   then
    begin

     m2XLTConvertBuff(ABuff,ASize,Cm2XLTOem2Ansi);

    end;

 end;

 function    m2XLTConvertAnsi2Oem(const AAnsiCp: LongBool;
                                  const ABuff: PAnsiChar;
                                  const ASize: LongInt
                                 ): PAnsiChar;
 begin

  Result:=ABuff;

  if AAnsiCp
   then
    begin

     m2XLTConvertBuff(ABuff,ASize,Cm2XLTAnsi2Oem);

    end;

 end;


 {$I *.inc}


end.

