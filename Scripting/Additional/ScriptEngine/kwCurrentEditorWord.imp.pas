{$IfNDef kwCurrentEditorWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCurrentEditorWord.imp.pas"
// Начат: 27.04.2011 14:25
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::CommonWords::kwCurrentEditorWord
//
// Поддержка слов, работающих с редактором, который находится в ФОКУСЕ
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwCurrentEditorWord_imp}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}
 _kwCurrentEditorWord_ = {abstract mixin} class(_kwFocusedControlWord_)
  {* Поддержка слов, работающих с редактором, который находится в ФОКУСЕ }
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoEditor(const aCtx: TtfwContext;
     anEditor: TevCustomEditorWindow); virtual; abstract;
 end;//_kwCurrentEditorWord_

{$Else kwCurrentEditorWord_imp}

{$IfNDef kwCurrentEditorWord_imp_impl}
{$Define kwCurrentEditorWord_imp_impl}

type _kwFocusedControlWord_R_ = _kwCurrentEditorWord_;

{$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}

// start class _kwCurrentEditorWord_

procedure _kwCurrentEditorWord_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F21267E03CE_4DB7EF0202FE_var*
//#UC END# *4F21267E03CE_4DB7EF0202FE_var*
begin
//#UC START# *4F21267E03CE_4DB7EF0202FE_impl*
 DoEditor(aCtx, aControl As TevCustomEditorWindow);
//#UC END# *4F21267E03CE_4DB7EF0202FE_impl*
end;//_kwCurrentEditorWord_.DoControl

{$Else  kwCurrentEditorWord_imp_impl}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\kwFocusedControlWord.imp.pas}
{$EndIf kwCurrentEditorWord_imp_impl}
{$EndIf kwCurrentEditorWord_imp}
