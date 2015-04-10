unit tfwStringStreamFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwStringStreamFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Parser::TtfwStringStreamFactory
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStreamFactory,
  l3BaseStream
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStringStreamFactory = class(TtfwStreamFactory)
 private
 // private fields
   f_String : AnsiString;
 protected
 // realized methods
   function Stream: Tl3Stream; override;
 public
 // public methods
   constructor Create(const aString: AnsiString); reintroduce;
 end;//TtfwStringStreamFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Memory,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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

{$IfEnd} //not NoScripts

end.