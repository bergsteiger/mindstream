unit kwStereotypeStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwStereotypeStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::StereotypeStereotypeProducer
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
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
 TkwStereotypeStereotypeProducer = {final} class(_tfwWordProducer_)
 protected
 // overridden protected methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function AcceptsKeyWordAfter: Boolean; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function GetNewWordName(const aContext: TtfwContext): Il3CString; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwStereotypeStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeStereotypeProducer,
  SysUtils,
  kwStandardProcedureCloseBracket,
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

type _Instance_R_ = TkwStereotypeStereotypeProducer;

{$Include ..\ScriptEngine\tfwWordProducer.imp.pas}

// start class TkwStereotypeStereotypeProducer

class function TkwStereotypeStereotypeProducer.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'StereotypeStereotypeProducer';
end;//TkwStereotypeStereotypeProducer.GetWordNameForRegister

function TkwStereotypeStereotypeProducer.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F43B1450000_var*
//#UC END# *4DB6C99F026E_4F43B1450000_var*
begin
//#UC START# *4DB6C99F026E_4F43B1450000_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.EndBracket

function TkwStereotypeStereotypeProducer.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4F43B1450000_var*
//#UC END# *4DB9B446039A_4F43B1450000_var*
begin
//#UC START# *4DB9B446039A_4F43B1450000_impl*
 Result := High(Result);
//#UC END# *4DB9B446039A_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.AfterWordMaxCount

function TkwStereotypeStereotypeProducer.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4F43B1450000_var*
//#UC END# *4DB9B502013D_4F43B1450000_var*
begin
//#UC START# *4DB9B502013D_4F43B1450000_impl*
 Result := true;
//#UC END# *4DB9B502013D_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.AcceptsKeyWordAfter

function TkwStereotypeStereotypeProducer.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F43B1450000_var*
//#UC END# *4DBAEE0D028D_4F43B1450000_var*
begin
//#UC START# *4DBAEE0D028D_4F43B1450000_impl*
 Result := TkwCompiledStereotypeStereotypeProducer;
//#UC END# *4DBAEE0D028D_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.CompiledWordClass

function TkwStereotypeStereotypeProducer.GetNewWordName(const aContext: TtfwContext): Il3CString;
//#UC START# *4F37B3F10318_4F43B1450000_var*
//#UC END# *4F37B3F10318_4F43B1450000_var*
begin
//#UC START# *4F37B3F10318_4F43B1450000_impl*
 Result := l3Cat([TtfwCStringFactory.C('<<'), inherited GetNewWordName(aContext), TtfwCStringFactory.C('>>')]);
//#UC END# *4F37B3F10318_4F43B1450000_impl*
end;//TkwStereotypeStereotypeProducer.GetNewWordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWordProducer.imp.pas}
{$IfEnd} //not NoScripts

end.