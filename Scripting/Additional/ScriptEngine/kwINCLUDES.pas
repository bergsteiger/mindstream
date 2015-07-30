unit kwINCLUDES;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwINCLUDES.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::IncludesAndUsesPack::INCLUDES
//
// Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - откуда слово было вызвано
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwCompilingWord,
  kwIncluded,
  kwCompiledWordPrim,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
 TkwINCLUDES = {final scriptword} class(_kwUsesLike_)
  {* Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - откуда слово было вызвано }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function GetIncludedClass: RkwIncluded; override;
 end;//TkwINCLUDES
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwInnerIncluded,
  kwStandardProcedureCloseBracket,
  l3String,
  SysUtils,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwUsesLike.imp.pas}

// start class TkwINCLUDES

class function TkwINCLUDES.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INCLUDES';
end;//TkwINCLUDES.GetWordNameForRegister

function TkwINCLUDES.GetIncludedClass: RkwIncluded;
//#UC START# *4F3AA4E10327_4F3AA502005F_var*
//#UC END# *4F3AA4E10327_4F3AA502005F_var*
begin
//#UC START# *4F3AA4E10327_4F3AA502005F_impl*
 Result := TkwInnerIncluded;
//#UC END# *4F3AA4E10327_4F3AA502005F_impl*
end;//TkwINCLUDES.GetIncludedClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация INCLUDES
 TkwINCLUDES.RegisterInEngine;
{$IfEnd} //not NoScripts

end.