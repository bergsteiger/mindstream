unit kwDDSupportGetState;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDDSupportGetState.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::DDSupport_GetState
//
// Возвращает текщее состояние DDSupport
// Формат:
// {code}
// DDSupport:GetState
// {code}
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
 TkwDDSupportGetState = {final} class(_tfwAutoregisteringWord_)
  {* Возвращает текщее состояние DDSupport
Формат: 
[code]
DDSupport:GetState
[code] }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDDSupportGetState
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  DragData,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDDSupportGetState;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDDSupportGetState

procedure TkwDDSupportGetState.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53EB381201AE_var*
//#UC END# *4DAEEDE10285_53EB381201AE_var*
begin
//#UC START# *4DAEEDE10285_53EB381201AE_impl*
 aCtx.rEngine.PushInt(Ord(DDSupport.State));
//#UC END# *4DAEEDE10285_53EB381201AE_impl*
end;//TkwDDSupportGetState.DoDoIt

class function TkwDDSupportGetState.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'DDSupport:GetState';
end;//TkwDDSupportGetState.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.