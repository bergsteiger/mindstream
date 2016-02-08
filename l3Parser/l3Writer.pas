unit l3Writer;

{ Библиотека "L3 (Low Level Library)" }
{ Автор: Люлин А.В. ©                 }
{ Модуль: l3Writer -                  }
{ Начат: 25.11.2006 18:32             }
{ $Id: l3Writer.pas,v 1.4 2012/07/31 14:24:06 voba Exp $ }

// $Log: l3Writer.pas,v $
// Revision 1.4  2012/07/31 14:24:06  voba
// - bug fix
//
// Revision 1.3  2012/07/27 11:05:35  voba
// - XML support
//
// Revision 1.2  2008/02/14 17:09:15  lulin
// - cleanup.
//
// Revision 1.1  2006/11/25 15:47:41  lulin
// - для писателей в файл выделен общий предок.
//

{$Include l3Define.inc }

interface

uses
  l3Types,
  l3Base,
  l3Filer,
  l3CacheableBase
  ;

type
  Tl3Writer = class(Tl3CacheableBase)
   {* Генератор XML. }
    private
    // internal fields
      f_Filer    : Tl3CustomFiler;
    protected
    // internal methods
      procedure Cleanup;
        override;
        {-}
    protected
    // interface methods
      // Il3XMLWriter
      procedure Start;
        virtual;
        {* - начинает генерацию. }
      procedure Finish;
        virtual;
        {* - заканчивает генерацию. }
      procedure WriteLn(const aString: String);
        {-}
      property Filer : Tl3CustomFiler
       read f_Filer;
    public
    // public methods
      constructor Create(const aFileName: String);
        reintroduce;
        overload;
        virtual;
        {-}
      constructor Create(const aStream: IStream);
        reintroduce;
        overload;
        virtual;
        {-}
      constructor Create(aFiler: Tl3CustomFiler);
        reintroduce;
        overload;
        virtual;
        {-}
  end;//Tl3Writer

implementation

// start class Tl3Writer

constructor Tl3Writer.Create(const aFileName: String);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Filer := Tl3CustomDOSFiler.Make(aFileName, l3_fmWrite);
end;

constructor Tl3Writer.Create(const aStream: IStream);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Filer := Tl3CustomFiler.Create;
 f_Filer.COMStream := aStream;
end;

constructor Tl3Writer.Create(aFiler: Tl3CustomFiler);
  //reintroduce;
  {-}
begin
 inherited Create;
 f_Filer := aFiler.Use;
end;

procedure Tl3Writer.Cleanup;
  //override;
  {-}
begin
 l3Free(f_Filer);
 inherited;
end;

procedure Tl3Writer.Start;
  {-}
begin
 if (f_Filer <> nil) then
  f_Filer.Open;
end;

procedure Tl3Writer.Finish;
  {-}
begin
 if (f_Filer <> nil) then
  f_Filer.Close;
end;

procedure Tl3Writer.WriteLn(const aString: String);
  {-}
begin
 if (f_Filer <> nil) then
  f_Filer.WriteLn(aString);
end;

end.

