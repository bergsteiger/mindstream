unit Script.UnknownToken;

interface

uses
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptUnknownToken = class(TscriptWord)
  private
   f_String : String;
  protected
   function LogDetails: String; override;
   procedure DoDoIt(aContext: TscriptContext); override;
  public
   constructor Create(const aString: String);
   class function Make(const aString: String): IscriptWord;
 end;//TscriptUnknownToken

implementation

constructor TscriptUnknownToken.Create(const aString: String);
begin
 inherited Create('Неизвестный токен');
 f_String := aString;
end;

class function TscriptUnknownToken.Make(const aString: String): IscriptWord;
begin
 Result := Create(aString);
end;

function TscriptUnknownToken.LogDetails: String;
begin
 Result := '"' + Self.f_String + '"';
end;

procedure TscriptUnknownToken.DoDoIt(aContext: TscriptContext);
begin
 // - ничего не делаем
end;

end.
