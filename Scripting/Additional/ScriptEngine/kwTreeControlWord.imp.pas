{$IfNDef kwTreeControlWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwTreeControlWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtOutlinerWords::kwTreeControlWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwTreeControlWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwTreeControlWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoTreeContol(const aTreeControl: TvtCustomOutliner;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwTreeControlWord_
{$IfEnd} //not NoScripts

{$Else kwTreeControlWord_imp}

{$IfNDef kwTreeControlWord_imp_impl}
{$Define kwTreeControlWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwTreeControlWord_

procedure _kwTreeControlWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4E01B86201B6_var*
//#UC END# *4F212C3A015A_4E01B86201B6_var*
begin
//#UC START# *4F212C3A015A_4E01B86201B6_impl*
 RunnerAssert(aControl is TvtCustomOutliner, 'В слово передан не TvtCustomOutliner, а ' + aControl.Name + ' : ' + aControl.ClassName, aCtx);
 DoTreeContol(aControl as TvtCustomOutliner, aCtx);
//#UC END# *4F212C3A015A_4E01B86201B6_impl*
end;//_kwTreeControlWord_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwTreeControlWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwTreeControlWord_imp_impl}
{$EndIf kwTreeControlWord_imp}
