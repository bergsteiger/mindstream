unit Script.Dictionary;

interface

uses
 System.Generics.Collections,
 Script.WordsInterfaces,
 Script.Word
 ;

type
 TscriptDictionary = class(TDictionary<String, IscriptWord>)
  public
   procedure AddWord(const aKey: String; aWordClass : RscriptWord);
 end;//TscriptDictionary

implementation

procedure TscriptDictionary.AddWord(const aKey: String; aWordClass : RscriptWord);
var
 l_Word : IscriptWord;
begin
 l_Word := aWordClass.Make(aKey);
 try
  Self.Add(aKey, l_Word);
 finally
  l_Word := nil
 end;//try..finally
end;

end.
