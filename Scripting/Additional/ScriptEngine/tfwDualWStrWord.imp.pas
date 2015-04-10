{$IfNDef tfwDualWStrWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwDualWStrWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::StringProcessing::tfwDualWStrWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDualWStrWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
 _tfwDualWStrWord_ = {abstract mixin} class(_tfwWStrWord_)
 protected
 // realized methods
   procedure DoString(const aCtx: TtfwContext;
     const aStr: Tl3WString); override;
 protected
 // protected methods
   procedure DoStrings(const aCtx: TtfwContext;
     const aStr1: Tl3WString;
     const aStr2: Tl3WString); virtual; abstract;
 end;//_tfwDualWStrWord_
{$IfEnd} //not NoScripts

{$Else tfwDualWStrWord_imp}

{$IfNDef tfwDualWStrWord_imp_impl}
{$Define tfwDualWStrWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwWStrWord.imp.pas}

// start class _tfwDualWStrWord_

procedure _tfwDualWStrWord_.DoString(const aCtx: TtfwContext;
  const aStr: Tl3WString);
//#UC START# *4F4FE51201BD_4F4FE56B01BF_var*
var
 l_S : Il3CString;
 l_C : AnsiChar;
//#UC END# *4F4FE51201BD_4F4FE56B01BF_var*
begin
//#UC START# *4F4FE51201BD_4F4FE56B01BF_impl*
 if aCtx.rEngine.IsTopType(tfw_svtStr) then
 begin
  l_S := aCtx.rEngine.PopString;
  DoStrings(aCtx, l3PCharLen(l_S), aStr);
 end//aCtx.rEngine.Last.rType = tfw_svtString
 else
 if aCtx.rEngine.IsTopType(tfw_svtChar) then
 begin
  l_C := aCtx.rEngine.PopChar;
  DoStrings(aCtx, l3PCharLen(l_C), aStr);
 end//aCtx.rEngine.IsTopType(tfw_svtChar)
 else
  DoStrings(aCtx, aCtx.rEngine.PopWStr, aStr);
//#UC END# *4F4FE51201BD_4F4FE56B01BF_impl*
end;//_tfwDualWStrWord_.DoString

{$IfEnd} //not NoScripts

{$Else  tfwDualWStrWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwWStrWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwDualWStrWord_imp_impl}
{$EndIf tfwDualWStrWord_imp}
