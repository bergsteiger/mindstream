{$IFNDEF _m0DEFINE_INC}
 {$DEFINE _m0DEFINE_INC}
(*
//
// module:  m0define.inc
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: m0define.inc,v 1.1 2014/08/20 16:31:25 lulin Exp $
//
*)

{$Include l3Define.inc}

 {$IFNDEF _m0LANGUAGE_RUS}
  {$IFNDEF _m0LANGUAGE_ENG}
   {$DEFINE _m0LANGUAGE_RUS}
   {.$DEFINE _m0LANGUAGE_ENG}
  {$ENDIF}
 {$ENDIF}

 {$IFDEF Nemesis}
  {$Define _m0LINGUISTICS_MEDIALINGUA}
 {$Else  Nemesis}
  {$IFNDEF _m0LINGUISTICS_AGAMA}
   {$IFNDEF _m0LINGUISTICS_INFORMATIC}
    {$IFNDEF _m0LINGUISTICS_MEDIALINGUA}
     {$DEFINE _m0LINGUISTICS_AGAMA}
     {.$DEFINE _m0LINGUISTICS_INFORMATIC}
     {.$DEFINE _m0LINGUISTICS_MEDIALINGUA}
    {$ENDIF}
   {$ENDIF}
  {$ENDIF}
 {$ENDIF}

 {$IFNDEF _m0USEFORMS0}
  {$IfDef l3ConsoleApp}
   {$DEFINE _m0USEFORMS0}
  {$EndIf l3ConsoleApp}
 {$ENDIF}

 {$IFNDEF _m0USEFORMS0}
  {$IFNDEF _m0USEFORMS1}
   {$DEFINE _m0USEFORMS1}
  {$ENDIF}
 {$ENDIF}

 {$IFNDEF _m0MSGBOX0}
  {.$DEFINE _m0MSGBOX0}
 {$ENDIF}

 {$IFNDEF _m0MSGBOX0}
  {$IFNDEF _m0MSGBOX1}
   {$DEFINE _m0MSGBOX1}
  {$ENDIF}
 {$ENDIF}

 {$IfDef ALCU}
  {$Define _m0LOGSAV1}
 {$EndIf ALCU}

 {$IfDef Nemesis}
  {$IfOpt D+}
   {$Define _m0LOGSAV1}
  {$EndIf}
 {$EndIf Nemesis}

 {$IFNDEF _m0LOGSAV1}
  {.$DEFINE _m0LOGSAV1}
 {$ENDIF}

 {$IFNDEF _m0LOGSAV1}
  {$IFNDEF _m0LOGSAV0}
   {$DEFINE _m0LOGSAV0}
  {$ENDIF}
 {$ENDIF}

 {$IFNDEF _m0MONOMODE1}
  {.$DEFINE _m0MONOMODE1}
 {$ENDIF}

 {$IFNDEF _m0MONOMODE1}
  {$IFNDEF _m0MONOMODE0}
   {$DEFINE _m0MONOMODE0}
  {$ENDIF}
 {$ENDIF}

{$ENDIF}
