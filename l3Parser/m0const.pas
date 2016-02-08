(*
//
// module:  m0const.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0const.pas,v 1.1 2014/08/20 16:31:25 lulin Exp $
//
*)
unit    m0Const;


 {$I m0Define.inc}

 interface


 uses
        Windows,Messages,SysUtils,Consts,Classes;


 const
        //Cm0EndOfLine              = ''^M^J'';

        Cm0DateSeparator          = '/';
        Cm0TimeSeparator          = ':';

        Cm0LongDateFormat         = 'dd/mm/yyyy';
        Cm0LongTimeFormat         = 'hh:nn:ss';

        Cm0ShortDateFormat        = 'dd/mm/yyyy';
        Cm0ShortTimeFormat        = 'hh:nn:ss';

(*        Cm0MinByte                = Low(Byte);
        Cm0MinWord                = Low(Word);
        Cm0MinInteger             = Low(Integer);
        Cm0MinLongInt             = Low(LongInt);*)

(*        Cm0MaxByte                = High(Byte);
        Cm0MaxWord                = High(Word);
        Cm0MaxInteger             = High(Integer);
        Cm0MaxLongInt             = High(LongInt);

        Cm0MinPointer             = Pointer(+0);
        Cm0MinLongWord            = LongInt(+0);

        Cm0MaxPointer             = Pointer(-1);
        Cm0MaxLongWord            = LongInt(-1);*)


 implementation


end.

