unit    m2S64Lib;
{* Функции для работы со знаковыми 64-битными числами. }

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, free for non commercial use.
//
//
*)
// $Id: m2s64lib.pas,v 1.1 2008/02/22 17:10:08 lulin Exp $

// $Log: m2s64lib.pas,v $
// Revision 1.1  2008/02/22 17:10:08  lulin
// - библиотека переехала.
//
// Revision 1.2  2007/12/10 15:33:04  lulin
// - cleanup.
//
// Revision 1.1  2007/12/07 11:51:05  lulin
// - переезд.
//
// Revision 1.2  2001/10/18 12:10:32  law
// - comments: xHelpGen.
//

{$I m2Define.inc}

interface


 function    m2S64Min             (const AParamA: Int64;
                                   const AParamB: Int64
                                  ): Int64; pascal;
   {* - возвращает минимальное из двух чисел. }

 function    m2S64Max             (const AParamA: Int64;
                                   const AParamB: Int64
                                  ): Int64; pascal;
   {* - возвращает максимальное из двух чисел. }


 function    m2S64Compare         (const AParamA: Int64;
                                   const AParamB: Int64
                                  ): Integer; pascal;
   {* - сравнивает два числа. }


 implementation


 function    m2S64Min(const AParamA: Int64;
                      const AParamB: Int64
                     ): Int64;
 asm

                push  ebx
                mov   ecx,dword ptr [AParamA][+$00]
                mov   ebx,dword ptr [AParamA][+$04]
                mov   eax,dword ptr [AParamB][+$00]
                mov   edx,dword ptr [AParamB][+$04]
                cmp   ebx,edx
                jg    @@02
                jnz   @@01
                cmp   ecx,eax
                ja    @@02
                
  @@01:         mov   eax,ecx
                mov   edx,ebx
                
  @@02:         pop   ebx

 end;

 function    m2S64Max(const AParamA: Int64;
                      const AParamB: Int64
                     ): Int64;
 asm

                push  ebx
                mov   ecx,dword ptr [AParamA][+$00]
                mov   ebx,dword ptr [AParamA][+$04]
                mov   eax,dword ptr [AParamB][+$00]
                mov   edx,dword ptr [AParamB][+$04]
                cmp   edx,ebx
                jg    @@02
                jnz   @@01
                cmp   eax,ecx
                ja    @@02
                
  @@01:         mov   eax,ecx
                mov   edx,ebx
                
  @@02:         pop   ebx

 end;

 function    m2S64Compare(const AParamA: Int64;
                          const AParamB: Int64
                         ): Integer;
 asm

                push  ebx
                mov   ecx,dword ptr [AParamA][+$00]
                mov   ebx,dword ptr [AParamA][+$04]
                mov   eax,dword ptr [AParamB][+$00]
                mov   edx,dword ptr [AParamB][+$04]
                cmp   ebx,edx
                jg    @@04
                jnz   @@01
                cmp   ecx,eax
                ja    @@04
                
  @@01:         cmp   edx,ebx
                jg    @@02
                jnz   @@03
                cmp   eax,ecx
                jbe   @@03
                
  @@02:         xor   eax,eax
                dec   eax
                jmp   @@05

  @@03:         xor   eax,eax
                jmp   @@05
                
  @@04:         xor   eax,eax
                inc   eax
                
  @@05:         pop   ebx

 end;


end.

