unit l3StringEx;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3StringEx -                }
{ Начат: 16.02.2000 16:50             }
{ $Id: l3StringEx.pas,v 1.57 2015/02/02 14:20:30 lulin Exp $ }

// $Log: l3StringEx.pas,v $
// Revision 1.57  2015/02/02 14:20:30  lulin
// {RequestLink:586158141}.
//
// Revision 1.56  2014/12/17 16:57:14  lulin
// {RequestLink:585129079}.
//
// Revision 1.55  2014/11/05 16:59:29  lulin
// - перетряхиваем код.
//
// Revision 1.54  2013/07/08 16:43:15  lulin
// - выделяем работу с размером куска памяти.
//
// Revision 1.53  2013/03/28 14:03:17  lulin
// - портируем.
//
// Revision 1.52  2013/01/15 11:59:27  lulin
// {RequestLink:423621421}
//
// Revision 1.51  2012/11/22 10:33:36  dinishev
// {Requestlink:409757935}
//
// Revision 1.50  2011/09/26 10:45:52  lulin
// {RequestLink:287220465}.
//
// Revision 1.49  2011/09/26 09:43:35  lulin
// {RequestLink:287220465}.
//
// Revision 1.48  2010/10/25 16:08:44  lulin
// {RequestLink:237503785}.
//
// Revision 1.47  2010/05/13 10:39:00  lulin
// {RequestLink:211878770}.
//
// Revision 1.46  2010/05/12 09:33:37  narry
// - неправильно конвертировался #149 из Ansi в OEM
//
// Revision 1.45  2009/07/20 16:44:09  lulin
// - убираем из некоторых листьевых параграфов хранение типа конкретного тега, вместо этого "плодим" под каждый тип тега свой тип класса.
//
// Revision 1.44  2009/01/20 08:44:59  lulin
// - <K>: 135600594.
//
// Revision 1.43  2009/01/15 07:26:06  lulin
// - при преобразовании из Unicode в OEM преобразуем № в N.
//
// Revision 1.42  2008/12/18 14:42:50  lulin
// - <K>: 132222370.
//
// Revision 1.41  2008/12/18 12:39:03  lulin
// - <K>: 132222370. Поддерживаем работу с кодировкой TatarOEM.
//
// Revision 1.40  2008/12/15 16:06:19  lulin
// - <K>: 131137753.
//
// Revision 1.39  2008/12/15 14:24:02  lulin
// - <K>: 130744814.
//
// Revision 1.38  2008/01/23 11:28:54  lulin
// - bug fix: не падаем на перекодировки татарского в unicode.
//
// Revision 1.37  2007/08/14 14:30:13  lulin
// - оптимизируем перемещение блоков памяти.
//
// Revision 1.36  2007/03/22 05:56:48  lulin
// - cleanup.
//
// Revision 1.35  2007/03/19 10:40:39  oman
// - fix: Зацикливались на пустой строке в Tl3Str.AsWideString
//
// Revision 1.34  2007/03/16 14:47:31  lulin
// - cleanup.
//
// Revision 1.33  2006/12/01 15:51:04  lulin
// - cleanup.
//
// Revision 1.32  2006/12/01 15:10:33  lulin
// - cleanup.
//
// Revision 1.31  2006/11/27 08:43:26  lulin
// - cleanup.
//
// Revision 1.30  2006/11/25 14:36:23  lulin
// - cleanup.
//
// Revision 1.29  2006/11/25 14:31:53  lulin
// - корректнее записываем текст, который в кодировке, отличной от кодировки записываемого файла.
//
// Revision 1.28  2006/09/21 12:26:27  dinishev
// remove procedure l3FixWidthEx
//
// Revision 1.27  2006/07/06 07:51:03  dinishev
// Bug fix: неправильная выливка гипессылок в таблице
//
// Revision 1.26  2005/09/08 16:09:29  lulin
// - bug fix: часть символов неправильно конвертировались из Unicode в ANSI.
//
// Revision 1.25  2005/09/08 15:23:14  lulin
// - bug fix: Unicode-строки неправильно разгонялись по ширине.
//
// Revision 1.24  2005/04/04 14:01:45  mmorozov
// new: - bugfix: корректное преобразование символов алфавита _CP_OEM в Unicode на не русской кодовой странице;
//
// Revision 1.23  2004/06/18 10:15:46  law
// - класс _TevTextPara стал крайне аскетичным.
//
// Revision 1.22  2004/05/11 17:17:02  law
// - cleanup.
//
// Revision 1.21  2004/04/19 16:08:23  law
// - new type: _Tl3PCharLenConst.
//
// Revision 1.20  2003/09/23 08:38:02  law
// - new prop: IevHyperlink.Hint.
// - rename proc: ev_plAssignNil -> l3AssignNil.
//
// Revision 1.19  2003/05/12 09:20:25  law
// - rename proc: ev_plIsNil -> l3IsNil.
//
// Revision 1.18  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.17  2002/04/05 14:11:18  law
// - bug fix.
//
// Revision 1.16  2002/02/26 15:48:08  law
// - optimization: попытка оптимизации путем уменьшения фрагментации выделяемой памяти.
//
// Revision 1.15  2002/02/19 09:40:28  law
// - bug fix: не рисовался символ § в OEM кодировке.
//
// Revision 1.14  2001/12/11 13:59:56  law
// - new method: _Tm3ParaIndexBuilder.AddPara.
//
// Revision 1.13  2001/11/20 17:37:28  law
// - new behavior: сделана "рыба" для проверки работы индексатора.
//
// Revision 1.12  2001/10/24 12:57:45  law
// - new behavior: при преобразовании ANSI в Unicode нормально перекодируются символы-"стрелки".
//
// Revision 1.11  2001/10/24 12:19:48  law
// - new behavior: при преобразовании OEM в Unicode нормально перекодируются символы-"стрелки".
//
// Revision 1.10  2001/10/18 11:17:18  law
// - new call _format: изменен формат вызова m2XLTConvertBuffEx.
//
// Revision 1.9  2001/10/17 12:06:06  law
// - new behavior: добавлена кодировка CP_KOI8.
//
// Revision 1.8  2001/10/17 08:07:52  law
// - new lib: начинаем использовать m2.
//
// Revision 1.7  2001/10/01 14:07:23  law
// - new unit: l3XLatTables.
//
// Revision 1.6  2001/05/28 09:44:30  law
// - new proc: добавлена процедура l3FixWidth.
//
// Revision 1.5  2000/12/15 15:19:02  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  Windows,

  l3Interfaces,
  l3Types,
  l3Chars,
  l3Base
  ;

type
  Tl3Str = object(Tl3PCharLen)
    public
    // public methods
      procedure Init(aLen      : Long;
                     aCodePage : Long = CP_ANSI;
                     aBuff     : PPointer = nil);
        overload;
        {-}
      procedure Init(const aStr : Tl3PCharLenPrim;
                     aCodePage  : Long = CP_DefaultValue;
                     aBuff      : PPointer = nil);
        overload;
        {-}
      procedure Clear;
        {-}
      function  Empty: Bool;
        {-}
      function  AsWideString: WideString;
        {-}
  end;//Tl3Str

procedure l3FixWidth(S: Tl3String; SL: Long; var DW: Long);
  overload;
  {-}
procedure l3FixWidth(S: Tl3String; NewLen: Long);
  overload;
  {-}
function l3MultiByteToWideChar(aCodePage : Integer;
                                aIn       : PAnsiChar;
                                aInLen    : Integer;
                                aOut      : PWideChar;
                                aOutLen   : Integer): Integer;
  {-}
function l3HasTatar(const aStr: WideString): Boolean;
  {-}
procedure l3FreeStringMem(var aMem : Tl3PtrRec);
  {-}

implementation

uses
  RTLConsts,
  SysUtils,
  Classes,

  l3Except,
  {$IfDef l3Requires_m0}
  m2XltLib,
  {$EndIf l3Requires_m0}
  l3String,
  l3MemorySizeUtils,
  l3Memory,
  {$IfDef l3Requires_m0}
  l3XLatTables,
  {$EndIf l3Requires_m0}
  
  l3DataRefList,
  l3ProtoDataContainer,
  l3MinMax
  ;

{ start object Tl3Str }

procedure l3FixDOSCharsInUnicode(aSt: PWideChar; aLen: Long);
var
 l_Index : Long;
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aSt[l_Index] of
   cc_TriRight: aSt[l_Index] := #$25BA;
   cc_TriLeft: aSt[l_Index] := #$25C4;
   cc_OEMParagraphSign : aSt[l_Index] := #$00A7;
   cc_TriUp: aSt[l_Index] := #$25B2;
   cc_TriDown: aSt[l_Index] := #$25BC;
  end;//Case aSt[l_Index]
 end;//for l_Index
end;

procedure l3FixUnicode(aSt: PWideChar; aLen: Long);
var
 l_Index : Long;
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aSt[l_Index] of
   #186: aSt[l_Index] := #176;
   #8211: aSt[l_Index] := #45;
  end;//Case aSt[l_Index]
 end;//for l_Index
end;

type
 _ItemType_ = Pointer;
 _l3DataRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3DataRefList.imp.pas}
 Tl3DataRefList = class(_l3DataRefList_)
  {* Список ссылок на куски памяти. При своём освобождении освобождает хранимые куски памяти. Эта память должна быть выделена функцией l3System.GetLocalMem. }
 end;//Tl3DataRefList

 Tl3StrBufCache = class(Tl3DataRefList)
   protected
   // internal methods
    function DeleteTailWithoutFree: Pointer;
 end;//Tl3StrBufCache
 
type _Instance_R_ = Tl3DataRefList;
type _l3DataRefList_R_ = Tl3DataRefList;

{$Include w:\common\components\rtl\Garant\L3\l3DataRefList.imp.pas}

function Tl3StrBufCache.DeleteTailWithoutFree: Pointer;
var
 l_Pt : PItemType;
begin
 if (f_Count = 0) then
  Result := nil
 else
 begin
  Dec(f_Count);
  l_Pt := ItemSlot(f_Count);
  Result := l_Pt^;
  l_Pt^ := nil;
 end;//f_Count = 0
end;//Tl3StrBufCache.DeleteTailWithoutFree

var
 l_Tl3StrBufCache : Tl3StrBufCache;

procedure Tl3Str.Init(aLen      : Long;
                      aCodePage : Long = CP_ANSI;
                      aBuff     : PPointer = nil);
  {overload;}
  {-}
begin
 SCodePage := aCodePage;
 if (aBuff = nil) then
 begin
  if (l_Tl3StrBufCache <> nil) AND (l_Tl3StrBufCache.Count > 0) then
  begin
   S := l_Tl3StrBufCache.DeleteTailWithoutFree;
   if (aCodePage = CP_Unicode) then
   begin
    if (l3MemorySize(S) < Succ(aLen) * 2) then
     l3System.ReallocLocalMem(S, Succ(aLen) * 2);
    PWideChar(S)[aLen] := #0;
   end//aCodePage = CP_Unicode
   else
   begin
    if (l3MemorySize(S) < Succ(aLen)) then
     l3System.ReallocLocalMem(S, Succ(aLen));
    S[aLen] := #0;
   end;//aCodePage = CP_Unicode
  end//l_Tl3StrBufCache <> nil
  else
  begin
   if (aCodePage = CP_Unicode) then
   begin
    l3System.GetLocalMem(S, Succ(aLen) * 2);
    PWideChar(S)[aLen] := #0;
   end//aCodePage = CP_Unicode
   else
   begin
    l3System.GetLocalMem(S, Succ(aLen));
    S[aLen] := #0;
   end;//aCodePage = CP_Unicode
  end;//l_Tl3StrBufCache <> nil
 end//aBuff = nil
 else
 begin
  if (aCodePage = CP_Unicode) then
  begin
   if (l3MemorySize(aBuff^) < Succ(aLen) * 2) then
    l3System.ReallocLocalMem(aBuff^, Succ(aLen) * 2);
   S := aBuff^;
   PWideChar(S)[aLen] := #0;
  end//aCodePage = CP_Unicode
  else
  begin
   if (l3MemorySize(aBuff^) < Succ(aLen)) then
    l3System.ReallocLocalMem(aBuff^, Succ(aLen));
   S := aBuff^;
   S[aLen] := #0;
  end;//aCodePage = CP_Unicode
 end;//aBuff = nil
 SLen := aLen;
end;

procedure FreeCache;
begin
 FreeAndNil(l_Tl3StrBufCache);
end;

procedure CheckTl3StrBufCache;
begin
 if (l_Tl3StrBufCache = nil) then
 begin
  l3System.AddExitProc(FreeCache);
  l_Tl3StrBufCache := Tl3StrBufCache.Create;
 end;//l_Tl3StrBufCache = nil
end;

procedure l3StrBufCache_AddString(aStr : PAnsiChar);
begin
 Assert(aStr <> nil);
 l_Tl3StrBufCache.Add(aStr);
end;

procedure Tl3Str.Clear;
  {-}
begin
 CheckTl3StrBufCache;
 if (S <> nil) then
  l3StrBufCache_AddString(S);
 //l3System.FreeLocalMem(S);
 l3AssignNil(Self);
end;

procedure l3FreeStringMem(var aMem : Tl3PtrRec);
  {-}
begin
 if (Tl3Ptr(aMem).GetSize = 0) then
  Exit;
 if (aMem.Flag = l3_mfLocal) then
 begin
  CheckTl3StrBufCache;
  l3StrBufCache_AddString(Tl3Ptr(aMem).AsPointer);
  aMem.Flag := l3_mfNil;
  aMem.Ptr := nil;
  Exit;
 end;//aMem.Flag = l3_mfLocal
 Tl3Ptr(aMem).Clear;
end;
  
function l3HasTatar(const aStr: WideString): Boolean;
  {-}
var
 l_Index : Integer;
begin
 Result := false;
 for l_Index := 1 to Length(aStr) do
  Case aStr[l_Index] of
   #1240,
   #1241,
   #1256,
   #1257,
   #1198,
   #1199,
   #1174,
   #1175,
   #1186,
   #1187,
   #1210,
   #1211:
   begin
    Result := true;
    break;
   end;//#1240..
  end;//Case aStr[l_Index]
end;

procedure l3TatarToUnicode(aIn  : PAnsiChar;
                           aOut : PWideChar;
                           aLen : Integer);
var
 l_Index : Integer;                           
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aIn[l_Index] of
   #128: aOut[l_Index] := #1240;
   #144: aOut[l_Index] := #1241;
   #138: aOut[l_Index] := #1256;
   #154: aOut[l_Index] := #1257;
   #140: aOut[l_Index] := #1198;
   #156: aOut[l_Index] := #1199;
   #141: aOut[l_Index] := #1174;
   #157: aOut[l_Index] := #1175;
   #142: aOut[l_Index] := #1186;
   #158: aOut[l_Index] := #1187;
   #143: aOut[l_Index] := #1210;
   #159: aOut[l_Index] := #1211;
   else
    MultiByteToWideChar(CP_RussianWin, 0, @aIn[l_Index], 1, @aOut[l_Index], 1);
  end;//Case aIn[l_Index]
 end;//for l_Index
end;

procedure l3UnicodeToTatar(aIn  : PWideChar;
                           aOut : PAnsiChar;
                           aLen : Integer);
var
 l_Index : Integer;
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aIn[l_Index] of
   #1240: aOut[l_Index] := #128;
   #1241: aOut[l_Index] := #144;
   #1256: aOut[l_Index] := #138;
   #1257: aOut[l_Index] := #154;
   #1198: aOut[l_Index] := #140;
   #1199: aOut[l_Index] := #156;
   #1174: aOut[l_Index] := #141;
   #1175: aOut[l_Index] := #157;
   #1186: aOut[l_Index] := #142;
   #1187: aOut[l_Index] := #158;
   #1210: aOut[l_Index] := #143;
   #1211: aOut[l_Index] := #159;
   else
    WideCharToMultiByte(CP_RussianWin, 0, @aIn[l_Index], 1, @aOut[l_Index], 1, nil, nil);
  end;//Case aIn[l_Index]
 end;//for l_Index
end;

procedure l3TatarOEMToUnicode(aIn  : PAnsiChar;
                           aOut : PWideChar;
                           aLen : Integer);
var
 l_Index : Integer;
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aIn[l_Index] of
   #242: aOut[l_Index] := #1240;
   #248: aOut[l_Index] := #1241;
   #243: aOut[l_Index] := #1256;
   #249: aOut[l_Index] := #1257;
   #244: aOut[l_Index] := #1198;
   #250: aOut[l_Index] := #1199;
   #245: aOut[l_Index] := #1174;
   #251: aOut[l_Index] := #1175;
   #246: aOut[l_Index] := #1186;
   #252: aOut[l_Index] := #1187;
   #247: aOut[l_Index] := #1210;
   #253: aOut[l_Index] := #1211;
   else
    MultiByteToWideChar(CP_RussianDOS, 0, @aIn[l_Index], 1, @aOut[l_Index], 1);
  end;//Case aIn[l_Index]
 end;//for l_Index
end;

procedure l3UnicodeToTatarOEM(aIn  : PWideChar;
                           aOut : PAnsiChar;
                           aLen : Integer);
var
 l_Index : Integer;
begin
 for l_Index := 0 to Pred(aLen) do
 begin
  Case aIn[l_Index] of
   #1240: aOut[l_Index] := #242;
   #1241: aOut[l_Index] := #248;
   #1256: aOut[l_Index] := #243;
   #1257: aOut[l_Index] := #249;
   #1198: aOut[l_Index] := #244;
   #1199: aOut[l_Index] := #250;
   #1174: aOut[l_Index] := #245;
   #1175: aOut[l_Index] := #251;
   #1186: aOut[l_Index] := #246;
   #1187: aOut[l_Index] := #252;
   #1210: aOut[l_Index] := #247;
   #1211: aOut[l_Index] := #253;
   #8470: aOut[l_Index] := 'N'; // - знак номера
   else
    WideCharToMultiByte(CP_RussianDOS, 0, @aIn[l_Index], 1, @aOut[l_Index], 1, nil, nil);
  end;//Case aIn[l_Index]
 end;//for l_Index
end;

function l3MultiByteToWideChar(aCodePage : Integer;
                                aIn       : PAnsiChar;
                                aInLen    : Integer;
                                aOut      : PWideChar;
                                aOutLen   : Integer): Integer;
begin
 Result := aOutLen;
 Case aCodePage of
  CP_Tatar :
   l3TatarToUnicode(aIn, aOut, aInLen);
  CP_TatarOEM :
   l3TatarOEMToUnicode(aIn, aOut, aInLen);
  else
   Result := MultiByteToWideChar(aCodePage, 0, aIn, aInLen, aOut, aOutLen);
 end;//Case aCodePage
end;

function l3WideCharToMultiByte(aCodePage : Integer;
                               aIn       : PWideChar;
                               aInLen    : Integer;
                               aOut      : PAnsiChar;
                               aOutLen   : Integer): Integer;
begin
 Result := aOutLen;
 Case aCodePage of
  CP_Tatar :
   l3UnicodeToTatar(aIn, aOut, aInLen);
  CP_TatarOEM :
   l3UnicodeToTatarOEM(aIn, aOut, aInLen);
  else
   Result := WideCharToMultiByte(aCodePage, 0, aIn, aInLen, aOut, aOutLen, nil, nil);
 end;//Case aCodePage
end;

procedure Tl3Str.Init(const aStr : Tl3PCharLenPrim;
                      aCodePage  : Long = CP_DefaultValue;
                      aBuff      : PPointer = nil);
  {overload;}
  {-}
var
 l_tmpStr : Tl3Str;  
begin
 if l3IsNil(aStr) then
  l3AssignNil(Self)
 else
 if (aCodePage = CP_DefaultValue) OR (aCodePage = aStr.SCodePage) OR (aCodePage = CP_KeepExisting) then
 begin
  Init(aStr.SLen, aStr.SCodePage, aBuff);
  try
   if SCodePage = CP_Unicode then
    l3Move(aStr.S^, S^, SLen * 2)
   else
    l3Move(aStr.S^, S^, SLen);
  except
   if (aBuff = nil) then
    Clear;
   raise;
  end;{try..except}
 end//aCodePage = CP_DefaultValue
 else
 begin
  Init(aStr.SLen, aCodePage, aBuff);
  try
   {$IfDef l3Requires_m0}
   if (SCodePage = CP_OEMLite) then
   begin
    if (aStr.SCodePage = CP_ANSI) OR (aStr.SCodePage = CP_RussianWin) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuff(S, SLen, Cm2XLTAnsi2Oem);
    end//aStr.SCodePage = CP_ANSI
    else
    if l3IsOEMWithOutLiteEx(aStr.SCodePage) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuff(S, SLen, Cm2XLTOem2Special);
    end//aStr.SCodePage = CP_OEM
    else
    begin
     l_tmpStr.Init(aStr, CP_ANSI);
     try
      l3Move(l_tmpStr.S^, S^, SLen);
      m2XLTConvertBuff(S, SLen, Cm2XLTAnsi2Oem);
     finally
      l_tmpStr.Clear;
     end;{try..finally}
    end;//aStr.SCodePage = CP_OEM
   end//SCodePage = CP_OEMLite
   else
   if (SCodePage = CP_OEM) then
   begin
    if (aStr.SCodePage = CP_ANSI) OR (aStr.SCodePage = CP_RussianWin) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuff(S, SLen, Cm2XLTAnsi2Oem);
    end//aStr.SCodePage = CP_ANSI
    else
    if l3IsOEMEx(aStr.SCodePage) then
    begin
     l3Move(aStr.S^, S^, SLen);
     {-просто копируем исходную строку}
     //m2XLTConvertBuff(S, SLen, Cm2XLTOem2Special);
    end//aStr.SCodePage = CP_OEM
    else
    if (aStr.SCodePage = CP_Unicode) then
    begin
     l3WideCharToMultiByte(SCodePage, PWideChar(aStr.S), aStr.SLen, S, SLen);
    end//aStr.SCodePage = CP_Unicode
    else
    begin
     l_tmpStr.Init(aStr, CP_ANSI);
     try
      l3Move(l_tmpStr.S^, S^, SLen);
      m2XLTConvertBuff(S, SLen, Cm2XLTAnsi2Oem);
     finally
      l_tmpStr.Clear;
     end;{try..finally}
    end;//aStr.SCodePage = CP_OEM
   end//SCodePage = CP_OEM
   else
   if l3IsOEMEx(aStr.SCodePage) then
   begin
    if (SCodePage = CP_ANSI) OR (SCodePage = CP_RussianWin) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuff(S, SLen, Cm2XLTOem2Ansi);
    end//SCodePage = CP_ANSI
    else
    if l3IsOEMWithOutLiteEx(SCodePage) then
    begin
     l3Move(aStr.S^, S^, SLen);
     {-просто копируем исходную строку}
    end//SCodePage = CP_OEM
    else
    if (SCodePage = CP_Unicode) then
    begin
     MultiByteToWideChar(CP_RussianDos, 0, aStr.S, aStr.SLen, PWideChar(S), SLen);
     l3FixDOSCharsInUnicode(PWideChar(S), SLen);
    end//SCodePage = CP_Unicode
    else
    begin
     l_tmpStr.Init(aStr, CP_Unicode);
     try
      l3WideCharToMultiByte(SCodePage, PWideChar(l_tmpStr.S), l_tmpStr.SLen, S, SLen);
     finally
      l_tmpStr.Clear;
     end;//try..finally
    end;//SCodePage = CP_Unicode
   end//aStr.SCodePage = CP_OEMLite
   else
   if (SCodePage = CP_KOI8) then
   begin
    if (aStr.SCodePage = CP_ANSI) OR (aStr.SCodePage = CP_RussianWin) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuffEx(S, SLen, Win2Koi);
    end//aStr.SCodePage = CP_ANSI
    else
    if (aStr.SCodePage = CP_OEM) OR (aStr.SCodePage = CP_RussianDos) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuffEx(S, SLen, Dos2Koi);
    end//aStr.SCodePage = CP_OEM
    else
    begin
     l_tmpStr.Init(aStr, CP_ANSI);
     try
      l3Move(l_tmpStr.S^, S^, SLen);
      m2XLTConvertBuffEx(S, SLen, Win2Koi);
     finally
      l_tmpStr.Clear;
     end;//try..finally
    end;//aStr.SCodePage = CP_OEM
   end//SCodePage = CP_KOI8
   else
   if (aStr.SCodePage = CP_KOI8) then
   begin
    if (SCodePage = CP_ANSI) OR (SCodePage = CP_RussianWin) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuffEx(S, SLen, Koi2Win);
    end//SCodePage = CP_ANSI
    else
    if (SCodePage = CP_OEM) OR (SCodePage = CP_RussianDos) then
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuffEx(S, SLen, Koi2Dos);
    end//SCodePage = CP_OEM
    else
    begin
     l3Move(aStr.S^, S^, SLen);
     m2XLTConvertBuffEx(S, SLen, Koi2Win);
     l_tmpStr.Init(l3PCharLen(S, SLen, CP_ANSI), CP_Unicode);
     try
      if SCodePage = CP_Unicode then
       l3Move(l_tmpStr.S^, S^, SLen * 2)
      else
       l3WideCharToMultiByte(SCodePage, PWideChar(l_tmpStr.S), l_tmpStr.SLen, S, SLen);
     finally
      l_tmpStr.Clear;
     end;{try..finally}
    end;//SCodePage = CP_OEM
   end//aStr.SCodePage = CP_KOI8
   else
   {$EndIf l3Requires_m0}
   if (SCodePage = CP_Unicode) then
   begin
    Case aStr.SCodePage of
     CP_OEM, CP_RussianDOS:
      MultiByteToWideChar(CP_RussianDos, 0, aStr.S, aStr.SLen, PWideChar(S), SLen);
     CP_ANSI:
      MultiByteToWideChar(CP_RussianWin, 0, aStr.S, aStr.SLen, PWideChar(S), SLen);
     CP_Tatar:
      l3TatarToUnicode(aStr.S, PWideChar(S), SLen);
     CP_TatarOEM:
      l3TatarOEMToUnicode(aStr.S, PWideChar(S), SLen);
     else
      MultiByteToWideChar(aStr.SCodePage, 0, aStr.S, aStr.SLen, PWideChar(S), SLen);
    end;//Case aStr.SCodePage
    l3FixDOSCharsInUnicode(PWideChar(S), SLen);
   end//SCodePage = CP_Unicode
   else
   if (aStr.SCodePage = CP_Unicode) then
   begin
    if (SCodePage = CP_Tatar) then
     l3UnicodeToTatar(PWideChar(aStr.S), S, SLen)
    else
    if (SCodePage = CP_TatarOEM) then
     l3UnicodeToTatarOEM(PWideChar(aStr.S), S, SLen)
    else
    begin
     if (SCodePage = CP_ANSI) then
      l3FixUnicode(PWideChar(aStr.S), aStr.SLen);
     l3WideCharToMultiByte(SCodePage, PWideChar(aStr.S), aStr.SLen, S, SLen)
    end;//SCodePage = CP_Tatar
   end//aStr.SCodePage = CP_Unicode
   else
   begin
    l_tmpStr.Init(aStr, CP_Unicode);
    try
     if (SCodePage = CP_Tatar) then
      l3UnicodeToTatar(PWideChar(l_tmpStr.S), S, SLen)
     else
     if (SCodePage = CP_TatarOEM) then
      l3UnicodeToTatarOEM(PWideChar(l_tmpStr.S), S, SLen)
     else
      l3WideCharToMultiByte(SCodePage, PWideChar(l_tmpStr.S), l_tmpStr.SLen, S, SLen);
    finally
     l_tmpStr.Clear;
    end;//try..finally
   end;//aStr.SCodePage = CP_Unicode
  except
   if (aBuff = nil) then
    Clear;
   raise;
  end;//try..except
 end;//aCodePage = CP_DefaultValue
end;

function Tl3Str.Empty: Bool;
  {-}
begin
 Result := l3IsNil(Self);
end;

function Tl3Str.AsWideString: WideString;
  {-}
var
 l_Str : Tl3Str;
begin
 if not l3IsNil(Self) then
 begin
  if (SCodePage = CP_Unicode) then
  begin
   SetLength(Result, SLen);
   l3Move(S^, PWideChar(Result)^, SLen * 2);
  end//SCodePage = CP_Unicode
  else
  begin
   l_Str.Init(Self, CP_Unicode);
   try
    Result := l_Str.AsWideString;
   finally
    l_Str.Clear;
   end;//try..finally
  end;//SCodePage = CP_Unicode
 end//not l3IsNil(Self)
 else
  Result := '';
end;

procedure l3FixWidth(S: Tl3String; SL: Long; var DW: Long);
  {-}
var
 WC    : Long;
 DDW   : Long;
 P     : PAnsiChar;
 CI, O : Long;
 l_DW  : Long;
 l_Div : Integer;
begin
 if (SL > 0) AND (DW > 0) then
 begin
  P := S.St;
  WC := l3CountOfChar(cc_HardSpace, l3PCharLen(P, SL, S.CodePage));
  if (WC > 0) then
  begin
   if (S.CodePage = CP_Unicode) then
    l_Div := 2
   else
    l_Div := 1; 
   O := 0;
   l_DW := DW;
   while (l_DW > 0) AND (WC > 0) do
   begin
    DDW := l_DW div WC;
    CI := ev_lpCharIndex(cc_HardSpace, l3PCharLen(P, SL - (P - S.St) div l_Div, S.CodePage));
    S.Insert(cc_HardSpace, CI + (P - S.St) div l_Div, DDW);
    Dec(l_DW, DDW);
    Dec(WC);
    Inc(O, CI);
    Inc(O, DDW);
    Inc(O);
    P := S.St + O * l_Div;
   end;//while l_DW
  end else
   DW := 0; //- сигнализируем, что мы не добили пробелами
 end;//SL > 0
end;

procedure l3FixWidth(S: Tl3String; NewLen: Long);
  //overload;
  {-}
begin
 Dec(NewLen, S.Len);
 l3FixWidth(S, S.Len, NewLen);
end;

end.

