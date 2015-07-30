unit tfwFilteredArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwFilteredArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwFilteredArrayView
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwLambdedArrayView,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwFilterLambda = class(TtfwTwoLambdas)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TtfwFilterLambda

 TtfwFilteredArrayView = class(TtfwLambdedArrayView)
 protected
 // realized methods
   function TwoLabdasClass: RtfwTwoLambdas; override;
 end;//TtfwFilteredArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwFilterLambda

procedure TtfwFilterLambda.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EA87C200D8_var*
var
 l_V : TtfwStackValue;
//#UC END# *4DAEEDE10285_52EA87C200D8_var*
begin
//#UC START# *4DAEEDE10285_52EA87C200D8_impl*
 l_V := aCtx.rEngine.Pop;
 try
  aCtx.rEngine.Push(l_V);
  f_Lambda.DoIt(aCtx);
  if aCtx.rEngine.PopBool then
  begin
   aCtx.rEngine.Push(l_V);
   f_Word.DoIt(aCtx);
  end;//aCtx.rEngine.PopBool
 finally
  Finalize(l_V);
 end;//try..finally
//#UC END# *4DAEEDE10285_52EA87C200D8_impl*
end;//TtfwFilterLambda.DoDoIt

function TtfwFilteredArrayView.TwoLabdasClass: RtfwTwoLambdas;
//#UC START# *52EA8EE702FA_52E6752A0047_var*
//#UC END# *52EA8EE702FA_52E6752A0047_var*
begin
//#UC START# *52EA8EE702FA_52E6752A0047_impl*
 Result := TtfwFilterLambda;
//#UC END# *52EA8EE702FA_52E6752A0047_impl*
end;//TtfwFilteredArrayView.TwoLabdasClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwFilterLambda
 TtfwFilterLambda.RegisterClass;
{$IfEnd} //not NoScripts

end.