unit tfwFileStreamFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwFileStreamFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::Parser::TtfwFileStreamFactory
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
 TtfwFileStreamFactory = class(TtfwStreamFactory)
 protected
 // realized methods
   function Stream: Tl3Stream; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 end;//TtfwFileStreamFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Stream,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwFileStreamFactory

function TtfwFileStreamFactory.Stream: Tl3Stream;
//#UC START# *52F4E6E90067_52F4E85300D4_var*
//#UC END# *52F4E6E90067_52F4E85300D4_var*
begin
//#UC START# *52F4E6E90067_52F4E85300D4_impl*
 if (f_Stream = nil) then
  f_Stream := Tl3NamedTextStream.Create(FileName, l3_fmRead, 1000);
 Result := f_Stream; 
//#UC END# *52F4E6E90067_52F4E85300D4_impl*
end;//TtfwFileStreamFactory.Stream

procedure TtfwFileStreamFactory.Cleanup;
//#UC START# *479731C50290_52F4E85300D4_var*
//#UC END# *479731C50290_52F4E85300D4_var*
begin
//#UC START# *479731C50290_52F4E85300D4_impl*
 inherited;
//#UC END# *479731C50290_52F4E85300D4_impl*
end;//TtfwFileStreamFactory.Cleanup

{$IfEnd} //not NoScripts

end.