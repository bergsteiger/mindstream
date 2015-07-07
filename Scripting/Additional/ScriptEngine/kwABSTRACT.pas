unit kwABSTRACT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwABSTRACT.pas"
// Начат: 12.02.2012 16:31
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::ABSTRACT
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
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
 TkwABSTRACT = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwABSTRACT
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwABSTRACT;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwABSTRACT

function TkwABSTRACT.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_4F37B11C0160get_var*
//#UC END# *4DCACED80361_4F37B11C0160get_var*
begin
//#UC START# *4DCACED80361_4F37B11C0160get_impl*
 Result := tfw_wmAbstract;
//#UC END# *4DCACED80361_4F37B11C0160get_impl*
end;//TkwABSTRACT.pm_GetModifier

class function TkwABSTRACT.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'ABSTRACT';
end;//TkwABSTRACT.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.