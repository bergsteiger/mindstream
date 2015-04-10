unit kwVcmOpShortcut;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpShortcut.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_Shortcut
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
 TkwVcmOpShortcut = {final} class(_OperationParamWordPrim_)
 protected
 // realized methods
   procedure DoParams(const aParams: IvcmTestParams;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpShortcut
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpShortcut;

{$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}

// start class TkwVcmOpShortcut

procedure TkwVcmOpShortcut.DoParams(const aParams: IvcmTestParams;
  const aCtx: TtfwContext);
//#UC START# *5230185F0140_523018BE02F9_var*
//#UC END# *5230185F0140_523018BE02F9_var*
begin
//#UC START# *5230185F0140_523018BE02F9_impl*
 aCtx.rEngine.PushInt(aParams.Op.Shortcut);
//#UC END# *5230185F0140_523018BE02F9_impl*
end;//TkwVcmOpShortcut.DoParams

class function TkwVcmOpShortcut.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:Shortcut';
end;//TkwVcmOpShortcut.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.