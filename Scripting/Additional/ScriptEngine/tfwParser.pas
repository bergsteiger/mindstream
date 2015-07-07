unit tfwParser;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwParser.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Parser::TtfwParser
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Filer,
  l3ProtoObject,
  l3Parser,
  tfwParserInterfaces,
  tfwCachedTokens,
  tfwStreamFactory
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwParser = class(Tl3ProtoObject, ItfwParser)
 private
 // private fields
   f_CompiledCode : Tl3CustomDosFiler;
   f_Token : Il3CString;
   f_SourceLine : Integer;
   f_TokenInt : Integer;
   f_MyTokenType : Tl3TokenType;
   f_CompiledCodeIsActual : Boolean;
   f_CachedTokens : TtfwCachedTokens;
   f_CompiledCodeName : AnsiString;
   f_Parser : Tl3CustomParser;
   f_KeyWords : ItfwKeywordFinder;
   f_FileName : AnsiString;
 protected
 // realized methods
   function Get_KeyWords: ItfwKeywordFinder;
   procedure Set_KeyWords(const aValue: ItfwKeywordFinder);
   procedure NextToken;
   function TokenLongString: Il3CString;
   function TokenInt: Integer;
   function FileName: AnsiString;
   function TokenType: Tl3TokenType;
   function SourceLine: Integer;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure InitFields; override;
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(aFiler: TtfwStreamFactory); reintroduce;
   class function Make(aFiler: TtfwStreamFactory): ItfwParser; reintroduce;
     {* Сигнатура фабрики TtfwParser.Make }
 end;//TtfwParser
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Chars,
  SysUtils,
  l3Types,
  l3FileUtils,
  l3DateSt,
  tfwCStringFactory,
  l3Variant,
  l3String,
  l3_String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwParser

constructor TtfwParser.Create(aFiler: TtfwStreamFactory);
//#UC START# *52EF72FE00AB_4F4735060149_var*
const
 cVersion = '1.13';
var
 l_FileTime : AnsiString;
 l_Filer : Tl3CustomFiler;
//#UC END# *52EF72FE00AB_4F4735060149_var*
begin
//#UC START# *52EF72FE00AB_4F4735060149_impl*
 inherited Create;
 f_MyTokenType := l3_ttBOF;
 f_CompiledCodeIsActual := false;
 f_FileName := aFiler.FileName;
 if (f_FileName <> '') then
  if FileExists(f_FileName) then
  begin
   f_CompiledCodeName := f_FileName + '.co';
   l_FileTime := cVersion + ' ' + l3DateTimeToStr(FileDateTime(f_FileName));

   if FileExists(f_CompiledCodeName) then
   begin
    f_CompiledCode := Tl3CustomDosFiler.Make(f_CompiledCodeName, l3_fmRead, false, 1000);
    f_CompiledCode.NeedProcessMessages := false;
    f_CompiledCode.Indicator.NeedProgressProc := false;
    f_CompiledCode.Open;
    if l3Same(f_CompiledCode.ReadLn, l_FileTime) then
     f_CompiledCodeIsActual := true
    else
    begin
     f_CompiledCode.Close;
     FreeAndNil(f_CompiledCode);
    end;//l3Same(f_CompiledCode.ReadLn, l_FileTime)
   end;//FileExists(f_CompiledCodeName)

   if not f_CompiledCodeIsActual then
   begin
    Assert(f_CompiledCode = nil);
    f_CompiledCode := Tl3CustomDosFiler.Make(f_CompiledCodeName, l3_fmWrite, false, 1000);
    f_CompiledCode.NeedProcessMessages := false;
    f_CompiledCode.Indicator.NeedProgressProc := false;
    f_CompiledCode.Open;
    f_CompiledCode.WriteLn(l_FileTime);
   end;//not f_CompiledCodeIsActual
  end;//FileExists(l_FileName)

 if not f_CompiledCodeIsActual then
 begin
  Assert(f_Parser = nil);
  f_Parser := Tl3CustomParser.Create;
  l_Filer := Tl3CustomFiler.Create;
  try
   l_Filer.NeedProcessMessages := false;
   l_Filer.Indicator.NeedProgressProc := false;
   l_Filer.Stream := aFiler.Stream;
   l_Filer.NeedProcessMessages := false;
   l_Filer.Indicator.NeedProgressProc := false;
   l_Filer.CodePage := CP_ANSI;
   f_Parser.Filer := l_Filer;
  finally
   FreeAndNil(l_Filer);
  end;//try..finally
 end;//not f_CompiledCodeIsActual
  
 f_CachedTokens := TtfwCachedTokens.Create;
 Assert(not f_CachedTokens.Sorted);
 Assert(f_CachedTokens.Count = 0); 
//#UC END# *52EF72FE00AB_4F4735060149_impl*
end;//TtfwParser.Create

class function TtfwParser.Make(aFiler: TtfwStreamFactory): ItfwParser;
var
 l_Inst : TtfwParser;
begin
 l_Inst := Create(aFiler);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

function TtfwParser.Get_KeyWords: ItfwKeywordFinder;
//#UC START# *52EF72BD0089_4F4735060149get_var*
//#UC END# *52EF72BD0089_4F4735060149get_var*
begin
//#UC START# *52EF72BD0089_4F4735060149get_impl*
 Result := f_KeyWords;
//#UC END# *52EF72BD0089_4F4735060149get_impl*
end;//TtfwParser.Get_KeyWords

procedure TtfwParser.Set_KeyWords(const aValue: ItfwKeywordFinder);
//#UC START# *52EF72BD0089_4F4735060149set_var*
//#UC END# *52EF72BD0089_4F4735060149set_var*
begin
//#UC START# *52EF72BD0089_4F4735060149set_impl*
 f_KeyWords := aValue;
//#UC END# *52EF72BD0089_4F4735060149set_impl*
end;//TtfwParser.Set_KeyWords

procedure TtfwParser.NextToken;
//#UC START# *52EF733F022F_4F4735060149_var*
var
 l_ReadToken : Tl3_String;
 l_Token : Tl3PrimString;
 l_Len : Integer;
 l_KeyWord : Tl3PrimString;
 l_Index : Integer;
//#UC END# *52EF733F022F_4F4735060149_var*
begin
//#UC START# *52EF733F022F_4F4735060149_impl*
 f_Token := nil;
 f_TokenInt := 0;
 f_SourceLine := 0;

 if f_CompiledCodeIsActual then
 begin
  f_CompiledCode.Read(@f_MyTokenType, SizeOf(f_MyTokenType));
  f_CompiledCode.Read(@f_SourceLine, SizeOf(f_SourceLine));

  if (f_MyTokenType <> l3_ttEOF) then
  begin
   if (f_MyTokenType <> l3_ttInteger) then
   begin
    f_CompiledCode.Read(@l_Len, SizeOf(l_Len));
    if (l_Len > 0) then
    begin
     l_ReadToken := Tl3_String.Create;
     try
      l_ReadToken.Len := l_Len;
      Assert(l_ReadToken.Len = l_Len);
      f_CompiledCode.Read(l_ReadToken.St, l_Len);
      f_Token := TtfwCStringFactory.C(l_ReadToken);
 //     Assert(not f_CachedTokens.FindData(f_Token.AsWStr, l_Index, l3_siNative));
      f_CachedTokens.Add(f_Token);
     finally
      FreeAndNil(l_ReadToken);
     end;//try..finally
    end//l_Len > 0
    else
    if (l_Len = 0) then
    begin
     f_Token := TtfwCStringFactory.C('');
 //    Assert(not f_CachedTokens.FindData(f_Token.AsWStr, l_Index, l3_siNative));
     f_CachedTokens.Add(f_Token);
    end//l_Len = 0
    else
    if (l_Len = -1) then
    begin
     f_CompiledCode.Read(@l_Index, SizeOf(l_Index));
     f_Token := f_CachedTokens.Items[l_Index];
    end//l_Len = -1
    else
     Assert(false);
   end//f_MyTokenType <> l3_ttInteger
   else
    f_CompiledCode.Read(@f_TokenInt, SizeOf(f_TokenInt));
  end;//f_MyTokenType <> l3_ttEOF
 end//f_CompiledCodeIsActual
 else
 begin
  f_Parser.NextToken;

  l_Token := f_Parser.TokenLongString;
  f_MyTokenType := f_Parser.TokenType;
  f_SourceLine := f_Parser.SourceLine;

  if (f_MyTokenType = l3_ttInteger) then
  begin
   f_TokenInt := f_Parser.TokenInt;
  end;//f_MyTokenType = l3_ttInteger

  f_Token := TtfwCStringFactory.C(l_Token);
 end;//f_CompiledCodeIsActual
 
 if not f_CompiledCodeIsActual then
 begin
  if (f_CompiledCode <> nil) then
  begin
   if (f_MyTokenType = l3_ttKeyWord) then
   begin
    Assert(false);
   end;//f_MyTokenType = l3_ttKeyWord

   l_Len := l_Token.AsWStr.SLen;

   f_CompiledCode.Write(@f_MyTokenType, SizeOf(f_MyTokenType));
   f_CompiledCode.Write(@f_SourceLine, SizeOf(f_SourceLine));

   if (f_MyTokenType <> l3_ttEOF) then
   begin
    if (f_MyTokenType <> l3_ttInteger) then
    begin
     l_Index := f_CachedTokens.IndexOf(f_Token);
     if (l_Index < 0) then
 //    if not f_CachedTokens.FindData(f_Token.AsWStr, l_Index, l3_siNative) then
     begin
      f_CachedTokens.Add(f_Token);

      f_CompiledCode.Write(@l_Len, SizeOf(l_Len));
      if (l_Len > 0) then
       f_CompiledCode.Write(l_Token.AsWStr.S, l_Len)
      else
       Assert(l_Len = 0);
     end//not f_CachedTokens.FindData(f_Token, l_Index)
     else
     begin
 //     Assert(l3Same(f_CachedTokens.Items[l_Index], f_Token));
      l_Len := -1;
      f_CompiledCode.Write(@l_Len, SizeOf(l_Len));
      f_CompiledCode.Write(@l_Index, SizeOf(l_Index));
     end;//not f_CachedTokens.FindData(f_Token, l_Index)
    end//f_MyTokenType <> l3_ttInteger
    else
     f_CompiledCode.Write(@f_TokenInt, SizeOf(f_TokenInt));
   end;//f_MyTokenType <> l3_ttEOF

  end;//f_CompiledCode <> nil
 end;//not f_CompiledCodeIsActual

 if (f_MyTokenType = l3_ttSymbol) OR
    (f_MyTokenType = l3_ttDoubleQuotedString) then
 begin
  if (f_KeyWords <> nil) then
  begin
   l_KeyWord := f_KeyWords.KeyWordByName[f_Token];
   if (l_KeyWord <> nil) then
    f_MyTokenType := l3_ttKeyWord;
  end;//KeyWords <> nil
 end;//l_OriginalTT = l3_ttSymbol
//#UC END# *52EF733F022F_4F4735060149_impl*
end;//TtfwParser.NextToken

function TtfwParser.TokenLongString: Il3CString;
//#UC START# *52EF735A02FF_4F4735060149_var*
//#UC END# *52EF735A02FF_4F4735060149_var*
begin
//#UC START# *52EF735A02FF_4F4735060149_impl*
 //Result := TtfwCStringFactory.C(inherited TokenLongString);
 if (f_Token = nil) AND (f_MyTokenType = l3_ttInteger) then
  f_Token := TtfwCStringFactory.C(IntToStr(f_TokenInt));
 Result := f_Token;
//#UC END# *52EF735A02FF_4F4735060149_impl*
end;//TtfwParser.TokenLongString

function TtfwParser.TokenInt: Integer;
//#UC START# *52EF739503A9_4F4735060149_var*
//#UC END# *52EF739503A9_4F4735060149_var*
begin
//#UC START# *52EF739503A9_4F4735060149_impl*
 //Result := inherited TokenInt;
 Result := f_TokenInt;
//#UC END# *52EF739503A9_4F4735060149_impl*
end;//TtfwParser.TokenInt

function TtfwParser.FileName: AnsiString;
//#UC START# *52EF73A9014A_4F4735060149_var*
//#UC END# *52EF73A9014A_4F4735060149_var*
begin
//#UC START# *52EF73A9014A_4F4735060149_impl*
 Result := f_FileName;
//#UC END# *52EF73A9014A_4F4735060149_impl*
end;//TtfwParser.FileName

function TtfwParser.TokenType: Tl3TokenType;
//#UC START# *52EF73DE037D_4F4735060149_var*
//#UC END# *52EF73DE037D_4F4735060149_var*
begin
//#UC START# *52EF73DE037D_4F4735060149_impl*
// Result := inherited TokenType;
 Result := f_MyTokenType;
//#UC END# *52EF73DE037D_4F4735060149_impl*
end;//TtfwParser.TokenType

function TtfwParser.SourceLine: Integer;
//#UC START# *52EF7C8E027A_4F4735060149_var*
//#UC END# *52EF7C8E027A_4F4735060149_var*
begin
//#UC START# *52EF7C8E027A_4F4735060149_impl*
// Result := inherited SourceLine;
 Result := f_SourceLine;
//#UC END# *52EF7C8E027A_4F4735060149_impl*
end;//TtfwParser.SourceLine

procedure TtfwParser.Cleanup;
//#UC START# *479731C50290_4F4735060149_var*
//#UC END# *479731C50290_4F4735060149_var*
begin
//#UC START# *479731C50290_4F4735060149_impl*
 //KeyWord := nil;
 f_KeyWords := nil;
 //Filer := nil;
 if (f_CompiledCode <> nil) then
  f_CompiledCode.Close;
 FreeAndNil(f_CompiledCode);
 if not f_CompiledCodeIsActual AND (f_CompiledCodeName <> '') then
  if (f_MyTokenType <> l3_ttEOF) then
  // - файл не прочитали до конца
   DeleteFile(f_CompiledCodeName);
   // - надо удалить "битый код" 
 f_Token := nil;
 FreeAndNil(f_CachedTokens);
 FreeAndNil(f_Parser);
 inherited;
//#UC END# *479731C50290_4F4735060149_impl*
end;//TtfwParser.Cleanup

procedure TtfwParser.InitFields;
//#UC START# *47A042E100E2_4F4735060149_var*
//#UC END# *47A042E100E2_4F4735060149_var*
begin
//#UC START# *47A042E100E2_4F4735060149_impl*
 inherited;
 if (f_Parser <> nil) then
 begin
  f_Parser.CheckFloat := false;
  f_Parser.CheckComment := false;
  f_Parser.CheckStringBracket := false;
  f_Parser.AddDigits2WordChars := true;
  f_Parser.WordChars := f_Parser.WordChars +
                   cc_ANSIRussian +
                   [':', '.', '-', '+', '=', '<', '>', '?', '!', '&', '|',
                    '(', ')', '"', '@', '[', ']', ',',
                    '/', '^', '№', '~', '$', '%', '*', '\',
                    ';'] +
                   cc_Digits;
  f_Parser.CheckStringBracket := false;
  // - не смотрим на символ '<' в строковых константах
  f_Parser.SkipSoftEnter := true;
  // - плюём на #10 модели, которые не смогли победить
  f_Parser.SkipHardEnter := true;
  // - плюём на #13 модели, которые не смогли победить
  f_Parser.CheckKeyWords := false;
  // - ключевые слова будем обрабатывать сами
 end;//f_Parser <> nil
//#UC END# *47A042E100E2_4F4735060149_impl*
end;//TtfwParser.InitFields

{$If not defined(DesignTimeLibrary)}
class function TtfwParser.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4F4735060149_var*
//#UC END# *47A6FEE600FC_4F4735060149_var*
begin
//#UC START# *47A6FEE600FC_4F4735060149_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4F4735060149_impl*
end;//TtfwParser.IsCacheable
{$IfEnd} //not DesignTimeLibrary

procedure TtfwParser.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Token := nil;
 {$IfEnd} //not NoScripts
 {$If not defined(NoScripts)}
 f_KeyWords := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwParser.ClearFields

{$IfEnd} //not NoScripts

end.