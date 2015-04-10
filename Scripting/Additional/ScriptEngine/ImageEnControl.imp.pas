{$IfNDef ImageEnControl_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/ImageEnControl.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ImageEnView::ImageEnControl
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define ImageEnControl_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _ImageEnControl_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoWithImageEn(aControl: TImageEnView;
     const aCtx: TtfwContext); virtual; abstract;
 end;//_ImageEnControl_
{$IfEnd} //not NoScripts

{$Else ImageEnControl_imp}

{$IfNDef ImageEnControl_imp_impl}
{$Define ImageEnControl_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

// start class _ImageEnControl_

procedure _ImageEnControl_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_52E20F060237_var*
//#UC END# *4F212C3A015A_52E20F060237_var*
begin
//#UC START# *4F212C3A015A_52E20F060237_impl*
 DoWithImageEn(aControl as TImageEnView, aCtx);
//#UC END# *4F212C3A015A_52E20F060237_impl*
end;//_ImageEnControl_.DoControl

{$IfEnd} //not NoScripts

{$Else  ImageEnControl_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf ImageEnControl_imp_impl}
{$EndIf ImageEnControl_imp}
