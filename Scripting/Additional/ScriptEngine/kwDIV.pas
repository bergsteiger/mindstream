unit kwDIV;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDIV.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDIV
//
// DIV
// ( n1 n2 -- n3 )
// Делит n1 на n2, возвращает частное n3.
// Полностью аналогично /
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
 TkwDIV = {final} class(_kwDivide_)
  {* DIV
( n1 n2 -- n3 )
            Делит n1 на n2, возвращает частное n3.
Полностью аналогично / }
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDIV
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDIV;

{$Include ..\ScriptEngine\kwDivide.imp.pas}

// start class TkwDIV

class function TkwDIV.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F912119008A_var*
//#UC END# *4DB0614603C8_4F912119008A_var*
begin
//#UC START# *4DB0614603C8_4F912119008A_impl*
 Result := 'DIV';
//#UC END# *4DB0614603C8_4F912119008A_impl*
end;//TkwDIV.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwDivide.imp.pas}
{$IfEnd} //not NoScripts

end.