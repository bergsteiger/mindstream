unit tfwCOMStreamFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwCOMStreamFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Parser::TtfwCOMStreamFactory
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
  l3Interfaces,
  tfwStreamFactory,
  l3BaseStream
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwCOMStreamFactory = class(TtfwStreamFactory)
 private
 // private fields
   f_COMStream : IStream;
 protected
 // realized methods
   function Stream: Tl3Stream; override;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // public methods
   constructor Create(const aStream: IStream); reintroduce;
 end;//TtfwCOMStreamFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Stream,
  Classes
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwCOMStreamFactory

constructor TtfwCOMStreamFactory.Create(const aStream: IStream);
//#UC START# *52F4F21D036E_52F4F1AA01E1_var*
//#UC END# *52F4F21D036E_52F4F1AA01E1_var*
begin
//#UC START# *52F4F21D036E_52F4F1AA01E1_impl*
 inherited Create('');
 f_COMStream := aStream
//#UC END# *52F4F21D036E_52F4F1AA01E1_impl*
end;//TtfwCOMStreamFactory.Create

function TtfwCOMStreamFactory.Stream: Tl3Stream;
//#UC START# *52F4E6E90067_52F4F1AA01E1_var*
//#UC END# *52F4E6E90067_52F4F1AA01E1_var*
begin
//#UC START# *52F4E6E90067_52F4F1AA01E1_impl*
 if (f_Stream = nil) then
  l3IStream2Stream(f_COMStream, TStream(f_Stream));
 Result := f_Stream;
//#UC END# *52F4E6E90067_52F4F1AA01E1_impl*
end;//TtfwCOMStreamFactory.Stream

procedure TtfwCOMStreamFactory.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_COMStream := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TtfwCOMStreamFactory.ClearFields

{$IfEnd} //not NoScripts

end.