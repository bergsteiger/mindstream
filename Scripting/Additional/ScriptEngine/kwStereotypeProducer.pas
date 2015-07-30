unit kwStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::StereotypeProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwStereotypeProducerPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwStereotypeProducer = {final scriptword} class(TkwStereotypeProducerPrim)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwStereotypeProducer

class function TkwStereotypeProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StereotypeProducer';
end;//TkwStereotypeProducer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация StereotypeProducer
 TkwStereotypeProducer.RegisterInEngine;
{$IfEnd} //not NoScripts

end.