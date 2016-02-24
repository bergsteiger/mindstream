unit l3XMLWriter;
{* ѕисатель XML. }

{ Ѕиблиотека "Ёверест"    }
{ Ќачал: Ћюлин ј.¬.       }
{ ћодуль: l3XMLWriter -   }
{ Ќачат: 01.03.2005 19:19 }
{ $Id: l3XMLWriter.pas,v 1.21 2015/07/22 16:33:06 fireton Exp $ }

// $Log: l3XMLWriter.pas,v $
// Revision 1.21  2015/07/22 16:33:06  fireton
// - не пишем пустые данные
//
// Revision 1.20  2015/07/22 12:36:37  fireton
// - пишем данные в XML правильно
//
// Revision 1.19  2015/07/21 12:22:36  fireton
// - дорабатываем Il3XMLWriter
//
// Revision 1.18  2013/04/08 14:50:41  lulin
// - портируем.
//
// Revision 1.17  2013/04/05 12:03:00  lulin
// - портируем.
//
// Revision 1.16  2013/01/21 13:02:09  lulin
// {RequestLink:424399558}
//
// Revision 1.15  2013/01/15 12:12:56  lulin
// {RequestLink:423621421}
//
// Revision 1.14  2012/07/31 14:23:05  voba
// - bug fix
//
// Revision 1.13  2012/07/27 11:05:35  voba
// - XML support
//
// Revision 1.12  2008/02/06 11:44:42  lulin
// - список строк переехал в отдельный файл.
//
// Revision 1.11  2007/04/10 13:20:13  lulin
// - используем строки с кодировкой.
//
// Revision 1.10  2007/03/05 13:45:19  lulin
// - bug fix: использовалась не та константа.
//
// Revision 1.9  2006/11/25 15:47:41  lulin
// - дл€ писателей в файл выделен общий предок.
//
// Revision 1.8  2006/11/25 14:36:24  lulin
// - cleanup.
//
// Revision 1.7  2006/11/25 14:31:53  lulin
// - корректнее записываем текст, который в кодировке, отличной от кодировки записываемого файла.
//
// Revision 1.6  2006/11/24 19:04:40  lulin
// - корректно записываем знак параграфа.
//
// Revision 1.5  2006/11/24 17:36:06  lulin
// - корректно пишем управл€ющие символы.
//
// Revision 1.4  2006/11/22 10:12:16  lulin
// - оптимизируем скобки пустых тегов.
//
// Revision 1.3  2006/11/22 09:54:38  lulin
// - cleanup.
//
// Revision 1.2  2006/11/22 09:49:09  lulin
// - убран ненужный параметр.
//
// Revision 1.1  2006/11/21 12:52:56  lulin
// - писатель XML переехал в базовую библиотеку.
//
// Revision 1.5.8.1  2006/11/21 12:40:10  lulin
// - cleanup.
//
// Revision 1.5  2005/03/01 18:38:58  lulin
// - убрана лишн€€ переменна€.
//
// Revision 1.4  2005/03/01 18:21:01  lulin
// - поправлена дата начала файла.
//
// Revision 1.3  2005/03/01 18:13:42  lulin
// - добавлены комментарии.
//
// Revision 1.2  2005/03/01 17:45:06  lulin
// - используем "правильный" Free.
//
// Revision 1.1  2005/03/01 17:43:21  lulin
// - new class: TevXMLWriter (выкушен из VCM).
//

{$Include l3Define.inc }

interface

uses
  Windows,
  ActiveX,

  l3Types,
  l3Interfaces,
  l3Base,
  l3StringList,
  l3Filer,
  l3Writer
  ;

type
  Tl3XMLWriter = class(Tl3Writer, Il3XMLWriter)
   {* √енератор XML. }
    private
    // internal fields
      f_Levels   : Tl3StringList;
      f_Last     : AnsiString;
      f_CodePage : Integer;
      f_Buf      : PAnsiChar;     
      f_IsDataInTag: Boolean;
      f_LastIsFlushed: Boolean;
      procedure FlushLast(aNeedLF: Boolean = True);
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    protected
    // interface methods
      // Il3XMLWriter
      procedure OpenLevel(const aString : AnsiString);
        overload;
        {* - открывает новый тег. }
      procedure OpenLevel(const aString : AnsiString;
                          const aSuffix : AnsiString);
        overload;
        {* - открывает новый тег. aSuffix - атрибуты тега. }
      procedure OpenSubLevel(const aSuffix : AnsiString = '');
        {* - открывает подуровень, путем отрезани€ буквы "s" у предыдущего уровн€. }
      procedure CloseLevel;
        {* - закрывает тег. }
      procedure SaveString(const aString : AnsiString;
                           aLevelDelta   : Integer;
                           aNeedLF: Boolean = True);
        {* - сохран€ет строку в поток. }
      function  CS(const aSt: Tl3PCharLenPrim): AnsiString;
        overload;
        {* - Escape'ит строку. }
      function  CS(const aSt: Il3CString): AnsiString;
        overload;
        {* - Escape'ит строку. }
      function  CS(const aString: AnsiString): AnsiString;
        overload;
        {* - Escape'ит строку. }
      procedure Start;
        override;
        {* - начинает генерацию. }
      procedure InitFields;
        override;
        {* - «аписывает данные }
      procedure PutData(const aString: AnsiString);
        overload;
        {* - «аписывает данные }
      procedure PutData(const aString: Il3CString); overload;
        {* - «аписывает данные }
      procedure PutData(const aString: Tl3PCharLenPrim); overload;
        {-}
    public
    // public methods
      class function Make(const aFileName: AnsiString): Il3XMLWriter;
        reintroduce;
        overload;
        {* - создает генератор, дл€ записи XML в файл. }
      class function Make(const aStream: IStream): Il3XMLWriter;
        reintroduce;
        overload;
        {* - создает генератор, дл€ записи XML в поток. }
      class function Make(aFiler: Tl3CustomFiler): Il3XMLWriter;
        reintroduce;
        overload;
        {* - создает генератор, дл€ записи XML в поток. }
  end;//Tl3XMLWriter

implementation

uses
  SysUtils,
  StrUtils,

  l3Chars,
  l3String,
  l3StringEx
  ;

// start class Tl3XMLWriter

procedure Tl3XMLWriter.InitFields;
  //override;
  {-}
begin
 inherited;
 f_CodePage := CP_RussianWin;
end;

class function Tl3XMLWriter.Make(const aFileName: AnsiString): Il3XMLWriter;
  //reintroduce;
  //overload;
  {-}
var
 l_Writer : Tl3XMLWriter;
begin
 l_Writer := Create(aFileName);
 try
  Result := l_Writer;
 finally
  l3Free(l_Writer);
 end;//try..finally
end;

class function Tl3XMLWriter.Make(const aStream: IStream): Il3XMLWriter;
  //reintroduce;
  //overload;
  {-}
var
 l_Writer : Tl3XMLWriter;
begin
 l_Writer := Create(aStream);
 try
  Result := l_Writer;
 finally
  l3Free(l_Writer);
 end;//try..finally
end;

class function Tl3XMLWriter.Make(aFiler: Tl3CustomFiler): Il3XMLWriter;
  //reintroduce;
  //overload;
  {-}
var
 l_Writer : Tl3XMLWriter;
begin
 l_Writer := Create(aFiler);
 try
  Result := l_Writer;
 finally
  l3Free(l_Writer);
 end;//try..finally
end;

procedure Tl3XMLWriter.Cleanup;
  //override;
  {-}
begin
 l3System.FreeLocalMem(f_Buf);
 l3Free(f_Levels);
 inherited;
end;

procedure Tl3XMLWriter.OpenLevel(const aString : AnsiString);
  //overload;
  {-}
begin
 Assert(not f_IsDataInTag, 'Tl3XMLWriter: ѕопытка открыть новый тег, не закрыв тег с данными!');
 OpenLevel(aString, '');
end;

procedure Tl3XMLWriter.OpenLevel(const aString : AnsiString;
                                 const aSuffix : AnsiString);
  //overload;
  {-}
begin
 if (f_Levels = nil) then
  f_Levels := Tl3StringList.Create;
 FlushLast; 
 if (aSuffix = '') then
  f_Last := Format('%s', [aString])
 else
  f_Last := Format('%s %s', [aString, aSuffix]);
 f_LastIsFlushed := False;
 f_Levels.Add(aString);
 f_IsDataInTag := False;
end;
  
procedure Tl3XMLWriter.OpenSubLevel(const aSuffix : AnsiString = '');
  {-}
var
 l_S : AnsiString;
begin
 with f_Levels do
  l_S := Items[Pred(Count)].AsString;
 OpenLevel(Copy(l_S, 1, Pred(Length(l_S))), aSuffix);
end;

procedure Tl3XMLWriter.CloseLevel;
  {-}
var
 l_Delta: Integer;
 l_Out : AnsiString;
begin
 if (f_Levels <> nil) AND (f_Levels.Count > 0) then
 begin
  with f_Levels do
  begin
   l_Out := Items[Pred(Count)].AsString;
   Delete(Pred(Count));
   if f_IsDataInTag then
    l_Delta := MaxInt
   else
    l_Delta := 0;
   if (f_Last <> '') and not f_LastIsFlushed then
   begin
    SaveString(Format('<%s/>', [f_Last]), l_Delta);
    f_Last := '';
   end//f_Last <> ''
   else
    SaveString(Format('</%s>', [l_Out]), l_Delta);
   if (Count = 0) then
    l3Free(f_Levels);
  end;//f_Levels
  f_IsDataInTag := False;
 end;
end;

procedure Tl3XMLWriter.SaveString(const aString : AnsiString;
                                  aLevelDelta   : Integer;
                                  aNeedLF: Boolean = True);
  {-}
  procedure PutStr(const aStr: AnsiString);
  begin
   if aNeedLF then
    WriteLn(aStr)
   else
    Filer.Write(aStr);
  end;
begin
 if Filer.Pos = 0 then
   WriteLn(Format('<?xml version="1.0" encoding="windows-%d"?>', [f_CodePage]));
 if (f_Levels = nil) or f_Levels.Empty or (aLevelDelta = MaxInt) then
  PutStr(aString)
 else
  PutStr(ev_psFixLen('', f_Levels.Count + aLevelDelta, #32) + aString);
end;

function Tl3XMLWriter.CS(const aSt: Tl3PCharLenPrim): AnsiString;
  //overload;
  {* - Escape'ит строку. }
const
 cFrom : array [1..5] of AnsiChar = ('&',
                                 '>',
                                 '<',
                                 cc_DoubleQuote,
                                 cc_SingleQuote);
 cTo : array [1..5] of AnsiString = ('&amp;',
                                 '&gt;',
                                 '&lt;',
                                 '&quot;',
                                 '&apos;');
 cPref = '&#x';
var
 l_C     : AnsiChar;
 l_P     : Integer;
 l_Index : Integer;
 l_Rep   : AnsiString;
 l_S     : Tl3String;
 l_CP    : Integer;
 l_SE    : Tl3Str;
begin
 l_CP := aSt.SCodePage;
 if (l_CP = CP_ANSI) then
  l_CP := CP_RussianWin
 else
 if (l_CP = CP_OEM) then
  l_CP := CP_RussianDOS;
 if (l_CP = CP_Unicode) then
 begin
  Assert(f_CodePage <> CP_Unicode);
  Result := '';
  for l_Index := 0 to Pred(l_S.Len) do
   Result := Result + cPref + IntToHex(Ord(PWideChar(aSt.S)[l_Index]), 3) + ';';
 end//l_CP = CP_Unicode
 else
 begin
  l_S := Tl3String.Make(Tl3PCharLen(aSt));
  try
   l_Index := 0;
   while (l_Index < l_S.Len) do
   begin
    l_Rep := '';
    l_C := l_S[l_Index];
    Case l_C of
     cc_TriRight:
      l_Rep := '&#x25BA;';
     cc_TriLeft:
      l_Rep := '&#x25C4;';
     cc_OEMParagraphSign:
      l_Rep := '&#x0A7;';
     cc_TriUp:
      l_Rep := '&#x25B2;';
     cc_TriDown:
      l_Rep := '&#x25BC;';
     else
     begin
      if (l_C < cc_HardSpace) then
      begin
       if not (l_C in [cc_SoftEnter, cc_Tab, cc_HardEnter]) then
        l_Rep := #32
       else
        l_Rep := cPref + IntToHex(Ord(l_C), 3) + ';';
      end
      else
      if (l_C > cc_CtrlBackspace) AND (f_CodePage <> l_CP) then
      begin
       l_SE.Init(l3PCharLen(@l_C, 1, l_CP), CP_Unicode, @f_Buf);
       l_Rep := cPref + IntToHex(Ord(PWideChar(l_SE.S)^), 3) + ';';
      end//l_C > cc_CtrlBackspace
      else
      begin
       for l_P := Low(cFrom) to High(cFrom) do
       begin
        if (l_C = cFrom[l_P]) then
        begin
         l_Rep := cTo[l_P];
         break;
        end;//l_C = cFrom[l_P]
       end;//for l_P
      end;//l_C < cc_HardSpace
     end;//else
    end;//Case l_C
    if (l_Rep <> '') then
    begin
     l_S.Delete(l_Index, 1);
     l_S.Insert(l3PCharLen(l_Rep), l_Index);
     Inc(l_Index, Length(l_Rep));
    end//l_Rep <> ''
    else
     Inc(l_Index);
   end;//l_Index <= l_S.Len
   Result := l_S.AsString;
  finally
   l3Free(l_S);
  end;//try..finally
 end;//l_CP = CP_Unicode
end;

function Tl3XMLWriter.CS(const aSt: Il3CString): AnsiString;
  //overload;
  {* - Escape'ит строку. }
begin
 Result := CS(l3PCharLen(aSt));
end;

function Tl3XMLWriter.CS(const aString: AnsiString): AnsiString;
  {-}
begin
 Result := CS(l3PCharLen(aString));
end;

procedure Tl3XMLWriter.FlushLast(aNeedLF: Boolean = True);
begin
 if not f_LastIsFlushed then
 begin
  if (f_Last <> '') then
   SaveString(Format('<%s>', [f_Last]), -1, aNeedLF);
  f_LastIsFlushed := True;
 end;
end;

procedure Tl3XMLWriter.PutData(const aString: AnsiString);
begin
 PutData(l3PCharLen(aString));
end;

procedure Tl3XMLWriter.PutData(const aString: Tl3PCharLenPrim);
begin
 if not l3IsNil(aString) then
 begin
  FlushLast(False);
  Filer.Write(CS(aString));
  f_IsDataInTag := True;
 end;
end;

procedure Tl3XMLWriter.PutData(const aString: Il3CString);
begin
 PutData(l3PCharLen(aString));
end;

procedure Tl3XMLWriter.Start;
  {-}
begin
 inherited;
 //SaveString(Format('<?xml version="1.0" encoding="windows-%d"?>', [f_CodePage]), 0);
end;

end.

