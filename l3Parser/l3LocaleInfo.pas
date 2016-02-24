unit l3LocaleInfo;

// Библиотека : "L3 (Low Level Library)"
// Автор      : Морозов М.А.
// Начат      : 27.06.2005 14.30
// Модуль     : l3Listener.
// Версия     : $Id: l3LocaleInfo.pas,v 1.5 2014/02/13 10:53:59 lulin Exp $

// $Log: l3LocaleInfo.pas,v $
// Revision 1.5  2014/02/13 10:53:59  lulin
// - рефакторим безликие списки.
//
// Revision 1.4  2013/04/05 12:03:00  lulin
// - портируем.
//
// Revision 1.3  2007/02/12 18:06:19  lulin
// - переводим на строки с кодировкой.
//
// Revision 1.2  2006/12/04 08:15:46  mmorozov
// - rename: some Il3LocaleInfo properties;
//
// Revision 1.1  2006/12/01 15:21:43  mmorozov
// - new: информация о локали выделана в отдельный интерфейс;
//

interface

uses
  Windows,

  l3Interfaces,
  l3Base,
  l3ProtoObject
  ;

type
  Tl3BaseLocaleInfo = class(Tl3ProtoObject, Il3LocaleInfo)
  private
  // internal fields
    f_Name        : AnsiString;
    f_Language    : AnsiString;
    f_SubLanguage : AnsiString;
    f_Id          : LCID;
  protected
  // methods
    procedure DoParse(const aLocaleName  : AnsiString;
                        var aLanguage    : AnsiString;
                        var aSubLanguage : AnsiString);
      virtual;
      abstract;
      {-}
  protected
  // Il3LocaleInfo
    function pm_GetId: LCID;
      {* - идентификатор языка. }
    function pm_GetLanguage: AnsiString;
      {* - язык. }
    function pm_GetSubLanguage: AnsiString;
      {* - диалект. }
    function pm_GetName: AnsiString;
      reintroduce;
      {* - локаль. }
    procedure Parse(const aLocaleName  : AnsiString;
                    const aDefaultName : AnsiString);
      {* - строковое представление языка. }
  protected
  // properties
    property Language: AnsiString
      read f_Language
      write f_Language;
      {-}
    property SubLanguage: AnsiString
      read f_SubLanguage
      write f_SubLanguage;
      {-}
  public
  // methods
    constructor Create(const aLocaleName  : AnsiString;
                       const aDefaultName : AnsiString);
      reintroduce;
      {-}
    class function Make(const aLocaleName  : AnsiString;
                        const aDefaultName : AnsiString): Il3LocaleInfo;
      {-}
  end;//Tl3BaseLocaleInfo

  Tl3UnixLocaleInfo = class(Tl3BaseLocaleInfo)
  protected
  // methods
    procedure DoParse(const aLocaleName  : AnsiString;
                        var aLanguage    : AnsiString;
                        var aSubLanguage : AnsiString);
      override;
      {-}
  end;//Tl3UnixLocaleInfo

function l3MakeLocaleId(const aLanguage    : AnsiString;
                  const aSubLanguage : AnsiString): LCID;
  {-}

implementation

uses
  SysUtils
  ;

const
  c_fldLanguageId  = 0;
   // - windows language identifier;
  c_fldLanguage    = 1;
   // - language is a lowercase ISO 639 language code;
  c_fldScript      = 2;
   // - Script is an initial-uppercase ISO 15924 script code;
  c_fldSubLanguage = 3;
   // - SUBLANGUAGE specifies an uppercase ISO 3166-1 country/region identifier;
  c_fldDescription = 4;
   // - описания языка;

  c_Languages: array [0..111, 0..4] of AnsiString = (
   {* Таблица языков. Описание столбцов см. выше. Некоторые языки
      закомментированы, потому что поддерживаются не на всех платформах. Если
      вводить их использование, то нужна спецобработка. }
    ('$0436', 'af', '',     'ZA',        'Afrikaans (South Africa)'),
    ('$041c', 'sq', '',     'AL',        'Albanian (Albania)'),
  //('$0484', 'gsw','',     'FR',        'Windows Vista and later: Alsatian (France)'),
  //('$045e', 'am', '',     'ET',        'Windows Vista and later: Amharic (Ethiopia). Unicode only.'),
    ('$0401', 'ar', '',     'SA',        'Arabic (Saudi Arabia)'),
    ('$0801', 'ar', '',     'IQ',        'Arabic (Iraq)'),
    ('$0c01', 'ar', '',     'EG',        'Arabic (Egypt)'),
    ('$1001', 'ar', '',     'LY',        'Arabic (Libya)'),
    ('$1401', 'ar', '',     'DZ',        'Arabic (Algeria)'),
    ('$1801', 'ar', '',     'MA',        'Arabic (Morocco)'),
    ('$1c01', 'ar', '',     'TN',        'Arabic (Tunisia)'),
    ('$2001', 'ar', '',     'OM',        'Arabic (Oman)'),
    ('$2401', 'ar', '',     'YE',        'Arabic (Yemen)'),
    ('$2801', 'ar', '',     'SY',        'Arabic (Syria)'),
    ('$2c01', 'ar', '',     'JO',        'Arabic (Jordan)'),
    ('$3001', 'ar', '',     'LB',        'Arabic (Lebanon)'),
    ('$3401', 'ar', '',     'KW',        'Arabic (Kuwait)'),
    ('$3801', 'ar', '',     'AE',        'Arabic (U.A.E.)'),
    ('$3c01', 'ar', '',     'BH',        'Arabic (Bahrain)'),
    ('$4001', 'ar', '',     'QA',        'Arabic (Qatar)'),
  //('$042b', 'hy', '',     'AM',        'Windows 2000 and later: Armenian (Armenia). Unicode only.'),
  //('$044d', 'as', '',     'IN',        'Windows Vista and later: Assamese (India). Unicode only.'),
    ('$042c', 'az', 'Latn', 'AZ',        'Azeri (Latin)'),
    ('$082c', 'az', 'Cyrl', 'AZ',        'Azeri (Cyrillic)'),
  //('$046d', 'ba', '',     'RU',        'Windows Vista and later: Bashkir(Russia).'),
    ('$042d', 'eu', '',     'ES',        'Basque'),
    ('$0423', 'be', '',     'BY',        'Belarusian (Belarus)'),
  //('$0445', 'bn', '',     'IN',        'Windows XP SP2 and later: Bengali (India). Unicode only.'),
  //('$201a', 'bs', 'Cyrl', 'BA',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Bosnian (Bosnia and Herzegovina, Cyrillic)'),
  //('$141a', 'bs', 'Latn', 'BA',        'Windows XP SP2 and later: Bosnian (Bosnia and Herzegovina, Latin)'),
    ('$047e', 'br', '',     'FR',        'Breton (France)'),
    ('$0402', 'bg', '',     'BG',        'Bulgarian (Bulgaria)'),
    ('$0403', 'ca', '',     'ES',        'Catalan'),
    ('$0004', 'zh', '',     'Hans',      'Chinese (Simplified)'),
    ('$0404', 'zh', '',     'TW',        'Chinese (Taiwan)'),
    ('$0804', 'zh', '',     'CN',        'Chinese (PRC)'),
    ('$0c04', 'zh', '',     'HK',        'Chinese (Hong Kong SAR, PRC)'),
    ('$1004', 'zh', '',     'SG',        'Chinese (Singapore)'),
  //('$1404', 'zh', '',     'MO',        'Windows 98/Me, Windows XP and later: Chinese (Macao SAR)'),
    ('$7c04', 'zh', '',     'Hant',      'Chinese (Traditional)'),
  //('$0483', 'co', '',     'FR',        'Windows Vista and later: Corsican (France).'),
    ('$041a', 'hr', '',     'HR',        'Croatian (Croatia)'),
  //('$101a', 'hr', '',     'BA',        'Windows XP SP2 and later: Croatian (Bosnia and Herzegovina, Latin)'),
    ('$0405', 'cs', '',     'CZ',        'Czech (Czech Republic)'),
    ('$0406', 'da', '',     'DK',        'Danish (Denmark)'),
  //('$048c', 'gbz','',     'AF',        'Windows XP and later: Dari (Afghanistan).'),
  //('$0465', 'div','',     'MV',        'Windows XP and later: Divehi (Maldives). Unicode only.'),
    ('$0413', 'nl', '',     'NL',        'Dutch (Netherlands)'),
    ('$0813', 'nl', '',     'BE',        'Dutch (Belgium)'),
    ('$0409', 'en', '',     'US',        'English (United States)'),
    ('$0809', 'en', '',     'GB',        'English (United Kingdom)'),
    ('$0c09', 'en', '',     'AU',        'English (Australia)'),
    ('$1009', 'en', '',     'CA',        'English (Canada)'),
    ('$1409', 'en', '',     'NZ',        'English (New Zealand)'),
    ('$1809', 'en', '',     'IE',        'English (Ireland)'),
    ('$1c09', 'en', '',     'ZA',        'English (South Africa)'),
    ('$2009', 'en', '',     'JA',        'English (Jamaica)'),
    ('$2409', 'en', '',     '029',       'English (Caribbean)'),
    ('$2809', 'en', '',     'BZ',        'English (Belize)'),
    ('$2c09', 'en', '',     'TT',        'English (Trinidad)'),
  //('$3009', 'en', '',     'ZW',        'Windows 98/Me, Windows 2000 and later: English (Zimbabwe)'),
  //('$3409', 'en', '',     'PH',        'Windows 98/Me, Windows 2000 and later: English (Philippines)'),
  //('$4009', 'en', '',     'IN',        'Windows Vista and later: English (India)'),
  //('$4409', 'en', '',     'MY',        'Windows Vista and later: English (Malaysia)'),
  //('$4809', 'en', '',     'SG',        'Windows Vista and later: English (Singapore)'),
    ('$0425', 'et', '',     'EE',        'Estonian (Estonia)'),
    ('$0438', 'fo', '',     'FO',        'Faeroese (Faero Islands)'),
  //('$464', 'fil', '',     'PH',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Filipino (Philippines)'),
    ('$040b', 'fi', '',     'FI',        'Finnish'),
    ('$040c', 'fr', '',     'FR',        'French (France)'),
    ('$080c', 'fr', '',     'BE',        'French (Belgium)'),
    ('$0c0c', 'fr', '',     'CA',        'French (Canada)'),
    ('$100c', 'fr', '',     'CH',        'French (Switzerland)'),
    ('$140c', 'fr', '',     'LU',        'French (Luxembourg)'),
    ('$180c', 'fr', '',     'MC',        'French (Monaco)'),
  //('$0462', 'fy', '',     'NL',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Frisian (Netherlands)'),
  //('$0456', 'gl', '',     'ES',        'Windows XP and later: Galician'),
  //('$0437', 'ka', '',     'GE',        'Windows 2000 and later: Georgian. Unicode only.'),
    ('$0407', 'de', '',     'DE',        'German (Germany)'),
    ('$0807', 'de', '',     'CH',        'German (Switzerland)'),
    ('$0c07', 'de', '',     'AT',        'German (Austria)'),
    ('$1007', 'de', '',     'LU',        'German (Luxembourg)'),
    ('$1407', 'de', '',     'LI',        'German (Liechtenstein)'),
    ('$0408', 'el', '',     'GR',        'Greek'),
  //('$046f', 'kl', '',     'GL',        'Windows Vista and later: Greenlandic (Greenland)'),
  //('$0447', 'gu', '',     'IN',        'Windows XP and later: Gujarati. This is Unicode only.'),
  //('$0468', 'ha', 'Latn', 'NG',        'Windows Vista and later: Hausa (Nigeria)'),
    ('$040d', 'he', '',     'IL',        'Hebrew (Israel)'),
  //('$0439', 'hi', '',     'IN',        'Windows 2000 and later: Hindi (India). Unicode only.'),
    ('$040e', 'hu', '',     'HU',        'Hungarian (Hungary)'),
    ('$040f', 'is', '',     'IS',        'Icelandic (Iceland)'),
    ('$0421', 'id', '',     'ID',        'Indonesian'),
  //('$045d', 'iu', 'Cans', 'CA',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Inuktitut (Canada, Syllabics). Unicode only.'),
  //('$085d', 'iu', 'Latn', 'CA',        'Windows XP and later: Inuktitut (Canada, Latin).'),
  //('$083c', 'ga', '',     'IE',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Irish (Ireland).'),
  //('$0434', 'xh', '',     'ZA',        'Windows XP SP2 and later: isiXhosa/Xhosa (South Africa)'),
  //('$0435', 'zu', '',     'ZA',        'Windows XP SP2 and later: isiZulu/Zulu (South Africa)'),
    ('$0410', 'it', '',     'IT',        'Italian (Italy)'),
    ('$0810', 'it', '',     'CH',        'Italian (Switzerland)'),
    ('$0411', 'ja', '',     'JP',        'Japanese (Japan)'),
  //('$044b', 'kn', '',     'IN',        'Windows XP and later: Kannada. Unicode only.'),
  //('$043f', 'kk', '',     'KZ',        'Windows 2000 and later: Kazakh (Kazakhstan)'),
  //('$0453', 'kh', '',     'KH',        'Windows Vista and later: Khmer (Cambodia). Unicode only.'),
  //('$0486', 'qut','',     'GT',        'Windows Vista and later: K-iche (Guatemala).'),
  //('$0487', 'rw', '',     'RW',        'Windows Vista and later: Kinyarwanda (Rwanda).'),
  //('$0457', 'kok','',     'IN',        'Windows 2000 and later: Konkani. Unicode only.'),
    ('$0412', 'ko', '',     'KR',        'Korean (Korea)'),
  //('$0440', 'ky', '',     'KG',        'Windows XP and later: Kyrgyz (Kyrgyzstan)'),
  //('$0454', 'lo', '',     'LA',        'Windows Vista and later: Lao (Lao P.D.R.)'),
    ('$0426', 'lv', '',     'LV',        'Latvian (Latvia)'),
    ('$0427', 'lt', '',     'LT',        'Lithuanian (Lithuania)'),
  //('$082e', 'wee','',     'DE',        'Windows Vista and later: Lower Sorbian (Germany)'),
  //('$046e', 'lb', '',     'LU',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Luxembourgish (Luxembourg)'),
  //('$042f', 'mk', '',     'MK',        'Windows 2000 and later: Macedonian (FYROM)'),
  //('$043e', 'ms', '',     'MY',        'Windows 2000 and later: Malay (Malaysia)'),
  //('$083e', 'ms', '',     'BN',        'Windows 2000 and later: Malay (Brunei Darussalam)'),
  //('$044c', 'ml', '',     'IN',        'Windows XP SP2 and later: Malayalam (India). Unicode only.'),
  //('$043a', 'mt', '',     'MT',        'Windows XP SP2 and later: Maltese (Malta).'),
  //('$0481', 'mi', '',     'NZ',        'Windows XP SP2 and later: Maori (New Zealand)'),
  //('$047a', 'arn','',     'CL',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Mapudungun (Chile)'),
  //('$044e', 'mr', '',     'IN',        'Windows 2000 and later: Marathi (India). Unicode only.'),
  //('$047c', 'moh','',     'CA',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Mohawk (Canada)'),
  //('$0450', 'mn', '',     'MN',        'Windows XP and later: Mongolian (Mongolia)'),
  //('$0850', 'mn', '',     'CN',        'Windows Vista and later: Mongolian (PRC)'),
  //('$0461', 'ne', '',     'NP',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Nepali (Nepal). Unicode only'),
    ('$0414', 'nb', '',     'NO',        'Norwegian (Bokmal)'),
    ('$0814', 'nn', '',     'NO',        'Norwegian (Nynorsk)'),
    ('$0482', 'oc', '',     'FR',        'Occitan (France)'),
    ('$0448', 'or', '',     'IN',        'Oriya (India)'),
  //('$0463', 'ps', '',     'AF',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Pashto (Afghanistan)'),
    ('$0429', 'fa', '',     'IR',        'Persian (Iran)'),
    ('$0415', 'pl', '',     'PL',        'Polish (Poland)'),
    ('$0416', 'pt', '',     'BR',        'Portuguese (Brazil)'),
    ('$0816', 'pt', '',     'PT',        'Portuguese (Portugal)'),
  //('$0446', 'pa', '',     'IN',        'Windows XP and later: Punjabi (India). Unicode only.'),
  //('$046b', 'quz','',     'BO',        'Windows XP SP2 and later: Quechua (Bolivia)'),
  //('$086b', 'quz','',     'EC',        'Windows XP SP2 and later: Quechua (Ecuador)'),
  //('$0c6b', 'quz','',     'PE',        'Windows XP SP2 and later: Quechua (Peru)'),
    ('$0418', 'ro', '',     'RO',        'Romanian (Romania)'),
  //('$0417', 'rm', '',     'CH',        'Windows XP SP2 and later (downloadable); Windows Vista and later: Romansh'),
    ('$0419', 'ru', '',     'RU',        'Russian (Russia)'),
  //('$243b', 'smn','',     'FI',        'Windows XP SP2 and later: Sami (Inari, Finland)'),
  //('$103b', 'smj','',     'NO',        'Windows XP SP2 and later: Sami (Lule, Norway)'),
  //('$143b', 'smj','',     'SE',        'Windows XP SP2 and later: Sami (Lule, Sweden)'),
  //('$043b', 'se', '',     'NO',        'Windows XP SP2 and later: Sami (Northern, Norway)'),
  //('$083b', 'se', '',     'SE',        'Windows XP SP2 and later: Sami (Northern, Sweden)'),
  //('$0c3b', 'se', '',     'FI',        'Windows XP SP2 and later: Sami (Northern, Finland)'),
  //('$203b', 'sms','',     'FI',        'Windows XP SP2 and later: Sami (Skolt, Finland)'),
  //('$183b', 'sma','',     'NO',        'Windows XP SP2 and later: Sami (Southern, Norway)'),
  //('$1c3b', 'sma','',     'SE',        'Windows XP SP2 and later: Sami (Southern, Sweden)'),
  //('$044f', 'sa', '',     'IN',        'Windows 2000 and later: Sanskrit (india). Unicode only.'),
    ('$0c1a', 'sr', 'Cyrl', 'SP',        'Serbian (Serbia and Montenegro, Cyrillic)'),
  //('$1c1a', 'sr', 'Cyrl', 'BA',        'Windows XP SP2 and later: Serbian (Bosnia, and Herzegovina, Cyrillic)'),
    ('$081a', 'sr', 'Latn', 'SP',        'Serbian (Serbia and Montenegro, Latin)'),
  //('$181a', 'sr', 'Latn', 'BA ',       'Windows XP SP2 and later: Serbian (Bosnia, and Herzegovina, Latin)'),
  //('$046c', 'ns', '',     'ZA',        'Windows XP SP2 and later: Sesotho sa Leboa/Northern Sotho (South Africa)'),
  //('$0432', 'tn', '',     'ZA',        'Windows XP SP2 and later: Setswana/Tswana (South Africa)'),
  //('$045b', 'si', '',     'LK',        'Windows Vista and later: Sinhala (Sri Lanka). Unicode only.'),
    ('$041b', 'sk', '',     'SK',        'Slovak (Slovakia)'),
    ('$0424', 'sl', '',     'SI',        'Slovenian (Slovenia)'),
    ('$040a', 'es', '',     'ES_tradnl', 'Spanish (Spain, Traditional Sort)'),
    ('$080a', 'es', '',     'MX',        'Spanish (Mexico)'),
    ('$0c0a', 'es', '',     'ES_tradnl', 'Spanish (Spain, Modern Sort)'),
    ('$100a', 'es', '',     'GT',        'Spanish (Guatemala)'),
    ('$140a', 'es', '',     'CR',        'Spanish (Costa Rica)'),
    ('$180a', 'es', '',     'PA',        'Spanish (Panama)'),
    ('$1c0a', 'es', '',     'DO',        'Spanish (Dominican Republic)'),
    ('$200a', 'es', '',     'VE',        'Spanish (Venezuela)'),
    ('$240a', 'es', '',     'CO',        'Spanish (Colombia)'),
    ('$280a', 'es', '',     'PE',        'Spanish (Peru)'),
    ('$2c0a', 'es', '',     'AR',        'Spanish (Argentina)'),
    ('$300a', 'es', '',     'EC',        'Spanish (Ecuador)'),
    ('$340a', 'es', '',     'CL',        'Spanish (Chile)'),
    ('$380a', 'es', '',     'UR',        'Spanish (Uruguay)'),
    ('$3c0a', 'es', '',     'PY',        'Spanish (Paraguay)'),
    ('$400a', 'es', '',     'BO',        'Spanish (Bolivia)'),
    ('$440a', 'es', '',     'SV',        'Spanish (El Salvador)'),
    ('$480a', 'es', '',     'HN',        'Spanish (Honduras)'),
    ('$4c0a', 'es', '',     'NI',        'Spanish (Nicaragua)'),
    ('$500a', 'es', '',     'PR',        'Spanish (Puerto Rico)'),
  //('$540a', 'es', '',     'US',        'Windows Vista and later: Spanish (United States)'),
  //('$0441', 'sw', '',     'KE',        'Windows 2000 and later: Swahili (Kenya)'),
    ('$041d', 'sv', '',     'SE',        'Swedish (Sweden)'),
    ('$081d', 'sv', '',     'FI',        'Swedish (Finland)'),
  //('$045a', 'syr','',     'SY',        'Windows XP and later: Syriac (Syria). Unicode only.'),
  //('$0428', 'tg', 'Cyrl', 'TJ',        'Windows Vista and later: Tajik (Tajikistan)'),
  //('$085f', 'tmz','',     'DZ',        'Windows Vista and later: Tamazight (Algeria, Latin)'),
  //('$0449', 'ta', '',     'IN',        'Windows 2000 and later: Tamil. This is Unicode only.'),
  //('$0444', 'tt', '',     'RU',        'Windows XP and later: Tatar (Russia)'),
  //('$044a', 'te', '',     'IN',        'Windows XP and later: Telugu (India). Unicode only.'),
    ('$041e', 'th', '',     'TH',        'Thai (Thailand)'),
  //('$0451', 'bo', '',     'CN',        'Windows Vista and later: Tibetan (PRC)'),
  //('$0851', 'bo', '',     'BT',        'Windows Vista and later: Tibetan (Bhutan)'),
    ('$041f', 'tr', '',     'TR',        'Turkish (Turkey)'),
  //('$0442', 'tk', '',     'TM',        'Windows Vista and later: Turkmen (Turkmenistan)'),
  //('$0480', 'ug', '',     'CN',        'Windows Vista and later: Uighur (PRC)'),
    ('$0422', 'uk', '',     'UA',        'Ukrainian (Ukraine)'),
  //('$042e', 'wen','',     'DE',        'Windows Vista and later: Upper Sorbian (Germany)'),
  //('$0420', 'ur', '',     'PK',        'Windows 98/Me, Windows 2000 and later: Urdu (Pakistan)'),
    ('$0820', 'tr', '',     'IN',        'Urdu (India)')
  //('$0443', 'uz', 'Latn', 'UZ',        'Windows 2000 and later: Uzbek (Uzbekistan, Latin)'),
  //('$0843', 'uz', 'Cyrl', 'UZ',        'Windows 2000 and later: Uzbek (Uzbekistan, Cyrillic)'),
  //('$042a', 'vi', '',     'VN',        'Windows 98/Me, Windows NT 4.0 and later: Vietnamese'),
  //('$0452', 'cy', '',     'GB',        'Windows XP SP2 and later: Welsh (United Kingdom)'),
  //('$0488', 'wo', '',     'SN',        'Windows Vista and later: Wolof (Senegal)'),
  //('$0485', 'sah','',     'RU',        'Windows Vista and later: Yakut (Russia)'),
  //('$0478', 'ii', '',     'CN',        'Windows Vista and later: Yi (PRC)'),
  //('$046a', 'yo', '',     'NG',        'Windows Vista and later: Yoruba (Nigeria')
  );//c_Languages

function l3MakeLocaleId(const aLanguage    : AnsiString;
                        const aSubLanguage : AnsiString): LCID;
  {-}
var
 l_Index: Integer;
begin
 Result := LANG_NEUTRAL;
 if aLanguage <> '' then
  for l_Index := Low(c_Languages) to High(c_Languages) do
   if (c_Languages[l_Index, c_fldLanguage] = aLanguage) and
    ((aSubLanguage = '') or (c_Languages[l_Index, c_fldSubLanguage] = aSubLanguage)) then
   begin
    Result := (SORT_DEFAULT shl 16) or
     StrToInt(c_Languages[l_Index, c_fldLanguageId]);
    Break;
   end;
end;

{ Tl3BaseLocaleInfo }

constructor Tl3BaseLocaleInfo.Create(const aLocaleName  : AnsiString;
                                     const aDefaultName : AnsiString);
begin
 inherited Create;
 Parse(aLocaleName, aDefaultName);
end;

class function Tl3BaseLocaleInfo.Make(const aLocaleName  : AnsiString;
                                      const aDefaultName : AnsiString): Il3LocaleInfo;
var
 l_Class: Tl3BaseLocaleInfo;
begin
 l_Class := Create(aLocaleName, aDefaultName);
 try
  Result := l_Class;
 finally
  FreeAndNil(l_Class);
 end;
end;

procedure Tl3BaseLocaleInfo.Parse(const aLocaleName  : AnsiString;
                                  const aDefaultName : AnsiString);

 procedure lp_Process(const aLocaleName: AnsiString);
 begin
  DoParse(aLocaleName, f_Language, f_SubLanguage);
  // Локаль успешно распарсилась:
  if f_Language <> '' then
   f_Id := l3MakeLocaleId(f_Language, f_SubLanguage);
 end;

begin
 f_Id := LANG_NEUTRAL;
 // Читаем локаль:
 lp_Process(aLocaleName);
 // Формат локали не действителен, используем по умолчанию:
 if f_Id = LANG_NEUTRAL then
 begin
  lp_Process(aDefaultName);
  f_Name := aDefaultName;
 end
 else
  f_Name := aLocaleName;
 // Локаль не определена:
 Assert(f_Id <> LANG_NEUTRAL);
end;

function Tl3BaseLocaleInfo.pm_GetLanguage: AnsiString;
  {* - язык. }
begin
 Result := f_Language;
end;

function Tl3BaseLocaleInfo.pm_GetId: LCID;
  {* - идентификатор языка. }
begin
 Result := f_Id;
end;

function Tl3BaseLocaleInfo.pm_GetName: AnsiString;
  {* - локаль. }
begin
 Result := f_Name;
end;

function Tl3BaseLocaleInfo.pm_GetSubLanguage: AnsiString;
  {* - диалект. }
begin
 Result := f_SubLanguage;
end;

{ Tl3UnixLocaleInfo }

procedure Tl3UnixLocaleInfo.DoParse(const aLocaleName  : AnsiString;
                                      var aLanguage    : AnsiString;
                                      var aSubLanguage : AnsiString);
  {-}
const
 c_SubLanguageSeparate = '_';
 c_CodePageSeparate    = '.';

type
 TState = (sLanguage, sSubLanguage, sNone);

var
 l_State  : TState;
 l_Index  : Integer;
 l_Marker : Integer;

 function lp_CutValue: AnsiString;
 begin
  Result := Copy(aLocaleName, l_Marker, l_Index - l_Marker);
 end;

 function lp_CutLanguage: AnsiString;
 begin
  Result := AnsiLowerCase(lp_CutValue);
 end;

 function lp_CutSubLanguage: AnsiString;
 begin
  Result := AnsiUpperCase(lp_CutValue);
 end;

begin
 aLanguage := '';
 aSubLanguage := '';
 l_State := sNone;
 l_Marker := 1;
 l_Index := 1;
 while l_Index <= Length(aLocaleName) do
 begin
  if l_State = sNone then
   l_State := sLanguage;
  case l_State of
   sLanguage:
    if aLocaleName[l_Index] in [c_SubLanguageSeparate, c_CodePageSeparate] then
    begin
     aLanguage := lp_CutLanguage;
     if aLocaleName[l_Index] = c_CodePageSeparate then
      Exit;
     l_Marker := Succ(l_Index);
     l_State := sSubLanguage;
    end;
   sSubLanguage:
    if aLocaleName[l_Index] = c_CodePageSeparate then
    begin
     aSubLanguage := lp_CutSubLanguage;
     l_State := sNone;
     Break;
    end;
  end;
  Inc(l_Index);
 end;
 case l_State of
  sLanguage:
   aLanguage := lp_CutLanguage;
  sSubLanguage:
   aSubLanguage := lp_CutSubLanguage;
 end;
end;

end.