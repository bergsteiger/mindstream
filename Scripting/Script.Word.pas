unit Script.Word;

interface

uses
 Core.Obj,
 Script.WordsInterfaces
 ;

type
 TscriptWord = class(TCoreInterfacedObject, IscriptWord)
  private
   f_Key : String;
    {* - Ключ по которому слово зарегистрированно. }
  protected
   procedure DoDoIt(aContext: TscriptContext); virtual; abstract;
    {* - собственно процедура для выполнения слова словаря. Для определения в потомках. }
   function LogDetails: String; virtual;
   procedure DoIt(aContext: TscriptContext);
    {* - собственно процедура для выполнения слова словаря. }
  public
   constructor Create(const aKey: String);
   class function Make(const aKey: String): IscriptWord;
    {* - фабрика }
 end;//TscriptWord
 RscriptWord = class of TscriptWord;

implementation

constructor TscriptWord.Create(const aKey: String);
begin
 inherited Create;
 f_Key := aKey;
end;

class function TscriptWord.Make(const aKey: String): IscriptWord;
 {* - фабрика }
begin
 Result := Create(aKey);
end;

function TscriptWord.LogDetails: String;
begin
 Result := '';
end;

procedure TscriptWord.DoIt(aContext: TscriptContext);
 {* - собственно процедура для выполнения слова словаря. }
begin
 aContext.Enter(Self.ClassName + ' Key: ' + f_Key, Self.LogDetails);
 try
  DoDoIt(aContext);
 finally
  aContext.Leave(Self.ClassName + ' Key: ' + f_Key, Self.LogDetails);
 end;//try..finally
end;

end.
