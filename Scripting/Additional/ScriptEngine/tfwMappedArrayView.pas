unit tfwMappedArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "tfwMappedArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::TtfwMappedArrayView
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
 TtfwMapLambda = class(TtfwTwoLambdas)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TtfwMapLambda

 TtfwMappedArrayView = class(TtfwLambdedArrayView)
 protected
 // realized methods
   function TwoLabdasClass: RtfwTwoLambdas; override;
 end;//TtfwMappedArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwMapLambda

procedure TtfwMapLambda.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EA87EA0325_var*
//#UC END# *4DAEEDE10285_52EA87EA0325_var*
begin
//#UC START# *4DAEEDE10285_52EA87EA0325_impl*
 f_Lambda.DoIt(aCtx);
 f_Word.DoIt(aCtx);
//#UC END# *4DAEEDE10285_52EA87EA0325_impl*
end;//TtfwMapLambda.DoDoIt

function TtfwMappedArrayView.TwoLabdasClass: RtfwTwoLambdas;
//#UC START# *52EA8EE702FA_52E6733C0163_var*
//#UC END# *52EA8EE702FA_52E6733C0163_var*
begin
//#UC START# *52EA8EE702FA_52E6733C0163_impl*
 Result := TtfwMapLambda;
//#UC END# *52EA8EE702FA_52E6733C0163_impl*
end;//TtfwMappedArrayView.TwoLabdasClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwMapLambda
 TtfwMapLambda.RegisterClass;
{$IfEnd} //not NoScripts

end.