unit kwINCLUDES;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwINCLUDES.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::IncludesAndUses::IncludesAndUsesPack::INCLUDES
//
// Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - откуда слово было вызвано
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
  tfwScriptingInterfaces,
  kwIncluded,
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
 TkwINCLUDES = {final} class(_kwUsesLike_)
  {* Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - откуда слово было вызвано }
 protected
 // overridden protected methods
   function GetIncludedClass: RkwIncluded; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwINCLUDES
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwInnerIncluded,
  kwStandardProcedureCloseBracket,
  l3String,
  SysUtils,
  l3Types,
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

type _Instance_R_ = TkwINCLUDES;

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
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
{$IfEnd} //not NoScripts

end.