unit Script.Interfaces;

interface

uses
 System.SysUtils
 ;

type
  IscriptLog = interface
   procedure ToLog(const aString: String);
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

  Escript = class(Exception)
   public
    class procedure Check(aCondition: Boolean); overload;
    class procedure Check(aCondition: Boolean; const aMessage: String); overload;
  end;//Escript

implementation

class procedure Escript.Check(aCondition: Boolean);
begin
 Escript.Check(aCondition, 'Condition failed');
end;

class procedure Escript.Check(aCondition: Boolean; const aMessage: String);
begin
 if not aCondition then
  raise Self.Create(aMessage);
end;

end.
