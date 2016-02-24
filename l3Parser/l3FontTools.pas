unit l3FontTools;

{$IfDef DesignTimeLibrary}
{$WEAKPACKAGEUNIT ON}
{$EndIf DesignTimeLibrary}

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3FontTools -               }
{ Начат: 20.05.2005 15:56 }
{ $Id: l3FontTools.pas,v 1.10 2014/03/03 14:03:53 lulin Exp $ }

// $Log: l3FontTools.pas,v $
// Revision 1.10  2014/03/03 14:03:53  lulin
// - рефакторинг менеджера шрифтов.
//
// Revision 1.9  2011/11/07 07:25:51  lulin
// {RequestLink:296632270}
//
// Revision 1.8  2011/09/02 12:02:31  lulin
// {RequestLink:280006084}.
//
// Revision 1.7  2007/04/04 11:29:42  lulin
// - добавлена досовская кодировка шрифта.
//
// Revision 1.6  2007/01/12 13:22:46  lulin
// - cleanup.
//
// Revision 1.5  2007/01/12 11:00:50  lulin
// - cleanup.
//
// Revision 1.4  2007/01/11 14:06:33  lulin
// - интерфейс шрифта переехал в базовый модуль.
//
// Revision 1.3  2006/12/04 15:39:41  lulin
// - модуль переименован в соответствии с его функциями.
//
// Revision 1.2  2005/05/26 15:35:10  lulin
// - базовая канва вывода теперь избавлена от знания о контролах управления.
//
// Revision 1.1  2005/05/20 12:10:57  lulin
// - new unit: l3FontTools.
//

{$Include l3Define.inc }

interface

uses
  Windows,
  
  Classes,
  Graphics,

  l3Interfaces
  ;

procedure l3IFont2Font(const F1: Il3FontInfo; F2: TFont);
  {* - присваивает свойства интерфейса F1: Il3FontInfo шрифту F2: TFont. }
function l3IsDefaultCharset(aCharset : TFontCharset) : Boolean;
 {* - определяет алфавит по умолчанию. }

implementation

uses
  l3Chars,
  l3Defaults,
  l3FontManager,
  l3Dict
  ;

procedure CheckFont(aFont : TFont);
begin
 if (aFont.Color = clDefault) then
  aFont.Color := clWindowText;
end;

procedure l3IFont2Font(const F1: Il3FontInfo; F2: TFont);
  {-}
var
 OC      : TNotifyEvent;
 LogFont : Tl3LogFont;
 Style   : TFontStyles;
 FD      : Tl3FontManager;
 Sz      : Integer;
begin
 FD := l3FontManager.Fonts;
 LogFont := FD.DRByName[F1.Name];
 OC := F2.OnChange;
 try
  F2.OnChange := nil;
  F2.Pitch := F1.Pitch;
  if (F2.Pitch = fpFixed) AND not LogFont.IsFixed then
   LogFont := FD.DRByName[def_ANSIDOSFontName];
  F2.Name  := LogFont.AsString;
  Sz := F1.Size;
  if (F1.Index <> l3_fiNone) then
   Sz := Sz - (Sz div 4);
  F2.Size  := Sz;
  F2.Color := F1.ForeColor;
  Style := [];
  if F1.Bold then
   Include(Style, fsBold);
  if F1.Italic then
   Include(Style, fsItalic);
  if F1.Underline then
   Include(Style, fsUnderline);
  if F1.Strikeout then
   Include(Style, fsStrikeout);
  F2.Style := Style;
  if (LogFont = nil) then
   F2.CharSet := CS_Effective
  else
   F2.CharSet := LogFont.LogFont.elfLogFont.lfCharSet;
  CheckFont(F2);
  if Assigned(OC) then OC(F2);
 finally
  F2.OnChange := OC;
 end;//try..finally
end;

function l3IsDefaultCharset(aCharset : TFontCharset) : Boolean;
 {* - определяет алфавит по умолчанию. }
begin
 Result := (aCharset = CS_Ansi) or (aCharset = CS_Default){ or (aCharset = CS_OEM)};
end;

end.

