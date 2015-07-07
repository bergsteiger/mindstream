{$IfNDef kwVGVisualObjectWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVGVisualObjectWord.imp.pas"
// Начат: 12.12.2011 17:45
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::VGSceneWords::kwVGVisualObjectWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwVGVisualObjectWord_imp}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
 _kwVGVisualObjectWord_ = {abstract mixin} class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoVisualObject(anObject: TvgVisualObject;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_kwVGVisualObjectWord_
{$IfEnd} //not NoScripts AND not NoVGScene

{$Else kwVGVisualObjectWord_imp}

{$IfNDef kwVGVisualObjectWord_imp_impl}
{$Define kwVGVisualObjectWord_imp_impl}

{$If not defined(NoScripts) AND not defined(NoVGScene)}


{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

type
  TvgHackVisualObject = {abstract} class(TvgVisualObject)
  end;//TvgHackVisualObject

// start class _kwVGVisualObjectWord_

procedure _kwVGVisualObjectWord_.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4EE6055E0333_var*
//#UC END# *4F21485E0184_4EE6055E0333_var*
begin
//#UC START# *4F21485E0184_4EE6055E0333_impl*
 RunnerAssert(aComponent is TvgVisualObject, 'Переданный объект не является VG-контролом', aCtx);
 DoVisualObject(aComponent as TvgVisualObject, aCtx);
//#UC END# *4F21485E0184_4EE6055E0333_impl*
end;//_kwVGVisualObjectWord_.DoComponent

{$IfEnd} //not NoScripts AND not NoVGScene

{$Else  kwVGVisualObjectWord_imp_impl}
{$If not defined(NoScripts) AND not defined(NoVGScene)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts AND not NoVGScene

{$EndIf kwVGVisualObjectWord_imp_impl}
{$EndIf kwVGVisualObjectWord_imp}
