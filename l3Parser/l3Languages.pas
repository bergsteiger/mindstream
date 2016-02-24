unit l3Languages;

{ Константы и процедуры выдернуты из Windows.pas, входящего в состав Delphi 2009 }

interface

uses 
 l3Base,
 l3ProtoObject;

(*
 *  Language IDs.
 *
 *  The following two combinations of primary language ID and
 *  sublanguage ID have special semantics:
 *
 *    Primary Language ID   Sublanguage ID      Result
 *    -------------------   ---------------     ------------------------
 *    LANG_NEUTRAL          SUBLANG_NEUTRAL     Language neutral
 *    LANG_NEUTRAL          SUBLANG_DEFAULT     User default language
 *    LANG_NEUTRAL          SUBLANG_SYS_DEFAULT System default language
 *    LANG_INVARIANT        SUBLANG_NEUTRAL     Invariant locale
 *)

const
{ Primary language IDs. }

  LANG_NEUTRAL                         = $00;
  {$EXTERNALSYM LANG_NEUTRAL}
  LANG_INVARIANT                       = $7f;
  {$EXTERNALSYM LANG_INVARIANT}

  LANG_AFRIKAANS                       = $36;
  {$EXTERNALSYM LANG_AFRIKAANS}
  LANG_ALBANIAN                        = $1c;
  {$EXTERNALSYM LANG_ALBANIAN}
  LANG_ARABIC                          = $01;
  {$EXTERNALSYM LANG_ARABIC}
  LANG_BASQUE                          = $2d;
  {$EXTERNALSYM LANG_BASQUE}
  LANG_BELARUSIAN                      = $23;
  {$EXTERNALSYM LANG_BELARUSIAN}
  LANG_BULGARIAN                       = $02;
  {$EXTERNALSYM LANG_BULGARIAN}
  LANG_CATALAN                         = $03;
  {$EXTERNALSYM LANG_CATALAN}
  LANG_CHINESE                         = $04;
  {$EXTERNALSYM LANG_CHINESE}
  LANG_CROATIAN                        = $1a;
  {$EXTERNALSYM LANG_CROATIAN}
  LANG_CZECH                           = $05;
  {$EXTERNALSYM LANG_CZECH}
  LANG_DANISH                          = $06;
  {$EXTERNALSYM LANG_DANISH}
  LANG_DUTCH                           = $13;
  {$EXTERNALSYM LANG_DUTCH}
  LANG_ENGLISH                         = $09;
  {$EXTERNALSYM LANG_ENGLISH}
  LANG_ESTONIAN                        = $25;
  {$EXTERNALSYM LANG_ESTONIAN}
  LANG_FAEROESE                        = $38;
  {$EXTERNALSYM LANG_FAEROESE}
  LANG_FARSI                           = $29;
  {$EXTERNALSYM LANG_FARSI}
  LANG_FINNISH                         = $0b;
  {$EXTERNALSYM LANG_FINNISH}
  LANG_FRENCH                          = $0c;
  {$EXTERNALSYM LANG_FRENCH}
  LANG_GERMAN                          = $07;
  {$EXTERNALSYM LANG_GERMAN}
  LANG_GREEK                           = $08;
  {$EXTERNALSYM LANG_GREEK}
  LANG_HEBREW                          = $0d;
  {$EXTERNALSYM LANG_HEBREW}
  LANG_HUNGARIAN                       = $0e;
  {$EXTERNALSYM LANG_HUNGARIAN}
  LANG_ICELANDIC                       = $0f;
  {$EXTERNALSYM LANG_ICELANDIC}
  LANG_INDONESIAN                      = $21;
  {$EXTERNALSYM LANG_INDONESIAN}
  LANG_ITALIAN                         = $10;
  {$EXTERNALSYM LANG_ITALIAN}
  LANG_JAPANESE                        = $11;
  {$EXTERNALSYM LANG_JAPANESE}
  LANG_KOREAN                          = $12;
  {$EXTERNALSYM LANG_KOREAN}
  LANG_LATVIAN                         = $26;
  {$EXTERNALSYM LANG_LATVIAN}
  LANG_LITHUANIAN                      = $27;
  {$EXTERNALSYM LANG_LITHUANIAN}
  LANG_NORWEGIAN                       = $14;
  {$EXTERNALSYM LANG_NORWEGIAN}
  LANG_POLISH                          = $15;
  {$EXTERNALSYM LANG_POLISH}
  LANG_PORTUGUESE                      = $16;
  {$EXTERNALSYM LANG_PORTUGUESE}
  LANG_ROMANIAN                        = $18;
  {$EXTERNALSYM LANG_ROMANIAN}
  LANG_RUSSIAN                         = $19;
  {$EXTERNALSYM LANG_RUSSIAN}
  LANG_SERBIAN                         = $1a;
  {$EXTERNALSYM LANG_SERBIAN}
  LANG_SLOVAK                          = $1b;
  {$EXTERNALSYM LANG_SLOVAK}
  LANG_SLOVENIAN                       = $24;
  {$EXTERNALSYM LANG_SLOVENIAN}
  LANG_SPANISH                         = $0a;
  {$EXTERNALSYM LANG_SPANISH}
  LANG_SWEDISH                         = $1d;
  {$EXTERNALSYM LANG_SWEDISH}
  LANG_TATAR                           = $44;

  LANG_THAI                            = $1e;
  {$EXTERNALSYM LANG_THAI}
  LANG_TURKISH                         = $1f;
  {$EXTERNALSYM LANG_TURKISH}
  LANG_UKRAINIAN                       = $22;
  {$EXTERNALSYM LANG_UKRAINIAN}
  LANG_VIETNAMESE                      = $2a;
  {$EXTERNALSYM LANG_VIETNAMESE}


{ Sublanguage IDs. }

  { The name immediately following SUBLANG_ dictates which primary
    language ID that sublanguage ID can be combined with to form a
    valid language ID. }

  SUBLANG_NEUTRAL                      = $00;    { language neutral }
  {$EXTERNALSYM SUBLANG_NEUTRAL}
  SUBLANG_DEFAULT                      = $01;    { user default }
  {$EXTERNALSYM SUBLANG_DEFAULT}
  SUBLANG_SYS_DEFAULT                  = $02;    { system default }
  {$EXTERNALSYM SUBLANG_SYS_DEFAULT}
  SUBLANG_CUSTOM_DEFAULT               = $03;    { default custom language/locale }
  {$EXTERNALSYM SUBLANG_CUSTOM_DEFAULT}
  SUBLANG_CUSTOM_UNSPECIFIED           = $04;    { custom language/locale }
  {$EXTERNALSYM SUBLANG_CUSTOM_UNSPECIFIED}
  SUBLANG_UI_CUSTOM_DEFAULT            = $05;    { Default custom MUI language/locale }
  {$EXTERNALSYM SUBLANG_UI_CUSTOM_DEFAULT}

  SUBLANG_ARABIC_SAUDI_ARABIA          = $01;    { Arabic (Saudi Arabia) }
  {$EXTERNALSYM SUBLANG_ARABIC_SAUDI_ARABIA}
  SUBLANG_ARABIC_IRAQ                  = $02;    { Arabic (Iraq) }
  {$EXTERNALSYM SUBLANG_ARABIC_IRAQ}
  SUBLANG_ARABIC_EGYPT                 = $03;    { Arabic (Egypt) }
  {$EXTERNALSYM SUBLANG_ARABIC_EGYPT}
  SUBLANG_ARABIC_LIBYA                 = $04;    { Arabic (Libya) }
  {$EXTERNALSYM SUBLANG_ARABIC_LIBYA}
  SUBLANG_ARABIC_ALGERIA               = $05;    { Arabic (Algeria) }
  {$EXTERNALSYM SUBLANG_ARABIC_ALGERIA}
  SUBLANG_ARABIC_MOROCCO               = $06;    { Arabic (Morocco) }
  {$EXTERNALSYM SUBLANG_ARABIC_MOROCCO}
  SUBLANG_ARABIC_TUNISIA               = $07;    { Arabic (Tunisia) }
  {$EXTERNALSYM SUBLANG_ARABIC_TUNISIA}
  SUBLANG_ARABIC_OMAN                  = $08;    { Arabic (Oman) }
  {$EXTERNALSYM SUBLANG_ARABIC_OMAN}
  SUBLANG_ARABIC_YEMEN                 = $09;    { Arabic (Yemen) }
  {$EXTERNALSYM SUBLANG_ARABIC_YEMEN}
  SUBLANG_ARABIC_SYRIA                 = $0a;    { Arabic (Syria) }
  {$EXTERNALSYM SUBLANG_ARABIC_SYRIA}
  SUBLANG_ARABIC_JORDAN                = $0b;    { Arabic (Jordan) }
  {$EXTERNALSYM SUBLANG_ARABIC_JORDAN}
  SUBLANG_ARABIC_LEBANON               = $0c;    { Arabic (Lebanon) }
  {$EXTERNALSYM SUBLANG_ARABIC_LEBANON}
  SUBLANG_ARABIC_KUWAIT                = $0d;    { Arabic (Kuwait) }
  {$EXTERNALSYM SUBLANG_ARABIC_KUWAIT}
  SUBLANG_ARABIC_UAE                   = $0e;    { Arabic (U.A.E) }
  {$EXTERNALSYM SUBLANG_ARABIC_UAE}
  SUBLANG_ARABIC_BAHRAIN               = $0f;    { Arabic (Bahrain) }
  {$EXTERNALSYM SUBLANG_ARABIC_BAHRAIN}
  SUBLANG_ARABIC_QATAR                 = $10;    { Arabic (Qatar) }
  {$EXTERNALSYM SUBLANG_ARABIC_QATAR}
  SUBLANG_CHINESE_TRADITIONAL          = $01;    { Chinese (Taiwan) }
  {$EXTERNALSYM SUBLANG_CHINESE_TRADITIONAL}
  SUBLANG_CHINESE_SIMPLIFIED           = $02;    { Chinese (PR China) }
  {$EXTERNALSYM SUBLANG_CHINESE_SIMPLIFIED}
  SUBLANG_CHINESE_HONGKONG             = $03;    { Chinese (Hong Kong) }
  {$EXTERNALSYM SUBLANG_CHINESE_HONGKONG}
  SUBLANG_CHINESE_SINGAPORE            = $04;    { Chinese (Singapore) }
  {$EXTERNALSYM SUBLANG_CHINESE_SINGAPORE}
  SUBLANG_DUTCH                        = $01;    { Dutch }
  {$EXTERNALSYM SUBLANG_DUTCH}
  SUBLANG_DUTCH_BELGIAN                = $02;    { Dutch (Belgian) }
  {$EXTERNALSYM SUBLANG_DUTCH_BELGIAN}
  SUBLANG_ENGLISH_US                   = $01;    { English (USA) }
  {$EXTERNALSYM SUBLANG_ENGLISH_US}
  SUBLANG_ENGLISH_UK                   = $02;    { English (UK) }
  {$EXTERNALSYM SUBLANG_ENGLISH_UK}
  SUBLANG_ENGLISH_AUS                  = $03;    { English (Australian) }
  {$EXTERNALSYM SUBLANG_ENGLISH_AUS}
  SUBLANG_ENGLISH_CAN                  = $04;    { English (Canadian) }
  {$EXTERNALSYM SUBLANG_ENGLISH_CAN}
  SUBLANG_ENGLISH_NZ                   = $05;    { English (New Zealand) }
  {$EXTERNALSYM SUBLANG_ENGLISH_NZ}
  SUBLANG_ENGLISH_EIRE                 = $06;    { English (Irish) }
  {$EXTERNALSYM SUBLANG_ENGLISH_EIRE}
  SUBLANG_ENGLISH_SOUTH_AFRICA         = $07;    { English (South Africa) }
  {$EXTERNALSYM SUBLANG_ENGLISH_SOUTH_AFRICA}
  SUBLANG_ENGLISH_JAMAICA              = $08;    { English (Jamaica) }
  {$EXTERNALSYM SUBLANG_ENGLISH_JAMAICA}
  SUBLANG_ENGLISH_CARIBBEAN            = $09;    { English (Caribbean) }
  {$EXTERNALSYM SUBLANG_ENGLISH_CARIBBEAN}
  SUBLANG_ENGLISH_BELIZE               = $0a;    { English (Belize) }
  {$EXTERNALSYM SUBLANG_ENGLISH_BELIZE}
  SUBLANG_ENGLISH_TRINIDAD             = $0b;    { English (Trinidad) }
  {$EXTERNALSYM SUBLANG_ENGLISH_TRINIDAD}
  SUBLANG_FRENCH                       = $01;    { French }
  {$EXTERNALSYM SUBLANG_FRENCH}
  SUBLANG_FRENCH_BELGIAN               = $02;    { French (Belgian) }
  {$EXTERNALSYM SUBLANG_FRENCH_BELGIAN}
  SUBLANG_FRENCH_CANADIAN              = $03;    { French (Canadian) }
  {$EXTERNALSYM SUBLANG_FRENCH_CANADIAN}
  SUBLANG_FRENCH_SWISS                 = $04;    { French (Swiss) }
  {$EXTERNALSYM SUBLANG_FRENCH_SWISS}
  SUBLANG_FRENCH_LUXEMBOURG            = $05;    { French (Luxembourg) }
  {$EXTERNALSYM SUBLANG_FRENCH_LUXEMBOURG}
  SUBLANG_GERMAN                       = $01;    { German }
  {$EXTERNALSYM SUBLANG_GERMAN}
  SUBLANG_GERMAN_SWISS                 = $02;    { German (Swiss) }
  {$EXTERNALSYM SUBLANG_GERMAN_SWISS}
  SUBLANG_GERMAN_AUSTRIAN              = $03;    { German (Austrian) }
  {$EXTERNALSYM SUBLANG_GERMAN_AUSTRIAN}
  SUBLANG_GERMAN_LUXEMBOURG            = $04;    { German (Luxembourg) }
  {$EXTERNALSYM SUBLANG_GERMAN_LUXEMBOURG}
  SUBLANG_GERMAN_LIECHTENSTEIN         = $05;    { German (Liechtenstein) }
  {$EXTERNALSYM SUBLANG_GERMAN_LIECHTENSTEIN}
  SUBLANG_ITALIAN                      = $01;    { Italian }
  {$EXTERNALSYM SUBLANG_ITALIAN}
  SUBLANG_ITALIAN_SWISS                = $02;    { Italian (Swiss) }
  {$EXTERNALSYM SUBLANG_ITALIAN_SWISS}
  SUBLANG_KOREAN                       = $01;    { Korean (Extended Wansung) }
  {$EXTERNALSYM SUBLANG_KOREAN}
  SUBLANG_KOREAN_JOHAB                 = $02;    { Korean (Johab) }
  {$EXTERNALSYM SUBLANG_KOREAN_JOHAB}
  SUBLANG_NORWEGIAN_BOKMAL             = $01;    { Norwegian (Bokmal) }
  {$EXTERNALSYM SUBLANG_NORWEGIAN_BOKMAL}
  SUBLANG_NORWEGIAN_NYNORSK            = $02;    { Norwegian (Nynorsk) }
  {$EXTERNALSYM SUBLANG_NORWEGIAN_NYNORSK}
  SUBLANG_PORTUGUESE                   = $02;    { Portuguese }
  {$EXTERNALSYM SUBLANG_PORTUGUESE}
  SUBLANG_PORTUGUESE_BRAZILIAN         = $01;    { Portuguese (Brazilian) }
  {$EXTERNALSYM SUBLANG_PORTUGUESE_BRAZILIAN}
  SUBLANG_RUSSIAN_RUSSIA               = $01;    { Russia (RU) }
  SUBLANG_TATAR_RUSSIA                 = $01;    {  }
  SUBLANG_SERBIAN_LATIN                = $02;    { Serbian (Latin) }
  {$EXTERNALSYM SUBLANG_SERBIAN_LATIN}
  SUBLANG_SERBIAN_CYRILLIC             = $03;    { Serbian (Cyrillic) }
  {$EXTERNALSYM SUBLANG_SERBIAN_CYRILLIC}
  SUBLANG_SPANISH                      = $01;    { Spanish (Castilian) }
  {$EXTERNALSYM SUBLANG_SPANISH}
  SUBLANG_SPANISH_MEXICAN              = $02;    { Spanish (Mexican) }
  {$EXTERNALSYM SUBLANG_SPANISH_MEXICAN}
  SUBLANG_SPANISH_MODERN               = $03;    { Spanish (Modern) }
  {$EXTERNALSYM SUBLANG_SPANISH_MODERN}
  SUBLANG_SPANISH_GUATEMALA            = $04;    { Spanish (Guatemala) }
  {$EXTERNALSYM SUBLANG_SPANISH_GUATEMALA}
  SUBLANG_SPANISH_COSTA_RICA           = $05;    { Spanish (Costa Rica) }
  {$EXTERNALSYM SUBLANG_SPANISH_COSTA_RICA}
  SUBLANG_SPANISH_PANAMA               = $06;    { Spanish (Panama) }
  {$EXTERNALSYM SUBLANG_SPANISH_PANAMA}
  SUBLANG_SPANISH_DOMINICAN_REPUBLIC     = $07;  { Spanish (Dominican Republic) }
  {$EXTERNALSYM SUBLANG_SPANISH_DOMINICAN_REPUBLIC}
  SUBLANG_SPANISH_VENEZUELA            = $08;    { Spanish (Venezuela) }
  {$EXTERNALSYM SUBLANG_SPANISH_VENEZUELA}
  SUBLANG_SPANISH_COLOMBIA             = $09;    { Spanish (Colombia) }
  {$EXTERNALSYM SUBLANG_SPANISH_COLOMBIA}
  SUBLANG_SPANISH_PERU                 = $0a;    { Spanish (Peru) }
  {$EXTERNALSYM SUBLANG_SPANISH_PERU}
  SUBLANG_SPANISH_ARGENTINA            = $0b;    { Spanish (Argentina) }
  {$EXTERNALSYM SUBLANG_SPANISH_ARGENTINA}
  SUBLANG_SPANISH_ECUADOR              = $0c;    { Spanish (Ecuador) }
  {$EXTERNALSYM SUBLANG_SPANISH_ECUADOR}
  SUBLANG_SPANISH_CHILE                = $0d;    { Spanish (Chile) }
  {$EXTERNALSYM SUBLANG_SPANISH_CHILE}
  SUBLANG_SPANISH_URUGUAY              = $0e;    { Spanish (Uruguay) }
  {$EXTERNALSYM SUBLANG_SPANISH_URUGUAY}
  SUBLANG_SPANISH_PARAGUAY             = $0f;    { Spanish (Paraguay) }
  {$EXTERNALSYM SUBLANG_SPANISH_PARAGUAY}
  SUBLANG_SPANISH_BOLIVIA              = $10;    { Spanish (Bolivia) }
  {$EXTERNALSYM SUBLANG_SPANISH_BOLIVIA}
  SUBLANG_SPANISH_EL_SALVADOR          = $11;    { Spanish (El Salvador) }
  {$EXTERNALSYM SUBLANG_SPANISH_EL_SALVADOR}
  SUBLANG_SPANISH_HONDURAS             = $12;    { Spanish (Honduras) }
  {$EXTERNALSYM SUBLANG_SPANISH_HONDURAS}
  SUBLANG_SPANISH_NICARAGUA            = $13;    { Spanish (Nicaragua) }
  {$EXTERNALSYM SUBLANG_SPANISH_NICARAGUA}
  SUBLANG_SPANISH_PUERTO_RICO          = $14;    { Spanish (Puerto Rico) }
  {$EXTERNALSYM SUBLANG_SPANISH_PUERTO_RICO}
  SUBLANG_SWEDISH                      = $01;    { Swedish }
  {$EXTERNALSYM SUBLANG_SWEDISH}
  SUBLANG_SWEDISH_FINLAND              = $02;    { Swedish (Finland) }
  {$EXTERNALSYM SUBLANG_SWEDISH_FINLAND}


(*
 *  A language ID is a 16 bit value which is the combination of a
 *  primary language ID and a secondary language ID.  The bits are
 *  allocated as follows:
 *
 *       +-----------------------+-------------------------+
 *       |     Sublanguage ID    |   Primary Language ID   |
 *       +-----------------------+-------------------------+
 *        15                   10 9                       0   bit
 *
 *  Language ID creation/extraction macros:
 *
 *    MAKELANGID    - construct language id from a primary language id and
 *                    a sublanguage id.
 *    PRIMARYLANGID - extract primary language id from a language id.
 *    SUBLANGID     - extract sublanguage id from a language id.
 *
 *)

function MakeLangID(p, s: WORD): WORD;
{$EXTERNALSYM MAKELANGID}
function PrimaryLangID(lgid: WORD): WORD;
{$EXTERNALSYM PRIMARYLANGID}
function SubLangID(lgid: WORD): WORD;
{$EXTERNALSYM SUBLANGID}

function l3CodePageFromLangID(aLangID: Word; aIsOEM: Boolean): Integer;
function l3ANSICodePage(aLangID: Word): Integer;
function l3OEMCodePage(aLangID: Word): Integer;

type
 TLanguageObj = class(Tl3ProtoObject)
 private
  f_AnsiCodePage: Integer;
  f_LanguageID: Integer;
  f_OEMCodePage: Integer;
  procedure pm_SetLanguageID(const aValue: Integer);
 public
  property AnsiCodePage: Integer read f_AnsiCodePage;
  property LanguageID: Integer read f_LanguageID write pm_SetLanguageID;
  property OEMCodePage: Integer read f_OEMCodePage;
 end;


implementation

uses l3Chars, SysUtils, Math;

// #define MAKELANGID(p, s)       ((((WORD  )(s)) << 10) | (WORD  )(p))
function MakeLangID(p, s: WORD): WORD;
begin
  Result := WORD(s shl 10) or p;
end;

// #define PRIMARYLANGID(lgid)    ((WORD  )(lgid) & 0x3ff)
function PrimaryLangID(lgid: WORD): WORD;
begin
  Result := WORD(lgid and $3FF);
end;

// #define SUBLANGID(lgid)        ((WORD  )(lgid) >> 10)
function SubLangID(lgid: WORD): WORD;
begin
  Result := lgid shr 10;
end;

function l3CodePageFromLangID(aLangID: Word; aIsOEM: Boolean): Integer;
var
 l_Lang, l_SubLang: Word;
begin
 Assert(aLangID > 0, 'function l3CodePageFromLangID: aLangID = 0');
 l_Lang := PrimaryLangID(aLangID);
 l_SubLang := SubLangID(aLangID);
 case l_Lang of
  LANG_RUSSIAN : Result := IfThen(aIsOEM, CP_OEMLite, CP_RussianWin);
  LANG_TATAR   : Result := IfThen(aIsOEM, CP_TatarOEM, CP_Tatar);
 else
  Assert(false, format('function l3CodePageFromLangID: Codepage not defined for LangID=',[aLangID]));
  //Result := CP_KeepExisting;
 end;
end;

function l3ANSICodePage(aLangID: Word): Integer;
begin
 Result:= l3CodePageFromLangID(aLangID, false);
end;

function l3OEMCodePage(aLangID: Word): Integer;
begin
 Result:= l3CodePageFromLangID(aLangID, true);
end;

procedure TLanguageObj.pm_SetLanguageID(const aValue: Integer);
begin
 f_LanguageID := IfThen(aValue <= 0, MakeLangID(LANG_RUSSIAN, SUBLANG_RUSSIAN_RUSSIA), aValue);
 f_AnsiCodePage:= l3AnsiCodePage(f_LanguageID);
 f_OEMCodePage:= l3OEMCodePage(f_LanguageID);
end;


(*


*)

end.


