{$IfNDef kwMouseUpDownSupport_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMouseUpDownSupport.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::MouseInput::kwMouseUpDownSupport
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwMouseUpDownSupport_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}
 _kwMouseUpDownSupport_ = {mixin} class(_kwSendInputSupport_)
 protected
 // realized methods
   function GetInputStruct(const aCtx: TtfwContext): TInput; override;
 protected
 // protected methods
   function GetMouseEventFlag: Integer; virtual; abstract;
 end;//_kwMouseUpDownSupport_
{$IfEnd} //not NoScripts

{$Else kwMouseUpDownSupport_imp}

{$IfNDef kwMouseUpDownSupport_imp_impl}
{$Define kwMouseUpDownSupport_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}

// start class _kwMouseUpDownSupport_

function _kwMouseUpDownSupport_.GetInputStruct(const aCtx: TtfwContext): TInput;
//#UC START# *4F71A8960347_4F967BAD0127_var*
var
 l_P: TPoint;
//#UC END# *4F71A8960347_4F967BAD0127_var*
begin
//#UC START# *4F71A8960347_4F967BAD0127_impl*
 l3FillChar(Result, SizeOf(TInput));

 Windows.GetCursorPos(l_P);
 Result.Itype := INPUT_MOUSE;
 Result.mi.dx := l_P.X;
 Result.mi.dy := l_P.Y;
 Result.mi.dwFlags := GetMouseEventFlag;
//#UC END# *4F71A8960347_4F967BAD0127_impl*
end;//_kwMouseUpDownSupport_.GetInputStruct

{$IfEnd} //not NoScripts

{$Else  kwMouseUpDownSupport_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwSendInputSupport.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwMouseUpDownSupport_imp_impl}
{$EndIf kwMouseUpDownSupport_imp}
