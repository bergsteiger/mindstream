{$IfNDef kwScrollInfoWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwScrollInfoWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::kwScrollInfoWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwScrollInfoWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
 _kwScrollInfoWord_ = {mixin} class(_kwWinControlFromStackWord_)
 private
 // private fields
   f_ScrollInfo : TScrollInfo;
    {* Поле для свойства ScrollInfo}
 protected
 // realized methods
   procedure DoWinControl(aControl: TWinControl;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 protected
 // protected methods
   procedure DoScrollInfo(const aCtx: TtfwContext); virtual; abstract;
 protected
 // protected properties
   property ScrollInfo: TScrollInfo
     read f_ScrollInfo;
 end;//_kwScrollInfoWord_
{$IfEnd} //not NoScripts

{$Else kwScrollInfoWord_imp}

{$IfNDef kwScrollInfoWord_imp_impl}
{$Define kwScrollInfoWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}

// start class _kwScrollInfoWord_

procedure _kwScrollInfoWord_.DoWinControl(aControl: TWinControl;
  const aCtx: TtfwContext);
//#UC START# *4F212C930149_517939B9033C_var*
//#UC END# *4F212C930149_517939B9033C_var*
begin
//#UC START# *4F212C930149_517939B9033C_impl*
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Не указано, для какого скроллбара получаем информацию.', aCtx);

 f_ScrollInfo.cbSize := SizeOf(TScrollInfo);
 f_ScrollInfo.fMask := SIF_ALL;

 if aCtx.rEngine.PopBool
  then GetScrollInfo(aControl.Handle, SB_VERT, f_ScrollInfo)
  else GetScrollInfo(aControl.Handle, SB_HORZ, f_ScrollInfo);

 DoScrollInfo(aCtx);
//#UC END# *4F212C930149_517939B9033C_impl*
end;//_kwScrollInfoWord_.DoWinControl

procedure _kwScrollInfoWord_.ClearFields;
 {-}
begin
 Finalize(f_ScrollInfo);
 inherited;
end;//_kwScrollInfoWord_.ClearFields

{$IfEnd} //not NoScripts

{$Else  kwScrollInfoWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwWinControlFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwScrollInfoWord_imp_impl}
{$EndIf kwScrollInfoWord_imp}
