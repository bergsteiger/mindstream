unit l3StringAdapter;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3StringAdapter -           }
{ Начат: 18.01.2008 16:08 }
{ $Id: l3StringAdapter.pas,v 1.6 2009/07/21 12:24:40 lulin Exp $ }

// $Log: l3StringAdapter.pas,v $
// Revision 1.6  2009/07/21 12:24:40  lulin
// {RequestLink:141264340}. №35.
//
// Revision 1.5  2008/12/12 19:19:30  lulin
// - <K>: 129762414.
//
// Revision 1.4  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.3  2008/02/12 10:31:25  lulin
// - избавляемся от излишнего метода на базовом классе.
//
// Revision 1.2  2008/02/05 13:09:16  lulin
// - базовая строка переехала в отжельный файл.
//
// Revision 1.1  2008/01/18 13:26:17  lulin
// - <TDN>: 16.
//

{$Include l3Define.inc }

interface

uses
  l3Types,
  l3IID,
  l3Interfaces,
  l3InternalInterfaces,
  l3CustomString,
  l3_String,
  l3CacheableBase
  ;

type
  Tl3StringAdapter = class(Tl3CacheableBase,
                           Il3MemoryPool,
                           Il3CString)
    private
    // internal fields
      f_String : Tl3CustomString;
    public
    // interface methods
      // Il3String
      function pm_GetAsWStr: Tl3WString;
        {-}
      // Il3MemoryPool
      function  pm_GetSize: Long;
      procedure pm_SetSize(NewSize: Long);
        {-}
    protected
    // internal methods
      function COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
        override;
        {-}
      procedure Cleanup;
        override;
        {-}
    public
    // public methods
      constructor Create(aString: Tl3CustomString);
        reintroduce;
        {-}
      class function Make(aString: Tl3_String): Il3MemoryPool;
        {-}
      class function MakeS(aString: Tl3CustomString): Il3CString;
        {-}
  end;//Tl3StringAdapter

implementation

uses
  l3Base
  ;

// start class Tl3StringAdapter

constructor Tl3StringAdapter.Create(aString: Tl3CustomString);
  //reintroduce;
  {-}
begin
 inherited Create;
 l3Set(f_String, aString);
end;

procedure Tl3StringAdapter.Cleanup;
  //override;
  {-}
begin
 l3Free(f_String);
 inherited;
end;

class function Tl3StringAdapter.Make(aString: Tl3_String): Il3MemoryPool;
  {-}
var
 l_S : Tl3StringAdapter;
begin
 l_S := Create(aString);
 try
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

class function Tl3StringAdapter.MakeS(aString: Tl3CustomString): Il3CString;
  {-}
var
 l_S : Tl3StringAdapter;
begin
 l_S := Create(aString);
 try
  Result := l_S;
 finally
  l3Free(l_S);
 end;//try..finally
end;

function Tl3StringAdapter.COMQueryInterface(const IID: Tl3GUID; out Obj): Tl3HResult;
  //override;
  {-}
begin
 if IID.EQ(IStream) then
 begin
  if (f_String = nil) then
   Result.SetNoInterface
  else
   Result := f_String.COMQueryInterface(IID, Obj);
 end//IID.EQ(IStream)
 else
  Result := inherited COMQueryInterface(IID, Obj);
end;

function Tl3StringAdapter.pm_GetAsWStr: Tl3WString;
  {-}
begin
 Result := f_String.AsWStr;
end;

function Tl3StringAdapter.pm_GetSize: Long;
  {-}
begin
 Result := (f_String As Tl3_String).StSize;
end;

procedure Tl3StringAdapter.pm_SetSize(NewSize: Long);
  {-}
begin
 (f_String As Tl3_String).StSize := NewSize;
end;

end.

