{$IfNDef kwComponentFromStackWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwComponentFromStackWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwComponentFromStackWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwComponentFromStackWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
 _kwComponentFromStackWord_ = {abstract mixin} class(_kwObjectFromStackWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwComponentFromStackWord_
{$IfEnd} //not NoScripts

{$Else kwComponentFromStackWord_imp}

{$IfNDef kwComponentFromStackWord_imp_impl}
{$Define kwComponentFromStackWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}

// start class _kwComponentFromStackWord_

procedure _kwComponentFromStackWord_.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F2148300318_var*
//#UC END# *4F212BD5010E_4F2148300318_var*
begin
//#UC START# *4F212BD5010E_4F2148300318_impl*
 DoComponent(anObject As TComponent, aCtx);
//#UC END# *4F212BD5010E_4F2148300318_impl*
end;//_kwComponentFromStackWord_.DoObject

{$IfEnd} //not NoScripts

{$Else  kwComponentFromStackWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwObjectFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwComponentFromStackWord_imp_impl}
{$EndIf kwComponentFromStackWord_imp}
