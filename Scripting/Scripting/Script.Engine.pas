unit Script.Engine;

interface

uses
 Script.Interfaces,
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptEngine = class
   protected
    class function CompileToken(aContext : TscriptCompileContext): Boolean;
   public
    class function CompileScript(const aFileName: String;
                              const aCompileLog: IscriptCompileLog): IscriptCode;
    class procedure RunScript(const aFileName: String;
                              const aCompileLog: IscriptCompileLog;
                              const aRunLog : IscriptRunLog);
    class procedure RegisterKeyWord(const aKeyWord: String; aWordClass: RscriptWord);
 end;//TscriptEngine

implementation

uses
 TypInfo,
 System.SysUtils,
 Script.Parser,
 Testing.Engine,
 Script.Code,
 Script.StringWord,
 Script.UnknownToken,
 Script.Axiomatics
 ;

class function TscriptEngine.CompileToken(aContext : TscriptCompileContext): Boolean;
var
 l_FoundWord : IscriptWord;
begin
 Result := true;
 aContext.Parser.NextToken;
 aContext.Log(GetEnumName(TypeInfo(TscriptTokenType), Ord(aContext.Parser.TokenType)) + ': ' + aContext.Parser.TokenString, '');
 Case aContext.Parser.TokenType of
  script_ttEOF:
   Result := false;
  script_ttToken:
  begin
   if TscriptAxiomatics.Instance.TryGetValue(aContext.Parser.TokenString, l_FoundWord) then
   // - слово зарегистрировано в аксиоматике
    aContext.Compiler.CompileWord(l_FoundWord)
    // - компилируем его
   else
    aContext.Compiler.CompileWord(TscriptUnknownToken.Make(aContext.Parser.TokenString));
    // - пока компилируем заглушку
  end;//script_ttToken
  script_ttString:
   aContext.Compiler.CompileWord(TscriptStringWord.Make(aContext.Parser.TokenString));
  else
   Assert(false, 'Неизвестный тип токена: ' + GetEnumName(TypeInfo(TscriptTokenType), Ord(aContext.Parser.TokenType)));
 end;//Case l_CompileContext.Parser.TokenType
end;

class function TscriptEngine.CompileScript(const aFileName: String;
                                           const aCompileLog: IscriptCompileLog): IscriptCode;
var
 l_CompileContext : TscriptCompileContext;
begin
 l_CompileContext := TscriptCompileContext.Create(aCompileLog,
                                                  TscriptParser.Make(aFileName),
                                                  TscriptCompiler.Make);
 try
  while CompileToken(l_CompileContext) do
   ;
  Result := l_CompileContext.Compiler.CompiledCode;
 finally
  FreeAndNil(l_CompileContext);
 end;//try..finally
end;

class procedure TscriptEngine.RunScript(const aFileName: String;
                                        const aCompileLog: IscriptCompileLog;
                                        const aRunLog : IscriptRunLog);
var
 l_RunContext : TscriptRunContext;
 l_Code : IscriptCode;
begin
 l_Code := Self.CompileScript(aFileName, aCompileLog);
 try
  l_RunContext := TscriptRunContext.Create(aRunLog);
  try
   l_Code.Run(l_RunContext);
   // - выполняем скомпилированный код
  finally
   FreeAndNil(l_RunContext);
  end;//try..finally
 finally
  l_Code := nil;
 end;//try..finally
end;

class procedure TscriptEngine.RegisterKeyWord(const aKeyWord: String; aWordClass: RscriptWord);
begin
 TscriptAxiomatics.Instance.AddWord(aKeyWord, aWordClass);
end;

end.
