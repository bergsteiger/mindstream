unit kwDivizion;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDivizion.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDivizion
//
// /                                "slash"
// ( n1 n2 -- n3 )
// Делит n1 на n2, возвращает частное  n3.
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
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwDivide.imp.pas}
 TkwDivizion = {final} class(_kwDivide_)
  {* /                                "slash"                        
( n1 n2 -- n3 )
            Делит n1 на n2, возвращает частное  n3. }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDivizion
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDivizion;

{$Include ..\ScriptEngine\kwDivide.imp.pas}

// start class TkwDivizion

class function TkwDivizion.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F911FB2031B_var*
//#UC END# *4DB0614603C8_4F911FB2031B_var*
begin
//#UC START# *4DB0614603C8_4F911FB2031B_impl*
 Result := '/';
//#UC END# *4DB0614603C8_4F911FB2031B_impl*
end;//TkwDivizion.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwDivide.imp.pas}
{$IfEnd} //not NoScripts

end.