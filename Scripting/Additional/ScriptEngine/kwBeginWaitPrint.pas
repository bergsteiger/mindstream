unit kwBeginWaitPrint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBeginWaitPrint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::BeginWait_Print
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwBeginWaitPrint = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBeginWaitPrint
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  Classes
  {$If defined(InsiderTest) AND not defined(NoScripts)}
  ,
  kwPrintDataSaver
  {$IfEnd} //InsiderTest AND not NoScripts
  ,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

type _Instance_R_ = TkwBeginWaitPrint;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwBeginWaitPrint

procedure TkwBeginWaitPrint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F72B9B00169_var*
//#UC END# *4DAEEDE10285_4F72B9B00169_var*
begin
//#UC START# *4DAEEDE10285_4F72B9B00169_impl*
 {$If defined(InsiderTest)}
 TkwPrintDataSaver.Instance.StartWaitingToPrint(aCtx);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4F72B9B00169_impl*
end;//TkwBeginWaitPrint.DoDoIt

class function TkwBeginWaitPrint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BeginWait:Print';
end;//TkwBeginWaitPrint.GetWordNameForRegister

{$IfEnd} //nsTest AND not NoScripts

initialization
{$If defined(nsTest) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //nsTest AND not NoScripts

end.