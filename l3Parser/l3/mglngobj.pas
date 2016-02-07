unit mgLngObj;

{* Лингвистические объекты. }

(*
//
// module:  mglngobj.pas
// author:  Mickael P. Golovin
//
// $Id: mglngobj.pas,v 1.1 2014/08/20 16:07:28 lulin Exp $
//
*)

// $Log: mglngobj.pas,v $
// Revision 1.1  2014/08/20 16:07:28  lulin
// - вычищаем мусор.
//
// Revision 1.15  2013/04/05 12:04:42  lulin
// - портируем.
//
// Revision 1.14  2012/11/01 07:09:40  lulin
// - вычищаем мусор.
//
// Revision 1.13  2009/10/20 07:19:48  voba
// - cc
//
// Revision 1.12  2009/10/19 11:04:26  voba
// - избавляемся от старой библиотеки регулярных выражений
//
// Revision 1.11  2009/07/20 11:22:28  lulin
// - заставляем работать F1 после - {RequestLink:141264340}. №7, 32, 33.
//
// Revision 1.10  2009/05/25 11:39:49  voba
// - cc
//
// Revision 1.9  2009/04/28 06:39:11  voba
// - замена лингвистического модуля на  l3LingLib
//
// Revision 1.8  2009/03/19 16:28:34  lulin
// [$139443095].
//
// Revision 1.7  2008/05/04 12:24:58  voba
// - переделал m0REXDat
//
// Revision 1.6  2008/02/12 15:18:55  lulin
// - прощаемся с универсальным списком.
//
// Revision 1.5  2008/01/31 20:10:03  lulin
// - избавляемся от излишней универсальности списков.
//
// Revision 1.4  2007/11/26 09:31:50  voba
// - warning remove
//
// Revision 1.3  2006/05/04 11:01:35  lulin
// - поправлен тип длины строки.
// - вычищены "старые" методы работы с памятью и строками.
//
// Revision 1.2  2004/09/21 12:04:30  lulin
// - Release заменил на Cleanup.
//
// Revision 1.1  2004/09/02 15:17:36  law
// - cleanup.
//
// Revision 1.29  2004/05/27 14:32:25  law
// - new methods: _Tl3_CBase.IsCacheable, _NeedStoreInPool.
//
// Revision 1.28  2003/12/01 16:20:42  law
// - change: переходим от вызовов методов объектов к вызовам глобальных/локальных процедур.
//
// Revision 1.27  2003/11/27 12:11:01  fireton
// update: форматирование исходников
//
// Revision 1.26  2003/11/26 15:25:55  fireton
// update: исходники частично отформатированы
//
// Revision 1.25  2002/10/30 13:51:08  law
// - bug fix.
//
// Revision 1.24  2002/10/30 13:43:36  law
// - new behavior: проверка орфографии с учетом сокращений с точкой.
//
// Revision 1.23  2002/10/30 12:19:22  law
// - cleanup.
//
// Revision 1.22  2002/10/30 12:03:18  law
// - cleanup.
//
// Revision 1.21  2002/10/30 11:42:25  law
// - cleanup.
//
// Revision 1.20  2002/10/29 16:15:07  law
// - cleanup.
//
// Revision 1.19  2002/09/03 08:49:29  law
// - change: изменен формат вызова callback процедуры.
//
// Revision 1.18  2002/09/03 08:22:19  law
// - new behavior: нормализация с отбрасыванием частицы НЕ.
//
// Revision 1.17  2002/08/02 11:45:24  migel
// Number parser bug fix
//
// Revision 1.16  2002/04/02 13:56:04  law
// - new behavior: пытаемся оптимизировать распределение памяти.
//
// Revision 1.15  2002/03/28 16:51:14  law
// - bug fix: несовпадение прямого и обратного индексов.
//
// Revision 1.14  2002/03/25 14:39:24  law
// - cleanup: избавляемся от ненужных регулярных выражений.
//
// Revision 1.13  2001/12/20 14:21:59  law
// - comments: xHelpGen.
//

{$I m0Define.inc}

interface

uses
 Windows,
 Messages,

 SysUtils,
 Consts,
 Classes,

 l3Types,
 l3Base,
 l3LingLib

 ,
 //m0Const,
 //m0AddTyp,
 m0STRLib,
 //m0REXLib,
 //m0REXDat,
 //m0REXPar,
 m0LNGLib,
 //m0IDPLib,

 //mgConst,
 mgLngLst
 ;

type
 TmgLangBuilder = class(TmgLangFormHandleList)
   {* Построитель списка нормальных форм. }
 private
  procedure cb_NormalBuff(AStatus: longint; ABuff: PAnsiChar; ASize: Cardinal);
        {-}
 public
    // public methods
  constructor Create(AFlags: longint; ABuff: PAnsiChar; ASize: longint; AOemCp: longbool;
   aWithDot: Bool = False; aTemp: PPointer = nil);
   reintroduce;
   virtual;
        {-}
  class function IsCacheable: Bool;
   override;
        {-}
 end;   //TmgLangBuilder


implementation

uses
  l3Chars,
  l3String
  ;

 { -- unit.private -- }

constructor TmgLangBuilder.Create(AFlags: longint; ABuff: PAnsiChar; ASize: longint; AOemCp: longbool;
 aWithDot: Bool = False; aTemp: PPointer = nil);
begin
 inherited Create;
 m0LNGNormalBuff(Cm0LNGLibStatusINIT_FORM, aFlags,
  aBuff, aSize, aOemCp,
  cb_NormalBuff, aWithDot, aTemp);
end;

class function TmgLangBuilder.IsCacheable: Bool;
  //override;
  {-}
begin
 Result := True;
end;

procedure TmgLangBuilder.cb_NormalBuff(AStatus: longint; ABuff: PAnsiChar; ASize: Cardinal);
var
 LHandle: TmgLangFormHandle;
 LIndex:  longint;
begin
 if BinSearchByKey(ABuff, ASize, LIndex) then
 begin
  with Handles[LIndex] do
   Status := Status or AStatus;
 end
 else
 begin
  LHandle := TmgLangFormHandle.Create;
  try
   with LHandle do
   begin
    Status := AStatus;
    Value  := m0STRPasBuff(ABuff, ASize);
   end;//with LHandle
   Insert(LIndex, LHandle);
  finally
   l3Free(LHandle);
  end;//try..finally
 end;
end;

end.
