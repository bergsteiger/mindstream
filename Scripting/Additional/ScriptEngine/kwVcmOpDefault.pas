unit kwVcmOpDefault;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpDefault.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_Default
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
 TkwVcmOpDefault = {final} class(_OperationParamWord_)
 protected
 // realized methods
   function Flag: TvcmOpFlag; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpDefault
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpDefault;

{$Include ..\ScriptEngine\OperationParamWord.imp.pas}

// start class TkwVcmOpDefault

function TkwVcmOpDefault.Flag: TvcmOpFlag;
//#UC START# *5230151C02BA_5230156001B9_var*
//#UC END# *5230151C02BA_5230156001B9_var*
begin
//#UC START# *5230151C02BA_5230156001B9_impl*
 Result := vcm_ofDefault;
//#UC END# *5230151C02BA_5230156001B9_impl*
end;//TkwVcmOpDefault.Flag

class function TkwVcmOpDefault.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:Default';
end;//TkwVcmOpDefault.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.