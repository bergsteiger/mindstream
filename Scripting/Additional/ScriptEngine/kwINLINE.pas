unit kwINLINE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwINLINE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Modifiers::INLINE
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
 TkwINLINE = {final} class(_kwModifier_)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwINLINE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwINLINE;

{$Include ..\ScriptEngine\kwModifier.imp.pas}

// start class TkwINLINE

function TkwINLINE.pm_GetModifier: TtfwWordModifier;
//#UC START# *4DCACED80361_53ED95740075get_var*
//#UC END# *4DCACED80361_53ED95740075get_var*
begin
//#UC START# *4DCACED80361_53ED95740075get_impl*
 Result := tfw_wmInline;
//#UC END# *4DCACED80361_53ED95740075get_impl*
end;//TkwINLINE.pm_GetModifier

class function TkwINLINE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INLINE';
end;//TkwINLINE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwModifier.imp.pas}
{$IfEnd} //not NoScripts

end.