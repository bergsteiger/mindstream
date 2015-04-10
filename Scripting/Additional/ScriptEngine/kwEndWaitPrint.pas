unit kwEndWaitPrint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwEndWaitPrint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::EtalonsWorking::EndWait_Print
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
 TkwEndWaitPrint = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwEndWaitPrint
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

type _Instance_R_ = TkwEndWaitPrint;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwEndWaitPrint

procedure TkwEndWaitPrint.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F72BA72006B_var*
//#UC END# *4DAEEDE10285_4F72BA72006B_var*
begin
//#UC START# *4DAEEDE10285_4F72BA72006B_impl*
 {$If defined(InsiderTest)}
 TkwPrintDataSaver.Instance.EndWatingToPrint;
 {$IfEnd}
//#UC END# *4DAEEDE10285_4F72BA72006B_impl*
end;//TkwEndWaitPrint.DoDoIt

class function TkwEndWaitPrint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'EndWait:Print';
end;//TkwEndWaitPrint.GetWordNameForRegister

{$IfEnd} //nsTest AND not NoScripts

initialization
{$If defined(nsTest) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //nsTest AND not NoScripts

end.