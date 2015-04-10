{$IfNDef kwObjectFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwObjectFromStackWord.imp.pas"
// Начат: 26.01.2012 14:32
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CoreWords::kwObjectFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwObjectFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 _SystemWord_Parent_ = _tfwAutoregisteringWord_;
 {$Include ..\ScriptEngine\SystemWord.imp.pas}
 _kwObjectFromStackWord_ = {abstract mixin} class(_SystemWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwObjectFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwObjectFromStackWord_imp}

{$IfNDef kwObjectFromStackWord_imp_impl}
{$Define kwObjectFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

{$Include ..\ScriptEngine\SystemWord.imp.pas}

// start class _kwObjectFromStackWord_

procedure _kwObjectFromStackWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F212BA80137_var*
//#UC END# *4DAEEDE10285_4F212BA80137_var*
begin
//#UC START# *4DAEEDE10285_4F212BA80137_impl*
 DoObject(aCtx.rEngine.PopObj, aCtx);
//#UC END# *4DAEEDE10285_4F212BA80137_impl*
end;//_kwObjectFromStackWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  kwObjectFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwObjectFromStackWord_imp_impl}
{$EndIf kwObjectFromStackWord_imp}
