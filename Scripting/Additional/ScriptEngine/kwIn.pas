unit kwIn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIn.pas"
// Начат: 11.05.2011 20:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwIn
//
// {code}
// : InParameter IN A IN B
// A . B .
// ;
// 
// : "Напечатать два значения"
// InParameter
// ;
// 
// 2 'Hello' InParameter
// 
// "Напечатать два значения {(10)} {('Привет')}"
// {code}
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
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
 TkwIn = class(_tfwVar_)
  {* [code]
: InParameter IN A IN B
 A . B .
;

: "Напечатать два значения"
 InParameter
;

2 'Hello' InParameter

"Напечатать два значения [(10)] [('Привет')]"
[code] }
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwLeftParam,
  kwRightParam,
  kwLeftWordRefParam,
  kwCompiledVar,
  l3String,
  l3Parser,
  kwCompiledWord,
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

type _Instance_R_ = TkwIn;

{$Include ..\ScriptEngine\tfwVar.imp.pas}

// start class TkwIn

class function TkwIn.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DCAB5CD03C9_var*
//#UC END# *4DB0614603C8_4DCAB5CD03C9_var*
begin
//#UC START# *4DB0614603C8_4DCAB5CD03C9_impl*
 Result := 'IN';
//#UC END# *4DB0614603C8_4DCAB5CD03C9_impl*
end;//TkwIn.GetWordNameForRegister

procedure TkwIn.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DCAB5CD03C9_var*
//#UC END# *4DB6CE2302C9_4DCAB5CD03C9_var*
begin
//#UC START# *4DB6CE2302C9_4DCAB5CD03C9_impl*
 aPrevContext.rCompiler.CompileInParameterPopCode(aPrevContext, aCompiled{ As TkwCompiledIn});
 inherited;
//#UC END# *4DB6CE2302C9_4DCAB5CD03C9_impl*
end;//TkwIn.AfterCompile

function TkwIn.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DCAB5CD03C9_var*
//#UC END# *4DBAEE0D028D_4DCAB5CD03C9_var*
begin
//#UC START# *4DBAEE0D028D_4DCAB5CD03C9_impl*
 if (tfw_wmRightWordRef in aCtx.rTypeInfo.Modifiers) then
  Result := TkwRightParam
 else
 if (tfw_wmLeftWordRef in aCtx.rTypeInfo.Modifiers) then
  Result := TkwLeftWordRefParam
 else
  Result := TkwLeftParam;
//#UC END# *4DBAEE0D028D_4DCAB5CD03C9_impl*
end;//TkwIn.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwVar.imp.pas}
{$IfEnd} //not NoScripts

end.