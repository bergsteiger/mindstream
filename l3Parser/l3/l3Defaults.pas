unit l3Defaults;
{* Значения по умолчанию библиотеки L3. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Defaults -                }
{ Начат: 10.09.2001 15:33             }
{ $Id: l3Defaults.pas,v 1.24 2012/11/01 09:42:57 lulin Exp $ }

// $Log: l3Defaults.pas,v $
// Revision 1.24  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.23  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.22  2012/10/26 19:42:24  lulin
// - вычищаем поддержку ветки редактора.
//
// Revision 1.21  2011/09/02 12:28:55  lulin
// {RequestLink:281523254}.
//
// Revision 1.20  2011/08/29 18:14:24  lulin
// {RequestLink:278833302}.
//
// Revision 1.19  2011/08/29 14:46:18  lulin
// - правим эталоны из-за уменьшения шрифта по-умолчанию для preformatted-параграфов.
//
// Revision 1.18  2011/08/26 16:34:02  lulin
// {RequestLink:278833302}.
//
// Revision 1.17  2011/08/26 14:47:02  lulin
// {RequestLink:278833302}.
//
// Revision 1.16  2011/07/13 17:39:10  lulin
// {RequestLink:228688745}.
//
// Revision 1.15  2011/07/04 16:18:49  vkuprovich
// {RequestLink:269082891}
// Убираем излишние комментарии
//
// Revision 1.14  2011/06/17 11:59:10  lulin
// {RequestLink:228688486}.
//
// Revision 1.13  2011/04/20 10:45:22  lulin
// {RequestLink:263294701}.
//
// Revision 1.12  2011/03/21 14:03:29  lulin
// {RequestLink:228691765}.
//
// Revision 1.11  2011/03/17 15:27:50  lulin
// {RequestLink:228691765}.
//
// Revision 1.10  2011/03/16 18:24:24  lulin
// {RequestLink:228688510}.
// - используем новый синий цвет фона.
//
// Revision 1.9  2010/09/23 09:35:14  lulin
// {RequestLink:234361479}.
//
// Revision 1.8  2010/01/19 12:09:14  lulin
// {RequestLink:178717037}.
//
// Revision 1.7  2008/09/09 15:40:14  lulin
// - удалены ненужные свойства.
//
// Revision 1.6  2008/06/16 13:55:08  lulin
// - рисуем схему EVD на модели.
//
// Revision 1.5  2007/01/12 13:48:16  lulin
// - cleanup.
//
// Revision 1.4  2006/12/04 13:43:57  oman
// - fix: Константа для определения минимальной печатной области
//  вынесена в l3/ev (cq23103)
//
// Revision 1.3  2005/05/24 14:50:09  lulin
// - готовим модуль evGraph к переезду в L3.
//
// Revision 1.2  2005/03/28 08:35:10  mmorozov
// new behaviour: для Немезиса def_ANSIDOSFontName  = 'Courier New';
//
// Revision 1.1  2001/09/10 11:38:44  law
// - split unit: evDef -> evDef + l3Defaults.
//

{$Include l3Define.inc }

interface

uses
  Graphics,
  l3Const
  ;

const
  c_MainMenuColor = $00A95800;

  def_PaperColor   = clWhite;
   {* - цвет бумаги. }
  def_Zoom         = 100;

  def_cmPaperWidth     = 2100;
  def_cmPaperHeight    = 2970;
  def_cmPaperLeft      = 150;
  def_cmPaperRight     = 150;
  def_cmPaperTop       = 200;
  def_cmPaperBottom    = 200;
  def_cmMinPrintArea   = 300;
  def_cmPrintableWidth = def_cmPaperWidth - def_cmPaperLeft - def_cmPaperRight;
  def_cmNormalParaStyleWidth = def_cmPrintableWidth;
  def_FrameWidth       = l3Inch div 144;
  def_FirstIndent      = l3Inch div 2;
  def_FirstLineIndent  = def_FirstIndent;
  def_LineSpacing = 100;
  def_BigLineSpacing = {150}125;
  def_PrintingLineSpacing = def_BigLineSpacing;

var
  def_inchPrintableWidth : Integer = 0;
  def_inchPaperWidth     : Integer = 0;
  def_inchPaperHeight    : Integer = 0;
  def_inchPaperBottom    : Integer = 0;
  def_inchMinPrintArea   : Integer = 0;
  def_inchPaperLeft      : Integer = 0;
  def_inchPaperRight     : Integer = 0;
  def_inchPaperTop       : Integer = 0;
  def_inchNormalParaStyleWidth : Integer = 0;

const
 cGarant2011ToolbarsColor = $00F9F8FA;
 cGarant2011BackColor = $00F9F8FA;
 cGarant2011GradientStartColor = $CF9560;
 cGarant2011GradientEndColor = $E1B484;
 cGarant2011SelectionColor = $B87040;
 cGarant2011LinkColor = $00800000;
 cGarant2011BorderColor = $A95C1D;
 cGarant2011InnerBorderColor = $DBAA76;
 cGarant2011KZBorderColor = $E7B294;
 cGarant2011KZInnerBorderColor = $EFCFBD;
 cGarant2011CollapsedPanelColor = $E0C9B1;
 cWarningMessageColor = $F6E1D2;

resourcestring
  def_ANSIDOSFontName  = 'Courier New';
  def_WingdingsFontName = 'Wingdings';

implementation

uses
  l3UnitsTools
  ;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Defaults.pas initialization enter'); {$EndIf}
  def_inchPaperLeft := l3Cm2Inch(def_cmPaperLeft);
  def_inchPaperRight := l3Cm2Inch(def_cmPaperRight);
  def_inchPaperTop := l3Cm2Inch(def_cmPaperTop);
  def_inchPrintableWidth := l3Cm2Inch(def_cmPrintableWidth);
  def_inchPaperWidth := l3Cm2Inch(def_cmPaperWidth);
  def_inchPaperHeight := l3Cm2Inch(def_cmPaperHeight);
  def_inchPaperBottom := l3Cm2Inch(def_cmPaperBottom);
  def_inchMinPrintArea := l3Cm2Inch(def_cmMinPrintArea);
  def_inchNormalParaStyleWidth := l3Cm2Inch(def_cmNormalParaStyleWidth);
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3Defaults.pas initialization leave'); {$EndIf}
end.

