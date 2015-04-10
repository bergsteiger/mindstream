{$IfNDef kwVTCustomListerFromStackWords_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwVTCustomListerFromStackWords.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::vtControlsFromStackWords::kwVTCustomListerFromStackWords
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwVTCustomListerFromStackWords_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
 _kwVTCustomListerFromStackWords_ = {mixin} class(_kwControlFromStackWord_)
 protected
 // realized methods
   procedure DoControl(aControl: TControl;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoVTCustomListner(const aCtx: TtfwContext;
     const aLister: TvtCustomLister); virtual; abstract;
 end;//_kwVTCustomListerFromStackWords_
{$IfEnd} //not NoScripts

{$Else kwVTCustomListerFromStackWords_imp}

{$IfNDef kwVTCustomListerFromStackWords_imp_impl}
{$Define kwVTCustomListerFromStackWords_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}

type
  TvtCustomListerHack = class(TvtCustomLister)
  end;//TvtCustomListerHack

// start class _kwVTCustomListerFromStackWords_

procedure _kwVTCustomListerFromStackWords_.DoControl(aControl: TControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C3A015A_4F86A253003F_var*
//#UC END# *4F212C3A015A_4F86A253003F_var*
begin
//#UC START# *4F212C3A015A_4F86A253003F_impl*
 DoVTCustomListner(aCtx, aControl as TvtCustomLister);
//#UC END# *4F212C3A015A_4F86A253003F_impl*
end;//_kwVTCustomListerFromStackWords_.DoControl

{$IfEnd} //not NoScripts

{$Else  kwVTCustomListerFromStackWords_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwVTCustomListerFromStackWords_imp_impl}
{$EndIf kwVTCustomListerFromStackWords_imp}
