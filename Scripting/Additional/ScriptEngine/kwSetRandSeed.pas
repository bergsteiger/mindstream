unit kwSetRandSeed;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSetRandSeed.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::SysUtils::SetRandSeed
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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwSetRandSeed = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetRandSeed
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSetRandSeed;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwSetRandSeed

procedure TkwSetRandSeed.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_50599E5402BB_var*
//#UC END# *4DAEEDE10285_50599E5402BB_var*
begin
//#UC START# *4DAEEDE10285_50599E5402BB_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Функции SetRandSeed надо передать число.', aCtx);
 RandSeed := aCtx.rEngine.PopInt;
//#UC END# *4DAEEDE10285_50599E5402BB_impl*
end;//TkwSetRandSeed.DoDoIt

class function TkwSetRandSeed.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetRandSeed';
end;//TkwSetRandSeed.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.