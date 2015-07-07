{$IfNDef tfwWStrWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwWStrWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::tfwWStrWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwWStrWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
 _tfwWStrWord_ = {abstract mixin} class(_tfwSysUtilsWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // protected methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); virtual; abstract;
 end;//_tfwWStrWord_
{$IfEnd} //not NoScripts

{$Else tfwWStrWord_imp}

{$IfNDef tfwWStrWord_imp_impl}
{$Define tfwWStrWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}

// start class _tfwWStrWord_

procedure _tfwWStrWord_.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FE4E800D3_var*
var
 l_S : Il3CString;
 l_C : AnsiChar;
//#UC END# *4DAEEDE10285_4F4FE4E800D3_var*
begin
//#UC START# *4DAEEDE10285_4F4FE4E800D3_impl*
 if aCtx.rEngine.IsTopType(tfw_svtStr) then
 begin
  l_S := aCtx.rEngine.PopString;
  DoString(aCtx, l3PCharLen(l_S));
 end//aCtx.rEngine.Last.rType = tfw_svtString
 else
 if aCtx.rEngine.IsTopType(tfw_svtChar) then
 begin
  l_C := aCtx.rEngine.PopChar;
  DoString(aCtx, l3PCharLen(l_C));
 end//aCtx.rEngine.IsTopType(tfw_svtChar)
 else
  DoString(aCtx, aCtx.rEngine.PopWStr);
//#UC END# *4DAEEDE10285_4F4FE4E800D3_impl*
end;//_tfwWStrWord_.DoDoIt

{$IfEnd} //not NoScripts

{$Else  tfwWStrWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwSysUtilsWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwWStrWord_imp_impl}
{$EndIf tfwWStrWord_imp}
