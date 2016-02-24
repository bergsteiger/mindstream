unit l3CustomString;
{$Include l3Define.inc}

interface

uses
  l3Interfaces,
  l3Types,
  l3Variant,
  Classes,
  l3IID
  ;

type
 Tl3CustomString = {abstract} class(Tl3PrimString)
  {* Базовый класс для "строк". Определяет операции и свойства, но не способ хранения данных. }
 private
 // private methods
   class procedure L3SayConstString;
     {* Сигнатура метода l3SayConstString }
 protected
 // property methods
   function pm_GetSt: PAnsiChar;
   function pm_GetLen: Integer; virtual;
   procedure pm_SetLen(aValue: Integer); virtual;
   function pm_GetCodePage: Integer;
   procedure pm_SetCodePage(aValue: Integer);
   function pm_GetIsOEM: Boolean;
   function pm_GetIsOEMEx: Boolean;
   function pm_GetIsANSI: Boolean;
   function pm_GetAsPCharLen: Tl3PCharLen;
   procedure pm_SetAsPCharLen(const aValue: Tl3PCharLen);
   function pm_GetFirst: AnsiChar;
   function pm_GetLast: AnsiChar;
   function pm_GetCh(aPos: Integer): AnsiChar;
   procedure pm_SetCh(aPos: Integer; aValue: AnsiChar);
   function pm_GetRTrimLen: Integer;
   function pm_GetLTrimLen: Integer;
   function pm_GetAsChar: AnsiChar;
   procedure pm_SetAsChar(aValue: AnsiChar);
   function pm_GetAsPWideChar: PWideChar;
   procedure pm_SetAsPWideChar(aValue: PWideChar);
   function pm_GetAsWideString: WideString;
   procedure pm_SetAsWideString(const aValue: WideString);
 protected
 // overridden protected methods
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
 public
 // overridden public methods
   procedure Assign(Source: TPersistent); override;
   function COMQueryInterface(const IID: Tl3GUID;
    out Obj): Tl3HResult; override;
     {* Реализация запроса интерфейса }
 protected
 // protected methods
   procedure DoSetCodePage(aValue: Integer); virtual;
   procedure CheckUnicode;
     {* Сигнатура метода CheckUnicode }
 public
 // public methods
   function Offset(Delta: Integer): Tl3CustomString; virtual;
   function AssignSt(aSt: PAnsiChar;
     O1: Integer;
     O2: Integer;
     aCodePage: Integer): Tl3CustomString;
   procedure LPad(aCh: AnsiChar;
     aCodePage: Integer = CP_ANSI;
     aRepeat: Integer = 1);
     {* добавляет к строке слева символ aCh aRepeat раз }
   procedure Append(const aSt: Tl3WString;
     aRepeat: Integer = 1); overload;  virtual;
     {* добавляет строку aSt к данной строке aRepeat раз }
   procedure Append(const aCh: Tl3Char;
     aRepeat: Integer = 1); overload; 
     {* добавляет символ aCh к данной строке aRepeat раз }
   procedure Append(aCh: AnsiChar;
     aRepeat: Integer = 1;
     aCodePage: Integer = CP_ANSI); overload; 
     {* добавляет символ aCh к данной строке aRepeat раз }
   procedure Insert(const aSt: Tl3WString;
     aPos: Integer;
     aRepeat: Integer = 1); overload;  virtual;
     {* вставляет строку aSt в позицию aPos, aRepeat раз }
   procedure Insert(aCh: AnsiChar;
     aPos: Integer;
     aRepeat: Integer = 1); overload; 
     {* вставляет символ aCh в позицию aPos, aRepeat раз }
   procedure Insert(S: Tl3CustomString;
     aPos: Integer;
     aRepeat: Integer = 1); overload; 
     {* вставляет строку S в позицию aPos, aRepeat раз }
   function Trim: Tl3CustomString;
     {* удаляет конечные и начальные пробелы }
   function TrimAll: Tl3CustomString;
     {* удаляет конечные, начальные и дублирующиеся пробелы }
   procedure LTrim; virtual;
     {* удаляет из строки ведущие пробелы }
   function RTrim: Tl3CustomString;
     {* удаляет из строки конечные пробелы }
   procedure TrimEOL;
     {* удаляет из строки конечные cc_SoftEnter и cc_HardEnter }
   function DeleteDoubleSpace: Tl3CustomString; virtual;
     {* удаляет из строки дублирующиеся пробелы }
   function DeleteAllChars(aChar: AnsiChar): Integer;
     {* удаляет из строки все символы aChar и возвращает количество удаленных }
   function ReplaceNonReadable: Tl3CustomString; virtual;
     {* заменяет "нечитаемые" символы пробелами }
   function FindChar(Pos: Integer;
     C: AnsiChar): Integer;
     {* ищет символ в строке с позиции Pos и возвращает позицию найденного символа или -1 }
   procedure FindCharEx(C: AnsiChar;
     aSt: Tl3CustomString);
   function Indent: Integer;
   procedure MakeBMTable(var BT: Tl3BMTable);
     {* создает таблицу Boyer-Moore для строки }
   function BMSearch(S: Tl3CustomString;
     BT: Tl3BMTable;
     var Pos: Cardinal): Boolean;
     {* ищет данную строку в строке S с учетом регистра }
   function BMSearchUC(S: Tl3CustomString;
     BT: Tl3BMTable;
     var Pos: Cardinal): Boolean;
     {* ищет данную строку в строке S без учета регистра
ВНИМАНИЕ! Для успешного поиска без учёта регистра подстрока (S) должна быть в ВЕРХНЕМ РЕГИСТРЕ!
И таблица (BT) должна быть построена для этой строки в верхнем регистре! }
   procedure MakeUpper;
     {* преобразует строку к верхнему регистру }
   procedure MakeLower;
     {* преобразует строку к нижнему регистру }
   function Delete(aPos: Integer;
     aCount: Integer): PAnsiChar; virtual;
     {* удаляет aCount символов с позиции aPos }
   procedure SetSt(aStr: PAnsiChar;
     aLen: Integer = -1);
     {* присваивает новое значение строке, считая, что aStr имеет ту же кодировку, что и строка }
   function JoinWith(P: Tl3PrimString): Integer; virtual;
     {* операция объединения двух объектов }
 public
 // public properties
   property St: PAnsiChar
     read pm_GetSt;
   property Len: Integer
     read pm_GetLen
     write pm_SetLen;
   property CodePage: Integer
     read pm_GetCodePage
     write pm_SetCodePage;
   property IsOEM: Boolean
     read pm_GetIsOEM;
   property IsOEMEx: Boolean
     read pm_GetIsOEMEx;
   property IsANSI: Boolean
     read pm_GetIsANSI;
   property AsPCharLen: Tl3PCharLen
     read pm_GetAsPCharLen
     write pm_SetAsPCharLen;
   property First: AnsiChar
     read pm_GetFirst;
   property Last: AnsiChar
     read pm_GetLast;
   property Ch[aPos: Integer]: AnsiChar
     read pm_GetCh
     write pm_SetCh;
   property RTrimLen: Integer
     read pm_GetRTrimLen;
   property LTrimLen: Integer
     read pm_GetLTrimLen;
   property AsChar: AnsiChar
     read pm_GetAsChar
     write pm_SetAsChar;
   property AsPWideChar: PWideChar
     read pm_GetAsPWideChar
     write pm_SetAsPWideChar;
   property AsWideString: WideString
     read pm_GetAsWideString
     write pm_SetAsWideString;
 end;//Tl3CustomString

implementation

uses
  l3BMSearch,
  SysUtils,
  l3Base,
  l3String,
  l3StringEx,
  l3Memory,
  l3StringAdapter,
  l3Chars
  ;

// start class Tl3CustomString

class procedure Tl3CustomString.L3SayConstString;
//#UC START# *54C68EF4028F_4773DEF0021B_var*
//#UC END# *54C68EF4028F_4773DEF0021B_var*
begin
//#UC START# *54C68EF4028F_4773DEF0021B_impl*
 raise Exception.Create('Данный тип строки не может быть модифицирован');
//#UC END# *54C68EF4028F_4773DEF0021B_impl*
end;//Tl3CustomString.L3SayConstString

function Tl3CustomString.Offset(Delta: Integer): Tl3CustomString;
//#UC START# *4E568A7E0120_4773DEF0021B_var*
var
 l_S: Tl3WString;  
//#UC END# *4E568A7E0120_4773DEF0021B_var*
begin
//#UC START# *4E568A7E0120_4773DEF0021B_impl*
 l_S := AsWStr;
 AsWStr := l3PCharLen(l_S.S + Delta, l_S.SLen - Delta, l_S.SCodePage);
 Result := Self;
//#UC END# *4E568A7E0120_4773DEF0021B_impl*
end;//Tl3CustomString.Offset

procedure Tl3CustomString.DoSetCodePage(aValue: Integer);
//#UC START# *4E568AB6016C_4773DEF0021B_var*
//#UC END# *4E568AB6016C_4773DEF0021B_var*
begin
//#UC START# *4E568AB6016C_4773DEF0021B_impl*
//#UC END# *4E568AB6016C_4773DEF0021B_impl*
end;//Tl3CustomString.DoSetCodePage

procedure Tl3CustomString.CheckUnicode;
//#UC START# *54C6388203A0_4773DEF0021B_var*
const
 cCodePages : array [0..7] of Integer = (CP_RussianWin, CP_EastEurope, CP_Greek, CP_Turkish, CP_WesternWin, CP_Tatar, CP_TatarOEM, CP_RussianDOS);
var
 l_Index: Integer;
 l_S: Tl3Str;
 l_W: Tl3WString;
//#UC END# *54C6388203A0_4773DEF0021B_var*
begin
//#UC START# *54C6388203A0_4773DEF0021B_impl*
 l_W := GetAsPCharLen;
 if (l_W.SCodePage = CP_Unicode) then
 begin
  for l_Index := Low(cCodePages) to High(cCodePages) do
  begin
   l_S.Init(l_W, cCodePages[l_Index]);
   try
    if l3Same(l_W, l_S) then
    begin
     CodePage := cCodePages[l_Index];
     break;
    end;//l3Same(l_S, l_S)
   finally
    l_S.Clear;
   end;//try..finally
  end;//for l_Index
 end;//l_W.SCodePage = CP_Unicode
//#UC END# *54C6388203A0_4773DEF0021B_impl*
end;//Tl3CustomString.CheckUnicode

function Tl3CustomString.AssignSt(aSt: PAnsiChar;
  O1: Integer;
  O2: Integer;
  aCodePage: Integer): Tl3CustomString;
//#UC START# *54C639280275_4773DEF0021B_var*
var
 L : Integer;
//#UC END# *54C639280275_4773DEF0021B_var*
begin
//#UC START# *54C639280275_4773DEF0021B_impl*
 if (O2 > O1) then L := O2 - O1 else L := 0;
 if aCodePage = CP_Unicode then
  O1 := O1 * SizeOf(WideChar);
 AsPCharLen := l3PCharLen(aSt + O1, L, aCodePage);
 Result := Self;
//#UC END# *54C639280275_4773DEF0021B_impl*
end;//Tl3CustomString.AssignSt

procedure Tl3CustomString.LPad(aCh: AnsiChar;
  aCodePage: Integer = CP_ANSI;
  aRepeat: Integer = 1);
//#UC START# *54C6397F033C_4773DEF0021B_var*
//#UC END# *54C6397F033C_4773DEF0021B_var*
begin
//#UC START# *54C6397F033C_4773DEF0021B_impl*
 Insert(l3PCharLen(@aCh, 1, aCodePage), 0, aRepeat);
//#UC END# *54C6397F033C_4773DEF0021B_impl*
end;//Tl3CustomString.LPad

procedure Tl3CustomString.Append(const aSt: Tl3WString;
  aRepeat: Integer = 1);
//#UC START# *54C639EC034A_4773DEF0021B_var*
//#UC END# *54C639EC034A_4773DEF0021B_var*
begin
//#UC START# *54C639EC034A_4773DEF0021B_impl*
//#UC END# *54C639EC034A_4773DEF0021B_impl*
end;//Tl3CustomString.Append

procedure Tl3CustomString.Append(const aCh: Tl3Char;
  aRepeat: Integer = 1);
//#UC START# *54C63A210201_4773DEF0021B_var*
//#UC END# *54C63A210201_4773DEF0021B_var*
begin
//#UC START# *54C63A210201_4773DEF0021B_impl*
 Append(l3PCharLen(@aCh.rWC, 1, aCh.rCodePage), aRepeat);
//#UC END# *54C63A210201_4773DEF0021B_impl*
end;//Tl3CustomString.Append

procedure Tl3CustomString.Append(aCh: AnsiChar;
  aRepeat: Integer = 1;
  aCodePage: Integer = CP_ANSI);
//#UC START# *54C63A550261_4773DEF0021B_var*
//#UC END# *54C63A550261_4773DEF0021B_var*
begin
//#UC START# *54C63A550261_4773DEF0021B_impl*
 Append(l3PCharLen(@aCh, 1, aCodePage), aRepeat);
//#UC END# *54C63A550261_4773DEF0021B_impl*
end;//Tl3CustomString.Append

procedure Tl3CustomString.Insert(const aSt: Tl3WString;
  aPos: Integer;
  aRepeat: Integer = 1);
//#UC START# *54C63A9901CE_4773DEF0021B_var*
//#UC END# *54C63A9901CE_4773DEF0021B_var*
begin
//#UC START# *54C63A9901CE_4773DEF0021B_impl*
 l3SayConstString;
//#UC END# *54C63A9901CE_4773DEF0021B_impl*
end;//Tl3CustomString.Insert

procedure Tl3CustomString.Insert(aCh: AnsiChar;
  aPos: Integer;
  aRepeat: Integer = 1);
//#UC START# *54C63AD303DA_4773DEF0021B_var*
//#UC END# *54C63AD303DA_4773DEF0021B_var*
begin
//#UC START# *54C63AD303DA_4773DEF0021B_impl*
 Insert(l3PCharLen(PAnsiChar(@aCh), 1), aPos, aRepeat);
//#UC END# *54C63AD303DA_4773DEF0021B_impl*
end;//Tl3CustomString.Insert

procedure Tl3CustomString.Insert(S: Tl3CustomString;
  aPos: Integer;
  aRepeat: Integer = 1);
//#UC START# *54C63AF80344_4773DEF0021B_var*
//#UC END# *54C63AF80344_4773DEF0021B_var*
begin
//#UC START# *54C63AF80344_4773DEF0021B_impl*
 if not S.Empty then
  Insert(S.AsPCharLen, aPos, aRepeat);
//#UC END# *54C63AF80344_4773DEF0021B_impl*
end;//Tl3CustomString.Insert

function Tl3CustomString.Trim: Tl3CustomString;
//#UC START# *54C63B82016A_4773DEF0021B_var*
//#UC END# *54C63B82016A_4773DEF0021B_var*
begin
//#UC START# *54C63B82016A_4773DEF0021B_impl*
 LTrim;
 Result := RTrim;
//#UC END# *54C63B82016A_4773DEF0021B_impl*
end;//Tl3CustomString.Trim

function Tl3CustomString.TrimAll: Tl3CustomString;
//#UC START# *54C63BA70371_4773DEF0021B_var*
//#UC END# *54C63BA70371_4773DEF0021B_var*
begin
//#UC START# *54C63BA70371_4773DEF0021B_impl*
 Result := Trim.DeleteDoubleSpace;
//#UC END# *54C63BA70371_4773DEF0021B_impl*
end;//Tl3CustomString.TrimAll

procedure Tl3CustomString.LTrim;
//#UC START# *54C63BCF01AC_4773DEF0021B_var*
//#UC END# *54C63BCF01AC_4773DEF0021B_var*
begin
//#UC START# *54C63BCF01AC_4773DEF0021B_impl*
 Assert(false);
//#UC END# *54C63BCF01AC_4773DEF0021B_impl*
end;//Tl3CustomString.LTrim

function Tl3CustomString.RTrim: Tl3CustomString;
//#UC START# *54C63BEF0044_4773DEF0021B_var*
//#UC END# *54C63BEF0044_4773DEF0021B_var*
begin
//#UC START# *54C63BEF0044_4773DEF0021B_impl*
 if not Empty then
 begin
  Len := l3RTrim(AsPCharLen).SLen;
  if Empty then Clear;
 end;//not Empty
 Result := Self;
//#UC END# *54C63BEF0044_4773DEF0021B_impl*
end;//Tl3CustomString.RTrim

procedure Tl3CustomString.TrimEOL;
//#UC START# *54C63C5E0104_4773DEF0021B_var*
//#UC END# *54C63C5E0104_4773DEF0021B_var*
begin
//#UC START# *54C63C5E0104_4773DEF0021B_impl*
 while (Len > 0) and (St[Pred(Len)] in [cc_SoftEnter, cc_HardEnter, cc_Null]) do
  Len := Pred(Len);
//#UC END# *54C63C5E0104_4773DEF0021B_impl*
end;//Tl3CustomString.TrimEOL

function Tl3CustomString.DeleteDoubleSpace: Tl3CustomString;
//#UC START# *54C63C7C01C4_4773DEF0021B_var*
//#UC END# *54C63C7C01C4_4773DEF0021B_var*
begin
//#UC START# *54C63C7C01C4_4773DEF0021B_impl*
 Result := Self;
//#UC END# *54C63C7C01C4_4773DEF0021B_impl*
end;//Tl3CustomString.DeleteDoubleSpace

function Tl3CustomString.DeleteAllChars(aChar: AnsiChar): Integer;
//#UC START# *54C63CAA03E0_4773DEF0021B_var*
var
 l_Pos : Integer;
//#UC END# *54C63CAA03E0_4773DEF0021B_var*
begin
//#UC START# *54C63CAA03E0_4773DEF0021B_impl*
 Result := 0;
 l_Pos := 0;
 while true do
 begin
  l_Pos := FindChar(l_Pos, aChar);
  if (l_Pos < 0) then
   break
  else
  begin
   Delete(l_Pos, 1);
   Inc(Result);
  end;//l_Pos < 0
 end;//while true
//#UC END# *54C63CAA03E0_4773DEF0021B_impl*
end;//Tl3CustomString.DeleteAllChars

function Tl3CustomString.ReplaceNonReadable: Tl3CustomString;
//#UC START# *54C63CED01C7_4773DEF0021B_var*
//#UC END# *54C63CED01C7_4773DEF0021B_var*
begin
//#UC START# *54C63CED01C7_4773DEF0021B_impl*
 Result := Self;
 l3SayConstString;
//#UC END# *54C63CED01C7_4773DEF0021B_impl*
end;//Tl3CustomString.ReplaceNonReadable

function Tl3CustomString.FindChar(Pos: Integer;
  C: AnsiChar): Integer;
//#UC START# *54C63EA70259_4773DEF0021B_var*
var
 P, P1 : PAnsiChar;
//#UC END# *54C63EA70259_4773DEF0021B_var*
begin
//#UC START# *54C63EA70259_4773DEF0021B_impl*
 if Empty OR (Pos >= Len) then
  Result := -1
 else
 begin
  P := St;
  P1 := ev_lpScan(C, P + Pos, Len - Pos);
  if (P1 = nil) then
   Result := -1
  else
   Result := (P1 - P);
 end;//Empty.. 
//#UC END# *54C63EA70259_4773DEF0021B_impl*
end;//Tl3CustomString.FindChar

procedure Tl3CustomString.FindCharEx(C: AnsiChar;
  aSt: Tl3CustomString);
//#UC START# *54C63F2D0242_4773DEF0021B_var*
var
 l_S : Tl3PCharLen;
//#UC END# *54C63F2D0242_4773DEF0021B_var*
begin
//#UC START# *54C63F2D0242_4773DEF0021B_impl*
 l_S := AsPCharLen;
 aSt.AsPCharLen := l3FindChar(C, l_S);
 if not aSt.Empty then
  Len := l_S.SLen;
//#UC END# *54C63F2D0242_4773DEF0021B_impl*
end;//Tl3CustomString.FindCharEx

function Tl3CustomString.Indent: Integer;
//#UC START# *54C63F5400AC_4773DEF0021B_var*
//#UC END# *54C63F5400AC_4773DEF0021B_var*
begin
//#UC START# *54C63F5400AC_4773DEF0021B_impl*
 if Empty then
  Result := 0
 else
  Result := ev_lpIndent(St, Len);
//#UC END# *54C63F5400AC_4773DEF0021B_impl*
end;//Tl3CustomString.Indent

procedure Tl3CustomString.MakeBMTable(var BT: Tl3BMTable);
//#UC START# *54C63F7801B0_4773DEF0021B_var*
var
 l_S : Tl3PCharLen;
//#UC END# *54C63F7801B0_4773DEF0021B_var*
begin
//#UC START# *54C63F7801B0_4773DEF0021B_impl*
 l_S := AsPCharLen;
 if (l_S.SCodePage = CP_Unicode) then
  l3FillChar(BT, SizeOf(BT))
 else
  l3BMSearch.BMMakeTable(l_S.S, BT, l_S.SLen);
//#UC END# *54C63F7801B0_4773DEF0021B_impl*
end;//Tl3CustomString.MakeBMTable

function Tl3CustomString.BMSearch(S: Tl3CustomString;
  BT: Tl3BMTable;
  var Pos: Cardinal): Boolean;
//#UC START# *54C63FB802C8_4773DEF0021B_var*
var
 l_S  : Tl3PCharLen;
 l_SS : Tl3PCharLen;
//#UC END# *54C63FB802C8_4773DEF0021B_var*
begin
//#UC START# *54C63FB802C8_4773DEF0021B_impl*
 l_S := S.AsPCharLen;
 l_SS := AsPCharLen;
 if l3IsNil(l_SS) then
  Result := false
 else
  Result := l3SearchStr(l_S, BT, l_SS, Pos);
//#UC END# *54C63FB802C8_4773DEF0021B_impl*
end;//Tl3CustomString.BMSearch

function Tl3CustomString.BMSearchUC(S: Tl3CustomString;
  BT: Tl3BMTable;
  var Pos: Cardinal): Boolean;
//#UC START# *54C63FE7008C_4773DEF0021B_var*
var
 l_S  : Tl3PCharLen;
 l_SS : Tl3PCharLen;
//#UC END# *54C63FE7008C_4773DEF0021B_var*
begin
//#UC START# *54C63FE7008C_4773DEF0021B_impl*
 l_S := S.AsPCharLen;
 l_SS := AsPCharLen;
 if l3IsNil(l_SS) then
  Result := false
 else
  Result := l3SearchStrUC(l_S, BT, l_SS, Pos);
//#UC END# *54C63FE7008C_4773DEF0021B_impl*
end;//Tl3CustomString.BMSearchUC

procedure Tl3CustomString.MakeUpper;
//#UC START# *54C640230216_4773DEF0021B_var*
//#UC END# *54C640230216_4773DEF0021B_var*
begin
//#UC START# *54C640230216_4773DEF0021B_impl*
 l3MakeUpperCase(St, Len, CodePage);
//#UC END# *54C640230216_4773DEF0021B_impl*
end;//Tl3CustomString.MakeUpper

procedure Tl3CustomString.MakeLower;
//#UC START# *54C64032026A_4773DEF0021B_var*
//#UC END# *54C64032026A_4773DEF0021B_var*
begin
//#UC START# *54C64032026A_4773DEF0021B_impl*
 l3MakeLowerCase(St, Len, CodePage);
//#UC END# *54C64032026A_4773DEF0021B_impl*
end;//Tl3CustomString.MakeLower

function Tl3CustomString.Delete(aPos: Integer;
  aCount: Integer): PAnsiChar;
//#UC START# *54C640510217_4773DEF0021B_var*
//#UC END# *54C640510217_4773DEF0021B_var*
begin
//#UC START# *54C640510217_4773DEF0021B_impl*
 Result := St;
//#UC END# *54C640510217_4773DEF0021B_impl*
end;//Tl3CustomString.Delete

procedure Tl3CustomString.SetSt(aStr: PAnsiChar;
  aLen: Integer = -1);
//#UC START# *54C640BB0399_4773DEF0021B_var*
//#UC END# *54C640BB0399_4773DEF0021B_var*
begin
//#UC START# *54C640BB0399_4773DEF0021B_impl*
 AsPCharLen := l3PCharLen(aStr, aLen, CodePage);
//#UC END# *54C640BB0399_4773DEF0021B_impl*
end;//Tl3CustomString.SetSt

function Tl3CustomString.JoinWith(P: Tl3PrimString): Integer;
//#UC START# *54C641A901E6_4773DEF0021B_var*
//#UC END# *54C641A901E6_4773DEF0021B_var*
begin
//#UC START# *54C641A901E6_4773DEF0021B_impl*
 Result := -1;
//#UC END# *54C641A901E6_4773DEF0021B_impl*
end;//Tl3CustomString.JoinWith

function Tl3CustomString.pm_GetSt: PAnsiChar;
//#UC START# *54C62FCA01B2_4773DEF0021Bget_var*
//#UC END# *54C62FCA01B2_4773DEF0021Bget_var*
begin
//#UC START# *54C62FCA01B2_4773DEF0021Bget_impl*
 if (Self = nil) then
  Result := nil
 else
  Result := GetAsPCharLen.S;
//#UC END# *54C62FCA01B2_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetSt

function Tl3CustomString.pm_GetLen: Integer;
//#UC START# *54C63008010F_4773DEF0021Bget_var*
//#UC END# *54C63008010F_4773DEF0021Bget_var*
begin
//#UC START# *54C63008010F_4773DEF0021Bget_impl*
 if (Self = nil) then
  Result := 0
 else
  Result := GetAsPCharLen.SLen;
//#UC END# *54C63008010F_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetLen

procedure Tl3CustomString.pm_SetLen(aValue: Integer);
//#UC START# *54C63008010F_4773DEF0021Bset_var*
//#UC END# *54C63008010F_4773DEF0021Bset_var*
begin
//#UC START# *54C63008010F_4773DEF0021Bset_impl*
//#UC END# *54C63008010F_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetLen

function Tl3CustomString.pm_GetCodePage: Integer;
//#UC START# *54C6307003BB_4773DEF0021Bget_var*
//#UC END# *54C6307003BB_4773DEF0021Bget_var*
begin
//#UC START# *54C6307003BB_4773DEF0021Bget_impl*
 Result := AsPCharLen.SCodePage;
//#UC END# *54C6307003BB_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetCodePage

procedure Tl3CustomString.pm_SetCodePage(aValue: Integer);
//#UC START# *54C6307003BB_4773DEF0021Bset_var*
//#UC END# *54C6307003BB_4773DEF0021Bset_var*
begin
//#UC START# *54C6307003BB_4773DEF0021Bset_impl*
 if (Self <> nil) then
  DoSetCodePage(aValue);
//#UC END# *54C6307003BB_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetCodePage

function Tl3CustomString.pm_GetIsOEM: Boolean;
//#UC START# *54C630BC0157_4773DEF0021Bget_var*
//#UC END# *54C630BC0157_4773DEF0021Bget_var*
begin
//#UC START# *54C630BC0157_4773DEF0021Bget_impl*
 Result := l3IsOEM(CodePage);
//#UC END# *54C630BC0157_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetIsOEM

function Tl3CustomString.pm_GetIsOEMEx: Boolean;
//#UC START# *54C630DC0134_4773DEF0021Bget_var*
//#UC END# *54C630DC0134_4773DEF0021Bget_var*
begin
//#UC START# *54C630DC0134_4773DEF0021Bget_impl*
 Result := l3IsOEMEx(CodePage);
//#UC END# *54C630DC0134_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetIsOEMEx

function Tl3CustomString.pm_GetIsANSI: Boolean;
//#UC START# *54C631160124_4773DEF0021Bget_var*
//#UC END# *54C631160124_4773DEF0021Bget_var*
begin
//#UC START# *54C631160124_4773DEF0021Bget_impl*
 Result := l3IsANSI(CodePage);
//#UC END# *54C631160124_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetIsANSI

function Tl3CustomString.pm_GetAsPCharLen: Tl3PCharLen;
//#UC START# *54C6321A0320_4773DEF0021Bget_var*
//#UC END# *54C6321A0320_4773DEF0021Bget_var*
begin
//#UC START# *54C6321A0320_4773DEF0021Bget_impl*
 if (Self = nil) then
  l3AssignNil(Result)
 else
  Tl3WString(Result) := GetAsPCharLen;
//#UC END# *54C6321A0320_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetAsPCharLen

procedure Tl3CustomString.pm_SetAsPCharLen(const aValue: Tl3PCharLen);
//#UC START# *54C6321A0320_4773DEF0021Bset_var*
//#UC END# *54C6321A0320_4773DEF0021Bset_var*
begin
//#UC START# *54C6321A0320_4773DEF0021Bset_impl*
 if (Self <> nil) then
  DoSetAsPCharLen(aValue);
//#UC END# *54C6321A0320_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetAsPCharLen

function Tl3CustomString.pm_GetFirst: AnsiChar;
//#UC START# *54C63409007E_4773DEF0021Bget_var*
//#UC END# *54C63409007E_4773DEF0021Bget_var*
begin
//#UC START# *54C63409007E_4773DEF0021Bget_impl*
 if not Empty then
  Result := Ch[0]
 else
  Result := #0;
//#UC END# *54C63409007E_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetFirst

function Tl3CustomString.pm_GetLast: AnsiChar;
//#UC START# *54C6352E0043_4773DEF0021Bget_var*
//#UC END# *54C6352E0043_4773DEF0021Bget_var*
begin
//#UC START# *54C6352E0043_4773DEF0021Bget_impl*
 if not Empty then
  Result := Ch[Pred(Len)]
 else
  Result := #0;
//#UC END# *54C6352E0043_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetLast

function Tl3CustomString.pm_GetCh(aPos: Integer): AnsiChar;
//#UC START# *54C6356B0095_4773DEF0021Bget_var*
var
 l_S : Tl3WString;
//#UC END# *54C6356B0095_4773DEF0021Bget_var*
begin
//#UC START# *54C6356B0095_4773DEF0021Bget_impl*
 l_S := AsPCharLen;
 if (l_S.S <> nil) AND (aPos >= 0) AND (aPos < l_S.SLen) then
 begin
  if (l_S.SCodePage = CP_Unicode) then
   Result := AnsiChar(PWideChar(l_S.S)[aPos])
  else
   Result := l_S.S[aPos];
 end//S <> nil
 else
  Result := #0;
//#UC END# *54C6356B0095_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetCh

procedure Tl3CustomString.pm_SetCh(aPos: Integer; aValue: AnsiChar);
//#UC START# *54C6356B0095_4773DEF0021Bset_var*
var
 l_S : Tl3WString;
//#UC END# *54C6356B0095_4773DEF0021Bset_var*
begin
//#UC START# *54C6356B0095_4773DEF0021Bset_impl*
 if (aPos >= 0) then
 begin
  l_S := GetAsPCharLen;
  if (l_S.S <> nil) AND (aPos < l_S.SLen) then
  begin
   if (l_S.SCodePage = CP_Unicode) then
    PWideChar(l_S.S)[aPos] := WideChar(aValue)
   else
    l_S.S[aPos] := aValue;
   CheckUnicode; 
  end//S <> nil
  else
   Insert(l3PCharLen(@aValue, 1, CodePage), aPos);
 end;{aPos >= 0}
//#UC END# *54C6356B0095_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetCh

function Tl3CustomString.pm_GetRTrimLen: Integer;
//#UC START# *54C6360A0301_4773DEF0021Bget_var*
//#UC END# *54C6360A0301_4773DEF0021Bget_var*
begin
//#UC START# *54C6360A0301_4773DEF0021Bget_impl*
 if Empty then
  Result := 0
 else
  Result := l3RTrim(AsPCharLen).SLen;
//#UC END# *54C6360A0301_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetRTrimLen

function Tl3CustomString.pm_GetLTrimLen: Integer;
//#UC START# *54C6365D02F7_4773DEF0021Bget_var*
//#UC END# *54C6365D02F7_4773DEF0021Bget_var*
begin
//#UC START# *54C6365D02F7_4773DEF0021Bget_impl*
 if Empty then
  Result := 0
 else
  Result := l3LTrim(Self.AsWStr).SLen;
//#UC END# *54C6365D02F7_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetLTrimLen

function Tl3CustomString.pm_GetAsChar: AnsiChar;
//#UC START# *54C63686017E_4773DEF0021Bget_var*
//#UC END# *54C63686017E_4773DEF0021Bget_var*
begin
//#UC START# *54C63686017E_4773DEF0021Bget_impl*
 Result := Ch[0];
//#UC END# *54C63686017E_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetAsChar

procedure Tl3CustomString.pm_SetAsChar(aValue: AnsiChar);
//#UC START# *54C63686017E_4773DEF0021Bset_var*
//#UC END# *54C63686017E_4773DEF0021Bset_var*
begin
//#UC START# *54C63686017E_4773DEF0021Bset_impl*
 AsPCharLen := l3PCharLen(@aValue, 1, CodePage);
//#UC END# *54C63686017E_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetAsChar

function Tl3CustomString.pm_GetAsPWideChar: PWideChar;
//#UC START# *54C636F400CA_4773DEF0021Bget_var*
//#UC END# *54C636F400CA_4773DEF0021Bget_var*
begin
//#UC START# *54C636F400CA_4773DEF0021Bget_impl*
 Result := PWideChar(St);
//#UC END# *54C636F400CA_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetAsPWideChar

procedure Tl3CustomString.pm_SetAsPWideChar(aValue: PWideChar);
//#UC START# *54C636F400CA_4773DEF0021Bset_var*
//#UC END# *54C636F400CA_4773DEF0021Bset_var*
begin
//#UC START# *54C636F400CA_4773DEF0021Bset_impl*
 AsPCharLen := l3PCharLen(PAnsiChar(aValue), -1, CP_Unicode);
//#UC END# *54C636F400CA_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetAsPWideChar

function Tl3CustomString.pm_GetAsWideString: WideString;
//#UC START# *54C637680235_4773DEF0021Bget_var*
{$IfDef XE4}
var
 l_S : Tl3PCharLen;
{$EndIf XE4}
//#UC END# *54C637680235_4773DEF0021Bget_var*
begin
//#UC START# *54C637680235_4773DEF0021Bget_impl*
 {$IfDef XE4}
 l_S := AsPCharLen;
 Result := Tl3Str(l_S).AsWideString;
 {$Else  XE4}
 Result := Tl3Str(AsPCharLen).AsWideString;
 {$EndIf XE4}
//#UC END# *54C637680235_4773DEF0021Bget_impl*
end;//Tl3CustomString.pm_GetAsWideString

procedure Tl3CustomString.pm_SetAsWideString(const aValue: WideString);
//#UC START# *54C637680235_4773DEF0021Bset_var*
//#UC END# *54C637680235_4773DEF0021Bset_var*
begin
//#UC START# *54C637680235_4773DEF0021Bset_impl*
 AsPCharLen := l3PCharLen(aValue);
//#UC END# *54C637680235_4773DEF0021Bset_impl*
end;//Tl3CustomString.pm_SetAsWideString

procedure Tl3CustomString.Assign(Source: TPersistent);
//#UC START# *478CF34E02CE_4773DEF0021B_var*
//#UC END# *478CF34E02CE_4773DEF0021B_var*
begin
//#UC START# *478CF34E02CE_4773DEF0021B_impl*
 if (Source = nil) then
  Clear
 else
 if (Source Is Tl3PrimString) then
  AssignString(Tl3PrimString(Source))
 else
  inherited;
//#UC END# *478CF34E02CE_4773DEF0021B_impl*
end;//Tl3CustomString.Assign

procedure Tl3CustomString.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4773DEF0021B_var*
//#UC END# *47A869D10074_4773DEF0021B_var*
begin
//#UC START# *47A869D10074_4773DEF0021B_impl*
 Assert(false);
//#UC END# *47A869D10074_4773DEF0021B_impl*
end;//Tl3CustomString.DoSetAsPCharLen

function Tl3CustomString.COMQueryInterface(const IID: Tl3GUID;
  out Obj): Tl3HResult;
//#UC START# *4A60B23E00C3_4773DEF0021B_var*
//#UC END# *4A60B23E00C3_4773DEF0021B_var*
begin
//#UC START# *4A60B23E00C3_4773DEF0021B_impl*
 Result.SetOk;
 if IID.EQ(Il3CString) then
  Il3CString(Obj) := Tl3StringAdapter.MakeS(Self)
 else
 if IID.EQ(IStream) then
  IStream(Obj) := Tl3StringStream.Make(Self)
 else
  Result := inherited COMQueryInterface(IID, Obj);
//#UC END# *4A60B23E00C3_4773DEF0021B_impl*
end;//Tl3CustomString.COMQueryInterface

end.