unit l3Const;
{* Константы библиотеки L3. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В.                   }
{ Модуль: l3Const -                   }
{ Начат: 13.04.1998 14:05             }
{ $Id: l3Const.pas,v 1.28 2011/05/18 17:46:00 lulin Exp $ }

// $Log: l3Const.pas,v $
// Revision 1.28  2011/05/18 17:46:00  lulin
// {RequestLink:266409354}.
//
// Revision 1.27  2010/06/02 11:13:59  dinishev
// [$216074494]
//
// Revision 1.26  2010/03/18 14:15:46  lulin
// {RequestLink:197951943}.
//
// Revision 1.25  2009/09/23 13:43:21  dinishev
// [$163068489]. Более правильные рабочие константы.
//
// Revision 1.24  2009/09/23 08:09:04  dinishev
// Типа стандартизация и таблицы лучше выглядят.
//
// Revision 1.23  2007/01/22 15:20:13  oman
// - new: Локализация библиотек - l3 (cq24078)
//
// Revision 1.22  2005/05/26 16:01:48  lulin
// - избавил базовую канву вывода от знания о константах Эвереста.
//
// Revision 1.21  2005/05/24 14:50:09  lulin
// - готовим модуль evGraph к переезду в L3.
//
// Revision 1.20  2005/05/24 13:43:34  lulin
// - rename unit: evLineAr -> l3LineArray.
//
// Revision 1.19  2005/05/24 13:21:57  lulin
// - new const: l3Inch.
//
// Revision 1.18  2001/09/26 14:33:48  law
// - cleanup: удалена переменная l3NilVar.
//
// Revision 1.17  2001/09/26 14:06:59  law
// - cleanup: l3NilObject заменен на _l3NilOp.
//
// Revision 1.16  2001/09/03 09:27:07  law
// - bug fix.
//
// Revision 1.15  2001/09/03 09:21:12  law
// - bug fix.
//
// Revision 1.14  2001/08/31 12:19:58  law
// - cleanup: первые шаги к кроссплатформенности.
//
// Revision 1.13  2001/08/29 07:01:10  law
// - split unit: l3Intf -> l3BaseStream, l3BaseDraw, l3InterfacedComponent.
//
// Revision 1.12  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  Windows;

const  
  l3BitInLong = 32;
   {* Число бит в целом. }
  l3ParseBufSize = 32{8} * 1024;
  l3NotFound  = -1;
   {* Признак ненайденной подстроки. }

const
  l3NilLong = High(Longint);
   {* NULL для целых. }
  l3Inch = 1440;
   {* Дюйм. }
  l3mmInInch = 254;
    {* - число сантиметров в дюйме. }
  l3FontIndexDelta = l3Inch div 16;
   {-}
  l3Epsilon = l3Inch div 120;
    {* - предел точности. }
  l3AlingDelta = l3Epsilon * 7;
   { Велчина выравнивания (значения отличающиеся на меньшую по модулю велчину считаются равными). }
  l3ShapeNil = Low(Longint) div 2;
   {* - NULL для координат рисуемых объектов. }

const
  S_Ok                  = Windows.S_Ok;
   {* Успешное завершение. }
  S_False               = Windows.S_False;
   {* Неуспешное завершение. }
  E_NoInterface         = Windows.E_NoInterface;
   {* Интерфейс не поддерживается. }
  E_ClassNotAvailable   = Windows.CLASS_E_CLASSNOTAVAILABLE;
   {* Класс недоступен. }
  E_Fail = Windows.E_Fail;
   {-}
  {$IfNDef Delphi6}
  E_UNEXPECTED = Windows.E_UNEXPECTED;
   {-}
  E_NOTIMPL = Windows.E_NOTIMPL;
   {-}
  {$EndIf Delphi6}

  {Коды клавиш}
  VK_ALT  = VK_MENU;

resourcestring
  l3ErrSeekPastEOF     = 'Seek past EOF';
  l3ErrSeekError       = 'Seek error';
  l3ErrPutbackOverflow = 'Putback overflow';
  l3ErrInvalidOrigin   = 'Invalid origin in seek method';
  
  l3NULLStr = '<NULL>';

implementation

end.

