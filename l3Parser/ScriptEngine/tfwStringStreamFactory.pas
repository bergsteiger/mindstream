unit tfwStringStreamFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Parsing"
// Модуль: "tfwStringStreamFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Parsing::Parser::TtfwStringStreamFactory
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

uses
  tfwStreamFactory,
  l3BaseStream
  ;

type
 TtfwStringStreamFactory = class(TtfwStreamFactory)
 private
 // private fields
   f_String : AnsiString;
 protected
 // realized methods
   function Stream: Tl3Stream; override;
   function FileDateTime: TDateTime; override;
 public
 // public methods
   constructor Create(const aString: AnsiString); reintroduce;
 end;//TtfwStringStreamFactory

implementation

uses
  l3Memory,
  l3String,
  SysUtils
  ;

// start class TtfwStringStreamFactory

constructor TtfwStringStreamFactory.Create(const aString: AnsiString);
//#UC START# *52F4FB4E00F6_52F4FAF80376_var*
//#UC END# *52F4FB4E00F6_52F4FAF80376_var*
begin
//#UC START# *52F4FB4E00F6_52F4FAF80376_impl*
 inherited Create('');
 f_String := aString; 
//#UC END# *52F4FB4E00F6_52F4FAF80376_impl*
end;//TtfwStringStreamFactory.Create

function TtfwStringStreamFactory.Stream: Tl3Stream;
//#UC START# *52F4E6E90067_52F4FAF80376_var*
//#UC END# *52F4E6E90067_52F4FAF80376_var*
begin
//#UC START# *52F4E6E90067_52F4FAF80376_impl*
 if (f_Stream = nil) then
  f_Stream := Tl3StringStream.Create(l3PCharLen(f_String));
 Result := f_Stream;
//#UC END# *52F4E6E90067_52F4FAF80376_impl*
end;//TtfwStringStreamFactory.Stream

function TtfwStringStreamFactory.FileDateTime: TDateTime;
//#UC START# *55A649CC0040_52F4FAF80376_var*
//#UC END# *55A649CC0040_52F4FAF80376_var*
begin
//#UC START# *55A649CC0040_52F4FAF80376_impl*
 Result := Now;
//#UC END# *55A649CC0040_52F4FAF80376_impl*
end;//TtfwStringStreamFactory.FileDateTime

end.