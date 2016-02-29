unit tfwTruncatedArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwTruncatedArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwTruncatedArrayView
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
 TtfwTruncLambda = class(TtfwTwoLambdas)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TtfwTruncLambda

 TtfwTruncatedArrayView = class(TtfwLambdedArrayView)
 protected
 // realized methods
   function TwoLabdasClass: RtfwTwoLambdas; override;
 end;//TtfwTruncatedArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwTruncLambda

procedure TtfwTruncLambda.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55E0417101EC_var*
var
 l_V : TtfwStackValue;
//#UC END# *4DAEEDE10285_55E0417101EC_var*
begin
//#UC START# *4DAEEDE10285_55E0417101EC_impl*
 l_V := aCtx.rEngine.Pop;
 try
  aCtx.rEngine.Push(l_V);
  f_Lambda.DoIt(aCtx);
  if aCtx.rEngine.PopBool then
  begin
   aCtx.rEngine.Push(l_V);
   WordToWork.DoIt(aCtx);
  end//aCtx.rEngine.PopBool
  else
   raise EtfwBreakIterator.Create('Выход из итератора');
 finally
  Finalize(l_V);
 end;//try..finally
//#UC END# *4DAEEDE10285_55E0417101EC_impl*
end;//TtfwTruncLambda.DoDoIt

function TtfwTruncatedArrayView.TwoLabdasClass: RtfwTwoLambdas;
//#UC START# *52EA8EE702FA_55E0413800EA_var*
//#UC END# *52EA8EE702FA_55E0413800EA_var*
begin
//#UC START# *52EA8EE702FA_55E0413800EA_impl*
 Result := TtfwTruncLambda;
//#UC END# *52EA8EE702FA_55E0413800EA_impl*
end;//TtfwTruncatedArrayView.TwoLabdasClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwTruncLambda
 TtfwTruncLambda.RegisterClass;
{$IfEnd} //not NoScripts

end.