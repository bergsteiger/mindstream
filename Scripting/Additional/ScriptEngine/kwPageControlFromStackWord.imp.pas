{$IfNDef kwPageControlFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPageControlFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwPageControlFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwPageControlFromStackWord_imp}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwPageControlFromStackWord_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoPageControl(aControl: TElCustomPageControl;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwPageControlFromStackWord_
{$IfEnd} //Nemesis AND not NoScripts

{$Else kwPageControlFromStackWord_imp}

{$IfNDef kwPageControlFromStackWord_imp_impl}
{$Define kwPageControlFromStackWord_imp_impl}

{$If defined(Nemesis) AND not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _kwPageControlFromStackWord_

procedure _kwPageControlFromStackWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_500014590086_var*
//#UC END# *4F212C3A015A_500014590086_var*
begin
//#UC START# *4F212C3A015A_500014590086_impl*
 RunnerAssert(aControl is TElCustomPageControl, 'Мне нужен TElCustomPageControl, а это - ' + aControl.ClassName, aCtx);
 DoPageControl(aControl as TElCustomPageControl, aCtx);
//#UC END# *4F212C3A015A_500014590086_impl*
end;//_kwPageControlFromStackWord_.DoControl

{$IfEnd} //Nemesis AND not NoScripts

{$Else  kwPageControlFromStackWord_imp_impl}
{$If defined(Nemesis) AND not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //Nemesis AND not NoScripts

{$EndIf kwPageControlFromStackWord_imp_impl}
{$EndIf kwPageControlFromStackWord_imp}
