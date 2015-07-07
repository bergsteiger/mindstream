unit kwVcmOpLongHint;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpLongHint.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_LongHint
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
  vcmInterfaces,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 {$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}
 TkwVcmOpLongHint = {final} class(_OperationParamWordPrim_)
 protected
 // realized methods
   procedure DoParams(const aParams: IvcmTestParams;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpLongHint
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpLongHint;

{$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}

// start class TkwVcmOpLongHint

procedure TkwVcmOpLongHint.DoParams(const aParams: IvcmTestParams;
  const aCtx: TtfwContext);
//#UC START# *5230185F0140_52301B0C0177_var*
//#UC END# *5230185F0140_52301B0C0177_var*
begin
//#UC START# *5230185F0140_52301B0C0177_impl*
 aCtx.rEngine.PushString(aParams.Op.LongHint);
//#UC END# *5230185F0140_52301B0C0177_impl*
end;//TkwVcmOpLongHint.DoParams

class function TkwVcmOpLongHint.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:LongHint';
end;//TkwVcmOpLongHint.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.