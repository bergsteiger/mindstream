unit kwINLINE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwINLINE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::Modifiers::INLINE
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwModifier,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwINLINE = {final scriptword} class(TkwModifier)
 protected
 // realized methods
   function pm_GetModifier: TtfwWordModifier; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwINLINE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

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
// Регистрация INLINE
 TkwINLINE.RegisterInEngine;
{$IfEnd} //not NoScripts

end.