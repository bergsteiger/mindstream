unit uTypes;

interface

type
  Tl3TokenType = (
                  l3_ttBOF,        {- начало файла}
                  l3_ttEOF,        {- конец файла}
                  l3_ttEOL,        {- конец строки}
                  l3_ttSingleChar, {- единичный (управл€ющий) символ}
                  l3_ttSymbol,     {- идентификатор}
                  l3_ttKeyWord,    {- ключевое слово}
                  l3_ttString,     {- строка (в кавычках)}
                  l3_ttInteger,    {- целое число}
                  l3_ttFloat,      {- вещественное число}
                  l3_ttComment,    {- комментарий}
                  l3_ttDoubleQuotedString, // - строка в двойных кавычках
                  l3_ttUnknown
                 );

{type
 IParsable = interface
  procedure NextToken;
  property TokenString: String;
  property TokenType: Tl3TokenType;
 end;                    }

implementation

end.
