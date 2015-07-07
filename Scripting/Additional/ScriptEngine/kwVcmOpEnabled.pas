unit kwVcmOpEnabled;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpEnabled.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_Enabled
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
  vcmExternalInterfaces,
  vcmInterfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 {$Include ..\ScriptEngine\OperationParamWord.imp.pas}
 TkwVcmOpEnabled = {final} class(_OperationParamWord_)
 protected
 // realized methods
   function Flag: TvcmOpFlag; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpEnabled
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpEnabled;

{$Include ..\ScriptEngine\OperationParamWord.imp.pas}

// start class TkwVcmOpEnabled

function TkwVcmOpEnabled.Flag: TvcmOpFlag;
//#UC START# *5230151C02BA_523014A301F2_var*
//#UC END# *5230151C02BA_523014A301F2_var*
begin
//#UC START# *5230151C02BA_523014A301F2_impl*
 Result := vcm_ofEnabled;
//#UC END# *5230151C02BA_523014A301F2_impl*
end;//TkwVcmOpEnabled.Flag

class function TkwVcmOpEnabled.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:Enabled';
end;//TkwVcmOpEnabled.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.