unit Script.Word.Examples;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptWordExample1 = class(TscriptWord)
  protected
   function LogDetails: String; override;
   procedure DoDoIt(aContext: TscriptContext); override;
 end;//TscriptWordExample1

 TscriptWordExample2 = class(TscriptWord)
  protected
   function LogDetails: String; override;
   procedure DoDoIt(aContext: TscriptContext); override;
 end;//TscriptWordExample2

implementation

uses
 Script.Engine
 ;

// TscriptWordExample1

function TscriptWordExample1.LogDetails: String;
begin
 Result := 'Example 1';
end;

procedure TscriptWordExample1.DoDoIt(aContext: TscriptContext);
begin
 // - Ничего не делаем
end;

// TscriptWordExample2

function TscriptWordExample2.LogDetails: String;
begin
 Result := 'Example 2';
end;

procedure TscriptWordExample2.DoDoIt(aContext: TscriptContext);
begin
 // - Ничего не делаем
end;

initialization
 TscriptEngine.RegisterKeyWord('DoNothing', TscriptWordExample1);
 TscriptEngine.RegisterKeyWord('DoNothing2', TscriptWordExample2);

end.
