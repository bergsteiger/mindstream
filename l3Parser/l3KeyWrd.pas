unit l3KeyWrd;
{* Таблица ключевых слов. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3KeyWrd -                  }
{ Начат: 13.10.1999 15:27             }
{ $Id: l3KeyWrd.pas,v 1.28 2015/07/10 10:46:10 lulin Exp $ }

// $Log: l3KeyWrd.pas,v $
// Revision 1.28  2015/07/10 10:46:10  lulin
// - переносим аксиоматику в скрипты.
//
// Revision 1.27  2014/02/14 15:33:48  lulin
// - избавляемся от ошибок молодости.
//
// Revision 1.26  2014/02/04 15:12:14  lulin
// - рефакторинг парсера.
//
// Revision 1.25  2014/02/04 15:01:06  lulin
// - рефакторинг парсера.
//
// Revision 1.24  2013/04/04 11:33:02  lulin
// - портируем.
//
// Revision 1.23  2012/02/14 19:33:27  lulin
// - перегенерация.
//
// Revision 1.22  2011/05/10 17:14:15  lulin
// {RequestLink:236719181}.
// №24.
//
// Revision 1.21  2010/09/02 09:20:14  lulin
// - дурацкое приведение заменяем на Assert.
//
// Revision 1.20  2010/09/02 07:45:06  lulin
// - добавляем две новых версии метода добавления ключевого слова.
//
// Revision 1.19  2010/03/01 14:03:07  lulin
// {RequestLink:193823544}.
// - первый шаг.
//
// Revision 1.18  2008/02/21 16:32:54  lulin
// - cleanup.
//
// Revision 1.17  2008/02/20 17:23:09  lulin
// - упрощаем строки.
//
// Revision 1.16  2008/02/12 19:32:36  lulin
// - избавляемся от универсальности списков.
//
// Revision 1.15  2007/07/23 05:20:49  oman
// warning fix
//
// Revision 1.14  2004/06/02 16:42:39  law
// - удален класс Tl3VList.
//
// Revision 1.13  2004/05/24 10:59:47  law
// - new prop: Tl3KeyWord.KeyWordByID, StringByID.
//
// Revision 1.12  2004/05/14 13:29:38  law
// - new method: Tl3KeyWords.AddKeyWords.
//
// Revision 1.11  2003/03/11 10:30:17  law
// - new class: Tl3StringMap.
//
// Revision 1.10  2002/04/10 15:13:33  law
// - new constructor.
//
// Revision 1.9  2001/09/04 07:37:41  law
// - change nethod: конструктор Tl3KeyWord.Create сделан виртуальным.
//
// Revision 1.8  2001/08/29 09:12:24  law
// - new behavior: Tl3KeyWord теперь можно сравнивать с Integer (l3_ctByID).
//
// Revision 1.7  2001/08/28 11:58:27  law
// - comments: xHelpGen.
//
// Revision 1.6  2001/07/24 12:30:24  law
// - comments: xHelpGen.
//
// Revision 1.5  2000/12/15 15:19:01  law
// - вставлены директивы Log.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3Base,
  l3Dict,
  l3ParserInterfaces
  ;

type
  Tl3KeyWord = class(Tl3String)
   {* Ключевое слово. }
    private
    {internal fields}
      f_Handle : Long;
    protected
    {property methods}
      function  pm_GetStringID: Tl3Handle;
        override;
      procedure pm_SetStringID(Value: Tl3Handle);
        override;
        {-}
    public
    {public methods}
      constructor Create(const aKeyword: AnsiString; aHandle: Long);
        reintroduce;
        overload;
        virtual;
        {* - создает ключевое слово. }
      constructor Create(const aKeyword: Tl3CustomString; aHandle: Long);
        reintroduce;
        overload;
        {* - создает ключевое слово. }
      constructor Create(const aKeyword: Tl3WString; aHandle: Long);
        reintroduce;
        overload;
        {* - создает ключевое слово. }
  end;{Tl3KeyWord}
  {* Ключевое слово. Для связи строки и целочисленного идентификатора.
     Может быть использован как предок для классов с дополнительной информацией и ответственностью.
     А также самостоятельно, совместно с объектами класса Tl3KeyWords. }

  Tl3KeyWords = class(Tl3Dictionary, Il3KeywordFinder)
   {* Таблица ключевых слов. }
    protected
    // ptoperty methods
   function Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
    public
    {public methods}
      constructor Create(aDuplicates : Tl3Duplicates = l3_dupError);
        reintroduce;
        {-}
      procedure AddKeyWords(const aKeyWords: array of Tl3KW);
        {-}
      function  AddKeyWord(const aKeyWord: AnsiString; aID: Long): Tl3KeyWord;
        overload;
        {* - добавить ключевое слово. }
      function  AddKeyWord(const aKeyWord: Tl3WString; aID: Long): Tl3KeyWord;
        overload;
        {* - добавить ключевое слово. }
      function  AddKeyWord(const aKeyWord: Tl3PrimString; aID: Long): Tl3KeyWord;
        overload;
        {* - добавить ключевое слово. }
    public
    // public properties
      property Items;
        default;
        {-}
  end;//Tl3KeyWords
  {* Таблица ключевых слов. Используется для преобразования строки в ее идентификатор. }

implementation

uses
  l3String
  ;

{ start class Tl3KeyWord }

constructor Tl3KeyWord.Create(const aKeyword: AnsiString; aHandle: Long);
  {-}
begin
 inherited Create;
 AsString := aKeyWord;
 StringID := aHandle;
end;

constructor Tl3KeyWord.Create(const aKeyword: Tl3CustomString; aHandle: Long);
  //overload;
  {* - создает ключевое слово. }
begin
 Make(aKeyWord);
 StringID := aHandle;
end;

constructor Tl3KeyWord.Create(const aKeyword: Tl3WString; aHandle: Long);
  //reintroduce;
  //overload;
  {* - создает ключевое слово. }
begin
 Make(aKeyWord);
 StringID := aHandle;
end;

function Tl3KeyWord.pm_GetStringID: Tl3Handle;
  {override;}
  {-}
begin
 Result := f_Handle;
end;

procedure Tl3KeyWord.pm_SetStringID(Value: Tl3Handle);
  {override;}
  {-}
begin
 f_Handle := Value;
end;

// start class Tl3KeyWords

constructor Tl3KeyWords.Create(aDuplicates : Tl3Duplicates = l3_dupError);
  //reintroduce;
  {-}
begin
 inherited Create;
 Duplicates := aDuplicates;
end;

procedure Tl3KeyWords.AddKeyWords(const aKeyWords: array of Tl3KW);
  {-}
var
 l_Index : Integer;
begin
 for l_Index := Low(aKeyWords) to High(aKeyWords) do
  with aKeyWords[l_Index] do
   AddKeyWord(rName, rID);
end;

function Tl3KeyWords.AddKeyWord(const aKeyWord: AnsiString; aID: Long): Tl3KeyWord;
  {-}
begin
 Result := AddKeyWord(l3PCharLen(aKeyWord), aID);
end;

function Tl3KeyWords.AddKeyWord(const aKeyWord: Tl3WString; aID: Long): Tl3KeyWord;
  //overload;
  {* - добавить ключевое слово. }
var
 l_KW    : Tl3KeyWord;
 l_Index : Long;
 l_S     : Tl3PrimString;
begin
 l_KW := Tl3KeyWord.Create(aKeyWord, aID);
 try
  l_Index := Add(l_KW);
  if (l_Index < 0) then
   Result := nil
  else
  begin
   l_S := Items[l_Index];
   Assert(l_S Is Tl3KeyWord);
   Result := Tl3KeyWord(l_S);
  end;//l_Index < 0
 finally
  l3Free(l_KW);
 end;{try..finally}
end;

function Tl3KeyWords.AddKeyWord(const aKeyWord: Tl3PrimString; aID: Long): Tl3KeyWord;
  //overload;
  {* - добавить ключевое слово. }
begin
 Result := AddKeyWord(aKeyWord.AsWStr, aID);
end;

function Tl3KeyWords.Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
begin
 Result := DRbyName[l3Str(aName)];
end;

end.

