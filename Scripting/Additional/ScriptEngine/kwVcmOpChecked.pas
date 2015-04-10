unit kwVcmOpChecked;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpChecked.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_Checked
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
 TkwVcmOpChecked = {final} class(_OperationParamWord_)
 protected
 // realized methods
   function Flag: TvcmOpFlag; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpChecked
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpChecked;

{$Include ..\ScriptEngine\OperationParamWord.imp.pas}

// start class TkwVcmOpChecked

function TkwVcmOpChecked.Flag: TvcmOpFlag;
//#UC START# *5230151C02BA_5230153303B8_var*
//#UC END# *5230151C02BA_5230153303B8_var*
begin
//#UC START# *5230151C02BA_5230153303B8_impl*
 Result := vcm_ofChecked;
//#UC END# *5230151C02BA_5230153303B8_impl*
end;//TkwVcmOpChecked.Flag

class function TkwVcmOpChecked.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:Checked';
end;//TkwVcmOpChecked.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.