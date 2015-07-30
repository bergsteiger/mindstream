unit kwIn;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwIn.pas"
// Начат: 11.05.2011 20:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwIn
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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwVar,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIn = {scriptword} class(TtfwVar)
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
   class function GetWordNameForRegister: AnsiString; override;
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TkwIn
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwLeftParam,
  kwRightParam,
  kwLeftWordRefParam
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIn

class function TkwIn.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'IN';
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
// Регистрация TkwIn
 TkwIn.RegisterInEngine;
{$IfEnd} //not NoScripts

end.