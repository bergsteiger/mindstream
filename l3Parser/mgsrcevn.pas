unit mgSrcEvn;

(*
//
// module:  mgsrcevn.pas
// author:  Mickael P. Golovin
//
// Copyright (c) 1997-2000 by Archivarius Team, free for non commercial use.
//
// $Id: mgsrcevn.pas,v 1.1 2014/08/20 16:07:28 lulin Exp $
//
*)

 // $Log: mgsrcevn.pas,v $
 // Revision 1.1  2014/08/20 16:07:28  lulin
 // - вычищаем мусор.
 //
 // Revision 1.9  2014/04/07 10:04:24  lulin
 // - переходим от интерфейсов к объектам.
 //
 // Revision 1.8  2013/04/05 12:04:42  lulin
 // - портируем.
 //
 // Revision 1.7  2011/05/18 12:10:47  lulin
 // {RequestLink:266409354}.
 //
 // Revision 1.6  2009/10/14 08:59:39  voba
 // - избавляемся от библиотеки mg
 //
 // Revision 1.5  2009/04/28 06:34:40  voba
 // - cc
 //
 // Revision 1.4  2005/08/31 13:07:45  lulin
 // - bug fix: был AV при поиске, когда искали в целиком выделенном параграфе.
 //
 // Revision 1.3  2005/03/28 11:32:33  lulin
 // - интерфейсы переехали в "правильный" модуль.
 //
 // Revision 1.2  2005/03/11 13:04:21  lulin
 // - от Tk2AtomR переходим к _Ik2Tag.
 //
 // Revision 1.1  2004/09/02 15:17:37  law
 // - cleanup.
 //
 // Revision 1.19  2004/09/02 10:27:55  law
 // - cleanup: убраны лишние зависимости.
 //
 // Revision 1.18  2003/12/01 16:20:42  law
 // - change: переходим от вызовов методов объектов к вызовам глобальных/локальных процедур.
 //
 // Revision 1.17  2003/11/27 12:11:00  fireton
 // update: форматирование исходников
 //
 // Revision 1.16  2003/11/26 15:25:54  fireton
 // update: исходники частично отформатированы
 //
 // Revision 1.15  2002/10/29 11:10:24  law
 // - change: вставлена директива Log.
 //

{$Include m0Define.inc}

interface

uses

  l3Types,
  l3Interfaces,
  l3Base,
  l3LingLib,
  l3StringList,
  l3ProtoObject
  ;

{строит список норм поданного слова и выполняет поиск выполняет}
type
 TmgFindFormChecker = class(Tl3ProtoObject)
 private
  fNormList : Tl3StringList;

 public
  constructor Create(const aStr : Tl3WString);
  procedure Cleanup; override;
  function SearchEvent(aString: Tl3CustomString; aBegPos: Long;
                       aEndPos: Long; var aBegRes: Long; var aEndRes: Long): Bool;
 end;


implementation

uses
  l3Chars,
  l3String,
  l3MinMax,

  m0LngLib,

  evCursorConst
  ;

 { -- unit.private -- }

 { -- TmgFindFormChecker.private -- }


 { -- TmgFindFormChecker.protected -- }


 { -- TmgFindFormChecker.public -- }

constructor TmgFindFormChecker.Create(const aStr : Tl3WString);
var
 lGetNormWordProc : TllAddStrProc;

 procedure GetNormWord(aWord : PAnsiChar; aWordLen : integer);
 begin
  fNormList.Add(l3PCharLen(aWord, aWordLen));
 end;

begin
 fNormList := Tl3StringList.Create;

 lGetNormWordProc := L2llAddStrProc(@GetNormWord);
 try
  if not mlmaLemmatize(aStr.S, aStr.SLen, 0{maStopAfterFirst}, lGetNormWordProc) then
   GetNormWord(aStr.S, aStr.SLen);
 finally
  FreellAddStrProc(lGetNormWordProc);
 end;
end;

procedure TmgFindFormChecker.Cleanup;
begin
 l3Free(fNormList);
 Inherited;
end;

//if fWordDict.FindData(l3PCharLen(aWord, aWordLen), lIndex, l3_siCaseUnSensitive) then

function TmgFindFormChecker.SearchEvent(aString: Tl3CustomString;
                                        aBegPos: Long; aEndPos: Long;
                                        var aBegRes: Long; var aEndRes: Long): Boolean;

var
 lGetNormWordProc : TllAddStrProc;
 lWasFound : Boolean; // останавливаем перебор
 lStr : Tl3PCharLen;

 procedure GetNormWord(aWord : PAnsiChar; aWordLen : integer);
 var
  lIndex : Integer;
 begin
  if lWasFound then
   Exit;
  // Добавим в словарь
  if fNormList.FindData(l3PCharLen(aWord, aWordLen), lIndex, l3_siCaseUnSensitive) then
   lWasFound := True;
 end;

 function DoWord(var aStr : Tl3WString): Boolean;
 begin
  Result := true;
  if not mlmaLemmatize(aStr.S, aStr.SLen, 0{maStopAfterFirst}, lGetNormWordProc) then
   GetNormWord(aStr.S, aStr.SLen);

  if lWasFound then
  begin
   Result := False;

   aBegRes := aBegPos + aStr.S - lStr.S;
   aEndRes := aBegRes + aStr.SLen;
  end;
 end;//DoWord

begin
 lWasFound := False;
 lStr := l3PCharLen(aString.St + aBegPos, min(aEndPos - aBegPos, aString.Len - aBegPos), aString.CodePage);

 lGetNormWordProc := L2llAddStrProc(@GetNormWord);
 try
  l3ParseWordsF(lStr, l3L2WA(@DoWord));
 finally
  FreellAddStrProc(lGetNormWordProc);
 end;

 Result := lWasFound;
end;
end.
