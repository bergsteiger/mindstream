unit kwVcmOpImageIndex;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVcmOpImageIndex.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::VCMWords::vcm_op_ImageIndex
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
 TkwVcmOpImageIndex = {final} class(_OperationParamWordPrim_)
 protected
 // realized methods
   procedure DoParams(const aParams: IvcmTestParams;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmOpImageIndex
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

type _Instance_R_ = TkwVcmOpImageIndex;

{$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}

// start class TkwVcmOpImageIndex

procedure TkwVcmOpImageIndex.DoParams(const aParams: IvcmTestParams;
  const aCtx: TtfwContext);
//#UC START# *5230185F0140_523018AA0227_var*
//#UC END# *5230185F0140_523018AA0227_var*
begin
//#UC START# *5230185F0140_523018AA0227_impl*
 aCtx.rEngine.PushInt(aParams.Op.ImageIndex);
//#UC END# *5230185F0140_523018AA0227_impl*
end;//TkwVcmOpImageIndex.DoParams

class function TkwVcmOpImageIndex.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'vcm:op:ImageIndex';
end;//TkwVcmOpImageIndex.GetWordNameForRegister

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
 {$Include ..\ScriptEngine\OperationParamWordPrim.imp.pas}
{$IfEnd} //not NoScripts AND not NoVCM

end.