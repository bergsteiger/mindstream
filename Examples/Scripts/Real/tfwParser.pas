unit tfwParser;

// Модуль: "w:\common\components\rtl\Garant\ScriptEngine\tfwParser.pas"
// Стереотип: "SimpleClass"

{$Include seDefine.inc}

interface

uses
 l3IntfUses
 , l3ProtoObject
 , tfwParserInterfaces
 , l3Filer
 , l3Interfaces
 , l3Parser
 , tfwCachedTokens
 , tfwStreamFactory
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Core
 , l3Except
 , Classes
;

type
 TtfwParserToken = object
  public
   rTokenType: Tl3TokenType;
   rInteger: Integer;
   rString: Il3CString;
 end;//TtfwParserToken

 _ItemType_ = TtfwParserToken;
 _l3RecordListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include l3RecordListPrim.imp.pas}
 TtfwParserTokenList = class(_l3RecordListPrim_)
 end;//TtfwParserTokenList

 TtfwDecoratorParser = class(Tl3ProtoObject, ItfwParser, ItfwParserEx)
  private
   f_Parser: ItfwParser;
   f_Tokens: TtfwParserTokenList;
   f_Token: TtfwParserToken;
   f_Filer: TtfwStreamFactory;
   f_IndexToPush: Integer;
  private
   procedure CheckParser;
  protected
   procedure PushToken(const aToken: TtfwParserToken);
   procedure NextToken;
   function TokenLongString: Il3CString;
   function TokenInt: Integer;
   function FileName: AnsiString;
   function TokenType: Tl3TokenType;
   function SourceLine: Integer;
   procedure PushString(const aString: Il3CString);
   procedure PushSymbol(const aString: Il3CString);
   procedure PushInt(aValue: Integer);
   procedure Cleanup; override;
    {* Функция очистки полей объекта. }
   procedure InitFields; override;
   procedure ClearFields; override;
  public
   constructor Create(aFiler: TtfwStreamFactory); reintroduce;
   class function Make(aFiler: TtfwStreamFactory): ItfwParserEx; reintroduce;
 end;//TtfwDecoratorParser

 TtfwParser = class(Tl3ProtoObject, ItfwParser)
  private
   f_CompiledCode: Tl3CustomFiler;
   f_Token: Il3CString;
   f_SourceLine: Integer;
   f_TokenInt: Integer;
   f_MyTokenType: Tl3TokenType;
   f_CompiledCodeIsActual: Boolean;
   f_CachedTokens: TtfwCachedTokens;
   f_CompiledCodeName: AnsiString;
   f_Parser: Tl3CustomParser;
   f_FileName: AnsiString;
  protected
   procedure NextToken;
   function TokenLongString: Il3CString;
   function TokenInt: Integer;
   function FileName: AnsiString;
   function TokenType: Tl3TokenType;
   function SourceLine: Integer;
   procedure Cleanup; override;
    {* Функция очистки полей объекта. }
   procedure InitFields; override;
   {$If NOT Defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
    {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
   procedure ClearFields; override;
  public
   constructor Create(aFiler: TtfwStreamFactory); reintroduce;
   class function MakePrim(aFiler: TtfwStreamFactory): ItfwParser; reintroduce;
   class function Make(aFiler: TtfwStreamFactory): ItfwParserEx;
 end;//TtfwParser

function TtfwParserToken_C(const aString: Il3CString;
 aType: Tl3TokenType): TtfwParserToken; overload;
function TtfwParserToken_C(aValue: Integer): TtfwParserToken; overload;
function TtfwParserToken_E: TtfwParserToken;

implementation

uses
 l3ImplUses
 , l3Chars
 , SysUtils
 , l3FileUtils
 , l3DateSt
 , tfwCStringFactory
 , l3Variant
 , l3String
 , l3_String
 , l3Base
 , l3MinMax
 , RTLConsts
;

function TtfwParserToken_C(const aString: Il3CString;
 aType: Tl3TokenType): TtfwParserToken;
//#UC START# *5576DCA60121_5576DC260338_var*
//#UC END# *5576DCA60121_5576DC260338_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *5576DCA60121_5576DC260338_impl*
 Result.rString := aString;
 Result.rTokenType := aType;
//#UC END# *5576DCA60121_5576DC260338_impl*
end;//TtfwParserToken_C

function TtfwParserToken_C(aValue: Integer): TtfwParserToken;
//#UC START# *5576DCCE0203_5576DC260338_var*
//#UC END# *5576DCCE0203_5576DC260338_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *5576DCCE0203_5576DC260338_impl*
 Result.rString := TtfwCStringFactory.C(IntToStr(aValue));
 Result.rInteger := aValue;
 Result.rTokenType := l3_ttInteger;
//#UC END# *5576DCCE0203_5576DC260338_impl*
end;//TtfwParserToken_C

function TtfwParserToken_E: TtfwParserToken;
//#UC START# *5576F2CD0101_5576DC260338_var*
//#UC END# *5576F2CD0101_5576DC260338_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *5576F2CD0101_5576DC260338_impl*
 Result.rTokenType := l3_ttBOF;
//#UC END# *5576F2CD0101_5576DC260338_impl*
end;//TtfwParserToken_E

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_); forward;
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)
function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* Сравнивает элементы списка }
//#UC START# *47B07CF403D0_5576DE3A03D7_var*
//#UC END# *47B07CF403D0_5576DE3A03D7_var*
begin
//#UC START# *47B07CF403D0_5576DE3A03D7_impl*
 Result := false;
 Assert(false);
//#UC END# *47B07CF403D0_5576DE3A03D7_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_5576DE3A03D7_var*
//#UC END# *47B2C42A0163_5576DE3A03D7_var*
begin
//#UC START# *47B2C42A0163_5576DE3A03D7_impl*
 !!! Needs to be implemented !!!
//#UC END# *47B2C42A0163_5576DE3A03D7_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* Сравнивает два существующих элемента. }
//#UC START# *47B99D4503A2_5576DE3A03D7_var*
//#UC END# *47B99D4503A2_5576DE3A03D7_var*
begin
//#UC START# *47B99D4503A2_5576DE3A03D7_impl*
 Result := -1;
 Assert(false);
//#UC END# *47B99D4503A2_5576DE3A03D7_impl*
end;//CompareExistingItems

type _Instance_R_ = TtfwParserTokenList;

{$Include l3RecordListPrim.imp.pas}

constructor TtfwDecoratorParser.Create(aFiler: TtfwStreamFactory);
//#UC START# *5576CDF900F7_5576CD730375_var*
//#UC END# *5576CDF900F7_5576CD730375_var*
begin
//#UC START# *5576CDF900F7_5576CD730375_impl*
 inherited Create;
 aFiler.SetRefTo(f_Filer);
 f_Parser := nil;
//#UC END# *5576CDF900F7_5576CD730375_impl*
end;//TtfwDecoratorParser.Create

class function TtfwDecoratorParser.Make(aFiler: TtfwStreamFactory): ItfwParserEx;
var
 l_Inst : TtfwDecoratorParser;
begin
 l_Inst := Create(aFiler);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TtfwDecoratorParser.Make

procedure TtfwDecoratorParser.CheckParser;
//#UC START# *559FD77C034D_5576CD730375_var*
//#UC END# *559FD77C034D_5576CD730375_var*
begin
//#UC START# *559FD77C034D_5576CD730375_impl*
 if (f_Parser = nil) then
 begin
  f_Parser := TtfwParser.MakePrim(f_Filer);
(*  if (f_KeyWords <> nil) then
   f_Parser.KeyWords := f_KeyWords;*)
 end;//f_Parser = nil
//#UC END# *559FD77C034D_5576CD730375_impl*
end;//TtfwDecoratorParser.CheckParser

procedure TtfwDecoratorParser.PushToken(const aToken: TtfwParserToken);
//#UC START# *560EA6680085_5576CD730375_var*
//#UC END# *560EA6680085_5576CD730375_var*
begin
//#UC START# *560EA6680085_5576CD730375_impl*
 if (f_Tokens = nil) then
  f_Tokens := TtfwParserTokenList.Create;
 if (f_IndexToPush < f_Tokens.Count) then
 begin
  f_Tokens.Insert(f_IndexToPush, aToken);
  Inc(f_IndexToPush);
 end//f_IndexToPush < f_Tokens.Count
 else
 begin
  f_Tokens.Add(aToken);
  f_IndexToPush := f_Tokens.Count;
 end;//f_IndexToPush < f_Tokens.Count
//#UC END# *560EA6680085_5576CD730375_impl*
end;//TtfwDecoratorParser.PushToken

procedure TtfwDecoratorParser.NextToken;
//#UC START# *52EF733F022F_5576CD730375_var*
//#UC END# *52EF733F022F_5576CD730375_var*
begin
//#UC START# *52EF733F022F_5576CD730375_impl*
 CheckParser;
 if (f_Tokens = nil) OR f_Tokens.Empty then
 begin
  f_Token := TtfwParserToken_E;
  f_Parser.NextToken;
 end//f_Tokens.Empty
 else
 begin
  f_Token := f_Tokens.Items[0];
  f_Tokens.Delete(0);
  f_IndexToPush := 0;
 end;//f_Tokens.Empty
//#UC END# *52EF733F022F_5576CD730375_impl*
end;//TtfwDecoratorParser.NextToken

function TtfwDecoratorParser.TokenLongString: Il3CString;
//#UC START# *52EF735A02FF_5576CD730375_var*
//#UC END# *52EF735A02FF_5576CD730375_var*
begin
//#UC START# *52EF735A02FF_5576CD730375_impl*
 if (f_Token.rTokenType = l3_ttBOF) then
 begin
  if (f_Parser = nil) then
   Result := nil
  else
   Result := f_Parser.TokenLongString
 end//f_Token.rTokenType = l3_ttBOF
 else
  Result := f_Token.rString;
//#UC END# *52EF735A02FF_5576CD730375_impl*
end;//TtfwDecoratorParser.TokenLongString

function TtfwDecoratorParser.TokenInt: Integer;
//#UC START# *52EF739503A9_5576CD730375_var*
//#UC END# *52EF739503A9_5576CD730375_var*
begin
//#UC START# *52EF739503A9_5576CD730375_impl*
 if (f_Token.rTokenType = l3_ttBOF) then
  Result := f_Parser.TokenInt
 else
  Result := f_Token.rInteger;
//#UC END# *52EF739503A9_5576CD730375_impl*
end;//TtfwDecoratorParser.TokenInt

function TtfwDecoratorParser.FileName: AnsiString;
//#UC START# *52EF73A9014A_5576CD730375_var*
//#UC END# *52EF73A9014A_5576CD730375_var*
begin
//#UC START# *52EF73A9014A_5576CD730375_impl*
 if (f_Parser = nil) then
  Result := f_Filer.FileName
 else
  Result := f_Parser.FileName;
//#UC END# *52EF73A9014A_5576CD730375_impl*
end;//TtfwDecoratorParser.FileName

function TtfwDecoratorParser.TokenType: Tl3TokenType;
//#UC START# *52EF73DE037D_5576CD730375_var*
//#UC END# *52EF73DE037D_5576CD730375_var*
begin
//#UC START# *52EF73DE037D_5576CD730375_impl*
 if (f_Token.rTokenType = l3_ttBOF) then
 begin
  if (f_Parser = nil) then
   Result := l3_ttBOF
  else
   Result := f_Parser.TokenType;
 end//f_Token.rTokenType = l3_ttBOF
 else
  Result := f_Token.rTokenType;
//#UC END# *52EF73DE037D_5576CD730375_impl*
end;//TtfwDecoratorParser.TokenType

function TtfwDecoratorParser.SourceLine: Integer;
//#UC START# *52EF7C8E027A_5576CD730375_var*
//#UC END# *52EF7C8E027A_5576CD730375_var*
begin
//#UC START# *52EF7C8E027A_5576CD730375_impl*
 if (f_Parser = nil) then
  Result := 0
 else
  Result := f_Parser.SourceLine;
//#UC END# *52EF7C8E027A_5576CD730375_impl*
end;//TtfwDecoratorParser.SourceLine

procedure TtfwDecoratorParser.PushString(const aString: Il3CString);
//#UC START# *5576DB400397_5576CD730375_var*
//#UC END# *5576DB400397_5576CD730375_var*
begin
//#UC START# *5576DB400397_5576CD730375_impl*
 PushToken(TtfwParserToken_C(aString, l3_ttString));
//#UC END# *5576DB400397_5576CD730375_impl*
end;//TtfwDecoratorParser.PushString

procedure TtfwDecoratorParser.PushSymbol(const aString: Il3CString);
//#UC START# *5576DB580131_5576CD730375_var*
//#UC END# *5576DB580131_5576CD730375_var*
begin
//#UC START# *5576DB580131_5576CD730375_impl*
 PushToken(TtfwParserToken_C(aString, l3_ttSymbol));
//#UC END# *5576DB580131_5576CD730375_impl*
end;//TtfwDecoratorParser.PushSymbol

procedure TtfwDecoratorParser.PushInt(aValue: Integer);
//#UC START# *5576DB6D02FE_5576CD730375_var*
//#UC END# *5576DB6D02FE_5576CD730375_var*
begin
//#UC START# *5576DB6D02FE_5576CD730375_impl*
 PushToken(TtfwParserToken_C(aValue));
//#UC END# *5576DB6D02FE_5576CD730375_impl*
end;//TtfwDecoratorParser.PushInt

procedure TtfwDecoratorParser.Cleanup;
 {* Функция очистки полей объекта. }
//#UC START# *479731C50290_5576CD730375_var*
//#UC END# *479731C50290_5576CD730375_var*
begin
//#UC START# *479731C50290_5576CD730375_impl*
 f_Token.rTokenType := l3_ttBOF;
 //Finalize(f_Token);
 FreeAndNil(f_Filer);
 FreeAndNil(f_Tokens);
 inherited;
//#UC END# *479731C50290_5576CD730375_impl*
end;//TtfwDecoratorParser.Cleanup

procedure TtfwDecoratorParser.InitFields;
//#UC START# *47A042E100E2_5576CD730375_var*
//#UC END# *47A042E100E2_5576CD730375_var*
begin
//#UC START# *47A042E100E2_5576CD730375_impl*
 inherited;
 f_Token := TtfwParserToken_E;
 f_IndexToPush := High(f_IndexToPush);
//#UC END# *47A042E100E2_5576CD730375_impl*
end;//TtfwDecoratorParser.InitFields

procedure TtfwDecoratorParser.ClearFields;
begin
 f_Parser := nil;
 inherited;
end;//TtfwDecoratorParser.ClearFields

constructor TtfwParser.Create(aFiler: TtfwStreamFactory);
//#UC START# *52EF72FE00AB_4F4735060149_var*

 procedure OpenCoFiler(aMode : Tl3FileMode);
 var
  l_Try : Integer;
 begin//OpenCoFiler
  f_CompiledCode := Tl3CustomDosFiler.Make(f_CompiledCodeName, aMode, false, 1000);
  f_CompiledCode.NeedProcessMessages := false;
  f_CompiledCode.Indicator.NeedProgressProc := false;
  l_Try := 5;
  while (l_Try > 0) do
  begin
   try
    f_CompiledCode.Open;
   except
    Dec(l_Try);
    if (l_Try > 0) then
    begin
     Sleep(1000);
     continue;
    end//l_Try > 0
    else
     raise;
   end;//try..except
   break;
  end;//while (l_Try > 0)
 end;//OpenCoFiler

const
 cSig = '%co ';
 cVersion = '1.15';
var
 l_FileTime : AnsiString;
 l_Filer : Tl3CustomFiler;
//#UC END# *52EF72FE00AB_4F4735060149_var*
begin
//#UC START# *52EF72FE00AB_4F4735060149_impl*
 inherited Create;
 f_CompiledCodeName := '';
 f_MyTokenType := l3_ttBOF;
 f_CompiledCodeIsActual := false;
 f_FileName := aFiler.FileName;
 if (f_FileName <> '') then
  if FileExists(f_FileName) then
  begin
   f_CompiledCodeName := f_FileName + '.co';
   l_FileTime := cSig + cVersion + ' ' + l3DateTimeToStr(aFiler.FileDateTime);

   if FileExists(f_CompiledCodeName) then
   begin
    OpenCoFiler(l3_fmRead);
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
    OpenCoFiler(l3_fmWrite);
    f_CompiledCode.WriteLn(l_FileTime);
   end;//not f_CompiledCodeIsActual
  end//FileExists(l_FileName)
  else
  begin
   f_CompiledCode := Tl3CustomFiler.Create;
   f_CompiledCode.NeedProcessMessages := false;
   f_CompiledCode.Indicator.NeedProgressProc := false;
   f_CompiledCode.Mode := l3_fmRead;
   f_CompiledCode.Stream := aFiler.Stream;
   try
    f_CompiledCode.Open;
    if l3Starts(cSig + cVersion, f_CompiledCode.ReadLn) then
     f_CompiledCodeIsActual := true
    else
    begin
     f_CompiledCode.Close;
     FreeAndNil(f_CompiledCode);
    end;//l3Same(f_CompiledCode.ReadLn, l_FileTime)
   finally
    aFiler.CloseStream;
   end;//try..finally
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

class function TtfwParser.MakePrim(aFiler: TtfwStreamFactory): ItfwParser;
var
 l_Inst : TtfwParser;
begin
 l_Inst := Create(aFiler);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TtfwParser.MakePrim

class function TtfwParser.Make(aFiler: TtfwStreamFactory): ItfwParserEx;
//#UC START# *5576CDB40223_4F4735060149_var*
//#UC END# *5576CDB40223_4F4735060149_var*
begin
//#UC START# *5576CDB40223_4F4735060149_impl*
 Result := TtfwDecoratorParser.Make(aFiler);
//#UC END# *5576CDB40223_4F4735060149_impl*
end;//TtfwParser.Make

procedure TtfwParser.NextToken;
//#UC START# *52EF733F022F_4F4735060149_var*
var
 l_ReadToken : Tl3_String;
 l_Token : Tl3PrimString;
 l_Len : Integer;
 l_Index : Integer;
 l_CodePage : Integer;
//#UC END# *52EF733F022F_4F4735060149_var*
begin
//#UC START# *52EF733F022F_4F4735060149_impl*
 f_Token := nil;
 f_TokenInt := 0;
 f_SourceLine := 0;

 l_Token := nil;
 
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
      f_CompiledCode.Read(@l_CodePage, SizeOf(l_CodePage));
      l_ReadToken.CodePage := l_CodePage;
      Assert(l_ReadToken.CodePage = l_CodePage);
      l_ReadToken.Len := l_Len;
      Assert(l_ReadToken.Len = l_Len);
      if (l_CodePage = CP_Unicode) then
       f_CompiledCode.Read(l_ReadToken.St, l_Len * SizeOf(WideChar))
      else
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
      begin
       l_CodePage := l_Token.AsWStr.SCodePage;
       f_CompiledCode.Write(@l_CodePage, SizeOf(l_CodePage));
       if (l_CodePage = CP_Unicode) then
        f_CompiledCode.Write(l_Token.AsWStr.S, l_Len * SizeOf(WideChar))
       else
        f_CompiledCode.Write(l_Token.AsWStr.S, l_Len);
      end//l_Len > 0
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
 {* Функция очистки полей объекта. }
//#UC START# *479731C50290_4F4735060149_var*
//#UC END# *479731C50290_4F4735060149_var*
begin
//#UC START# *479731C50290_4F4735060149_impl*
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
 f_CompiledCodeName := '';
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
                    ';', '`'] +
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

{$If NOT Defined(DesignTimeLibrary)}
class function TtfwParser.IsCacheable: Boolean;
 {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
//#UC START# *47A6FEE600FC_4F4735060149_var*
//#UC END# *47A6FEE600FC_4F4735060149_var*
begin
//#UC START# *47A6FEE600FC_4F4735060149_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4F4735060149_impl*
end;//TtfwParser.IsCacheable
{$IfEnd} // NOT Defined(DesignTimeLibrary)

procedure TtfwParser.ClearFields;
begin
 f_Token := nil;
 inherited;
end;//TtfwParser.ClearFields

end.
