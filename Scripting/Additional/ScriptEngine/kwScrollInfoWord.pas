unit kwScrollInfoWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwScrollInfoWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::ScrollInfoProcessing::TkwScrollInfoWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  Windows,
  tfwScriptingInterfaces,
  kwWinControlFromStackWord,
  Controls
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwScrollInfoWord = {abstract} class(TkwWinControlFromStackWord)
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
 end;//TkwScrollInfoWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwScrollInfoWord

procedure TkwScrollInfoWord.DoWinControl(aControl: TWinControl;
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
end;//TkwScrollInfoWord.DoWinControl

procedure TkwScrollInfoWord.ClearFields;
 {-}
begin
 Finalize(f_ScrollInfo);
 inherited;
end;//TkwScrollInfoWord.ClearFields

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwScrollInfoWord
 TkwScrollInfoWord.RegisterClass;
{$IfEnd} //not NoScripts

end.