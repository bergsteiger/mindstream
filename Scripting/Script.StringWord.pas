unit Script.StringWord;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptStringWord = class(TscriptWord)
  private
   f_String : String;
  protected
   function LogDetails: String; override;
   procedure DoDoIt(aContext: TscriptContext); override;
  public
   constructor Create(const aString: String);
   class function Make(const aString: String): IscriptWord;
 end;//TscriptStringWord

implementation

constructor TscriptStringWord.Create(const aString: String);
begin
 inherited Create('Строковое значение');
 f_String := aString;
end;

class function TscriptStringWord.Make(const aString: String): IscriptWord;
begin
 Result := Create(aString);
end;

function TscriptStringWord.LogDetails: String;
begin
 Result := '"' + Self.f_String + '"';
end;

procedure TscriptStringWord.DoDoIt(aContext: TscriptContext);
begin
 aContext.PushString(Self.f_String);
end;

end.
