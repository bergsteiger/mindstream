unit kwBeginLikeCompiledCode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBeginLikeCompiledCode.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwBeginLikeCompiledCode
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
  kwCompiledWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwBeginLikeCompiledCode = class(TkwCompiledWord)
 public
 // overridden public methods
   function GetAsCaller(const aCtx: TtfwContext): TtfwWord; override;
 end;//TkwBeginLikeCompiledCode
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwBeginLikeCompiledCode

function TkwBeginLikeCompiledCode.GetAsCaller(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52DFE48500BB_52DFF03B0030_var*
//#UC END# *52DFE48500BB_52DFF03B0030_var*
begin
//#UC START# *52DFE48500BB_52DFF03B0030_impl*
 Result := Self;
//#UC END# *52DFE48500BB_52DFF03B0030_impl*
end;//TkwBeginLikeCompiledCode.GetAsCaller

{$IfEnd} //not NoScripts

end.