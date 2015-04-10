unit kwVcmHistoryClear;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmHistoryClear.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_History_Clear
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _VCMWord_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\VCMWord.imp.pas}
 TkwVcmHistoryClear = {final} class(_VCMWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmHistoryClear
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  vcmForm,
  Controls,
  StdRes,
  vcmBase
  {$If defined(nsTest)}
  ,
  afwAnswer
  {$IfEnd} //nsTest
  
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmHistoryClear;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\VCMWord.imp.pas}

// start class TkwVcmHistoryClear

procedure TkwVcmHistoryClear.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52F4D3CF01ED_var*
//#UC END# *4DAEEDE10285_52F4D3CF01ED_var*
begin
//#UC START# *4DAEEDE10285_52F4D3CF01ED_impl*
 if (vcmDispatcher.History <> nil) then
  vcmDispatcher.History.Clear(false);
//#UC END# *4DAEEDE10285_52F4D3CF01ED_impl*
end;//TkwVcmHistoryClear.DoDoIt

class function TkwVcmHistoryClear.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:History:Clear';
end;//TkwVcmHistoryClear.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.