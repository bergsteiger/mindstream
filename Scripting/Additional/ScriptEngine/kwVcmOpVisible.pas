unit kwVcmOpVisible;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpVisible.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_Visible
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
 TkwVcmOpVisible = {final} class(_OperationParamWord_)
 protected
 // realized methods
   function Flag: TvcmOpFlag; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpVisible
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpVisible;

{$Include ..\ScriptEngine\OperationParamWord.imp.pas}

// start class TkwVcmOpVisible

function TkwVcmOpVisible.Flag: TvcmOpFlag;
//#UC START# *5230151C02BA_523014D3003C_var*
//#UC END# *5230151C02BA_523014D3003C_var*
begin
//#UC START# *5230151C02BA_523014D3003C_impl*
 Result := vcm_ofVisible;
//#UC END# *5230151C02BA_523014D3003C_impl*
end;//TkwVcmOpVisible.Flag

class function TkwVcmOpVisible.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:Visible';
end;//TkwVcmOpVisible.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.