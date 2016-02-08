unit l3DropSource;

{ Библиотека "Эверест"    }
{ Автор: Люлин А.В. ©     }
{ Модуль: l3DropSource -  }
{ Начат: 06.04.2001 16:14 }
{ $Id: l3DropSource.pas,v 1.3 2013/12/25 15:10:36 lulin Exp $ }

// $Log: l3DropSource.pas,v $
// Revision 1.3  2013/12/25 15:10:36  lulin
// {RequestLink:509706011}
// - перетрясаем модель.
//
// Revision 1.2  2006/12/13 09:07:58  lulin
// - cleanup.
//
// Revision 1.1  2005/05/27 12:24:41  lulin
// - системные модули, не имеющие отношения к Эвересту переехали в L3.
//
// Revision 1.1.60.1  2005/05/27 12:05:56  lulin
// - убраны лишние зависимости.
//
// Revision 1.1  2001/04/06 13:58:41  law
// - new behavior: в первом приближении сделан Drag из окна редактора.
//

{$Include evDefine.inc }

interface

uses
  l3Interfaces,
  l3Const,
  l3Types,
  l3Base,
  l3ProtoObject
  ;

type
  Tl3DropSource = class(Tl3ProtoObject, IDropSource)
    protected
    // interface methods
      // IDropSource
      function QueryContinueDrag(fEscapePressed : WinBOOL;
                                 grfKeyState    : Longint): HResult;
        stdcall;
        {-}
      function GiveFeedback(dwEffect: Longint): HResult;
        stdcall;
        {-}
    public
    // public methods
      class function Make: IDropSource;
        {-}
  end;//Tl3DropSource

implementation

uses
  l3SysUtils
  ;

// start class Tl3DropSource

class function Tl3DropSource.Make: IDropSource;
  {-}
var
 l_DropSource : Tl3DropSource;
begin
 l_DropSource := Create;
 try
  Result := l_DropSource;
 finally
  l3Free(l_DropSource);
 end;//try..finally
end;

function Tl3DropSource.QueryContinueDrag(fEscapePressed : WinBOOL;
                                         grfKeyState    : Longint): HResult;
  //stdcall;
  {-}
begin
 if fEscapePressed then
  Result := DRAGDROP_S_CANCEL
 else
 if (grfKeyState AND MK_LButton = 0) then
  Result := DRAGDROP_S_DROP
 else
  Result := S_Ok;
end;

function Tl3DropSource.GiveFeedback(dwEffect: Longint): HResult;
  //stdcall;
  {-}
begin
 Result := DRAGDROP_S_USEDEFAULTCURSORS;
end;

end.

