unit kwCONTINUE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCONTINUE.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeFlowWords::CONTINUE
//
// Переход к началу цикла
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
 TkwCONTINUE = {final} class(_tfwAutoregisteringWord_)
  {* Переход к началу цикла }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwCONTINUE
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwCONTINUE;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwCONTINUE

procedure TkwCONTINUE.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F21638D02CD_var*
//#UC END# *4DAEEDE10285_4F21638D02CD_var*
begin
//#UC START# *4DAEEDE10285_4F21638D02CD_impl*
 raise EtfwContinue.Create('Выход на начало цикла');
//#UC END# *4DAEEDE10285_4F21638D02CD_impl*
end;//TkwCONTINUE.DoDoIt

class function TkwCONTINUE.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'CONTINUE';
end;//TkwCONTINUE.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.