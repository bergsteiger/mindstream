unit m0LNGLib;
{* Модуль интерфейса к лингвистическим библиотекам. }

(*
// module:  m0lnglib.pas
// author:  Mickael P. Golovin
//
// $Id: m0lnglib.pas,v 1.1 2014/08/20 16:31:25 lulin Exp $
*)

 // $Log: m0lnglib.pas,v $
 // Revision 1.1  2014/08/20 16:31:25  lulin
 // - вычищаем мусор.
 //
 // Revision 1.15  2014/08/20 15:00:41  lulin
 // - вычищаем мусор.
 //
 // Revision 1.14  2013/07/08 16:43:16  lulin
 // - выделяем работу с размером куска памяти.
 //
 // Revision 1.13  2013/04/12 16:25:07  lulin
 // - отлаживаем под XE3.
 //
 // Revision 1.12  2013/04/05 12:03:18  lulin
 // - портируем.
 //
 // Revision 1.11  2012/11/01 09:43:03  lulin
 // - забыл точку с запятой.
 //
 // Revision 1.10  2012/11/01 07:45:17  lulin
 // - делаем возможность логирования процесса загрузки модулей.
 //
 // Revision 1.9  2012/03/07 12:53:19  narry
 // Отвязываем окончания от базы
 //
 // Revision 1.8  2012/03/06 10:51:01  fireton
 // - загружаем список окончаний из защищённого zip-файла
 //
 // Revision 1.7  2012/03/02 09:30:42  voba
 // -k:310676394
 //
 // Revision 1.6  2009/10/19 11:04:24  voba
 // - избавляемся от старой библиотеки регулярных выражений
 //
 // Revision 1.5  2009/04/28 06:46:53  voba
 // - замена лингвистического модуля на  l3LingLib
 // - отпилил поддержку лингвистики от Agama и Informatic
 //
 // Revision 1.4  2008/05/05 08:14:23  lulin
 // "Вован, что-то наменял" (C).
 //
 // Revision 1.3  2008/05/04 14:51:39  lulin
 // - bug fix: не компилировалось после Вована.
 //
 // Revision 1.2  2008/05/04 12:03:06  voba
 // - переделал m0REXDat
 //
 // Revision 1.1  2008/02/07 09:54:24  lulin
 // - библиотека m0 переехала внутрь библиотеки L3.
 //
 // Revision 1.36  2007/08/15 14:26:48  lulin
 // - не подключался нужный модуль.
 //
 // Revision 1.35  2007/08/14 14:30:15  lulin
 // - оптимизируем перемещение блоков памяти.
 //
 // Revision 1.34  2007/05/10 08:00:16  fireton
 // - константа для пометки неиспользованных форм
 //
 // Revision 1.33  2006/05/04 11:01:29  lulin
 // - поправлен тип длины строки.
 // - вычищены "старые" методы работы с памятью и строками.
 //
 // Revision 1.32  2005/05/24 11:07:40  lulin
 // - cleanup.
 //
 // Revision 1.31  2005/05/17 09:56:11  lulin
 // - "залечил" неосвобожненные объекты.
 //
 // Revision 1.30  2005/03/02 15:58:50  lulin
 // - new behavior: выключен вывод в лог сообщений об обрезании длинных слов.
 //
 // Revision 1.29  2005/03/02 15:38:07  lulin
 // - cleanup.
 //
 // Revision 1.28  2004/09/16 09:25:19  lulin
 // - bug fix: наследники от evCtrl убивались в DesignTime произвольным образом.
 //
 // Revision 1.27  2003/11/26 15:26:00  fireton
 // update: исходники частично отформатированы
 //
 // Revision 1.26  2002/10/30 13:43:37  law
 // - new behavior: проверка орфографии с учетом сокращений с точкой.
 //
 // Revision 1.25  2002/10/14 07:47:30  migel
 // MEDIALINGUA synchronization bugfix
 //
 // Revision 1.23  2002/09/11 15:43:04  law
 // - change: адаптация к Delphi 7.0.
 //
 // Revision 1.22  2002/09/03 09:02:16  law
 // - new behavior: один раз кладем НЕ.
 //
 // Revision 1.21  2002/09/03 08:49:29  law
 // - change: изменен формат вызова callback процедуры.
 //
 // Revision 1.20  2002/09/03 08:22:17  law
 // - new behavior: нормализация с отбрасыванием частицы НЕ.
 //
 // Revision 1.19  2002/04/24 14:56:51  law
 // - cleanup.
 //
 // Revision 1.18  2002/04/16 15:04:35  law
 // - new flag: Cm0LNGLibCheckDashes.
 //
 // Revision 1.17  2002/04/15 14:27:48  law
 // - new flag: Cm0LNGLibCheckSpaces.
 //
 // Revision 1.16  2002/04/15 12:20:01  law
 // - new const: Cm0LNGLibStatusToo_Long.
 //
 // Revision 1.15  2002/03/26 08:52:04  law
 // - bug fix: из-за resourcestring попадали не все окончания.
 //
 // Revision 1.14  2002/03/25 15:52:06  law
 // - cleanup.
 //
 // Revision 1.13  2002/03/25 14:39:24  law
 // - cleanup: избавляемся от ненужных регулярных выражений.
 //
 // Revision 1.12  2002/03/22 14:53:21  law
 // - cleanup: избавляемся от ненужных регулярных выражений.
 //
 // Revision 1.11  2002/03/22 13:34:41  law
 // - bug fix: избавляемся от регулярных выражений.
 //
 // Revision 1.10  2002/02/08 14:09:34  law
 // - remove unit: m0xltlib.
 //
 // Revision 1.9  2001/12/20 14:21:59  law
 // - comments: xHelpGen.
 //

{$Include m0Define.inc}

interface

uses
  Windows,
  Messages,
  SysUtils,
  Consts,
  Classes,

  l3Types,
  m0Const,
  //m0AddTyp,
  //m0EXTInf,
  l3LingLib,
  m0S32Lib,
  m0STRLib,
  m2XLTLib,
  m3EndingReplaceList
  //,
  //m0REXLib,
  //m0REXDat
  ;

const
  Cm0LNGLibStatusORIG_FORM = $00000001;
  Cm0LNGLibStatusALTV_FORM = $00000002;
  Cm0LNGLibStatusDATE_FORM = $00000004;
  Cm0LNGLibStatusNUMB_FORM = $00000008;
  Cm0LNGLibStatusUSED_FORM = $00000010;
  Cm0LNGLibStatusNEXT_FORM = $00000020;
  Cm0LNGLibStatusSTOP_FORM = $00000040;
  Cm0LNGLibStatusNORM_FORM = $00000080;
  Cm0LNGLibStatusPNRM_FORM = $00000100;
  Cm0LNGLibStatusToo_Long  = $00000200;
  Cm0LNGLibStatusFORSCRCH  = $00000400;
  Cm0LNGLibStatusINIT_FORM = Cm0LNGLibStatusORIG_FORM;

  Cm0LNGLibFlagORIG_FORM = $00000000;
  Cm0LNGLibFlagNORM_FORM = $00000001;
   {* - возвращать нормальные формы? }
  Cm0LNGLibFlagALTV_FORM = $00000002;
   {* - создавать альтернативы? }
  Cm0LNGLibFlagUSET_FORM = $00000004;
   {* - поднимать регистр? }
  Cm0LNGLibFlagDMYN_FORM = $00000008;
   {* - разбирать даты в парсере?  }
  Cm0LNGLibFlagUPNF_FORM = $00000010;
   {* - псевдонормализация. }
  Cm0LNGLibCheckSpaces   = $00000020;
   {* - проверять пробелы после получения альтернатив. }
  Cm0LNGLibCheckDashes   = $00000040;
   {* - проверять дефисные конструкции? }

type
  Tm0LNGLibCharsBuff = packed array [0..064] of AnsiChar;

  Tm0LNGLibCharsInfo = (
   Cm0LNGLibUnknown,
   Cm0LNGLibEnglish,
   Cm0LNGLibRussian
  );

  Tm0LNGLibCallBackProc = procedure(AStatus : LongInt;
                                    ABuff   : PAnsiChar;
                                    ASize   : Cardinal) of object;
    {-}

procedure m0LNGNormalBuff(AStatus: LongInt; AFlags: LongInt; ABuff: PAnsiChar;
  ASize: Cardinal; AOemCp: LongBool; AProc: Tm0LNGLibCallBackProc;
  aWithDot: Bool = False; aTemp: PPointer = nil);
  {-}

procedure m0ExplicitEndingsListLoad;
  {- загружаем список окончаний принудительно}

type
 Tm0EndingReplaceListInitProc = procedure(aERList: Tm3EndingReplaceList);

const
 g_InitEndingListProc : Tm0EndingReplaceListInitProc = nil;

implementation

uses
  StrUtils,

  l3Chars,
  l3String,
  l3Base,
  l3MemorySizeUtils,
  l3Memory,
  l3ExceptionsLog,
  l3Stream,
  l3Interfaces,
  l3EndingList,
  l3MinMax
  ;

var
  _g_EnglishEndings: Tl3EndingList = nil;
  _g_RussianEndings: Tl3EndingList = nil;

  gEndingReplace : Tm3EndingReplaceList = nil;

const
  c_EnglishEndings = 'ability|able|ably|acy|age|aged|al|ally|an|ance|ancy|ant' +
    '|antly|ary|ate|ated|ately|ating|ation|ative|atively|' +
    'ator|ed|ely|ement|ence|ency|eness|ent|eous|eously|' +
    'eousness|er|es|ess|ful|fully|ing|ion|ional|ish|ism|' +
    'ist|ive|ively|less|ly|ment|mental|ness|or|ous|ously|' + 'ousness';
  c_RussianEndings = 'а|ав|авал|авала|авая|аев|аем|аема|аемой|ает|ал|ала|али|' +
    'ало|ам|ами|ан|ана|ание|аний|анин|ано|аном|ась|ат|атся|' +
    'ать|ах|ашей|ащая|аще|ащим|ащих|ают' +
    '|аяся|бой|бу|в|вал|вала|ват|ватой|ватом|вка|вке|вки|' +
    'вкой|вое|вок|вшая|вшей|вшейся|вшем|вшему|вши|вшим|' +
    'вших|вшую|вым|гли|дшей' +
    '|дши|е|еала|ев|евал|евала|евая|евой|его|егося|ее|еев|' +
    'ееся|ей|ел|ели|ело|ем|емая|емо|емой|емом|емся|емуся|' +
    'емы|ен|ена|енем|ение|ений|енно|ено|еной|еном|ены|' +
    'ести|ете|ется|еть|ец|ешь|ещей|ею|' + 'енный|енного' +
    'еюся|жий|зли|зм|зма|зме|змом|зму|зти|и|иала|ив|ивал' +
    '|ивала|ивая|ие|иев|ией|ием|иеся|ии|ий|ийся|ил|ила|или' +
    '|илий|ило|им|има|имая|ими|имо|имой|имы|ина|иная|ино|' +
    'иной|ином|ирую|ируя|истой|ись|ит|ите|ится|ить|их|ихся' + '|иче' +
    '|ишей|ишь|ию|ия|й|йка|йке|йки|йкой|йной|йся|йте|йти|' +
    'йше|йшей|йшим|ка|кам|ке|ки|кие|кий|кими|кли|кой|ку|л|' +
    'ла|лен|лена|ли|лива|ливой|ливы|ло|лось|лся|льно|ми' +
    '|мися|мое|мым|мя|н|на|ная|него|нее|нему|ние|нием|нии' + '|ный|ного' +
    '|ний|ним|ними|нию|ниях|нна|ннем|нние|нний|нной|нном|' +
    'нняя|но|ное|ной|ном|нута|нутом|нуты|нуть|ным|о|ов|' +
    'овав|овал|овала|ован|ована|ованно|овано|ованы|овая|' +
    'овли|овной|овой|овом|ого|ое|оев|ой|ок|ока|оки|ола|оли' +
    '|ом|омая' + '|ому|она|оний|онно|оном|ости|ость|ою|ск|ская|ские|ский' +
    '|ским|ское|ской|ском|ств|ства|стве|ство|ством|ству|стей' +
    '|ского|ских' + '|сти|стью|сь|та|тая|тесь|ти|тивы|тие|тием|тии|тое|том|' +
    'тся|тым|ть|ться|' + 'у|уала|ув|уемой|ует|ул|ула|ули|уло|ум|уном|усь|ут|утой|' +
    'утся|уты|ух|ушая|ушей|ущая|уще|ущим|ущих|ую|уюся|уют|ца' +
    '|цев|ции|ций|цию|ция' + '|чатой|че|чен|чески|чива|чивы|чии|чий|чли|чна|чно|чти|'
    +
    'чь|чье|чьей|чьи|чься|шего|шее|шей|шемся|шему|шен|ши|' +
    'шие|ший|шийся|шими|шимся|ших|шли|шься|щего|щее|щей|' +
    'щейся|щемся|щему|щен|щие|щий|щийся|щими|щимся|щих|' +
    'щую|ы|ывал|ывала|ые|ый|ыл|ыли|ыло|ым|ыми|ыт|ытий|ыть' +
    '|ых|ышей|ь|ье|ьев|ьего|ьей|ьем|ьему|ьи|ьим|ьими|ьми|' +
    'ьна|ьной|ьном|ьте|ьше|ья|ьям|ьях|ю|юсь|ются|ющая|юще|' +
    'ющем|ющим|ющих|юю|я|яв|яев|яем|яема|яемой|яет|ял|яла|' +
    'яли|яло|ям|ями|яние|яний|яной|ясь|ят|яте|ятой|ятся|ять' +
    '|ях|ящая|яще|ящем|ящим|ящих|яю|яют';

function g_EnglishEndings: Tl3EndingList;
  {-}
begin
 if (_g_EnglishEndings = nil) then
  _g_EnglishEndings := Tl3EndingList.Create(c_EnglishEndings);
 Result := _g_EnglishEndings;
end;

function g_RussianEndings: Tl3EndingList;
  {-}
begin
 if (_g_RussianEndings = nil) then
  _g_RussianEndings := Tl3EndingList.Create(c_RussianEndings);
 Result := _g_RussianEndings; 
end;

const
  cNot: PAnsiChar = 'НЕ';

 { -- unit.private -- }

{.$Define m0OutTooLongWord}

{$IFDEF _m0LANGUAGE_ENG}
 {$IfDef m0OutTooLongWord}
resourcestring
  SWTooLongWord = 'The word is too long, and has truncated:'^J'"%s"';
 {$EndIf m0OutTooLongWord}
{$ENDIF}
{$IFDEF _m0LANGUAGE_RUS}
 {$IfDef m0OutTooLongWord}
resourcestring
  SWTooLongWord = 'Слишком длинное слово, было сокращено:'^J'"%s"';
 {$EndIf m0OutTooLongWord}
{$ENDIF}


const
 Cm0EXTInfGramSize = $0080;
 Cm0EXTInfDataSize = $0200;
 //Cm0EXTInfAltvSize = $0040;
 //Cm0EXTInfWordSize = $0040;

type
 Tm0EXTInfGramBuff = packed array [0..Pred(Cm0EXTInfGramSize)] of AnsiChar;
 Tm0EXTInfDataBuff = packed array [0..Pred(Cm0EXTInfDataSize)] of AnsiChar;
 //Tm0EXTInfAltvBuff = packed array [0..Pred(Cm0EXTInfAltvSize)] of AnsiChar;
 //Tm0EXTInfWordBuff = packed array [0..Pred(Cm0EXTInfWordSize)] of AnsiChar;

function _IsNOUN(aWInfo: Byte): LongBool;
begin
 Result := (((AWInfo >= $07) and (AWInfo <= $18)) or    //существительное
           ((AWInfo >= $25) and (AWInfo <= $2f)) or     // имя собственное
           (AWInfo = $37) or                            // ??
           (AWInfo = $3b) or                            //Аббревиатура, пишущаяся прописными буквами
           (AWInfo = $3c));                             //Аббревиатура, пишущаяся строчными буквами
end;

function _IsADJC(aWInfo : Byte): LongBool;
begin
 Result := (aWInfo = $19) or (aWInfo = $1a) or (aWInfo = $1c) or // Прилагательное
           (aWInfo = $38); //??
end;

function _ChkChars(ABuff: PAnsiChar; ASize: Cardinal): Tm0LNGLibCharsInfo;
begin
 if l3AllCharsInCharSet(aBuff, aSize, cc_ANSIRussian) then
  Result := Cm0LNGLibRussian
 else
 if l3AllCharsInCharSet(aBuff, aSize, cc_ANSIEnglish) then
  Result := Cm0LNGLibEnglish
 else
  Result := Cm0LNGLibUnknown;
end;

function _CallBack0(ACharsInfo: Tm0LNGLibCharsInfo; AStatus: LongInt;
  AFlags: LongInt; ABuff: PAnsiChar; AProc: Tm0LNGLibCallBackProc): LongInt;
begin
 if ((AFlags and Cm0LNGLibFlagUSET_FORM) <> 0) then
  Result := m0STRAnsiUpperBuff(ABuff)
 else
  Result := l3StrLen(ABuff);
 AProc((AStatus or Cm0LNGLibStatusNORM_FORM), ABuff, Result);
end;

function EndingReplace: Tm3EndingReplaceList;
var
 aStream : TStream;
begin
 if gEndingReplace = nil then
 begin
  gEndingReplace := Tm3EndingReplaceList.Create;
  if Assigned(g_InitEndingListProc) then
   g_InitEndingListProc(gEndingReplace);
  {aStream := Tl3FileStream.Create('D:\endings.txt', l3_fmRead);
  try
   gEndingReplace.Load(aStream);
  finally
   l3Free(aStream);
  end;}
 end;

 Result := gEndingReplace;
end;

procedure m0ExplicitEndingsListLoad;
begin
 EndingReplace;
end;

procedure _CallBack1(ACharsInfo: Tm0LNGLibCharsInfo; AStatus: LongInt; AFlags: LongInt; ABuff: PAnsiChar; AProc: Tm0LNGLibCallBackProc);

 function __TruncateEnd(ATermHandle: Tl3EndingList; const AStopHandle: TChars; var aStr : Tl3PCharLen): Boolean;
 var
  lBegPos: Cardinal;
  lIndex : Integer;
 begin
  Result := False;
  if aTermHandle.InWord(aStr, lBegPos) then
   if ((lBegPos > 0) and (lBegPos < aStr.SLen)) then
    if not l3AllCharsInCharSet(aStr.S, lBegPos, aStopHandle) then
    begin
     aStr.SLen := lBegPos;
     Result := True;
    end;
 end;

var
  l_SaveChar : AnsiChar;
  l_Str      : Tl3PCharLen;
  lLen       : Integer;
begin
  if ((AFlags and Cm0LNGLibFlagUSET_FORM) <> 0) then
    lLen := m0STRAnsiUpperBuff(ABuff)
  else
    lLen := l3StrLen(ABuff);
  l_Str := l3PCharLen(aBuff, lLen);

  if ((AFlags and Cm0LNGLibFlagUPNF_FORM) <> 0) then
  begin
   //замена окончания
   if EndingReplace.MakeNorm(l_Str) then
    // собственно все уже сделали
   else
   // отрезание окончания
    case ACharsInfo of
      Cm0LNGLibEnglish:
        if __TruncateEnd(g_EnglishEndings, cc_EngConsonants, l_Str) then
          AStatus := AStatus or Cm0LNGLibStatusPNRM_FORM and not Cm0LNGLibStatusNORM_FORM;
      Cm0LNGLibRussian:
        if __TruncateEnd(g_RussianEndings, cc_RusConsonants, l_Str) then
          AStatus := AStatus or Cm0LNGLibStatusPNRM_FORM and not Cm0LNGLibStatusNORM_FORM;
    end;//case ACharsInfo
  end;//(AFlags and Cm0LNGLibFlagUPNF_FORM) <> 0

  if ((AStatus and Cm0LNGLibStatusPNRM_FORM) <> 0) then
  begin
   l_SaveChar := l_Str.S[l_Str.SLen];
   try
     l_Str.S[l_Str.SLen] := '@';
     AProc(AStatus, l_Str.S, Succ(l_Str.SLen));
   finally
     l_Str.S[l_Str.SLen] := l_SaveChar;
   end;//try..finally
  end
  else
    AProc(AStatus, l_Str.S, l_Str.SLen);
end;


procedure m0LNGNormalBuff(AStatus: LongInt; AFlags: LongInt; ABuff: PAnsiChar;
                          ASize: Cardinal; AOemCp: LongBool; AProc: Tm0LNGLibCallBackProc;
                          aWithDot: Bool = False; aTemp: PPointer = nil);

  procedure   __NormalBuff(AStatus: LongInt;
                           AFlags: LongInt;
                           ABuff: PAnsiChar;
                           ASize: Cardinal;
                           AProc: Tm0LNGLibCallBackProc);

   procedure   __ALTVForms(      ACharsInfo: Tm0LNGLibCharsInfo;
                                 AFlags: LongInt;
                                 ABuff: PAnsiChar;
                                 AProc: Tm0LNGLibCallBackProc
                          );
   begin
    _CallBack1(ACharsInfo,AStatus,AFlags,ABuff,AProc);
   end;

  var
   LForms : SmallInt;
   LGPos  : SmallInt;
   LGPtr  : PAnsiChar;
   LGram  : Tm0EXTInfGramBuff;
   L_Len  : Long;
  begin
   case _ChkChars(ABuff,ASize) of
    Cm0LNGLibUnknown:
     __ALTVForms(Cm0LNGLibUnknown,AFlags,ABuff,AProc);
    Cm0LNGLibEnglish:
     _CallBack1(Cm0LNGLibEnglish,AStatus,AFlags,ABuff,AProc);
    Cm0LNGLibRussian: begin
     if ((AFlags and Cm0LNGLibFlagNORM_FORM) <> 0) then
     begin
      if (mlmaruCheckWord(ABuff, maIgnoreCapitals) = 1) then
      begin
       LGPos:=0;
       LForms:=mlmaruLemmatize(ABuff, maIgnoreCapitals, LGram, nil, nil, SizeOf(LGram), 0, 0);
       while (LForms <> 0) do
       begin
        LGPtr:=@LGram[LGPos];
        Inc(LGPos,SmallInt(Succ(_CallBack0(Cm0LNGLibRussian,AStatus,AFlags,LGPtr,AProc))));
        Dec(LForms);
       end;//while (LForms <> 0)
       //_SetCaps
      end
      else
      begin
       if (aSize > 2) AND
         (aBuff[0] = 'Н') AND (aBuff[1] = 'Е') AND
        (mlmaruCheckWord(ABuff+2, maIgnoreCapitals) = 1) then
       begin
        LGPos:=0;
        LForms:=mlmaruLemmatize(ABuff + 2, maIgnoreCapitals, LGram, nil, nil, SizeOf(LGram), 0, 0);
        if (aTemp = nil) then
        begin
         while (LForms <> 0) do
         begin
          LGPtr:=@LGram[LGPos];
          Inc(LGPos,SmallInt(Succ(_CallBack0(Cm0LNGLibRussian,AStatus,AFlags,PAnsiChar('НЕ' + String(LGPtr)),AProc))));
          Dec(LForms);
         end;//while (LForms <> 0)
        end
        else
        begin
         while (LForms <> 0) do
         begin
          LGPtr:=@LGram[LGPos];
          l_Len := StrLen(LGPtr);
          if (aTemp^ = nil) then
          begin
           l3System.GetLocalMem(aTemp^, l_Len + 3);
           l3Move('НЕ', PAnsiChar(aTemp^)^, 2);
          end
          else
          if (l3MemorySize(aTemp^) < l_Len + 3) then
           l3System.ReallocLocalMem(aTemp^, l_Len + 3);
          l3Move(LGPtr^, PAnsiChar(aTemp^)[2], Succ(l_Len));
          Inc(LGPos,SmallInt(Succ(_CallBack0(Cm0LNGLibRussian,AStatus,AFlags,aTemp^,AProc))));
          Dec(LForms);
         end;//while (LForms <> 0)
        end;//aTemp = nil
        Exit;
       end;//aSize..
       __ALTVForms(Cm0LNGLibRussian,AFlags,ABuff,AProc);
      end;
     end else
      __ALTVForms(Cm0LNGLibRussian,AFlags,ABuff,AProc);
    end;//Cm0LNGLibRussian
   end;//case _ChkChars(ABuff,ASize)
  end;

 var
  LBuff: Tm0LNGLibCharsBuff;
  LSize: Cardinal;
begin

  if (((ABuff <> nil) and (ASize <> 0)) and Assigned(AProc)) then
  begin

    LSize := Min(Pred(SizeOf(LBuff)), ASize);
    //LSize := m0S32Min(Pred(SizeOf(LBuff)), ASize);

    m2XLTConvertOem2Ansi(AOemCp, m0STRCopySize( @LBuff, ABuff, LSize), LSize);

    if (LSize <> ASize) then
    begin
     {$If Declared(Gm0EXCLibDefSrv) AND Declared(SWTooLongWord)}
     Gm0EXCLibDefSrv.SaveMessage(Cm0EXCLibWRG, Format(SWTooLongWord, [StrPas(LBuff)]));
     {$IfEnd}
     AStatus := AStatus or Cm0LNGLibStatusToo_Long;
    end;//LSize <> ASize

    __NormalBuff(AStatus, AFlags, @LBuff, LSize, AProc);

  end;

end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0lnglib.pas initialization enter'); {$EndIf}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\m0\pas\m0lnglib.pas initialization leave'); {$EndIf}
finalization
  l3Free(_g_EnglishEndings);
  l3Free(_g_RussianEndings);
  l3Free(gEndingReplace);
end.
