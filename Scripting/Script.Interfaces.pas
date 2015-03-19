unit Script.Interfaces;

interface

type
  IscriptLog = interface
   procedure Log(const aString: String);
  end;//IscriptLog

  TscriptTokenType = (script_ttUnknown, script_ttToken, script_ttString, script_ttEOF);

  IscriptParser = interface
   function Get_TokenType: TscriptTokenType;
   function Get_TokenString: String;
   function Get_CurrentLineNumber: Integer;
   procedure NextToken;
    {* - Выбрать следующий токен из входного потока. }
   property TokenType: TscriptTokenType
    read Get_TokenType;
   property TokenString: String
    read Get_TokenString;
   property CurrentLineNumber: Integer
    read Get_CurrentLineNumber;
  end;//IscriptParser

  IscriptCompileLog = interface(IscriptLog)
  end;//IscriptCompileLog

  IscriptRunLog = interface(IscriptLog)
  end;//IscriptRunLog

implementation

end.
