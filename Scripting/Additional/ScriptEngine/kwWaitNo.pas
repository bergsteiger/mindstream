unit kwWaitNo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWaitNo.pas"
// Начат: 28.04.2011 15:10
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ModalDialogs::wait_No
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
 _afwImpurity_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\afwImpurity.imp.pas}
 TkwWaitNo = class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitNo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  ,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwWaitNo;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWaitNo

procedure TkwWaitNo.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB94AE60059_var*
//#UC END# *4DAEEDE10285_4DB94AE60059_var*
begin
//#UC START# *4DAEEDE10285_4DB94AE60059_impl*
 {$If NOT defined(nsTest)}
 RunnerAssert(false, '', aCtx);
 {$Else}
 afwSetAnswer(mrNo);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4DB94AE60059_impl*
end;//TkwWaitNo.DoDoIt

class function TkwWaitNo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:No';
end;//TkwWaitNo.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.