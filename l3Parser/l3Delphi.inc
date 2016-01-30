{ $Id: l3Delphi.inc,v 1.9 2013/05/24 15:59:50 lulin Exp $ }

// $Log: l3Delphi.inc,v $
// Revision 1.9  2013/05/24 15:59:50  lulin
// - пытаемся портироваться под XE4.
//
// Revision 1.8  2013/04/03 13:57:34  lulin
// - портируем.
//
// Revision 1.7  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.6  2006/01/10 07:29:00  voba
// - add VER180
//
// Revision 1.5  2002/09/11 15:43:03  law
// - change: адаптация к Delphi 7.0.
//
// Revision 1.4  2001/08/30 16:34:38  law
// - new version: портировал на Delphi 6.
//
// Revision 1.3  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{ Secrets of Delphi 3, by Ray Lischner. (1997, Waite Group Press).
  Copyright © 1996 The Waite Group, Inc.

  Define conditional macros, according to the version of Delphi.
  Delphi defines VER80=Delphi1, VER90=Delphi2, and VER100=Delphi3.
  Usually, features are upwardly compatible, so what is most interesting
  is knowing if the version is at Delphi 2 or later, Delphi 3 or later,
  and so on.

  This file defines Delphi1 for any version of Delphi, Delphi2 for
  version 2.0 or later, and Delphi3 for version 3.0 or later. To test
  for a specific version of Delphi, use the VER... labels. To test for
  a feature that depends on Windows 95 or Windows NT, use WIN32.
}

{$ifdef VER80}
  {$define Delphi1}
{$endif}
{$ifdef VER90}
  {$define Delphi1}
  {$define Delphi2}
{$endif}
{$ifdef VER100}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
{$endif}
{$ifdef VER120}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
{$endif}
{$ifdef VER130}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
{$endif}
{$ifdef VER140}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
{$endif}
{$ifdef VER150}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
  {$define Delphi7}
{$endif}
{$ifdef VER180}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
  {$define Delphi7}
  {$define Delphi2006}
{$endif}
{$IfDef VER230}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
  {$define Delphi7}
  {$define Delphi2006}
  {$define XE}
  {$define XE1}
  {$define XE2}
{$endif}
{$IfDef VER240}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
  {$define Delphi7}
  {$define Delphi2006}
  {$define XE}
  {$define XE1}
  {$define XE2}
  {$define XE3}
{$endif}
{$IfDef VER250}
  {$define Delphi1}
  {$define Delphi2}
  {$define Delphi3}
  {$define Delphi4}
  {$define Delphi5}
  {$define Delphi6}
  {$define Delphi7}
  {$define Delphi2006}
  {$define XE}
  {$define XE1}
  {$define XE2}
  {$define XE3}
  {$define XE4}
{$endif}
