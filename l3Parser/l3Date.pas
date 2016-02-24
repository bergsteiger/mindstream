unit l3Date;
{* Модуль для работы с датами. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: TurboPower Software ©        }
{ Модуль: l3Date -                    }
{ Начат: 19.11.1999 17:55             }
{ $Id: l3Date.pas,v 1.38 2015/06/03 10:45:21 voba Exp $ }

// $Log: l3Date.pas,v $
// Revision 1.38  2015/06/03 10:45:21  voba
// - k:600314823
//
// Revision 1.37  2014/07/03 10:56:17  lulin
// - правильнее упаковываем дату/время.
//
// Revision 1.36  2013/04/25 14:22:38  lulin
// - портируем.
//
// Revision 1.35  2013/03/28 17:25:04  lulin
// - портируем.
//
// Revision 1.34  2013/03/28 16:13:50  lulin
// - портируем.
//
// Revision 1.33  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.32  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.31  2011/10/14 05:24:44  narry
// Не собирался Парень
//
// Revision 1.30  2008/07/08 12:08:43  fireton
// - увеличиваем разрядность часов, минут и секунд
//
// Revision 1.29  2007/12/28 13:34:48  voba
// -  opt.
//
// Revision 1.28  2007/11/01 10:45:16  fireton
// - перегруженная версия DayOfWeek, работающая с TDateTime
//
// Revision 1.27  2007/08/14 14:30:12  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.26  2006/06/09 05:06:17  mmorozov
// - new behaviour: при вставке из буфера в качестве символов разделителей даты могут выступать любые символы кроме цифр (CQ: OIT500021261);
//
// Revision 1.25  2005/12/01 12:54:30  mmorozov
// - rename: l3CorrectDaysInDate -> l3CorrectDate (теперь работает корректно);
//
// Revision 1.24  2005/05/16 08:26:34  fireton
// - ExpandYear в interface
//
// Revision 1.23  2005/04/20 12:18:47  mmorozov
// change: function l3CorrectDaysInDate;
//
// Revision 1.22  2005/04/13 13:27:35  fireton
// - bug fix: проверяем год на валидность в IsDateFullyFilled
//
// Revision 1.21  2005/04/13 13:17:55  fireton
// - add: function IsDateFullyFilled
//
// Revision 1.20  2005/04/13 12:10:28  fireton
// - bug fix: если год в строке даты не обозначен, считаем его високосным
// - add: новая функция - l3CorrectDayInDate
// - немножко форматирования
//
// Revision 1.19  2004/08/05 07:23:44  am
// bugfix: isDateHalfValid
//
// Revision 1.18  2004/08/04 11:59:03  am
// change: подчистил код в isDateHalfValid
//
// Revision 1.17  2004/08/04 10:50:41  am
// change: поменял логику isDateHalfValid
// change: ExtractMask сделал из процедуры функцию возвращающую bool: все ли знакоместа заполнены в передаваемой строке
//
// Revision 1.16  2004/08/04 08:58:33  am
// new: isDateHalfValid - проверка неполной даты
//
// Revision 1.15  2004/04/28 12:35:12  fireton
// - bug fix: всегда четыре цифры в годе!
//
// Revision 1.14  2004/03/11 09:12:22  fireton
// - bug fix: ScanDateStr возвращала невменяемое значение года, если год был пустой
//            Теперь возвращает текущий
//
// Revision 1.13  2003/06/23 14:29:15  voba
// - поправил MakeDateBounds
//
// Revision 1.12  2003/06/19 14:56:36  voba
// - speed improvement  StDateToDateTime, DateTimeToStDate
//
// Revision 1.11  2003/06/19 09:03:30  voba
// - add функции работы с диапазоном дат
//
// Revision 1.10  2003/04/16 09:28:06  voba
// - improvement: add function for work with date bounds
//
// Revision 1.9  2001/10/05 13:54:04  voba
// - bug fix: NullDate.
//
// Revision 1.8  2001/10/04 15:58:26  voba
// - add procedure NormDate
//
// Revision 1.7  2001/10/04 13:42:51  voba
// - bug fix : procedure ValidDate
//
// Revision 1.6  2001/09/24 16:13:35  demon
// - bug fix: Delphi 5
//
// Revision 1.5  2001/09/21 11:41:36  narry
// - change: часть функций перетащено из RX.
//
// Revision 1.4  2001/08/28 12:55:13  law
// - rename unit: evUtils -> l3Utils.
//
// Revision 1.3  2001/07/27 15:46:04  law
// - comments: xHelpGen.
//
// Revision 1.2  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

{-Date and time manipulation}

{Based in part on code provided by Scott Bussinger and Carley Phillips.
 Many thanks to both.}

// *********************************************************
// *                    STDATE.PAS 1.04                    *
// *   Copyright (c) TurboPower Software Co., 1996, 1997   *
// *                 All rights reserved.                  *
// *********************************************************

{$IFDEF Win32}
  {$DEFINE OS32}
{$ENDIF}
 {$IFDEF VirtualPascal}
  {$DEFINE OS32}
{$ENDIF}
{ OS32 is used to enable 32-bit operating system options                    }

{$IFDEF OS32}
{---Global compiler defines for Delphi 2.0---}
{$IFDEF Win32}
{$H+} {Huge string support}
{$ENDIF}
{$Q-} {Overflow check}
{$R-} {Range check}
{$S-} {Stack check}
{$T-} {Typed @ check}
{$V-} {Var strings}
{$ELSE}
{---Global compiler defines for Delphi 1.0---}
{$F-} {Far calls
{$G+} {80286 code}
{$Q-} {Overflow check}
{$R-} {Range check}
{$S-} {Stack check}
{$T-} {Typed @ check}
{$V-} {Var strings}
{$ENDIF}

{$A+} {Aligned records}
{$B-} {Incomplete boolean evaluation}
{$W-} {No special Windows stack frames}
{$X+} {Extended syntax}

{$IFNDEF OS32}
  {$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ENDIF}

interface

uses
{$IFDEF OS32}
 {$IFDEF WIN32}
  Windows,
 {$ELSE}
  Os2Def,
 {$ENDIF}
{$ELSE}
  WinTypes,
  WinProcs,
{$ENDIF}
  SysUtils
  ;

type
  TStDate = LongInt;
    {* In STDATE, dates are stored in long integer format as the number of days
    since January 1, 1600. }

  TStDayType = (Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday);
    {* An enumerated type used when representing a day of the week. }

  TDaysOfWeek = set of TStDayType;

  TStBondDateType = (bdtActual, bdt30E360, bdt30360);
    {* An enumerated type used for calculating bond date differences. }

  TStTime = LongInt;
    {* STDATE handles time in a manner similar to dates, representing a given
    time of day as the number of seconds since midnight. }

  TStDateTimeRec = packed record
     {* This record type simply combines the two basic date types defined by
      STDATE, Date and Time. }
      D : TStDate;
      T : TStTime;
    end;

  Tl3DateBounds = record
                   Low  : TStDate;
                   High : TStDate;
                  end;

  TDateOrder = (doMDY, doDMY, doYMD);

const
  MinYear = 1600;        
   {* Minimum valid year for a date variable.}
  MaxYear = 3999;        
   {* Maximum valid year for a date variable. }
  MinDate  = TStDate($00000000);
   {* Minimum valid date for a date variable - 01/01/1600. }
  MaxDate  = TStDate($000D6025);
   {* Maximum valid date for a date variable - 12/31/3999. }
  Date1900 = TStDate($0001AC05);
   {* This constant contains the Julian date for 01/01/1900. }
  Date1980 = TStDate($00021E28);
   {* This constant contains the Julian date for 01/01/1980. }
  Date2000 = TStDate($00023AB1);
   {* This constant contains the Julian date for 01/01/2000. }
  BadDate =  TStDate($FFFFFFFF);
   {* This value is used to represent an invalid date, such
                                   as 12/32/1992. }

  StDate_DateTime_Delta = 109571;
  {$IFDEF WIN32}
   BadDateTime : TDateTime = -366*2000;
   NullDate: TDateTime = -366*2000;
  {$ELSE}
   BadDateTime : TDateTime = 0;
   NullDate    : TDateTime = 0;

  {$ENDIF}
   CenturyOffset: Byte = 60;

  DeltaJD     = $00232DA8;
   {* Days between 1/1/-4173 and 1/1/1600. }

  MinTime = 0;
   {* Minimum valid time for a time variable - 00:00:00 am. }
  MaxTime = 86399;
   {* Maximum valid time for a time variable - 23:59:59 pm. }
  BadTime = TStTime($FFFFFFFF);
   {* This value is used to represent an invalid time of
      day, such as 12:61:00. }

  SecondsInDay = 86400;
   {* Number of seconds in a day. }
  SecondsInHour = 3600;
   {* Number of seconds in an hour. }
  SecondsInMinute = 60;
   {* Number of seconds in a minute.}
  HoursInDay = 24;
   {* Number of hours in a day. }
  MinutesInHour = 60;        
   {* Number of minutes in an hour. }
  MinutesInDay = 1440;       
   {* Number of minutes in a day. }

  cEmptyDateTime : TStDateTimeRec = (D:0; T:0);

  SInvalidDate = 42;

var
  DefaultYear : Integer;
   {* default year--used by DateStringToDMY. }
  DefaultMonth : ShortInt;
   {* default month. }

var
  FourDigitYear: Boolean;
   {-}

  {-------julian date routines---------------}

function CurrentDate : TStDate;
  {* - returns today's date as a Julian date. }

function CurrentYear: Word;

function AddEpoch(Year, Epoch : Integer): Integer;

function ValidDate(Day, Month, Year : Integer) : Boolean;
  {* - Verify that day, month, year is a valid date.}
  overload;

function ValidDate(ADate: TDateTime): Boolean;
  overload;

function DMYtoStDate(Day, Month, Year : Integer) : TStDate;
  {* - Convert from day, month, year to a Julian date. }

procedure StDateToDMY(Julian : TStDate; var Day, Month, Year : Integer);
  {* - Convert from a Julian date to day, month, year. }

function IncDate(Julian : TStDate; Days, Months, Years : Integer) : TStDate;
  {* - Add (or subtract) the number of days, months, and years to a date. }

function IncDateTrunc(Julian : TStDate; Months, Years : Integer) : TStDate;
  {* - Add (or subtract) the specified number of months and years to a date. }

procedure DateDiff(Date1, Date2 : TStDate;
                   var Days, Months, Years : Integer);
{* - Return the difference in days, months, and years between two valid Julian
  dates. }

function BondDateDiff(Date1, Date2 : TStDate; DayBasis : TStBondDateType) : TStDate;
  {* - Return the difference in days between two valid Julian
  dates using a specific financial basis. }

function WeekOfYear(Julian : TStDate) : Byte;
  {* - Returns the week number of the year given the Julian Date. }

function AstJulianDate(Julian : TStDate) : Double;
  {* - Returns the Astronomical Julian Date from a TStDate. }

function AstJulianDatetoStDate(AstJulian : Double; Truncate : Boolean) : TStDate;
  {* - Returns a TStDate from an Astronomical Julian Date.
  Truncate TRUE   Converts to appropriate 0 hours then truncates
           FALSE  Converts to appropriate 0 hours, then rounds to
                  nearest;}

{!!.03 - added function}
function AstJulianDatePrim(Year, Month, Date : Integer; UT : TStTime) : Double;
  {* - Returns an Astronomical Julian Date for any year, even those outside
    MinYear..MaxYear. }

function DayOfWeek(Julian : TStDate) : TStDayType; overload;
  {*- Return the day of the week for a Julian date. }

function DayOfWeek(aDate : TDateTime) : TStDayType; overload;
  {*- Return the day of the week for a TDateTime date. }

function DayOfWeekDMY(Day, Month, Year : Integer) : TStDayType;
  {* - Return the day of the week for the day, month, year. }

function IsLeapYear(Year : Integer) : Boolean;
  {* - Return True if Year is a leap year. }

function DaysInMonth(Month : Integer; Year : Integer) : Integer;
  {* - Return the number of days in the specified month of a given year. }

  {-------time routines---------------}

function ValidTime(Hours, Minutes, Seconds : Integer) : Boolean;
  {* - Return True if Hours:Minutes:Seconds is a valid time. }

procedure StTimeToHMS(T : TStTime;
                    var Hours, Minutes, Seconds : Integer);
  {* - Convert a time variable to hours, minutes, seconds. }

function HMStoStTime(Hours, Minutes, Seconds : Integer) : TStTime;
  {* - Convert hours, minutes, seconds to a time variable. }

function CurrentTime : TStTime;
  {* - Return the current time in seconds since midnight. }

procedure TimeDiff(Time1, Time2 : TStTime;
                   var Hours, Minutes, Seconds : Integer);
  {* - Return the difference in hours, minutes, and seconds between two times. }

function IncTime(T : TStTime; Hours, Minutes, Seconds : Integer) : TStTime;
  {* - Add the specified hours, minutes, and seconds to a given time of day. }

function DecTime(T : TStTime; Hours, Minutes, Seconds : Integer) : TStTime;
  {* - Subtract the specified hours, minutes, and seconds from a given time of day. }

function RoundToNearestHour(T : TStTime; Truncate : Boolean) : TStTime;
  {* - Given a time, round it to the nearest hour, or truncate minutes and
  seconds. }

function RoundToNearestMinute(const T : TStTime; Truncate : Boolean) : TStTime;
  {* - Given a time, round it to the nearest minute, or truncate seconds. }

  {-------- routines for DateTimeRec records ---------}

function CompareStDateTime(DT1, DT2 : TStDateTimeRec) : Integer;
  {* - comparing TStDateTimeRec structure. }

function CurrentDateTime : TStDateTimeRec;
  {* - returns today's Date and Time as a Julian date. }

procedure DateTimeDiff(DT1 : TStDateTimeRec; var DT2 : TStDateTimeRec;
                       var Days : LongInt; var Secs : LongInt);
  {* - Return the difference in days and seconds between two points in time. }

procedure IncDateTime(DT1 : TStDateTimeRec; var DT2 : TStDateTimeRec;
                      Days : Integer; Secs : LongInt);
  {* - Increment (or decrement) a date and time by the specified number of days
  and seconds. }

function DateTimeToStDate(DT : TDateTime) : TStDate;
  {* - Convert Delphi TDateTime to TStDate. }

function DateTimeToStTime(DT : TDateTime) : TStTime;
  {* - Convert Delphi TDateTime to TStTime. }

function StDateToDateTime(D : TStDate) : TDateTime;
  {* - Convert TStDate to TDateTime. }

function StTimeToDateTime(T : TStTime) : TDateTime;
  {* - Convert TStTime to TDateTime. }

function StDateTimeRecToDateTime(const TD : TStDateTimeRec) : TDateTime;

function DateTimeToStDateTimeRec(const TD : TDateTime) : TStDateTimeRec;

function Convert2ByteDate(TwoByteDate : Word) : TStDate;
  {* - Convert an Object Professional two byte date into a SysTools date. }

function Convert4ByteDate(FourByteDate : TStDate) : Word;
  {* - Convert a SysTools date into an Object Professional two byte date. }


function DemonToStDate(Julian : TStDate) : TStDate;
  {* - Demon To StDate. }
function StDateToDemon(Julian : TStDate) : TStDate;
  {* - StDate To Demon. }

function NormDate(DateValue, DefaultValue: TDateTime): TDateTime;

function GetDateOrder(const DateFormat: string): TDateOrder;

function DefDateFormat(FourDigitYear: Boolean): string;

function StrToDateDef(const S: string; Default: TDateTime): TDateTime;
function StrToDateFmt(const DateFormat, S: string): TDateTime;
function StrToDateFmtDef(const DateFormat, S: string; Default: TDateTime): TDateTime;

function DefDateMask(BlanksChar: Char; FourDigitYear: Boolean): string;

function MakeDateBounds(aLowBound, aHighBound : TStDate) : Tl3DateBounds;
function DateInBounds(aDate : TStDate; aBound : Tl3DateBounds) : Boolean;
function IsDateBoundsIntersected(aBound1 : Tl3DateBounds; aBound2 : Tl3DateBounds) : Boolean;

function MakeDemonDateBounds(aLowBound, aHighBound : TStDate) : Tl3DateBounds;
function isDateHalfValid(const Format, S: string): boolean;
function l3CorrectDate(const Format, S: string): string;
function IsDateFullyFilled(const Format, S: string): boolean;
function l3CorrectDateSeparators(const aEditMask : String;
                                 const aDate     : String;
                                 const aBlank    : Char): String;
  {* - корректирует символы разделители в дате заменяя их на значения в
       региональных настройках. }

function ExpandYear(Year: Integer): Integer;

function DateTimeToDtDate(aDate: TDateTime): Integer;

const
  DefaultDateOrder = doDMY;

implementation

uses
  {$IfDef Delphi6}
  RTLConsts,
  {$Else  Delphi6}
  Consts,
  {$EndIf Delphi6}
  MaskUtils,

  l3String,
  l3DateSt
  ;

const
  First2Months = 59;           {1600 was a leap year}
  FirstDayOfWeek = Saturday;   {01/01/1600 was a Saturday}
  {DateLen = 40;}                {maximum length of Picture strings}
  {MaxMonthName = 15;}
  {MaxDayName   = 15;}


{type}
{  DateString = string[DateLen];}
  {SString = string[255];}

function l3CorrectDateSeparators(const aEditMask : String;
                                 const aDate     : String;
                                 const aBlank    : Char): String;
  {* - корректирует символы разделители в дате заменяя их на значения в
       региональных настройках. }
var
 l_Index  : Integer;
 l_Offset : Integer;
begin
 Result := aDate;
 l_Index := 1;
 while l_Index <= Length(aEditMask) do
 begin
  l_Offset := MaskOffsetToOffset(aEditMask, l_Index);
    // - позицию символа в маске преобразуем к позиции строки;
  if (aEditMask[l_Index] = mMskDateSeparator) and
     (l_Offset <= Length(Result)) and
     not (Result[l_Offset] in ['0'..'9']) and
       // - дата может быть скопированна в формате 100304, тогда ничего делать
       //   не нужно т.к. дата будет преобразована по маске в 10.03.04;
     (Result[l_Offset] <> {$ifDef XE}FormatSettings.{$EndIf}DateSeparator) then
   Result[l_Offset] := {$ifDef XE}FormatSettings.{$EndIf}DateSeparator;
  Inc(l_Index);
 end;
end;

function IsLeapYear(Year : Integer) : Boolean;
  {-Return True if Year is a leap year}
begin
  Result := (Year mod 4 = 0) and (Year mod 4000 <> 0) and
    ((Year mod 100 <> 0) or (Year mod 400 = 0));
end;


{$IFNDEF OS32}
procedure ExchangeLongInts(var I, J : LongInt);
  {-Exchange the values in two long integers}
  inline(
    $8C/$DB/               {mov bx,ds       ;save DS}
    $5E/                   {pop si}
    $1F/                   {pop ds          ;DS:SI => J}
    $5F/                   {pop di}
    $07/                   {pop es          ;ES:DI => I}
    $FC/                   {cld}
    $26/$8B/$05/           {mov ax,es:[di]}
    $A5/                   {movsw}
    $89/$44/$FE/           {mov [si-2],ax}
    $8B/$04/               {mov ax,[si]}
    $26/$87/$05/           {xchg ax,es:[di]}
    $89/$04/               {mov [si],ax}
    $8E/$DB);              {mov ds,bx       ;restore DS}

procedure ExchangeStructs(var I, J; Size : Cardinal);
  {-Exchange the values in two structures}
  inline(
    $FC/                   {cld       ;go forward}
    $8C/$DA/               {mov dx,ds       ;save DS}
    $59/                   {pop cx          ;CX = Size}
    $5E/                   {pop si}
    $1F/                   {pop ds          ;DS:SI => J}
    $5F/                   {pop di}
    $07/                   {pop es          ;ES:DI => I}
    $D1/$E9/               {shr cx,1        ;_move by words}
    $E3/$0C/               {jcxz odd}
    $9C/                   {pushf}
                           {start:}
    $89/$F3/               {mov bx,si}
    $26/$8B/$05/           {mov ax,es:[di]  ;exchange words}
    $A5/                   {movsw}
    $89/$07/               {mov [bx],ax}
    $E2/$F6/               {loop start      ;again?}
    $9D/                   {popf}
                           {odd:}
    $73/$07/               {jnc exit}
    $8A/$04/               {mov al,[si]     ;exchange the odd bytes}
    $26/$86/$05/           {xchg al,es:[di]}
    $88/$04/               {mov [si],al}
                           {exit:}
    $8E/$DA);              {mov ds,dx       ;restore DS}
{$ELSE}
procedure ExchangeLongInts(var I, J : LongInt);
{$IFDEF WIN32}
register;
asm
{$ELSE}
{&USES None} {&Frame-}
asm
  mov  eax,i
  mov  edx,j                                                           {!!.03}
{$ENDIF}
  mov  ecx, [eax]
  push ecx
  mov  ecx, [edx]
  mov  [eax], ecx
  pop  ecx
  mov  [edx], ecx
end;

{&frame-} {&uses none}
procedure ExchangeStructs(var I, J; Size : Cardinal);                  {!!.01}
{$IFDEF WIN32}
register;
asm
{$ELSE}
asm
  mov  eax,i
  mov  edx,j
  mov  ecx,Size
{$ENDIF}
  push edi
  push ebx
  push ecx
  shr  ecx, 2
  jz   @@LessThanFour

@@AgainDWords:
  mov  ebx, [eax]
  mov  edi, [edx]
  mov  [edx], ebx
  mov  [eax], edi
  add  eax, 4
  add  edx, 4
  dec  ecx
  jnz  @@AgainDWords

@@LessThanFour:
  pop  ecx
  and  ecx, $3
  jz   @@Done
  mov  bl, [eax]
  mov  bh, [edx]
  mov  [edx], bl
  mov  [eax], bh
  inc  eax
  inc  edx
  dec  ecx
  jz   @@Done

  mov  bl, [eax]
  mov  bh, [edx]
  mov  [edx], bl
  mov  [eax], bh
  inc  eax
  inc  edx
  dec  ecx
  jz   @@Done

  mov  bl, [eax]
  mov  bh, [edx]
  mov  [edx], bl
  mov  [eax], bh

@@Done:
  pop  ebx
  pop  edi
end;
{$ENDIF}

Function AddEpoch(Year, Epoch : Integer): Integer;
var
  EpochYear,
  EpochCent : Integer;
begin
  if Word(Year) < 100 then
  begin
    EpochYear := Epoch mod 100;
    EpochCent := (Epoch div 100) * 100;
    if (Year < EpochYear) then
      Inc(Year,EpochCent+100)
    else
      Inc(Year,EpochCent);
  end;
  Result := Year;
end;

function CurrentDate : TStDate;
  {-Returns today's date as a julian}
var
  lSysTime : TSystemTime;
begin
  GetLocalTime(lSysTime);
  with lSysTime do
   Result := DMYToStDate(wDay, wMonth, wYear);
end;

function DaysInMonth(Month : integer; Year : Integer) : Integer;
    {-Return the number of days in the specified month of a given year}
begin
  if (Year < MinYear) OR (Year > MaxYear) then
  begin
    Result := 0;
    Exit;
  end;

  case Month of
    1, 3, 5, 7, 8, 10, 12 :
      Result := 31;
    4, 6, 9, 11 :
      Result := 30;
    2 :
     Result := 28+Ord(IsLeapYear(Year));
  else
    Result := 0;
  end;
end;

function ValidDate(Day, Month, Year : Integer) : Boolean;
  {-Verify that day, month, year is a valid date}
  //overload;
begin
  if (Day < 1) or (Year < MinYear) or (Year > MaxYear) then
    Result := False
  else case Month of
    1..12 :
      Result := Day <= DaysInMonth(Month, Year);
  else
    Result := False;
  end
end;

function ValidDate(ADate: TDateTime): Boolean;
  //overload;
var
  Year, Month, Day: Word;
begin
  try
    DecodeDate(ADate, Year, Month, Day);
    Result := ValidDate(Day, Month, Year);
  except
    Result := False;
  end;
end;

function DMYtoStDate(Day, Month, Year : Integer) : TStDate;
  {-Convert from day, month, year to a julian date}
begin
  if not ValidDate(Day, Month, Year) then
    Result := BadDate
  else if (Year = MinYear) and (Month < 3) then
    if Month = 1 then
      Result := Pred(Day)
    else
      Result := Day+30
  else begin
    if Month > 2 then
      Dec(Month, 3)
    else begin
      Inc(Month, 9);
      Dec(Year);
    end;
    Dec(Year, MinYear);
    Result :=
      ((LongInt(Year div 100)*146097) div 4)+
      ((LongInt(Year mod 100)*1461) div 4)+
      (((153*Month)+2) div 5)+Day+First2Months;
  end;
end;

function WeekOfYear(Julian : TStDate) : Byte;
  {-Returns the week number of the year given the Julian Date}
var
  Day, Month, Year : Integer;
  FirstJulian : TStDate;
begin
  if (Julian < MinDate) or (Julian > MaxDate) then
  begin
    Result := 0;
    Exit;
  end;

  Julian := Julian + 3 - ((6 + Ord(DayOfWeek(Julian))) mod 7);
  StDateToDMY(Julian,Day,Month,Year);
  FirstJulian := DMYToStDate(1,1,Year);
  Result := 1 + (Julian - FirstJulian) div 7;
end;

function AstJulianDate(Julian : TStDate) : Double;
  {-Returns the Astronomical Julian Date from a TStDate}
begin
  {Subtract 0.5d since Astronomical JD starts at noon
   while TStDate (with implied .0) starts at midnight}
  Result := Julian - 0.5 + DeltaJD;
end;


{!!.03 - revised}
function AstJulianDatePrim(Year, Month, Date : Integer; UT : TStTime) : Double;
var
  A, B : integer;
  LY,
  GC   : Boolean;

begin
  Result := -MaxLongInt;
  if (not (Month in [1..12])) or (Date < 1)  then
    Exit
  else if (Month in [1, 3, 5, 7, 8, 10, 12]) and (Date > 31) then
    Exit
  else if (Month in [4, 6, 9, 11]) and (Date > 30) then
    Exit
  else if (Month = 2) then begin
    LY := IsLeapYear(Year);
    if ((LY) and (Date > 29)) or (not (LY) and (Date > 28)) then
      Exit;
  end else if ((UT < 0) or (UT >= SecondsInDay)) then
    Exit;

  if (Month <= 2) then begin
    Year := Year - 1;
    Month := Month + 12;
  end;
  A := abs(Year div 100);

  if (Year > 1582) then
    GC := True
  else if (Year = 1582) then begin
    if (Month > 10) then
      GC := True
    else if (Month < 10) then
      GC := False
    else begin
      if (Date >= 15) then
        GC := True
      else
        GC := False;
    end;
  end else
    GC := False;
  if (GC) then
    B := 2 - A + abs(A div 4)
  else
    B := 0;

  Result := Trunc(365.25 * (Year + 4716))
          + Trunc(30.6001 * (Month + 1))
          + Date + B - 1524.5
          + UT / SecondsInDay;
end;


function AstJulianDatetoStDate(AstJulian : Double; Truncate : Boolean) : TStDate;
  {-Returns a TStDate from an Astronomical Julian Date.
    Truncate TRUE   Converts to appropriate 0 hours then truncates
             FALSE  Converts to appropriate 0 hours, then rounds to
                    nearest;}
begin
  {Convert to TStDate, adding 0.5d for implied .0d of TStDate}
  AstJulian := AstJulian + 0.5 - DeltaJD;
  if (AstJulian < MinDate) OR (AstJulian > MaxDate) then
  begin
    Result := BadDate;
    Exit;
  end;

  if Truncate then
    Result := Trunc(AstJulian)
  else
    Result := Trunc(AstJulian + 0.5);
end;

procedure StDateToDMY(Julian : TStDate; var Day, Month, Year : Integer);
  {-Convert from a julian date to month, day, year}
var
  I, J : LongInt;
begin
  if Julian = BadDate then begin
    Day := 0;
    Month := 0;
    Year := 0;
  end
  else if Julian <= First2Months then begin
    Year := MinYear;
    if Julian <= 30 then begin
      Month := 1;
      Day := Succ(Julian);
    end
    else begin
      Month := 2;
      Day := Julian-30;
    end;
  end
  else begin
    I := (4*LongInt(Julian-First2Months))-1;

    J := (4*((I mod 146097) div 4))+3;
    Year := (100*(I div 146097))+(J div 1461);
    I := (5*(((J mod 1461)+4) div 4))-3;
    Day := ((I mod 153)+5) div 5;

    Month := I div 153;
    if Month < 10 then
      Inc(Month, 3)
    else begin
      Dec(Month, 9);
      Inc(Year);
    end;
    Inc(Year, MinYear);
  end;
end;

function IncDate(Julian : TStDate; Days, Months, Years : Integer) : TStDate;
  {-Add (or subtract) the number of months, days, and years to a date.
    Months and years are added before days. No overflow/underflow
    checks are made}
var
  Day, Month, Year, Day28Delta : Integer;
begin
  StDateToDMY(Julian, Day, Month, Year);
  Day28Delta := Day-28;
  if Day28Delta < 0 then
    Day28Delta := 0
  else
    Day := 28;

  Inc(Year, Years);
  Inc(Year, Months div 12);
  Inc(Month, Months mod 12);
  if Month < 1 then begin
    Inc(Month, 12);
    Dec(Year);
  end
  else if Month > 12 then begin
    Dec(Month, 12);
    Inc(Year);
  end;

  Julian := DMYtoStDate(Day, Month, Year);
  if Julian <> BadDate then begin
    Inc(Julian, Days);
    Inc(Julian, Day28Delta);
  end;
  Result := Julian;
end;

function IncDateTrunc(Julian : TStDate; Months, Years : Integer) : TStDate;
  {-Add (or subtract) the specified number of months and years to a date}
var
  Day, Month, Year : Integer;
  MaxDay, Day28Delta : Integer;
begin
  StDateToDMY(Julian, Day, Month, Year);
  Day28Delta := Day-28;
  if Day28Delta < 0 then
    Day28Delta := 0
  else
    Day := 28;

  Inc(Year, Years);
  Inc(Year, Months div 12);
  Inc(Month, Months mod 12);
  if Month < 1 then begin
    Inc(Month, 12);
    Dec(Year);
  end
  else if Month > 12 then begin
    Dec(Month, 12);
    Inc(Year);
  end;

  Julian := DMYtoStDate(Day, Month, Year);
  if Julian <> BadDate then begin
    MaxDay := DaysInMonth(Month, Year);
    if Day+Day28Delta > MaxDay then
      Inc(Julian, MaxDay-Day)
    else
      Inc(Julian, Day28Delta);
  end;
  Result := Julian;
end;

procedure DateDiff(Date1, Date2 : TStDate; var Days, Months, Years : Integer);
  {-Return the difference in days,months,years between two valid julian dates}
var
  Day1, Day2, Month1, Month2, Year1, Year2 : Integer;
begin
  {we want Date2 > Date1}
  if Date1 > Date2 then
    ExchangeLongInts(Date1, Date2);

  {convert dates to day,month,year}
  StDateToDMY(Date1, Day1, Month1, Year1);
  StDateToDMY(Date2, Day2, Month2, Year2);

  {days first}
  if Day2 < Day1 then begin
    Dec(Month2);
    if Month2 = 0 then begin
      Month2 := 12;
      Dec(Year2);
    end;
    Inc(Day2, DaysInMonth(Month2, Year2));
  end;
  Days := Day2-Day1;

  {now months and years}
  if Month2 < Month1 then begin
    Inc(Month2, 12);
    Dec(Year2);
  end;
  Months := Month2-Month1;
  Years := Year2-Year1;
end;

function BondDateDiff(Date1, Date2 : TStDate; DayBasis : TStBondDateType) : TStDate;
  {-Return the difference in days between two valid Julian
    dates using one a specific accrual method}
var
  Day1,
  Month1,
  Year1,
  Day2,
  Month2,
  Year2       : Integer;
  IY          : LongInt;                                               {!!.03}
begin
  {we want Date2 > Date1}
  if Date1 > Date2 then
    ExchangeLongInts(Date1, Date2);

  if (DayBasis = bdtActual) then
    Result := Date2-Date1
  else
  begin
    StDateToDMY(Date1, Day1, Month1, Year1);
    StDateToDMY(Date2, Day2, Month2, Year2);

    if (Day1 = 31) then
      Day1 := 30;
    if (DayBasis = bdt30E360) then
    begin
      if (Day2 = 31) then
        Day2 := 30
    end else
      if (Day2 = 31) and (Day1 >= 30) then
        Day2 := 30;

    IY := 360 * (Year2 - Year1);                                       {!!.03}
    Result := IY + 30 * (Month2 - Month1) + (Day2 - Day1);             {!!.03}
  end;
end;

function DayOfWeek(Julian : TStDate) : TStDayType;
  {-Return the day of the week for the date. Returns TStDayType(7) if Julian =
    BadDate.}
var
  B : Byte;
begin
  if Julian = BadDate then begin
    B := 7;
    Result := TStDayType(B);
  end else
    Result := TStDayType((Julian+Ord(FirstDayOfWeek)) mod 7 );
end;

function DayOfWeek(aDate: TDateTime) : TStDayType;
begin
 Result := DayOfWeek(DateTimeToStDate(aDate));
end;

function DayOfWeekDMY(Day, Month, Year : Integer) : TStDayType;
  {-Return the day of the week for the day, month, year}
begin
  Result := DayOfWeek( DMYtoStDate(Day, Month, Year));
end;

procedure StTimeToHMS(T : TStTime; var Hours, Minutes, Seconds : Integer);
  {-Convert a Time variable to Hours, Minutes, Seconds}
begin
  if T = BadTime then begin
    Hours := 0;
    Minutes := 0;
    Seconds := 0;
  end
  else begin
    Hours := T div SecondsInHour;
    Dec(T, LongInt(Hours)*SecondsInHour);
    Minutes := T div SecondsInMinute;
    Dec(T, LongInt(Minutes)*SecondsInMinute);
    Seconds := T;
  end;
end;

function HMStoStTime(Hours, Minutes, Seconds : Integer) : TStTime;
  {-Convert Hours, Minutes, Seconds to a Time variable}
var
  T : TStTime;
begin
  Hours := Hours mod HoursInDay;
  T := (LongInt(Hours)*SecondsInHour)+(LongInt(Minutes)*SecondsInMinute)+Seconds;
  Result := T mod SecondsInDay;
end;

function ValidTime(Hours, Minutes, Seconds : Integer) : Boolean;
  {-Return true if Hours:Minutes:Seconds is a valid time}
begin
  if (Hours < 0)   or (Hours > 23) or
     (Minutes < 0) or (Minutes >= 60) or
     (Seconds < 0) or (Seconds >= 60) then
    Result := False
  else
    Result := True;
end;

function CurrentTime : TStTime;
  {-Returns current time in seconds since midnight}
begin
  Result := Trunc(SysUtils.Time * SecondsInDay);
end;

procedure TimeDiff(Time1, Time2 : TStTime; var Hours, Minutes, Seconds : Integer);
  {-Return the difference in hours,minutes,seconds between two times}
begin
  StTimeToHMS(Abs(Time1-Time2), Hours, Minutes, Seconds);
end;

function IncTime(T : TStTime; Hours, Minutes, Seconds : Integer) : TStTime;
  {-Add the specified hours,minutes,seconds to T and return the result}
begin
  Inc(T, HMStoStTime(Hours, Minutes, Seconds));
  Result := T mod SecondsInDay;
end;

function DecTime(T : TStTime; Hours, Minutes, Seconds : Integer) : TStTime;
  {-Subtract the specified hours,minutes,seconds from T and return the result}
begin
  Hours := Hours mod HoursInDay;
  Dec(T, HMStoStTime(Hours, Minutes, Seconds));
  if T < 0 then
    Result := T+SecondsInDay
  else
    Result := T;
end;

function RoundToNearestHour(T : TStTime; Truncate : Boolean) : TStTime;
  {-Round T to the nearest hour, or Truncate minutes and seconds from T}
var
  Hours, Minutes, Seconds : Integer;
begin
  StTimeToHMS(T, Hours, Minutes, Seconds);
  Seconds := 0;
  if not Truncate then
    if Minutes >= (MinutesInHour div 2) then
      Inc(Hours);
  Minutes := 0;
  Result := HMStoStTime(Hours, Minutes, Seconds);
end;

function RoundToNearestMinute(const T : TStTime; Truncate : Boolean) : TStTime;
  {-Round T to the nearest minute, or Truncate seconds from T}
var
  Hours, Minutes, Seconds : Integer;
begin
  StTimeToHMS(T, Hours, Minutes, Seconds);
  if not Truncate then
    if Seconds >= (SecondsInMinute div 2) then
      Inc(Minutes);
  Seconds := 0;
  Result := HMStoStTime(Hours, Minutes, Seconds);
end;

function CompareStDateTime(DT1, DT2 : TStDateTimeRec) : Integer;
 Begin
  If DT1.D < DT2.D
   then Result := -1
   else
    If DT1.D = DT2.D
     then
      Begin
       If DT1.T < DT2.T
        then
         Result := -1
        else
         If DT1.T = DT2.T
          then Result := 0
          else Result := 1;
      end
     else
      Result := 1;

 end;

function CurrentDateTime : TStDateTimeRec;
  {-returns today's Date and Time}
 Begin
  Try
   Result.D := CurrentDate;
  except
   Result.D := CurrentDate;
  end;

  Result.T := CurrentTime;
 end;

procedure DateTimeDiff(DT1 : TStDateTimeRec; var DT2 : TStDateTimeRec;
                       var Days : LongInt; var Secs : LongInt);
  {-Return the difference in days and seconds between two points in time}
var
  tDT1, tDT2 : TStDateTimeRec;
begin
  tDT1 := DT1;
  tDT2 := DT2;
  {swap if tDT1 later than tDT2}
  if (tDT1.D > tDT2.D) or ((tDT1.D = tDT2.D) and (tDT1.T > tDT2.T)) then
    ExchangeStructs(tDT1, tDT2,sizeof(TStDateTimeRec));

  {the difference in days is easy}
  Days := tDT2.D-tDT1.D;

  {difference in seconds}
  if tDT2.T < tDT1.T then begin
    {subtract one day, add 24 hours}
    Dec(Days);
    Inc(tDT2.T, SecondsInDay);
  end;
  Secs := tDT2.T-tDT1.T;
end;

function DateTimeToStDate(DT : TDateTime) : TStDate;
  {-Convert Delphi TDateTime to TStDate}
//var
//  Day, Month, Year : Word;
begin
 If DT = NullDate then 
  Result := 0
 else
  If DT = BadDateTime then
   Result := BadDate
  else
   Result := Trunc(DT) + StDate_DateTime_Delta;  
   //begin
   // DecodeDate(DT, Year, Month, Day);
   // Result := DMYToStDate(Day, Month, Year);
   //end     
end;

function DateTimeToStTime(DT : TDateTime) : TStTime;
  {-Convert Delphi TDateTime to TStTime}
var
  Hour, Min, Sec, MSec : Word;
begin
   If DT <> BadDateTime
   then
  begin
     DecodeTime(DT, Hour, Min, Sec, MSec);
     Result := HMSToStTime(Hour, Min, Sec);
  end
  else
   Result := BadTime;
end;

function StDateToDateTime(D : TStDate) : TDateTime;
  {-Convert TStDate to TDateTime}
//var
//  Day, Month, Year : Integer;
begin
  {Result := 0;}
  If D = 0 then
   Result := NullDate
  else
  if D = BadDate then
   Result := BadDateTime
  else
  begin
   Result := D - StDate_DateTime_Delta;
  // StDateToDMY(D, Day, Month, Year);
  // Result := EncodeDate(Year, Month, Day);
  end
end;

function StTimeToDateTime(T : TStTime) : TDateTime;
  {-Convert TStTime to TDateTime}
var
  Hour, Min, Sec   : Integer;
begin
  {Result := 0;}
  if T <> BadTime then
   begin
    StTimeToHMS(T, Hour, Min, Sec);
    Result := EncodeTime(Hour, Min, Sec, 0);
   end
  else Result := BadDateTime;
end;

function StDateTimeRecToDateTime(const TD : TStDateTimeRec) : TDateTime;
begin
 Result := StDateToDateTime(TD.D) + StTimeToDateTime(TD.T);
end;

function DateTimeToStDateTimeRec(const TD : TDateTime) : TStDateTimeRec;
begin
 Result.D := DateTimeToStDate(TD);
 Result.T := DateTimeToStTime(TD);
end;

procedure IncDateTime(DT1 : TStDateTimeRec; var DT2 : TStDateTimeRec; Days : Integer; Secs : LongInt);
  {-Increment (or decrement) DT1 by the specified number of days and seconds
    and put the result in DT2}
begin
  DT2 := DT1;

  {date first}
  Inc(DT2.D, LongInt(Days));

  if Secs < 0 then begin
    {change the sign}
    Secs := -Secs;

    {adjust the date}
    Dec(DT2.D, Secs div SecondsInDay);
    Secs := Secs mod SecondsInDay;

    if Secs > DT2.T then begin
      {subtract a day from DT2.D and add a day's worth of seconds to DT2.T}
      Dec(DT2.D);
      Inc(DT2.T, SecondsInDay);
    end;

    {now subtract the seconds}
    Dec(DT2.T, Secs);
  end
  else begin
    {increment the seconds}
    Inc(DT2.T, Secs);

    {adjust date if necessary}
    Inc(DT2.D, DT2.T div SecondsInDay);

    {force time to 0..SecondsInDay-1 range}
    DT2.T := DT2.T mod SecondsInDay;
  end;
end;

function Convert2ByteDate(TwoByteDate : Word) : TStDate;
begin
  Result := LongInt(TwoByteDate) + Date1900;
end;

function Convert4ByteDate(FourByteDate : TStDate) : Word;
begin
  Result := Word(FourByteDate - Date1900);
end;

procedure SetDefaultYear;
  {-Initialize DefaultYear and DefaultMonth}
var
 lSysTime : TSystemTime;
begin
 GetLocalTime(lSysTime);
 with lSysTime do
 begin
  DefaultYear := wYear;
  DefaultMonth := wMonth;
 end;
end;

function NormDate(DateValue, DefaultValue: TDateTime): TDateTime;
 begin
  If (DateValue = NullDate) or (DateValue = BadDateTime) then
   Result := DefaultValue
  else
   Result := DateValue;
 end;

function DemonToStDate(Julian : TStDate) : TStDate;
 begin
  Result := Julian;
  If Julian = 0 then Result := BadDate;
 end;

function StDateToDemon(Julian : TStDate) : TStDate;
begin
 Result := Julian;
 if Julian = BadDate then
  Result := 0;
end;

function GetDateOrder(const DateFormat: string): TDateOrder;
var
  I: Integer;
begin
  Result := DefaultDateOrder;
  I := 1;
  while I <= Length(DateFormat) do begin
    case Chr(Ord(DateFormat[I]) and $DF) of
{$IFDEF Delphi3}
      'E': Result := doYMD;
{$ENDIF}
      'Y': Result := doYMD;
      'M': Result := doMDY;
      'D': Result := doDMY;
    else
      Inc(I);
      Continue;
    end;
    Exit;
  end;
  Result := DefaultDateOrder; { default }
end;

function DefDateFormat(FourDigitYear: Boolean): string;
begin
  if FourDigitYear then begin
    case GetDateOrder({$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat) of
      doMDY: Result := 'MM/DD/YYYY';
      doDMY: Result := 'DD/MM/YYYY';
      doYMD: Result := 'YYYY/MM/DD';
    end;
  end
  else begin
    case GetDateOrder({$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat) of
      doMDY: Result := 'MM/DD/YY';
      doDMY: Result := 'DD/MM/YY';
      doYMD: Result := 'YY/MM/DD';
    end;
  end;
end;

{$IFDEF Delphi3}
procedure ScanToNumber(const S: string; var Pos: Integer);
begin
  while (Pos <= Length(S)) and not (S[Pos] in ['0'..'9']) do begin
    if S[Pos] in LeadBytes then Inc(Pos);
    Inc(Pos);
  end;
end;
{$ENDIF}

procedure ScanBlanks(const S: string; var Pos: Integer);
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(S)) and (S[I] = ' ') do Inc(I);
  Pos := I;
end;

function ScanNumber(const S: string; MaxLength: Integer; var Pos: Integer;
  var Number: Longint): Boolean;
var
  I: Integer;
  N: Word;
begin
  Result := False;
  ScanBlanks(S, Pos);
  I := Pos;
  N := 0;
  while (I <= Length(S)) and (Longint(I - Pos) < MaxLength) and
    (S[I] in ['0'..'9']) and (N < 1000) do
  begin
    N := N * 10 + (Ord(S[I]) - Ord('0'));
    Inc(I);
  end;
  if I > Pos then begin
    Pos := I;
    Number := N;
    Result := True;
  end;
end;

function ScanChar(const S: string; var Pos: Integer; Ch: Char): Boolean;
begin
  Result := False;
  ScanBlanks(S, Pos);
  if (Pos <= Length(S)) and (S[Pos] = Ch) then begin
    Inc(Pos);
    Result := True;
  end;
end;

function ExpandYear(Year: Integer): Integer;
var
  N: Longint;
begin
  Result := Year;
  if Result < 100 then begin
    N := CurrentYear - CenturyOffset;
    Inc(Result, N div 100 * 100);
    if (CenturyOffset > 0) and (Result < N) then
      Inc(Result, 100);
  end;
end;

function ScanDate(const S, DateFormat: string; var Pos: Integer;
  var Y, M, D: Integer): Boolean;
var
  DateOrder: TDateOrder;
  N1, N2, N3: Longint;
begin
  Result := False;
  Y := 0; M := 0; D := 0;
  DateOrder := GetDateOrder(DateFormat);
{$IFDEF Delphi3}
  if {$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat[1] = 'g' then { skip over prefix text }
    ScanToNumber(S, Pos);
{$ENDIF Delphi3}
  if not (ScanNumber(S, MaxInt, Pos, N1) and ScanChar(S, Pos, {$ifDef XE}FormatSettings.{$EndIf}DateSeparator) and
    ScanNumber(S, MaxInt, Pos, N2)) then Exit;
  if ScanChar(S, Pos, {$ifDef XE}FormatSettings.{$EndIf}DateSeparator) then begin
    if not ScanNumber(S, MaxInt, Pos, N3) then Exit;
    case DateOrder of
      doMDY: begin Y := N3; M := N1; D := N2; end;
      doDMY: begin Y := N3; M := N2; D := N1; end;
      doYMD: begin Y := N1; M := N2; D := N3; end;
    end;
    Y := ExpandYear(Y);
  end
  else begin
    Y := CurrentYear;
    if DateOrder = doDMY then begin
      D := N1; M := N2;
    end
    else begin
      M := N1; D := N2;
    end;
  end;
  ScanChar(S, Pos, {$ifDef XE}FormatSettings.{$EndIf}DateSeparator);
  ScanBlanks(S, Pos);
{$IFDEF Delphi3}
  if SysLocale.FarEast and (System.Pos('ddd', {$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat) <> 0) then
  begin { ignore trailing text }
    if {$ifDef XE}FormatSettings.{$EndIf}ShortTimeFormat[1] in ['0'..'9'] then  { stop at time digit }
      ScanToNumber(S, Pos)
    else  { stop at time prefix }
      repeat
        while (Pos <= Length(S)) and (S[Pos] <> ' ') do Inc(Pos);
        ScanBlanks(S, Pos);
      until (Pos > Length(S)) or
        (AnsiCompareText({$ifDef XE}FormatSettings.{$EndIf}TimeAMString, Copy(S, Pos, Length({$ifDef XE}FormatSettings.{$EndIf}TimeAMString))) = 0) or
        (AnsiCompareText({$ifDef XE}FormatSettings.{$EndIf}TimePMString, Copy(S, Pos, Length({$ifDef XE}FormatSettings.{$EndIf}TimePMString))) = 0);
  end;
{$ENDIF Delphi3}
  Result := ValidDate(D, M, Y) and (Pos > Length(S));
end;

function MonthFromName(const S: string; MaxLen: Byte): Byte;
begin
  if Length(S) > 0 then
    for Result := 1 to 12 do begin
      if (Length({$ifDef XE}FormatSettings.{$EndIf}LongMonthNames[Result]) > 0) and
        (AnsiCompareText(Copy(S, 1, MaxLen),
        Copy({$ifDef XE}FormatSettings.{$EndIf}LongMonthNames[Result], 1, MaxLen)) = 0) then Exit;
    end;
  Result := 0;
end;

function ExtractMask(const Format, S: AnsiString; Ch: AnsiChar; Cnt: Integer;
  var I: Integer; Blank, Default: Integer): boolean;
var
  Tmp: string[20];
  J, L: Integer;
begin
  // возвращает True, если все знакоместа заполнены
  Result := False; 
  I := Default;
  Ch := UpCase(Ch);
  L := Length(Format);
  if Length(S) < L then L := Length(S)
  else if Length(S) > L then Exit;
  J := Pos(ev_psFixLen('', Cnt, Ch), AnsiUpperCase(Format));
  if J <= 0 then Exit;
  Tmp := '';
  Result := True;
  while (UpCase(Format[J]) = Ch) and (J <= L) do begin
    if S[J] <> ' ' then Tmp := Tmp + S[J]
    else
      Result := False;
    Inc(J);
  end;
  if Tmp = '' then
   I := Blank
  else if Cnt > 1 then begin
    I := MonthFromName(Tmp, Length(Tmp));
    if I = 0 then I := -1;
  end
  else I := StrToIntDef(Tmp, -1);
end;

function ScanDateStr(const Format, S: string; var D, M, Y: Integer): Boolean;
var
  Pos: Integer;
begin
  ExtractMask(Format, S, 'm', 3, M, -1, 0); { short month name? }
  if M = 0 then ExtractMask(Format, S, 'm', 1, M, -1, 0);
  ExtractMask(Format, S, 'd', 1, D, -1, 1);
  ExtractMask(Format, S, 'y', 1, Y, CurrentYear, CurrentYear);
  Y := ExpandYear(Y);
  Result := ValidDate(D, M, Y);
  if not Result then begin
    Pos := 1;
    Result := ScanDate(S, Format, Pos, Y, M, D);
  end;
end;

function InternalStrToDate(const DateFormat, S: string;
  var Date: TDateTime): Boolean;
var
  D, M, Y: Integer;
begin
  if S = '' then begin
    Date := NullDate;
    Result := True;
  end
  else begin
    Result := ScanDateStr(DateFormat, S, D, M, Y);
    if Result then
    try
      Date := EncodeDate(Y, M, D);
    except
      Result := False;
    end;
  end;
end;

function StrToDateFmt(const DateFormat, S: string): TDateTime;
begin
  if not InternalStrToDate(DateFormat, S, Result) then
    raise EConvertError.Create(s);
end;

function StrToDateDef(const S: string; Default: TDateTime): TDateTime;
begin
  if not InternalStrToDate({$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat, S, Result) then
    Result := Trunc(Default);
end;

function StrToDateFmtDef(const DateFormat, S: string; Default: TDateTime): TDateTime;
begin
  if not InternalStrToDate(DateFormat, S, Result) then
    Result := Trunc(Default);
end;

function l3CorrectDate(const Format, S: string): string;
var
 D, M, Y : Integer;
 l_Temp  : Integer;
begin
 // корректирует количество дней в месяце
 ScanDateStr(Format, S, D, M, Y);
 Result := S;
 if M > 12 then
  M := 12;
 if M < 1 then
  M := 1;
 if D < 1 then
  D := 1
 else
 begin
  l_Temp := DaysInMonth(M, Y);
  if D > l_Temp then
   D := l_Temp;
 end;
 Result := FormatDateTime(Format, EncodeDate(Y, M, D));
end;

function IsDateFullyFilled(const Format, S: string): boolean;
var
 D, M, Y: Integer;
 YearFull,
 MonthFull,
 DayFull: boolean;
begin
 MonthFull := ExtractMask(Format, S, 'm', 3, M, -1, 0); { short month name? }
 if M = 0 then
   MonthFull := ExtractMask(Format, S, 'm', 1, M, -1, 0);
 DayFull := ExtractMask(Format, S, 'd', 1, D, -1, 1);
 YearFull := ExtractMask(Format, S, 'y', 1, Y, 1904, CurrentYear);
 YearFull := YearFull and (Y >= MinYear) and (Y <= MaxYear);
 Result := YearFull and MonthFull and DayFull;
end;

function isDateHalfValid(const Format, S: string): boolean;
var
  D, M, Y: Integer;
  MonthFull,
  DayFull: boolean;

  function HasThreeDigits(Year: Integer): boolean;
  begin
    Result :=  ((Year div 100) > 0) and ((Year div 1000) = 0);
  end;

begin
  MonthFull := ExtractMask(Format, S, 'm', 3, M, -1, 0); { short month name? }
  if M = 0 then
    MonthFull := ExtractMask(Format, S, 'm', 1, M, -1, 0);
  DayFull := ExtractMask(Format, S, 'd', 1, D, -1, 1);
  ExtractMask(Format, S, 'y', 1, Y, 1904, CurrentYear);
  Y := ExpandYear(Y);
  Result := false;

  if not HasThreeDigits(Y) and ((Y < MinYear) or (Y > MaxYear)) then
   exit;

  if (D = -1) and (M = -1) then
  begin
   Result := true;
   exit;
  end;

  if (D = -1) or ((D = 0) and not DayFull) then
  begin
   Result := ((M >= 1) and (M <= 12)) or ((M = 0) and not MonthFull) or (M = -1);
   exit;
  end;

  if (M = -1) or ((M = 0) and not MonthFull) then
  begin
   Result := ((D >= 1) and (D <= 31)) or ((D=0) and not DayFull);
   exit;
  end;

  Result := (M >=1) and (M <= 12) and (D >= 1);
  if HasThreeDigits(Y) then
   Result := Result and (D <= 31)
  else
   Result := Result and (D <= DaysInMonth(M, Y))
end;

function CurrentYear: Word; {$IFNDEF WIN32} assembler; {$ENDIF}
{$IFDEF WIN32}
var
  SystemTime: TSystemTime;
begin
  GetLocalTime(SystemTime);
  Result := SystemTime.wYear;
end;
{$ELSE}
asm
        MOV     AH,2AH
        INT     21H
        MOV     AX,CX
end;
{$ENDIF}

function DefDateMask(BlanksChar: Char; FourDigitYear: Boolean): string;
begin
  if FourDigitYear then begin
    case GetDateOrder({$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat) of
      doMDY, doDMY: Result := '!99/99/9999;1;';
      doYMD: Result := '!9999/99/99;1;';
    end;
  end
  else begin
    case GetDateOrder({$ifDef XE}FormatSettings.{$EndIf}ShortDateFormat) of
      doMDY, doDMY: Result := '!99/99/99;1;';
      doYMD: Result := '!99/99/99;1;';
    end;
  end;
  if Result <> '' then Result := Result + BlanksChar;
end;

function MakeDateBounds(aLowBound, aHighBound : TStDate) : Tl3DateBounds;
begin
 with Result do
 begin
  Low  := aLowBound;
  High := aHighBound;
 end;

 { Граница может отсутствовать   aHighBound = 0
 with Result do
  if aLowBound < aHighBound then
  begin
   Low  := aLowBound;
   High := aHighBound;
  end
  else
  begin
   Low  := aHighBound;
   High := aLowBound;
  end }
end;

function MakeDemonDateBounds(aLowBound, aHighBound : TStDate) : Tl3DateBounds;
begin
 Result := MakeDateBounds(aLowBound, aHighBound);
 with Result do
 begin
  If Low < 1 then Low := 1;
  If High < 1 then High := MaxDate;
 end;
end;

function DateInBounds(aDate : TStDate; aBound : Tl3DateBounds) : Boolean;
begin
 Result := (aBound.Low <= aDate) and (aDate <= aBound.High);
end;

function IsDateBoundsIntersected(aBound1 : Tl3DateBounds; aBound2 : Tl3DateBounds) : Boolean;
begin
 Result := not ((aBound1.High < aBound2.Low) or (aBound1.Low > aBound2.High));
end;

function DateTimeToDtDate(aDate: TDateTime): Integer;
begin
 Result := StDateToDemon(DateTimeToStDate(aDate));
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('l3Date.pas initialization enter'); {$EndIf}
  {initialize DefaultYear and DefaultMonth}
  SetDefaultYear;
  // Всегда четыре цифры в годе (иначе все отъезжает на NT)
  FourDigitYear := True; {Pos('YYYY', AnsiUpperCase(ShortDateFormat)) > 0;}

{!touched!}{$IfDef LogInit} WriteLn('l3Date.pas initialization leave'); {$EndIf}
end.
