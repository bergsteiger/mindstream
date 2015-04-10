unit kwStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::StereotypeProducer
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
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwStereotypeProducerPrim.imp.pas}
 TkwStereotypeProducer = {final} class(_kwStereotypeProducerPrim_)
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeProducer,
  SysUtils,
  kwCompiledStereotypedWord,
  kwCompiledWord,
  kwCompiledVar,
  l3String,
  l3Parser,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwStereotypeProducer;

{$Include ..\ScriptEngine\kwStereotypeProducerPrim.imp.pas}

// start class TkwStereotypeProducer

class function TkwStereotypeProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StereotypeProducer';
end;//TkwStereotypeProducer.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwStereotypeProducerPrim.imp.pas}
{$IfEnd} //not NoScripts

end.