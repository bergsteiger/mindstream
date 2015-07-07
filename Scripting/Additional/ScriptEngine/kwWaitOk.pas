unit kwWaitOk;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwWaitOk.pas"
// Начат: 26.05.2011 21:14
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ModalDialogs::wait_Ok
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
 TkwWaitOk = class(_afwImpurity_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwWaitOk
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

type _Instance_R_ = TkwWaitOk;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\afwImpurity.imp.pas}

// start class TkwWaitOk

procedure TkwWaitOk.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DDE8A650180_var*
//#UC END# *4DAEEDE10285_4DDE8A650180_var*
begin
//#UC START# *4DAEEDE10285_4DDE8A650180_impl*
 {$If NOT defined(nsTest)}
 RunnerAssert(false, '', aCtx);
 {$Else}
 afwSetAnswer(mrOk);
 {$IfEnd}
//#UC END# *4DAEEDE10285_4DDE8A650180_impl*
end;//TkwWaitOk.DoDoIt

class function TkwWaitOk.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'wait:Ok';
end;//TkwWaitOk.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.