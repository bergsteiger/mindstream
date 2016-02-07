unit l3IniFile;

{$I+}

{ $Id: l3IniFile.pas,v 1.29 2014/10/29 15:37:58 voba Exp $ }

// $Log: l3IniFile.pas,v $
// Revision 1.29  2014/10/29 15:37:58  voba
// no message
//
// Revision 1.28  2014/10/16 13:44:04  lukyanets
// Зануляем возвращаемые значения в случае провала.
//
// Revision 1.27  2014/10/16 10:41:59  lukyanets
// Более контролируемо создаем конфиги
//
// Revision 1.26  2014/10/08 09:45:42  lukyanets
// CLeanup
//
// Revision 1.25  2013/12/25 11:41:58  lulin
// - чистим код.
//
// Revision 1.24  2013/06/17 15:36:37  voba
// - Сделал дефолт. проперти, что бы имя секции задавать в той же строке, типа  f_BaseLang.LanguageID:= BaseConfig['Settings'].ReadParamIntDef('Language', -1);
//
// Revision 1.23  2013/04/17 14:22:51  lulin
// - портируем.
//
// Revision 1.22  2013/04/09 11:08:18  lulin
// - пытаемся отладиться под XE.
//
// Revision 1.21  2013/04/05 12:03:00  lulin
// - портируем.
//
// Revision 1.20  2012/11/01 09:42:57  lulin
// - забыл точку с запятой.
//
// Revision 1.19  2012/11/01 07:45:08  lulin
// - делаем возможность логирования процесса загрузки модулей.
//
// Revision 1.18  2012/04/03 05:37:33  narry
// Обновление
//
// Revision 1.17  2011/05/18 12:09:16  lulin
// {RequestLink:266409354}.
//
// Revision 1.16  2010/09/28 13:06:11  fireton
// - Распределяем память для PAnsiChar своими средствами
//
// Revision 1.15  2010/04/12 13:10:42  voba
// - [K:200085802]
//
// Revision 1.14  2010/02/02 14:09:31  voba
// - K:178324176
//
// Revision 1.13  2008/10/22 06:15:58  fireton
// - bug fix: падение с Range Check Error при подаче пустой строки в NormalizePath
//
// Revision 1.12  2008/09/15 10:35:29  fireton
// - инициализация SattionConfig и ServerConfig
//
// Revision 1.11  2008/03/03 20:06:08  lulin
// - <K>: 85721135.
//
// Revision 1.10  2007/08/14 19:31:59  lulin
// - оптимизируем очистку памяти.
//
// Revision 1.9  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.8  2007/03/26 09:29:53  fireton
// - bug fix
//
// Revision 1.7  2007/02/09 14:40:01  voba
// - buf fix (Шура чото наменял)
//
// Revision 1.6  2007/02/08 15:01:38  lulin
// - функции работы с форматкой выделены в модуль работы со строками.
//
// Revision 1.5  2007/02/08 14:37:46  lulin
// - cleanup.
//
// Revision 1.4  2007/02/08 14:27:17  lulin
// - cleanup.
//
// Revision 1.3  2005/03/23 15:26:15  step
// new: function NormalizedPath
//
// Revision 1.2  2005/01/24 11:43:23  lulin
// - new behavior: при освобождении заглушки очищаем указатель на нее.
//
// Revision 1.1  2004/12/23 11:42:16  lulin
// - rename unit: User_Cfg -> l3IniFile.
//
// Revision 1.50  2004/12/23 11:28:36  lulin
// - rename unit: vtDateSt -> l3DateSt.
//
// Revision 1.49  2004/10/06 17:15:13  lulin
// - борьба за кошерность.
//
// Revision 1.48  2004/09/21 15:10:49  fireton
// - bug fix: не освобождался fSubstList
//
// Revision 1.47  2004/09/21 12:56:01  lulin
// - Release заменил на Cleanup.
//
// Revision 1.46  2004/09/14 16:22:26  voba
// - убрал Антошины изменения потому что глючит сохранение
//
// Revision 1.45  2004/09/14 13:47:18  lulin
// - г¤ «Ґ­ ¬®¤г«м Str_Man.
//
// Revision 1.40  2004/05/18 09:28:05  voba
// -code clean
//
// Revision 1.39  2004/05/18 09:02:29  voba
// -code clean
//
// Revision 1.38  2004/03/31 13:48:38  fireton
// - добавлены процедуры удаления секции и ключа в ini-файле
//
// Revision 1.37  2004/03/31 11:48:08  fireton
// - оптимизация по скорости ReadStringIni и WriteStringIni
//
// Revision 1.36  2004/03/30 15:33:23  step
// bug fix
//
// Revision 1.35  2004/03/30 14:23:45  fireton
// - процедуры для чтения/записи строк в ini-файл
//   (ReadStringIni и WriteStringIni)
//
// Revision 1.34  2004/03/18 14:27:15  fireton
// - добавление ImplodeSubsts
//
// Revision 1.33  2004/02/26 14:55:12  step
// изменена TCfgList.ExpandBySubst (условная компиляция)
//
// Revision 1.32  2004/02/20 09:31:48  step
// изменена TCfgList.ExpandBySubst
//
// Revision 1.31  2004/02/19 15:41:42  step
// add: TCfgList.ExpandBySubst
//
// Revision 1.30  2003/11/12 15:22:58  narry
// - new: добавлена возможность записи-чтения TDateTime (форматка T) в составе записи
//
// Revision 1.29  2003/05/28 15:26:46  voba
// -new behavior: при записи рекордов можно указывать в форматке размер целого от 1 до 8 и boolean
//
// Revision 1.28  2002/12/24 13:02:02  law
// - change: объединил Int64_Seek c основной веткой.
//
// Revision 1.27  2002/12/23 13:02:13  voba
// no message
//
// Revision 1.26.2.1  2002/12/23 13:05:04  law
// - объединил с основной веткой (то что Вован забыл положить).
//
// Revision 1.27  2002/12/23 13:02:13  voba
// no message
//
// Revision 1.26  2002/09/11 15:39:46  voba
// no message
//
// Revision 1.25  2002/06/20 06:28:09  voba
// no message
//
// Revision 1.24  2002/04/09 14:55:03  voba
// -improvement :  для функции чтения листов можно задать максимальное количество элементов
//
// Revision 1.23  2002/02/05 15:15:01  voba
// -new behavior: use AnsiString in place of shortstring
//
// Revision 1.22  2002/02/04 10:13:22  narry
// - bug fix: неверное восстановление ShortDateFormat после чтения времени
//
// Revision 1.21  2001/12/25 08:16:50  narry
// - bug fix: процедура чтения времени читала дату
//
// Revision 1.20  2001/10/25 13:51:42  narry
// - new behavior: чтение/запись времени
//
// Revision 1.19  2001/10/02 12:22:58  law
// - cleanup.
//
// Revision 1.18  2001/09/21 09:58:55  law
// - cleanup.
//
// Revision 1.17  2001/08/31 11:38:45  law
// - cleanup & comments.
//
// Revision 1.16  2001/08/31 11:02:36  law
// - rename unit: MyUtil -> l3FileUtils.
//
// Revision 1.15  2001/07/30 15:50:29  narry
// -bug fix: процедура ReadSectionValues возвращала пару Key=Value
//
// Revision 1.14  2001/05/18 12:42:21  law
// - change: изменен предок TObject -> _Tl3Base.
//
// Revision 1.13  2001/05/18 06:07:35  voba
// -bug fix
//
// Revision 1.12  2001/02/20 13:23:14  voba
// no message
//
// Revision 1.11  2000/12/15 15:36:28  law
// - вставлены директивы Log.

{$I l3Define.inc }

interface

uses
 SysUtils,
 Classes,
 Forms,

 l3Base,
 l3ProtoObject
 ;

const
 CfgExt = '.INI';
 StrSize = 1024;
 YesStr = 'YES';
 NoStr = 'NO';
 OnStr = 'ON';
 OffStr = 'OFF';
 TrueStr = 'TRUE';
 FalseStr = 'FALSE';
 OneStr = '1';
 ZeroStr = '0';

type
 {$IfNDef Win32}
 ShortString = AnsiString;
 PShortString = PAnsiString;
 {$EndIf}
 PBoolean = ^Boolean;

 TCfgString = AnsiString;

 TOnSetListItem = procedure(const ItStr: ShortString;
  var UserParam: Pointer) of object;
 TOnGetListItem = function(var ItStr: ShortString;
  var UserParam: Pointer): Boolean of object;

 TOnWriteArrayItem = function(var aValue: Integer): Boolean;
 {* - Подитеративная функция для записи элементов массива. Если возвращает true - элемент последний. }

 TOnReadArrayItem = procedure(aValue: Integer);
 {* - Подитеративная функция для записи элементов массива.}

function MakeWAIStub(Action: Pointer): TOnWriteArrayItem;
{* - делает заглушку для локальной процедуры (смотри l3Base.l3L2FA). }

function MakeRAIStub(Action: Pointer): TOnReadArrayItem;
{* - делает заглушку для локальной процедуры (смотри l3Base.l3L2FA). }

type

 TCfgList = class(Tl3ProtoObject)
 private
  FSection     : AnsiString;
  FCfgFileName : PAnsiChar;

  {internal}
  tmpPChar: PAnsiChar;

  fSubstList: TStringList;
 protected
  procedure Cleanup;
   override;
  {-}
  procedure ExpandBySubst(var aStr: AnsiString);
  function  GetSectionDefinition(const aSection : ShortString) : TCfgList;
 public
  constructor Create(CfgName: TFileName = '');
    reintroduce;
  class function CorrectCfgFileName(const aName: TFileName): TFileName;
  procedure SetCfgFile(const Value: TFileName);
  function GetCfgFile: TFileName;
  function GetSubstList: TStringList;

  procedure AddSubst(const aID: AnsiString; const aValue: AnsiString);
  procedure InitSubsts(const aSubstsSection: AnsiString);
  function ReadParamString(const ID: ShortString; var aStr: AnsiString): Boolean;
  function ReadParamFileName(const ID: ShortString; var aStr: TFileName): Boolean;
  function ReadParamStr(const ID: ShortString; var aStr: ShortString): Boolean;
   deprecated;
  function ReadParamDate(const ID: ShortString; var aDate: TDateTime): Boolean;
  function ReadParamTime(const ID: ShortString; var aTime: TDateTime): Boolean;
  function ReadParamDateTime(const ID: ShortString; var aDateTime: TDateTime): Boolean;
  function ReadParamInt(const ID: ShortString; var aInt: Longint): Boolean;
  function ReadParamBool(const ID: ShortString; var aBool: Boolean): Boolean;

  function ReadParamStrDef(const ID: ShortString; const DefStr: AnsiString): AnsiString;
  function ReadParamFileNameDef(const ID: ShortString; const aDefStr: TFileName): TFileName;
  function ReadParamDateDef(const ID: ShortString; DefDate: TDateTime): TDateTime;
  function ReadParamTimeDef(const ID: ShortString; DefTime: TDateTime): TDateTime;
  function ReadParamDateTimeDef(const ID: ShortString; DefDateTime: TDateTime): TDateTime;
  function ReadParamIntDef(const ID: ShortString; DefInt: Longint): Longint;
  function ReadParamBoolDef(const ID: ShortString; DefBool: Boolean): Boolean;

  procedure ReadParamList(const ID: ShortString; StrList: TStrings; aMaxItems: Integer = High(Integer));
  procedure ReadParamRec(const ID: ShortString; const FormStr: ShortString; var Rec);
  procedure ReadParamData(const ID: ShortString; Data: PAnsiChar; DataSize: Integer);
  procedure ReadParamExtList(const ID: ShortString; SetListFunc: TOnSetListItem; var UserParam: Pointer);
  procedure ReadParamArrayF(const ID: ShortString; aSetItemFunc: TOnReadArrayItem);
  procedure ReadFormPlace(const ID: ShortString; aForm: TForm);

  function WriteParamStr(const ID: ShortString; const aStr: AnsiString): Boolean;
  function WriteParamDate(const ID: ShortString; aDate: TDateTime): Boolean;
  function WriteParamTime(const ID: ShortString; aTime: TDateTime): Boolean;
  function WriteParamDateTime(const ID: ShortString; aDateTime: TDateTime): Boolean;
  function WriteParamInt(const ID: ShortString; aInt: Longint): Boolean;
  function WriteParamBool(const ID: ShortString; aBool: Boolean): Boolean;
  function WriteParamList(const ID: ShortString; StrList: TStrings; aMaxItems: Integer = High(Integer)): Boolean;
  function WriteParamRec(const ID: ShortString; const FormStr: ShortString; var Rec): Boolean;
  function WriteParamData(const ID: ShortString; Data: PAnsiChar; DataSize: Integer): Boolean;
  function WriteParamExtList(const ID: ShortString; GetListFunc: TOnGetListItem; var UserParam: Pointer): Boolean;
  procedure WriteParamArrayF(const ID: ShortString; aGetItemFunc: TOnWriteArrayItem);
  function WriteFormPlace(const ID: ShortString; aForm: TForm): Boolean;

  function WriteExpression(const aStr: ShortString): Boolean;

  procedure SetSection(const Value: ShortString);
  function GetSection: ShortString;
  procedure DeleteSection(const Value: ShortString);

  procedure GetSectionNameList(SectionList: TStrings);
  procedure ReadSection(Strings: TStrings);
  procedure ReadSectionValues(Strings: TStrings);
  procedure InflateSubst(var aStr: AnsiString);

  property SectionDefinition[const aSection : ShortString] : TCfgList read GetSectionDefinition; default;
  property Section: ShortString Read GetSection Write SetSection;
  property CfgFileName: TFileName Read GetCfgFile Write SetCfgFile;
  property SubstList: TStringList Read GetSubstList;
 end;

 Tl3IniFile = class(TCfgList)
 end;

 EcfgError = class(Exception);
 EcfgReadError = class(EcfgError);
 EcfgConvertError = class(EcfgError);

function UserConfig: TCfgList; //inline;
function StationConfig: TCfgList; //inline;
function ServerConfig: TCfgList; //inline;

procedure InitStationAndServerConfig(aIniPath: AnsiString = '');
procedure InitConfigs;
procedure InitUserConfig(aIniPath: AnsiString = '');
procedure InitStationConfig(aIniPath: AnsiString = '');
procedure DoneConfigs;
procedure DoneUserConfig;

procedure WriteStringIni(const IniFN: AnsiString; const Section, Key, Value: AnsiString);
function ReadStringIni(const IniFN: AnsiString; const Section, Key: AnsiString): AnsiString;

procedure DeleteIniSection(const IniFN: AnsiString; const Section: AnsiString);
procedure DeleteIniKey(const IniFN: AnsiString; const Section, Key: AnsiString);

function NormalizedPath(const aPath: AnsiString): AnsiString; // удаляет лишние символы '\'

implementation

uses
 Windows,
 StrUtils,
 l3Stream,
 l3DateSt,

 l3MinMax,
 l3String,
 l3FileUtils,
 l3Types;

resourcestring
 rsReadError = 'Ошибка чтения ';

const
 RecSplitChar = '~';
 c_SubstBracket = '%';

var
 g_UserConfig : TCfgList = Nil;
 g_StationConfig : TCfgList = Nil;
 g_ServerConfig : TCfgList = Nil;

function MakeWAIStub(Action: Pointer): TOnWriteArrayItem; register;
asm
 jmp  l3LocalStub
end;{asm}

function MakeRAIStub(Action: Pointer): TOnReadArrayItem; register;
asm
 jmp  l3LocalStub
end;{asm}

function DataToFormatString(Data: PAnsiChar; DataSize: Integer): AnsiString;
var
 lDataLong : Longint;
 lDataOffset : Integer;
begin
 {Попытаемся сократить DataSize, чтобы не писать лишних нулей в конце}

 lDataOffset := (Pred(DataSize) div 4) * 4;

 repeat
  lDataLong := 0;
  StrMove( @lDataLong, Data + lDataOffset, Min(4, DataSize - lDataOffset));
  if (lDataLong <> 0) or (lDataOffset = 0) then
   Break;
  Dec(lDataOffset, 4);
 until False;

 DataSize := Min(DataSize, lDataOffset + 4);

 lDataOffset := 0;
 Result := '';

 while lDataOffset < DataSize do
 begin
  lDataLong := 0;
  StrMove( @lDataLong, Data + lDataOffset, Min(4, DataSize - lDataOffset));
  Result := Result + IntToStr(lDataLong) + RecSplitChar;
  Inc(lDataOffset, 4);
 end;
end;

procedure FormatStringToData(const FStr: AnsiString; aIterFunc: TOnReadArrayItem);
var
 lDataLong : Longint;
 lStrOffset,
 lStrOffset2 : Integer;
 lStrSize : Integer;
 lStr : String[20];
begin
 lStrSize := Length(FStr);
 lStrOffset := 1;
 while (lStrOffset < lStrSize) do
 begin
  lStrOffset2 := l3StringPos(RecSplitChar, FStr, lStrOffset);
  if lStrOffset2 = 0 then
   lStrOffset2 := Succ(lStrSize);

  lStr[0] := AnsiChar(lStrOffset2 - lStrOffset);
  l3Move(FStr[lStrOffset], lStr[1], lStrOffset2 - lStrOffset);
  try
   lDataLong := StrToInt(lStr);
  except
   raise EcfgConvertError.Create('Невозможно преобразовать в число : ' + lStr);
  end;

  lStrOffset := Succ(lStrOffset2);

  aIterFunc(lDataLong);
 end;
end;

constructor TCfgList.Create(CfgName: TFileName);
begin
 inherited Create;
 SetCfgFile(CfgName);
 tmpPChar := l3StrAlloc(StrSize);
end;

procedure TCfgList.Cleanup;
begin
 WritePrivateProfileStringA(nil, nil, nil, fCfgFileName);
 FSection := '';
 if Assigned(FCfgFileName) then
  l3StrDispose(fCfgFileName);
 if Assigned(tmpPChar) then
  l3StrDispose(tmpPChar);
 if Assigned(fSubstList) then
  FreeAndNil(fSubstList);
 inherited;
end;

procedure TCfgList.ExpandBySubst(var aStr: AnsiString);
var
 l_StartBracket,
 l_EndBracket : Integer;
 l_SubstName : AnsiString;
 l_SubstIndex : Integer;
begin
 if Assigned(fSubstList) and (fSubstList.Count > 0) then
 begin
  l_EndBracket := 0;
  repeat
   l_StartBracket := PosEx(c_SubstBracket, aStr, l_EndBracket + 1);
   if (l_StartBracket > 0) then // нашли первую "скобку"
   begin
    l_EndBracket := PosEx(c_SubstBracket, aStr, l_StartBracket + 1);
    if (l_EndBracket > 0) then // нашли вторую "скобку"
    begin
     if (l_EndBracket - l_StartBracket > 1) then
      // между первой и второй "скобками" что-то есть
     begin
      l_SubstName := Copy(aStr, l_StartBracket + 1, l_EndBracket - l_StartBracket - 1);
      l_SubstIndex := SubstList.IndexOfName(l_SubstName);
      if l_SubstIndex > -1 then // есть на что заменить
      begin
       Delete(aStr,
        l_StartBracket,
        l_EndBracket - l_StartBracket + 1);
       {$IFDEF Delphi7}
       Insert(SubstList.ValueFromIndex[l_SubstIndex],
        aStr,
        l_StartBracket);
       {$ELSE}
       Insert(SubstList.Values[l_SubstName],
        aStr,
        l_StartBracket);
       {$ENDIF}
       l_EndBracket := l_StartBracket;
       // позиция второй "скобки" после замены стала не актуальна
      end;
     end;
    end;
   end;
  until
   (l_StartBracket = 0) or (l_EndBracket = 0);
 end;
end;

procedure TCfgList.SetCfgFile(const Value: TFileName);
var
 l_Name: TFileName;
begin
 l_Name := CorrectCfgFileName(Value);
// if not (FileExists(l_Name)) then
//   MakeFile(l_Name);
 if Assigned(FCfgFileName) then
  l3StrDispose(FCfgFileName);
 FCfgFileName := l3StrAlloc(Length(l_Name) + 1);
 StrPCopy(FCfgFileName, l_Name);
 FileClose(FileOpen(l3GetStrPas(FCfgFileName), fmShareExclusive and fmOpenReadWrite));
end;

function TCfgList.GetCfgFile: TFileName;
begin
 Result := l3GetStrPas(FCfgFileName);
end;

function TCfgList.GetSubstList: TStringList;
begin
 if fSubstList = nil then
  fSubstList := TStringList.Create;
 Result := fSubstList;
end;

procedure TCfgList.AddSubst(const aID: AnsiString; const aValue: AnsiString);
var
 I : Integer;
begin
 with SubstList do
 begin
  I := IndexOfName(aID);
  if I = -1 then
   Add(aID + '=' + aValue)
  else
   Values[aID] := AValue;
 end;
end;

procedure TCfgList.InitSubsts(const aSubstsSection: AnsiString);
const
 c_BufSize = 8192;
var
 l_MemoryStream : TMemoryStream;
 l_MemSize : Cardinal;
 l_BufferIsSmall : Boolean;
 I : Integer;
begin
 l_MemoryStream := TMemoryStream.Create;
 try
  l_MemSize := c_BufSize;
  repeat
   l_MemoryStream.SetSize(l_MemSize);
   l_BufferIsSmall := GetPrivateProfileSectionA(PAnsiChar(aSubstsSection),
    l_MemoryStream.Memory,
    l_MemSize,
    FCfgFileName) = l_MemSize - 2;
   l_MemSize := l_MemSize * 2;
  until not l_BufferIsSmall;

  // замена #0 на #13
  for I := 0 to l_MemoryStream.Size - 2 do
   if (PAnsiChar(l_MemoryStream.Memory) + I)^ = #0 then
   begin
    (PAnsiChar(l_MemoryStream.Memory) + I)^ := #13;
    if (PAnsiChar(l_MemoryStream.Memory) + I + 1)^ = #0 then
     Break;
   end;
  SubstList.Clear;
  SubstList.LoadFromStream(l_MemoryStream);
 finally
  l_MemoryStream.Free;
 end;
end;

procedure TCfgList.SetSection(const Value: ShortString);
begin
 FSection := AnsiUpperCase(Value);
end;

function TCfgList.GetSection: ShortString;
begin
 Result := FSection;
end;

function TCfgList.GetSectionDefinition(const aSection : ShortString) : TCfgList;
begin
 Section := aSection;
 Result := Self;
end;

procedure TCfgList.GetSectionNameList(SectionList: TStrings);
var
 FF : Text;
 SS : ShortString;
 R : Byte;
begin
 AssignFile(FF, FCfgFileName);
 try
  Reset(FF);
 except Exit;
 end;
 while not EOF(FF) do
 begin
  ReadLn(FF, SS);
  R := Pos(']', SS);
  if R > 0 then
  begin
   SS := TrimLeft(Copy(SS, 1, R - 1));
   if (SS[0] = #0) or (SS[1] <> '[') then
    Continue;
   SectionList.Add(Copy(SS, 2, Byte(SS[0]) - 1));
  end;
 end;
 Close(FF);
end;

procedure TCfgList.ReadSection(Strings: TStrings);
const
 BufSize = 8192;
var
 Buffer, P : PAnsiChar;
 Count : Integer;
begin
 l3System.GetLocalMem(Buffer, BufSize);
 try
  Count := GetPrivateProfileStringA(PAnsiChar(FSection), nil, nil,
   Buffer, BufSize, FCfgFileName);
  P := Buffer;
  if Count > 0 then
   while P[0] <> #0 do
   begin
    Strings.Add(l3GetStrPas(P));
    Inc(P, StrLen(P) + 1);
   end;
 finally
  l3System.FreeLocalMem(Buffer);
 end;
end;

procedure TCfgList.ReadSectionValues(Strings: TStrings);
var
 KeyList : TStringList;
 I : Integer;
begin
 KeyList := TStringList.Create;
 try
  ReadSection(KeyList);
  for I := 0 to Keylist.Count - 1 do
   //Strings.Values[KeyList[I]] := ReadParamStrDef(KeyList[I], '');
   Strings.Add(ReadParamStrDef(KeyList[I], ''));
 finally
  KeyList.Free;
 end;
end;

procedure TCfgList.ReadParamList(const ID: ShortString; StrList: TStrings;
                                 aMaxItems: Integer = High(Integer));
var
 I : Integer;
 St : AnsiString;
begin
 I := 1;
 repeat
  St := ID + IntToStr(I);
  if ReadParamString(St, St) then
   StrList.Add(St)
  else Break;
  Inc(I);
 until I > aMaxItems;
end;

function TCfgList.WriteParamList(const ID: ShortString; StrList: TStrings;
 aMaxItems: Integer = High(Integer)): Boolean;
var
 I : Integer;
 St : ShortString;

begin
 WritePrivateProfileStringA(PAnsiChar(FSection), nil, nil, FCfgFileName); {Delete Current Section}
 Result := False;
 aMaxItems := Min(aMaxItems, StrList.Count);
 for I := 1 to aMaxItems do
 begin
  St := ID + IntToStr(I);
  Result := WriteParamStr(St, StrList[Pred(I)]);
 end;
end;

procedure TCfgList.ReadParamExtList(const ID: ShortString; SetListFunc: TOnSetListItem;
 var UserParam: Pointer);
var
 I : Integer;
 St : AnsiString;
begin
 I := 1;
 repeat
  St := ID + IntToStr(I);
  if ReadParamString(St, St) then
   SetListFunc(St, UserParam)
  else Break;
  Inc(I);
 until False;
end;

function TCfgList.WriteParamExtList(const ID: ShortString; GetListFunc: TOnGetListItem;
 var UserParam: Pointer): Boolean;
var
 I : Integer;
 StID,
 St : ShortString;
begin
 WritePrivateProfileStringA(PAnsiChar(FSection), nil, nil, FCfgFileName); {Delete Current Section}
 I := 1;
 Result := False;
 while GetListFunc(St, UserParam) do
 begin
  StID := ID + IntToStr(I);
  Result := WriteParamStr(StID, St);
  Inc(I);
 end;
end;

procedure TCfgList.ReadParamArrayF(const ID: ShortString; aSetItemFunc: TOnReadArrayItem);
var
 lStr : AnsiString;
 l_A  : Pointer absolute aSetItemFunc;
begin
 try
  try
   if ReadParamString(ID, lStr) then
    FormatStringToData(lStr, aSetItemFunc);
  except
   raise EcfgReadError.Create(rsReadError + ID);
  end;
 finally
  l3FreeLocalStub(l_A);
 end;
end;

procedure TCfgList.WriteParamArrayF(const ID: ShortString; aGetItemFunc: TOnWriteArrayItem);
var
 lValue : Integer;
 lStr : AnsiString;
 l_A  : Pointer absolute aGetItemFunc;
begin
 try
  lStr := '';
  while not aGetItemFunc(lValue) do
   lStr := lStr + IntToStr(lValue) + RecSplitChar;

  WriteParamStr(ID, lStr);
 finally
  l3FreeLocalStub(l_A);
 end;
end;

type
 TFormPlaceRec = record
  rLeft   : Integer;
  rTop    : Integer;
  rWidth  : Integer;
  rHeight : Integer;
  rMaximize : Integer;
 end;

procedure TCfgList.ReadFormPlace(const ID: ShortString; aForm: TForm);
var
 lFormPlaceRec : TFormPlaceRec;
begin
 try
  ReadParamRec(ID, 'DDDDD', lFormPlaceRec);
  with aForm, lFormPlaceRec do
  begin
   Position :=  poDesigned;
   SetBounds(rLeft, rTop, rWidth, rHeight);
   if rMaximize > 0 then
    WindowState := wsMaximized
   else
    WindowState := wsNormal;
  end;
 except
 end;
end;

function TCfgList.WriteFormPlace(const ID: ShortString; aForm : TForm): Boolean;
var
 lFormPlaceRec : TFormPlaceRec;
begin
 with aForm, lFormPlaceRec do
 begin
  rLeft   := Left;
  rTop    := Top;
  rWidth  := Width;
  rHeight := Height;

  if WindowState = wsMaximized then
   rMaximize := 1
  else
   rMaximize := 0;
 end;
 
 Result := WriteParamRec(ID, 'DDDDD', lFormPlaceRec);
end;

procedure TCfgList.DeleteSection(const Value: ShortString);
begin
 if Section <> '' then
  Section := Value;
 WritePrivateProfileStringA(PAnsiChar(FSection), nil, nil, FCfgFileName)
end;

function TCfgList.ReadParamStr(const ID: ShortString; var aStr: ShortString): Boolean;
var
 lStr : AnsiString;
begin
 Result := ReadParamString(ID, lStr);
 aStr := lStr;
end;

function TCfgList.ReadParamString(const ID: ShortString; var aStr: AnsiString): Boolean;
const
 emptyPChar: PAnsiChar = #0;
var
 l_ID : AnsiString;
begin
 l_ID := ID + #0;
 Result := False;
 aStr := '';
 if (FSection <> '') then
 begin
  GetPrivateProfileStringA(PAnsiChar(FSection), @l_ID[1], EmptyPChar, tmpPChar, StrSize, FCfgFileName);
  if TmpPChar[0] <> #0 then
  begin
   aStr := l3GetStrPas(TmpPChar);
   ExpandBySubst(aStr);
   {AStr:=ConvFromReadable(aStr);}
   Result := True;
  end;
 end;
end;

function TCfgList.ReadParamFileName(const ID: ShortString; var aStr: TFileName): Boolean;
var
 l_S : AnsiString;
begin
 l_S := aStr;
 Result := ReadParamString(ID, l_S);
 aStr := l_S;
 // not realized
 //If (Length(aStr) > 0) and (aStr[1] = '%') then    //%IniPath%
 //begin
 // ExtractFilePath(ExpandFileName(AnsiString(fCfgFileName)));
 // aStr := ExtractFilePath(ExpandFileName(AnsiString(fCfgFileName))) + Copy(aStr, 11, Length(aStr));
 //end;
end;

function TCfgList.ReadParamInt(const ID: ShortString; var aInt: Longint): Boolean;
var
 tmpStr : AnsiString;
 l_ID   : AnsiString;
begin
 l_ID := ID + #0;
 aInt := 0;
 Result := False;
 if (FSection <> '') then
 begin
  if ReadParamString(l_ID, tmpStr) then
  begin
   try
    aInt := StrToInt(tmpStr);
    Result := True;
   except
    Result := False;
   end;
  end;
 end;
end;

function TCfgList.ReadParamBool(const ID: ShortString; var aBool: Boolean): Boolean;
var
 TmpStr : TCfgString;
 l_ID   : AnsiString;
begin
 Result := False;
 aBool := False;
 l_ID := ID + #0;
 if (FSection <> '') then
 begin
  if ReadParamString(l_ID, tmpStr) then
  begin
   TmpStr := AnsiUpperCase(TmpStr);
   if (TmpStr = YesStr) or
    (TmpStr = OnStr) or
    (TmpStr = OneStr) or
    (TmpStr = TrueStr) then
   begin
    aBool := True;
    Result := True;
   end
   else
   begin
    if (TmpStr = NoStr) or
     (TmpStr = OffStr) or
     (TmpStr = ZeroStr) or
     (TmpStr = FalseStr) then
    begin
     aBool := False;
     Result := True;
    end;
   end;
  end;
 end;
end;

function TCfgList.ReadParamDate(const ID: ShortString; var aDate: TDateTime): Boolean;
var
 lSaveShortDateFormat : AnsiString;
 tmpStr : AnsiString;
begin
 Result := ReadParamString(ID, tmpStr);
 aDate := 0;
 if Result then
  try
   lSaveShortDateFormat := {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat;
   {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat := 'd/m/y';
   try
    aDate := StrToDate(NormalizeDate(tmpStr));
   finally
    {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat := lSaveShortDateFormat;
   end;
  except
   Result := False;
  end;
end;

function TCfgList.ReadParamDateDef(const ID: ShortString; DefDate: TDateTime): TDateTime;
begin
 if not ReadParamDate(ID, Result) then
  Result := DefDate;
end;

function TCfgList.WriteParamDate(const ID: ShortString; aDate: TDateTime): Boolean;
begin
 try
  Result := WriteParamStr(ID, FormatDateTime('dd/mm/yyyy', aDate));
 except
  Result := False;
 end;
end;

function TCfgList.ReadParamDateTime(const ID: ShortString;
 var aDateTime: TDateTime): Boolean;
var
 lSaveShortDateFormat,
 lSaveShortTimeFormat : AnsiString;
 tmpStr : ShortString;
begin
 Result := ReadParamStr(ID, tmpStr);
 aDateTime := 0;
 if Result then
  try
   lSaveShortDateFormat := {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat;
   lSaveShortTimeFormat := {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat;
   {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat := 'd/m/y';
   {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat := 'h:n:s';
   try
    aDateTime := StrToDateTime(tmpStr);
   finally
    {$IfDef XE}FormatSettings.{$EndIf}ShortDateFormat := lSaveShortDateFormat;
    {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat := lSaveShortTimeFormat;
   end;
  except
   Result := False;
  end;
end;

function TCfgList.ReadParamDateTimeDef(const ID: ShortString;
 DefDateTime: TDateTime): TDateTime;
begin
 if not ReadParamDateTime(ID, Result) then
  Result := DefDateTime;
end;

function TCfgList.WriteParamDateTime(const ID: ShortString; aDateTime: TDateTime): Boolean;
begin
 try
  Result := WriteParamStr(ID, FormatDateTime('dd/mm/yyyy hh:nn:ss', aDateTime));
 except
  Result := False;
 end;
end;


function TCfgList.ReadParamTime(const ID: ShortString; var aTime: TDateTime): Boolean;
var
 lSaveShortTimeFormat : AnsiString;
 tmpStr : ShortString;
begin
 Result := ReadParamStr(ID, tmpStr);
 aTime := 0;
 if Result then
  try
   lSaveShortTimeFormat := {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat;
   {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat := 'h:n:s';
   try
    aTime := StrToTime({NormalizeDate}(tmpStr));
   finally
    {$IfDef XE}FormatSettings.{$EndIf}ShortTimeFormat := lSaveShortTimeFormat;
   end;
  except
   Result := False;
  end;
end;

function TCfgList.ReadParamTimeDef(const ID: ShortString; DefTime: TDateTime): TDateTime;
begin
 if not ReadParamTime(ID, Result) then
  Result := DefTime;
end;

function TCfgList.WriteParamTime(const ID: ShortString; aTime: TDateTime): Boolean;
begin
 try
  Result := WriteParamStr(ID, FormatDateTime('hh:nn:ss', aTime));
 except
  Result := False;
 end;
end;

function TCfgList.ReadParamStrDef(const ID: ShortString; const DefStr: AnsiString): AnsiString;
begin
 if not ReadParamString(ID, Result) then
  Result := DefStr;
end;

function TCfgList.ReadParamFileNameDef(const ID: ShortString;
 const aDefStr: TFileName): TFileName;
begin
 if not ReadParamFileName(ID, Result) then
  Result := aDefStr;
end;

function TCfgList.ReadParamIntDef(const ID: ShortString; DefInt: Longint): Longint;
begin
 if not ReadParamInt(ID, Result) then
  Result := DefInt;
end;

function TCfgList.ReadParamBoolDef(const ID: ShortString; DefBool: Boolean): Boolean;
begin
 if not ReadParamBool(ID, Result) then
  Result := DefBool;
end;

function TCfgList.WriteParamData(const ID: ShortString; Data: PAnsiChar;
 DataSize: Integer): Boolean;
var
 lStr : AnsiString;
begin
 lStr := DataToFormatString(Data, DataSize);
 Result := WriteParamStr(ID, lStr);
end;

procedure TCfgList.ReadParamData(const ID: ShortString; Data: PAnsiChar; DataSize: Integer);
var
 lStr : AnsiString;
 lDataOffset : Integer;
 lIterFunc : TOnReadArrayItem;
 l_A       : Pointer absolute lIterFunc;

 procedure IterFunc(aValue: Integer);
 begin
  if (lDataOffset >= DataSize) then
   exit;
  StrMove(Data + lDataOffset, @aValue, Min(4, DataSize - lDataOffset));
  Inc(lDataOffset, 4);
 end;

begin
 try
  if not ReadParamString(ID, lStr) then
   raise EcfgReadError.Create('');
  lDataOffset := 0;
  l3FillChar(Data^, DataSize, 0);
  lIterFunc := MakeRAIStub( @IterFunc);
  try
   FormatStringToData(lStr, lIterFunc);
  finally
   l3FreeLocalStub(l_A);
  end;
 except
  raise EcfgReadError.Create(rsReadError + ID);
 end;
end;

procedure TCfgList.ReadParamRec(const ID: ShortString; const FormStr: ShortString; var Rec);
var
 RStr : AnsiString;
begin
 try
  if not ReadParamString(ID, RStr) then
   raise EcfgReadError.Create('');
  l3FormatStringToRec(RStr, Rec, FormStr);
 except
  raise EcfgReadError.Create(rsReadError + ID);
 end;//try..except
end;

function TCfgList.WriteParamRec(const ID: ShortString; const FormStr: ShortString;
 var Rec): Boolean;
var
 ResStr : AnsiString;
begin
 ResStr := l3RecToFormatString(Rec, FormStr);
 Result := WriteParamStr(ID, ResStr);
end;

function TCfgList.WriteExpression(const aStr: ShortString): Boolean;
var
 I : Byte;
 ID : ShortString;
begin
 I := Pos('=', AStr);
 if I = 0 then
 begin
  Result := False;
  Exit;
 end;
 ID := Trim(Copy(AStr, 1, I - 1)) + #0;
 Result := WritePrivateProfileStringA(PAnsiChar(FSection), @ID[1], PAnsiChar(Trim(Copy(AStr, I + 1, 255)) + #0), FCfgFileName);
end;

function TCfgList.WriteParamStr(const ID: ShortString; const aStr: AnsiString): Boolean;
var
 STmp : AnsiString;
 l_ID : AnsiString;
begin
 l_ID := ID + #0;
 STmp := aStr;
 STmp := STmp + #0;
 Result := WritePrivateProfileStringA(PAnsiChar(FSection), @l_ID[1], @STmp[1], FCfgFileName);
end;

function TCfgList.WriteParamInt(const ID: ShortString; aInt: Longint): Boolean;
var
 AStr : ShortString;
 l_ID : AnsiString;
begin
 l_ID := ID + #0;
 aStr := IntToStr(aInt) + #0;
 Result := WritePrivateProfileStringA(PAnsiChar(FSection), @l_ID[1], @aStr[1], FCfgFileName);
end;

function TCfgList.WriteParamBool(const ID: ShortString; aBool: Boolean): Boolean;
var
 tmpStr : String[6];
 l_ID   : AnsiString;
begin
 l_ID := ID + #0;
 if ABool then
  tmpStr := OneStr + #0
 else tmpStr := ZeroStr + #0;
 Result := WritePrivateProfileStringA(PAnsiChar(FSection), @l_ID[1], @tmpStr[1], FCfgFileName)
end;

procedure TCfgList.InflateSubst(var aStr: AnsiString);
var
 X : Integer;
 I : Integer;
 Substr : AnsiString;
begin
 for I := 0 to Pred(fSubstList.Count) do
 begin
  {$IFDEF Delphi7}
  Substr := fSubstList.ValueFromIndex[I];
  {$ELSE}
  Substr := fSubstList.Values[fSubstList.Names[I]];
  {$ENDIF}
  X := PosEx(Substr, aStr, 1);
  if X > 0 then
  begin
   Delete(aStr, X, Length(Substr));
   Insert(c_SubstBracket + fSubstList.Names[I] + c_SubstBracket, aStr, X);
   break;
  end;
 end;
end;

procedure InitConfigs;
begin
 InitUserConfig;
 InitStationConfig;
end;

procedure InitUserConfig(aIniPath: AnsiString = '');
begin
 if UserConfig = Nil then
  g_UserConfig := TCfgList.Create(aIniPath)
 else
  Assert(SameText(UserConfig.CfgFileName, UserConfig.CorrectCfgFileName(aIniPath)));
end;

procedure InitStationConfig(aIniPath: AnsiString = '');
begin
 if StationConfig = Nil then
  g_StationConfig := TCfgList.Create(aIniPath)
 else
  Assert(SameText(StationConfig.CfgFileName, StationConfig.CorrectCfgFileName(aIniPath)));
end;

procedure DoneUserConfig;
begin
 l3Free(g_UserConfig);
end;

procedure DoneConfigs;
begin
 DoneUserConfig;
 l3Free(g_StationConfig);
 l3Free(g_ServerConfig);
end;

function ExtractSection(S: AnsiString): AnsiString;
var
 STmp : AnsiString;
begin
 STmp := Trim(S);
 if (STmp <> '') and (STmp[1] = '[') and (STmp[Length(STmp)] = ']') then
  Result := UpperCase(Copy(STmp, 2, Length(STmp) - 2))
 else
  Result := '';
end;

function IsComment(S: AnsiString): Boolean;
var
 I : Integer;
begin
 Result := S = '';
 if not Result then
 begin
  I := 1;
  while (I <= Length(S)) and (S[I] in [' ', #9]) do
   Inc(I);
  if I <= Length(S) then
   Result := S[I] = ';';
 end;
end;

procedure WriteStringIni(const IniFN: AnsiString; const Section, Key, Value: AnsiString);
var
 lSectionFound : Boolean;
 lKey : AnsiString;
 I, X : Integer;
 STmp, lUpSect, lUpKey : AnsiString;
 Stream : TFileStream;
 List : TStringList;
begin
 if FileExists(IniFN) then
 begin
  List := TStringList.Create;
  Stream := TFileStream.Create(IniFN, fmOpenReadWrite or fmShareDenyWrite);
  try
   List.LoadFromStream(Stream);
   I := 0;
   lUpSect := UpperCase(Section);
   // ищем секцию
   lSectionFound := False;
   while not ((I >= List.Count) or lSectionFound) do
   begin
    STmp := List[I];
    Inc(I);
    if not IsComment(STmp) then
     if ExtractSection(STmp) = lUpSect then
      lSectionFound := True;
   end;
   // ищем ключ
   lUpKey := UpperCase(Key);
   while I < List.Count do
   begin
    STmp := List[I];
    Inc(I);
    if not IsComment(STmp) then
    begin
     if ExtractSection(STmp) <> '' then // нашли следующую секцию - значит, ключ не найден
     begin
      List.Insert(I - 1, Key + '=' + Value);
      Break;
     end;
     X := Pos('=', STmp);
     if X > 0 then
     begin
      lKey := Trim(Copy(STmp, 1, X - 1));
      if UpperCase(lKey) = lUpKey then // ключ найден!
      begin
       List[I - 1] := lKey + '=' + Value;
       Break;
      end;
     end;
    end;
   end;

   if not lSectionFound then
   begin
    List.Append('[' + Section + ']');
    List.Append(Key + '=' + Value);
   end;
  finally
   if List.Count > 0 then
   begin
    Stream.Seek(0, soBeginning);
    List.SaveToStream(Stream);
    Stream.Size := Stream.Position; // чтобы установить конец файла
   end;
   l3Free(Stream);
   l3Free(List);
  end;
 end
 else // если это новый инишник...
 begin
  List := TStringList.Create;
  try
   List.Append('[' + Section + ']');
   List.Append(Key + '=' + Value);
  finally
   List.SaveToFile(IniFN);
   l3Free(List);
  end;
 end;
end;

function ReadStringIni(const IniFN: AnsiString; const Section, Key: AnsiString): AnsiString;
var
 I : Integer;
 lKey : AnsiString;
 X : Integer;
 STmp, lUpSect, lUpKey : AnsiString;
 List : TStringList;
begin
 Result := '';
 if not FileExists(IniFN) then
  Exit;
 List := TStringList.Create;
 try
  List.LoadFromFile(IniFN);
  I := 0;
  lUpSect := UpperCase(Section);
  // ищем секцию
  while I < List.Count do
  begin
   STmp := List[I];
   Inc(I);
   if IsComment(STmp) then
    Continue;
   if ExtractSection(STmp) = lUpSect then
    Break;
  end;
  // ищем ключ
  lUpKey := UpperCase(Key);
  while I < List.Count do
  begin
   STmp := List[I];
   Inc(I);
   if IsComment(STmp) then
    Continue;
   if ExtractSection(STmp) <> '' then // нашли следующую секцию - значит, ключ не найден
    Break;
   X := Pos('=', STmp);
   if X > 0 then
   begin
    lKey := UpperCase(Trim(Copy(STmp, 1, X - 1)));
    if lKey = lUpKey then // ключ найден!
    begin
     Result := Trim(Copy(STmp, X + 1, MaxInt));
     Break;
    end;
   end;
  end;
 finally
  l3Free(List);
 end;
end;

procedure DeleteIniSection(const IniFN: AnsiString; const Section: AnsiString);
var
 STmp : AnsiString;
 I : Integer;
 lSectionFound : Boolean;
 Stream : TFileStream;
 List : TStringList;
 lUpSect : AnsiString;
begin
 if FileExists(IniFN) then
 begin
  List := TStringList.Create;
  Stream := TFileStream.Create(IniFN, fmOpenReadWrite or fmShareDenyWrite);
  try
   List.LoadFromStream(Stream);
   I := 0;
   lUpSect := UpperCase(Section);
   // ищем секцию
   lSectionFound := False;
   while not ((I >= List.Count) or lSectionFound) do
   begin
    STmp := List[I];
    Inc(I);
    if not IsComment(STmp) then
     if ExtractSection(STmp) = lUpSect then
      lSectionFound := True;
   end;

   if lSectionFound then
   begin
    lSectionFound := False;
    Dec(I);
    List.Delete(I);
    while not ((I >= List.Count) or lSectionFound) do
    begin
     STmp := List[I];
     if ExtractSection(STmp) <> '' then
      lSectionFound := True
     else
      List.Delete(I);
    end;
   end;
  finally
   Stream.Seek(0, soBeginning);
   List.SaveToStream(Stream);
   Stream.Size := Stream.Position; // чтобы установить конец файла
   l3Free(Stream);
   l3Free(List);
  end;
 end;
end;

procedure DeleteIniKey(const IniFN: AnsiString; const Section, Key: AnsiString);
var
 lKeyFound : Boolean;
 lSectionFound : Boolean;
 lKey : AnsiString;
 I, X : Integer;
 STmp, lUpSect, lUpKey : AnsiString;
 Stream : TFileStream;
 List : TStringList;
begin
 if FileExists(IniFN) then
 begin
  List := TStringList.Create;
  lKeyFound := False;
  Stream := TFileStream.Create(IniFN, fmOpenReadWrite or fmShareDenyWrite);
  try
   List.LoadFromStream(Stream);
   I := 0;
   lUpSect := UpperCase(Section);
   // ищем секцию
   lSectionFound := False;
   while not ((I >= List.Count) or lSectionFound) do
   begin
    STmp := List[I];
    Inc(I);
    if not IsComment(STmp) then
     if ExtractSection(STmp) = lUpSect then
      lSectionFound := True;
   end;
   // ищем ключ
   lUpKey := UpperCase(Key);
   while I < List.Count do
   begin
    STmp := List[I];
    Inc(I);
    if not IsComment(STmp) then
    begin
     if ExtractSection(STmp) <> '' then // нашли следующую секцию - значит, ключ не найден
      Break;
     X := Pos('=', STmp);
     if X > 0 then
     begin
      lKey := Trim(Copy(STmp, 1, X - 1));
      if UpperCase(lKey) = lUpKey then // ключ найден!
      begin
       List.Delete(I - 1);
       lKeyFound := True;
       Break;
      end;
     end;
    end;
   end;
  finally
   if lKeyFound then // иначе, нафига его записывать?
   begin
    Stream.Seek(0, soBeginning);
    List.SaveToStream(Stream);
    Stream.Size := Stream.Position; // чтобы установить конец файла
   end;
   l3Free(Stream);
   l3Free(List);
  end;
 end;
end;

function NormalizedPath(const aPath: AnsiString): AnsiString;
const
 c_BackSlash = '\';
var
 l_Str: AnsiString;
begin
 if aPath = '' then
 begin
  Result := '';
  Exit;
 end;
 // Замена всех '/' --> '\'
 l_Str := AnsiReplaceStr(Trim(aPath), '/', c_BackSlash);

 // Замена всех '\\' --> '\' (кроме первой пары)
 if (l_Str[1] = c_BackSlash) and (l_Str[2] = c_BackSlash) then
  Result := c_BackSlash + AnsiReplaceStr(l_Str, '\\', c_BackSlash)
 else
  Result := AnsiReplaceStr(l_Str, '\\', c_BackSlash);
end;

procedure InitStationAndServerConfig(aIniPath: AnsiString = '');
var
 l_ServerCfgPath: AnsiString;
begin
 if g_StationConfig = nil then
  g_StationConfig:=TCfgList.Create(aIniPath)
 else
  Assert(SameText(g_StationConfig.CfgFileName, g_StationConfig.CorrectCfgFileName(aIniPath)));
 if g_ServerConfig = nil then
 begin
  StationConfig.Section := 'ServerConfig';
  l_ServerCfgPath := StationConfig.ReadParamStrDef('ServerConfigINI','');
  if Length(l_ServerCfgPath) = 0  then
   g_ServerConfig := StationConfig.Use
  else
   g_ServerConfig := TCfgList.Create(l_ServerCfgPath);
 end;
end;

function UserConfig: TCfgList;
begin
 Result := g_UserConfig;
end;

function StationConfig: TCfgList;
begin
 Result := g_StationConfig;
end;

function ServerConfig: TCfgList;
begin
 Result := g_ServerConfig;
end;

class function TCfgList.CorrectCfgFileName(
  const aName: TFileName): TFileName;
begin
 if Length(aName) = 0 then
  Result := ChangeFileExt(Application.ExeName, CfgExt)
 else
  Result := ExpandFileName(aName);
end;

initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3IniFile.pas initialization enter'); {$EndIf}
 {без initialization finalization не компилит}

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\L3\l3IniFile.pas initialization leave'); {$EndIf}
finalization
 DoneConfigs;
end.

