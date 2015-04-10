{$IfNDef tfwArrayAndLambdaWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwArrayAndLambdaWord.imp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::tfwArrayAndLambdaWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwArrayAndLambdaWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
 _tfwArrayAndLambdaWord_ = {abstract mixin} class(_tfwArrayWord_)
 protected
 // realized methods
   procedure DoArray(const aCtx: TtfwContext;
     const anArray: ItfwValueList); override;
 protected
 // protected methods
   procedure DoArrayAndLambda(const aCtx: TtfwContext;
     const anArray: ItfwValueList;
     aLambda: TtfwWord); virtual; abstract;
 end;//_tfwArrayAndLambdaWord_
{$IfEnd} //not NoScripts

{$Else tfwArrayAndLambdaWord_imp}

{$IfNDef tfwArrayAndLambdaWord_imp_impl}
{$Define tfwArrayAndLambdaWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwArrayWord.imp.pas}

// start class _tfwArrayAndLambdaWord_

procedure _tfwArrayAndLambdaWord_.DoArray(const aCtx: TtfwContext;
  const anArray: ItfwValueList);
//#UC START# *4ED7A0640044_52E7D13F028C_var*
//#UC END# *4ED7A0640044_52E7D13F028C_var*
begin
//#UC START# *4ED7A0640044_52E7D13F028C_impl*
 DoArrayAndLambda(aCtx, anArray, aCtx.rEngine.PopObj As TtfwWord);
//#UC END# *4ED7A0640044_52E7D13F028C_impl*
end;//_tfwArrayAndLambdaWord_.DoArray

{$IfEnd} //not NoScripts

{$Else  tfwArrayAndLambdaWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwArrayWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwArrayAndLambdaWord_imp_impl}
{$EndIf tfwArrayAndLambdaWord_imp}
