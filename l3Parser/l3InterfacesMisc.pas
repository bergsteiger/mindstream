unit l3InterfacesMisc;
 {* Вспомогательные функции для работы с интерфейсами. }

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. © }
{ Модуль: l3InterfacesMisc - }
{ Начат: 07.04.2000 12:46 }
{ $Id: l3InterfacesMisc.pas,v 1.13 2009/12/03 17:29:15 lulin Exp $ }

// $Log: l3InterfacesMisc.pas,v $
// Revision 1.13  2009/12/03 17:29:15  lulin
// - переносим TbsUserCRListInfo на модель.
//
// Revision 1.12  2009/07/21 13:21:19  lulin
// - правильнее сравниваем - если один из интерфейсов не отдаёт-таки IUnknown.
//
// Revision 1.11  2008/01/30 20:39:44  lulin
// - cleanup.
//
// Revision 1.10  2004/04/28 09:38:06  law
// - начал перетаскивать EE на новое дерево под директивой vtOutlinerKnowsInterface.
//
// Revision 1.9  2003/11/21 12:09:06  law
// - new method versions: l3BQueryInterfaces.
//
// Revision 1.8  2003/03/13 16:37:21  law
// - change: попытка портировать на Builder.
//
// Revision 1.7  2003/02/13 12:50:54  law
// - cleanup: l3IQueryInterface, l3IBQueryInterface переименованы в l3QueryInterface, l3BQueryInterface.
//
// Revision 1.6  2001/09/21 16:48:47  law
// - new proc: l3IQueryInterface.
//
// Revision 1.5  2001/08/29 08:54:08  law
// - comments: xHelpGen.
//
// Revision 1.4  2001/01/31 10:37:32  law
// - оптимизировано использование QueryInterface.
//
// Revision 1.3  2000/12/15 15:19:00  law
// - вставлены директивы Log.
//

{$I l3Define.inc }

interface

uses
  l3Types,
  l3IID
  ;

function l3QueryInterface(O: TObject; const IID: TGUID; out Obj): HResult;
  overload;
  {* - запросить интерфейс у объекта. }
function l3QueryInterface(O: TObject; const IID: Tl3GUID; out Obj): HResult;
  overload;
  {* - запросить интерфейс у объекта. }

function l3BQueryInterface(const O: IUnknown; const IID: TGUID; out Obj): Bool;
  overload;
  {* - запросить интерфейс у объекта. }
function l3BQueryInterface(O: TObject; const IID: TGUID; out Obj): Bool;
  overload;
  {* - запросить интерфейс у объекта. }
function l3BQueryInterface(O: TObject; const IID: Tl3GUID; out Obj): Bool;
  overload;
  {* - запросить интерфейс у объекта. }
function l3BQueryInterface(const O: IUnknown; const IID: TGUID): Bool;
  overload;
  {* - запросить интерфейс у объекта. }
function l3BQueryInterface(O: TObject; const IID: TGUID): Bool;
  overload;
  {* - запросить интерфейс у объекта. }
function l3BQueryInterface(O: TObject; const IID: Tl3GUID): Bool;
  overload;
  {* - запросить интерфейс у объекта. }

function l3IEQ(const I1, I2: IUnknown): Bool;
  {* - проверить эквивалентность интерфейсов. }
function l3QueryInterface(const O: IUnknown; const IID: TGUID; out Obj): HResult;
  overload;
  {* - запросить интерфейс у объекта. }
function l3QueryInterface(const O: IUnknown; const IID: Tl3GUID; out Obj): HResult;
  overload;
  {* - запросить интерфейс у объекта. }

function  l3IOK(Status: HRESULT): Bool;
  {* - проверяет Status, возвращаемый, методами интерфейсов на успех. }
function  l3IFail(Status: HRESULT): Bool;
  {* - проверяет Status, возвращаемый, методами интерфейсов на неуспех. }
  
implementation

uses
  ActiveX{,
  l3Const}
  ;

function l3IOK(Status: HRESULT): Bool;
  {-}
begin
 Result := Succeeded(Status);
end;

function l3IFail(Status: HRESULT): Bool;
  {-}
begin
 Result := Failed(Status);
end;

function l3QueryInterface(O: TObject; const IID: Tl3GUID; out Obj): HResult;
  {overload;}
  {-}
begin
 Result := l3QueryInterface(O, IID.IID, Obj);
end;

function l3QueryInterface(O: TObject; const IID: TGUID; out Obj): HResult;
  {overload;}
  {-}
var
 IU : IUnknown;
begin
 Result := E_NoInterface;
 if (O <> nil) AND O.GetInterface(IUnknown, IU) then begin
  Result := IU.QueryInterface(IID, Obj);
  IU := nil;
 end;
end;

function l3QueryInterface(const O: IUnknown; const IID: TGUID; out Obj): HResult;
  //overload;
  {* - запросить интерфейс у объекта. }
begin
 if (O = nil) then
  Result := E_NoInterface
 else
  Result := O.QueryInterface(IID, Obj);
end;

function l3QueryInterface(const O: IUnknown; const IID: Tl3GUID; out Obj): HResult;
  //overload;
  {* - запросить интерфейс у объекта. }
begin
 Result := l3QueryInterface(O, IID.IID, Obj); 
end;

function l3BQueryInterface(const O: IUnknown; const IID: TGUID; out Obj): Bool;
  //overload;
  {* - запросить интерфейс у объекта. }
begin
 Result := l3IOk(l3QueryInterface(O, IID, Obj));
end;

function l3BQueryInterface(O: TObject; const IID: TGUID; out Obj): Bool;
  //overload;
  {-}
begin
 Result := l3IOK(l3QueryInterface(O, IID, Obj));
end;

function l3BQueryInterface(O: TObject; const IID: Tl3GUID; out Obj): Bool;
  //overload;
  {-}
begin
 Result := l3IOK(l3QueryInterface(O, IID, Obj));
end;

function l3BQueryInterface(const O: IUnknown; const IID: TGUID): Bool;
  //overload;
  {* - запросить интерфейс у объекта. }
var
 l_Fake : IUnknown;  
begin
 Result := l3BQueryInterface(O, IID, l_Fake);
end;

function l3BQueryInterface(O: TObject; const IID: TGUID): Bool;
  //overload;
  {* - запросить интерфейс у объекта. }
var
 l_Fake : IUnknown;  
begin
 Result := l3BQueryInterface(O, IID, l_Fake);
end;

function l3BQueryInterface(O: TObject; const IID: Tl3GUID): Bool;
  //overload;
  {* - запросить интерфейс у объекта. }
var
 l_Fake : IUnknown;  
begin
 Result := l3BQueryInterface(O, IID, l_Fake);
end;

function l3IEQ(const I1, I2: IUnknown): Bool;
  {-}
var
 iu1 : IUnknown;
 iu2 : IUnknown;
begin
 Result := (I1 = I2);
 if not Result AND (I1 <> nil) AND (I2 <> nil) then
 begin
  if l3IOk(I1.QueryInterface(IUnknown, iu1)) then
   try
    if l3IOk(I2.QueryInterface(IUnknown, iu2)) then
     try
      Result := (iu1 = iu2);
     finally
      iu2 := nil;
     end;//try..finally
   finally
    iu1 := nil;
   end;//try..finally
 end;//not Result..
end;

end.

