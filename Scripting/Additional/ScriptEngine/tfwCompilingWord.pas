unit tfwCompilingWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwCompilingWord.pas"
// Начат: 26.04.2011 17:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwCompilingWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCompilingWord = {abstract} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function CompiledWordClassPrim(const aCtx: TtfwContext): RtfwWord; override;
   function GetEndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // protected methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; virtual; abstract;
   procedure BeforeCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext); virtual;
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); virtual;
   procedure UnknownWord(var aContext: TtfwContext); virtual;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; virtual;
   function AcceptsKeyWordAfter: Boolean; virtual;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; virtual;
   procedure DoStringToken(const aContext: TtfwContext;
     aCompiled: TtfwWord;
     const aString: Il3CString); virtual;
   function AcceptsEOF: Boolean; virtual;
   function DisabledEndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord;
   procedure FillCompiledWord(aCompiled: TtfwWord;
     const aCtx: TtfwContext); virtual;
   function GetWordProducerForCompiledClass: TtfwWord; virtual;
   function SupressNextImmediate: TtfwSuppressNextImmediate; virtual;
   procedure AfterCodePartAdded(aWord: TtfwWord;
     var aCtx: TtfwContext); virtual;
   procedure DoKeyword(var aContext: TtfwContext;
     aWord: TtfwWord;
     const aFinder: Il3KeywordFinder;
     const aPrevContext: TtfwContext); virtual;
 end;//TtfwCompilingWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwCompilingWord

procedure TtfwCompilingWord.BeforeCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext);
//#UC START# *4DB6CDDA038B_4DB6C8F30161_var*
//#UC END# *4DB6CDDA038B_4DB6C8F30161_var*
begin
//#UC START# *4DB6CDDA038B_4DB6C8F30161_impl*
 // - ничего не делаем
//#UC END# *4DB6CDDA038B_4DB6C8F30161_impl*
end;//TtfwCompilingWord.BeforeCompile

procedure TtfwCompilingWord.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DB6C8F30161_var*
//#UC END# *4DB6CE2302C9_4DB6C8F30161_var*
begin
//#UC START# *4DB6CE2302C9_4DB6C8F30161_impl*
 // - ничего не делаем
//#UC END# *4DB6CE2302C9_4DB6C8F30161_impl*
end;//TtfwCompilingWord.AfterCompile

procedure TtfwCompilingWord.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4DB6C8F30161_var*
//#UC END# *4DB6F2760023_4DB6C8F30161_var*
begin
//#UC START# *4DB6F2760023_4DB6C8F30161_impl*
 CompilerAssert(false, 'Неизвестный тип токена', aContext);
//#UC END# *4DB6F2760023_4DB6C8F30161_impl*
end;//TtfwCompilingWord.UnknownWord

function TtfwCompilingWord.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4DB6C8F30161_var*
//#UC END# *4DB9B446039A_4DB6C8F30161_var*
begin
//#UC START# *4DB9B446039A_4DB6C8F30161_impl*
 Result := High(Result);
//#UC END# *4DB9B446039A_4DB6C8F30161_impl*
end;//TtfwCompilingWord.AfterWordMaxCount

function TtfwCompilingWord.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4DB6C8F30161_var*
//#UC END# *4DB9B502013D_4DB6C8F30161_var*
begin
//#UC START# *4DB9B502013D_4DB6C8F30161_impl*
 Result := true;
//#UC END# *4DB9B502013D_4DB6C8F30161_impl*
end;//TtfwCompilingWord.AcceptsKeyWordAfter

function TtfwCompilingWord.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DB6C8F30161_var*
//#UC END# *4DBAEE0D028D_4DB6C8F30161_var*
begin
//#UC START# *4DBAEE0D028D_4DB6C8F30161_impl*
 Result := TkwCompiledWord;
//#UC END# *4DBAEE0D028D_4DB6C8F30161_impl*
end;//TtfwCompilingWord.CompiledWordClass

procedure TtfwCompilingWord.DoStringToken(const aContext: TtfwContext;
  aCompiled: TtfwWord;
  const aString: Il3CString);
//#UC START# *4DC19432023E_4DB6C8F30161_var*
var
 l_S : kwString.TkwString;
//#UC END# *4DC19432023E_4DB6C8F30161_var*
begin
//#UC START# *4DC19432023E_4DB6C8F30161_impl*
 l_S := TkwStringFactory.Instance.MakeKW(aString);
 try
  aCompiled.DoAddCodePart(l_S, false, aContext);
 finally
  FreeAndNil(l_S);
 end;//try..finally
//#UC END# *4DC19432023E_4DB6C8F30161_impl*
end;//TtfwCompilingWord.DoStringToken

function TtfwCompilingWord.AcceptsEOF: Boolean;
//#UC START# *4DC2DEE70178_4DB6C8F30161_var*
//#UC END# *4DC2DEE70178_4DB6C8F30161_var*
begin
//#UC START# *4DC2DEE70178_4DB6C8F30161_impl*
 Result := false;
//#UC END# *4DC2DEE70178_4DB6C8F30161_impl*
end;//TtfwCompilingWord.AcceptsEOF

function TtfwCompilingWord.DisabledEndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4EF4A9500352_4DB6C8F30161_var*
//#UC END# *4EF4A9500352_4DB6C8F30161_var*
begin
//#UC START# *4EF4A9500352_4DB6C8F30161_impl*
 Result := nil;
 if not aSilent then
  CompilerAssert(false, 'Слово не может иметь завершающей скобки', aContext);
//#UC END# *4EF4A9500352_4DB6C8F30161_impl*
end;//TtfwCompilingWord.DisabledEndBracket

procedure TtfwCompilingWord.FillCompiledWord(aCompiled: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F21A4F60049_4DB6C8F30161_var*
//#UC END# *4F21A4F60049_4DB6C8F30161_var*
begin
//#UC START# *4F21A4F60049_4DB6C8F30161_impl*
 // - ничего не делаем
//#UC END# *4F21A4F60049_4DB6C8F30161_impl*
end;//TtfwCompilingWord.FillCompiledWord

function TtfwCompilingWord.GetWordProducerForCompiledClass: TtfwWord;
//#UC START# *4F395A6902D2_4DB6C8F30161_var*
//#UC END# *4F395A6902D2_4DB6C8F30161_var*
begin
//#UC START# *4F395A6902D2_4DB6C8F30161_impl*
 Result := Self;
//#UC END# *4F395A6902D2_4DB6C8F30161_impl*
end;//TtfwCompilingWord.GetWordProducerForCompiledClass

function TtfwCompilingWord.SupressNextImmediate: TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4DB6C8F30161_var*
//#UC END# *4F3AB3B101FC_4DB6C8F30161_var*
begin
//#UC START# *4F3AB3B101FC_4DB6C8F30161_impl*
 Result := tfw_sniNo;
//#UC END# *4F3AB3B101FC_4DB6C8F30161_impl*
end;//TtfwCompilingWord.SupressNextImmediate

procedure TtfwCompilingWord.AfterCodePartAdded(aWord: TtfwWord;
  var aCtx: TtfwContext);
//#UC START# *4F3BCE1501F0_4DB6C8F30161_var*
//#UC END# *4F3BCE1501F0_4DB6C8F30161_var*
begin
//#UC START# *4F3BCE1501F0_4DB6C8F30161_impl*
 // - ничего не делаем
//#UC END# *4F3BCE1501F0_4DB6C8F30161_impl*
end;//TtfwCompilingWord.AfterCodePartAdded

procedure TtfwCompilingWord.DoKeyword(var aContext: TtfwContext;
  aWord: TtfwWord;
  const aFinder: Il3KeywordFinder;
  const aPrevContext: TtfwContext);
//#UC START# *53E21481021D_4DB6C8F30161_var*
var
 l_W  : TtfwWord;

 procedure DoCompile;
 begin
  aContext.rWordCompilingNow.DoAddCodePart(l_W, false, aContext);
  AfterCodePartAdded(l_W, aContext);
 end;//DoCompile

var
 l_FinderToResolve : Il3KeywordFinder;
 l_KW : TtfwKeyWord;
//#UC END# *53E21481021D_4DB6C8F30161_var*
begin
//#UC START# *53E21481021D_4DB6C8F30161_impl*
 l_W := aWord;
//          l_W := (l_Ctx.rParser.KeyWord As TtfwKeyWord).Word;
 if AcceptsKeyWordAfter OR
    ((l_W <> nil) AND (l_W.IsCloseBracket)) then
 begin
  if (l_W = nil) then
  // - описание слова видимо ещё не заверщено, надо брать его же из родителя
  begin
   l_FinderToResolve := aFinder;
   while (l_FinderToResolve <> nil) do
   begin
    l_KW := (l_FinderToResolve.KeywordByName[aContext.rParser.TokenLongString] As TtfwKeyWord);
    CompilerAssert((l_KW <> nil),
                   Format('Слово %s не найдено',
                          [l3Str(aContext.rParser.TokenLongString)]),
                   aContext);
    l_W := l_KW.Word;
    if (l_W <> nil) then
     break;
    l_FinderToResolve := l_FinderToResolve.ParentFinder;
   end;//while (l_FinderToResolve <> nil)
   if (l_W = nil) then
   begin
    l_FinderToResolve := aPrevContext.rEngine.As_ItfwKeywordFinder;
    if (l_FinderToResolve <> aFinder) then
    begin
    // - если там УЖЕ не искали
     l_KW := (l_FinderToResolve.KeywordByName[aContext.rParser.TokenLongString] As TtfwKeyWord);
     CompilerAssert((l_KW <> nil),
                    Format('Слово %s не найдено',
                           [l3Str(aContext.rParser.TokenLongString)]),
                    aContext);
     l_W := l_KW.Word;
    end;//l_FinderToResolve <> l_Finder
   end;//l_W = nil
  end;//l_W = nil
  CompilerAssert(l_W <> nil,
                 Format('Пустое слово для: %s',
                 [l3Str(aContext.rParser.TokenLongString)]),
                 aContext);
  if l_W.IsImmediate then
  begin
   Case Self.SupressNextImmediate of
    tfw_sniNo:
     l_W.DoIt(aContext);
    tfw_sniYes:
    begin
     if l_W.IsAnonimous OR l_W.IsCloseBracket then
      l_W.DoIt(aContext)
     else
      DoCompile;
    end;//tfw_sniYes
    tfw_sniForce:
     DoCompile;
    else
     Assert(false);
   end;// Case Self.SupressNextImmediate
  end//l_W.IsImmediate
  else
   DoCompile;
 end//AcceptsKeyWordAfter
 else
  CompilerAssert(false, 'Неожиданное ключевое слово: ' + l3Str(aContext.rParser.TokenLongString), aContext);
//#UC END# *53E21481021D_4DB6C8F30161_impl*
end;//TtfwCompilingWord.DoKeyword

procedure TtfwCompilingWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6C8F30161_var*

var
 l_Ctx : TtfwContext;

 function CheckInt64(const aString : Il3CString): Boolean;
 var
  l_V : Int64;
 begin//CheckInt64
  Result := false;
  if l3AllCharsInCharSet(aString, cc_Digits) then
//   if TryStrToInt64(aString, l_V) then
   begin
    Result := true;
    DoStringToken(l_Ctx, l_Ctx.rWordCompilingNow, aString);
   end;//TryStrToInt64(aString, l_V)
 end;//CheckInt64

var
 l_I  : TkwInteger;
 l_MC  : Cardinal;
 l_Finder : Il3KeywordFinder;
 l_Compiler : ItfwCompiler;
//#UC END# *4DAEEDE10285_4DB6C8F30161_var*
begin
//#UC START# *4DAEEDE10285_4DB6C8F30161_impl*
 if (aCtx.rCompiler = nil) then
 begin
  l_Compiler := nil;
  l_Finder := aCtx.rEngine.As_ItfwKeywordFinder
 end//aCtx.rCompiler = nil
 else
 begin
  l_Compiler := aCtx.rCompiler;
  l_Finder := l_Compiler.KeywordFinder;
 end;//aCtx.rCompiler = nil
 try
  l_Ctx := aCtx;
  l_Ctx.rKeyWordCompilingNow := nil;
  l_Ctx.rFirstHalfOfDualWord := nil;
  l_Ctx.rTypeInfo := TtfwTypeInfo_E;
  // - чтобы внутренним словам не досталось ереси, которая уже была использована
  l_Ctx.rPrevFinder := l_Finder;
  l_Ctx.rWasCloseBracket := false;
  try
   l_Ctx.rWordCompilingNow := CompiledWordClass(aCtx).Create(GetWordProducerForCompiledClass, l_Finder, aCtx.rTypeInfo, aCtx, Self.Key);
   try
    //l_Ctx.rWordCompilingNow.Key := Self.Key;
    // - чтобы под отладчиком можно было смотреть
    FillCompiledWord(l_Ctx.rWordCompilingNow, aCtx);
    l_Compiler := l_Ctx.rWordCompilingNow.GetCompiler(aCtx);
    l_Ctx.rCompiler := l_Compiler;

    BeforeCompile(aCtx, l_Ctx);

(*    if (aContext.rKeyWordDefiningNow <> nil) then
     l_Ctx.rWordCompilingNow.Key := aContext.rKeyWordDefiningNow;*)

    l_Compiler := l_Ctx.rWordCompilingNow.GetCompiler(aCtx);
    l_Ctx.rCompiler := l_Compiler;
    // - т.к. в BeforeCompile rWordCompilingNow - могло ПОМЕНЯТЬСЯ, например как %CHILDREN
    try
     l_MC := AfterWordMaxCount(l_Ctx);
     if (l_MC > 0) then
     begin
      if (l_Compiler = nil) then
       l_Ctx.rParser.KeyWords := aCtx.rEngine.As_ItfwKeywordFinder
      else
       l_Ctx.rParser.KeyWords := l_Compiler.KeywordFinder;
      try
       l_Ctx.rParser.NextToken;
       while (l_MC > 0) do
       begin
        Dec(l_MC);
        Case l_Ctx.rParser.TokenType of
         l3_ttEOF:
         begin
          if not AcceptsEOF then
           CompilerAssert(false, 'Неожиданный конец файла', l_Ctx);
          l_Ctx.rWasCloseBracket := true;
         end;//l3_ttEOF
         l3_ttInteger:
         begin
          l_I := TkwIntegerFactory.Instance.MakeKW(l_Ctx.rParser.TokenInt);
          try
           l_Ctx.rWordCompilingNow.DoAddCodePart(l_I, false, l_Ctx);
          finally
           FreeAndNil(l_I);
          end;//try..finally
         end;//l3_ttInteger
         l3_ttKeyWord:
         begin
          DoKeyword(l_Ctx, (l_Ctx.rParser.KeyWords.KeyWordByName[l_Ctx.rParser.TokenLongString] As TtfwKeyWord).Word, l_Finder, aCtx);
         end;//l3_ttKeyWord
         l3_ttString:
          DoStringToken(l_Ctx, l_Ctx.rWordCompilingNow, l_Ctx.rParser.TokenLongString);
         else
         begin
          if not CheckInt64(l_Ctx.rParser.TokenLongString) then
          begin
(*           if l3Same(l_Ctx.rParser.TokenLongString.AsWStr, EndBracket(l_Ctx)) then
            break
           else*)
(*           if (EndBracket(l_Ctx) <> nil) AND
              l3Starts(EndBracket(l_Ctx).NameForRegister + l_Ctx.rParser.LineComment, l_Ctx.rParser.TokenLongString.AsWStr) then
           begin
           // - это комментарий приклеенный к закрывающей скобке, его надо пропустить
            l_Ctx.rParser.SkipLineComment;
            l_Ctx.rWasCloseBracket := true;
           end//
           else*)
            UnknownWord(l_Ctx);
          end;//not CheckInt64(l_Ctx.rParser.TokenLongString.AsWStr)
         end;//else
        end;//Case l_Ctx.rParser.TokenType
        if l_Ctx.rWasCloseBracket then
         break;
        if (l_MC > 0) then
         l_Ctx.rParser.NextToken;
       end;//while true
      finally
       l_Ctx.rParser.KeyWords := l_Finder;
      end;//try..finally
     end;//l_MC > 0
     AfterCompile(PtfwContext(@aCtx)^, l_Ctx, (l_Ctx.rWordCompilingNow As TkwCompiledWordPrim));
    finally
//     try
//      AfterCompile(PtfwContext(@aCtx)^, l_Ctx, (l_Ctx.rWordCompilingNow As TkwCompiledWordPrim));
// - этот код перенёс выше, чтобы всплывали более ранние исключения
//     finally
      aCtx.rTypeInfo.Clear;
      // - сбрасываем модификаторы
//     end;//try..finally
    end;//try..finally
   finally
    FreeAndNil(l_Ctx.rWordCompilingNow);
   end;//try..finally
  finally
   Finalize(l_Ctx);
  end;//try..finally
 finally
  l_Finder := nil;
 end;//try..finally
//#UC END# *4DAEEDE10285_4DB6C8F30161_impl*
end;//TtfwCompilingWord.DoDoIt

function TtfwCompilingWord.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4DB6C8F30161_var*
//#UC END# *4DB6D7F70155_4DB6C8F30161_var*
begin
//#UC START# *4DB6D7F70155_4DB6C8F30161_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4DB6C8F30161_impl*
end;//TtfwCompilingWord.IsImmediate

function TtfwCompilingWord.CompiledWordClassPrim(const aCtx: TtfwContext): RtfwWord;
//#UC START# *4F477C2C03B9_4DB6C8F30161_var*
//#UC END# *4F477C2C03B9_4DB6C8F30161_var*
begin
//#UC START# *4F477C2C03B9_4DB6C8F30161_impl*
 Result := CompiledWordClass(aCtx);
//#UC END# *4F477C2C03B9_4DB6C8F30161_impl*
end;//TtfwCompilingWord.CompiledWordClassPrim

function TtfwCompilingWord.GetEndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *52D6B62E001B_4DB6C8F30161_var*
//#UC END# *52D6B62E001B_4DB6C8F30161_var*
begin
//#UC START# *52D6B62E001B_4DB6C8F30161_impl*
 Result := EndBracket(aContext, aSilent);
//#UC END# *52D6B62E001B_4DB6C8F30161_impl*
end;//TtfwCompilingWord.GetEndBracket

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwCompilingWord
 TtfwCompilingWord.RegisterClass;
{$IfEnd} //not NoScripts

end.