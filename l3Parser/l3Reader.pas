unit l3Reader;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Reader -                  }
{ Начат: 10.03.2006 18:55             }
{ $Id: l3Reader.pas,v 1.2 2008/02/14 17:09:15 lulin Exp $ }

// $Log: l3Reader.pas,v $
// Revision 1.2  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.1  2006/03/10 18:22:08  lulin
// - работа над заливкой/выливкой строковых ресурсов.
//

{$Include l3Define.inc }

interface

uses
  l3Interfaces,
  l3Types,
  l3Base,
  l3Filer,
  l3CacheableBase
  ;

type
  Tl3Reader = class(Tl3CacheableBase, Il3Reader)
    private
    // internal fields
      f_Filer  : Tl3CustomFiler;
    protected
    // internal methods
      procedure DoRead;
        virtual;
        abstract;
        {-}
      procedure Execute;
        {-}
      procedure Cleanup;
        override;
        {-}
    protected
    // internal properties
      property Filer: Tl3CustomFiler
        read f_Filer;
        {-}
    public
    // public methods
      constructor Create(const aFileName: String);
        reintroduce;
        overload;
        {-}
      constructor Create(const aStream: IStream);
        reintroduce;
        overload;
        {-}
      class function Make(const aFileName: String): Il3Reader;
        reintroduce;
        overload;
        {-}
      class function Make(const aStream: IStream): Il3Reader;
        reintroduce;
        overload;
        {-}
  end;//Tl3Reader

implementation

// start class Tl3Reader

constructor Tl3Reader.Create(const aFileName: String);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Filer := Tl3CustomDOSFiler.Make(aFileName, l3_fmRead);
end;

constructor Tl3Reader.Create(const aStream: IStream);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Filer := Tl3CustomFiler.Create;
 f_Filer.COMStream := aStream;
end;

class function Tl3Reader.Make(const aFileName: String): Il3Reader;
  //reintroduce;
  //overload;
  {-}
var
 l_Writer : Tl3Reader;
begin
 l_Writer := Create(aFileName);
 try
  Result := l_Writer;
 finally
  l3Free(l_Writer);
 end;//try..finally
end;

class function Tl3Reader.Make(const aStream: IStream): Il3Reader;
  //reintroduce;
  //overload;
  {-}
var
 l_Writer : Tl3Reader;
begin
 l_Writer := Create(aStream);
 try
  Result := l_Writer;
 finally
  l3Free(l_Writer);
 end;//try..finally
end;

procedure Tl3Reader.Cleanup;
  //override;
  {-}
begin
 l3Free(f_Filer);
 inherited;
end;

procedure Tl3Reader.Execute;
  {-}
begin
 Filer.Open;
 try
  DoRead;
 finally
  Filer.Close;
 end;//try..finally
end;

end.

