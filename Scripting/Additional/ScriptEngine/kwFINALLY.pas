unit kwFINALLY;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFINALLY.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::FINALLY
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwMedianBacket.imp.pas}
 TkwFINALLY = {final} class(_kwMedianBacket_)
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFINALLY
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFINALLY;

{$Include ..\ScriptEngine\kwMedianBacket.imp.pas}

// start class TkwFINALLY

class function TkwFINALLY.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FINALLY';
end;//TkwFINALLY.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwMedianBacket.imp.pas}
{$IfEnd} //not NoScripts

end.