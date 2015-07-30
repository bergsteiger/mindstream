unit kwCompiledStereotypeStereotypeProducer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledStereotypeStereotypeProducer.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwCompiledStereotypeStereotypeProducer
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledProcedure,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledStereotypeStereotypeProducer = class(TkwCompiledProcedure)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwCompiledStereotypeStereotypeProducer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledStereotypeStereotypeProducerRunner,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledStereotypeStereotypeProducer

procedure TkwCompiledStereotypeStereotypeProducer.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F43B1C00019_var*
var
 l_Runner : TkwCompiledStereotypeStereotypeProducerRunner;
 //l_M : TtfwWordModifiers;
//#UC END# *4DAEEDE10285_4F43B1C00019_var*
begin
//#UC START# *4DAEEDE10285_4F43B1C00019_impl*
 l_Runner := TkwCompiledStereotypeStereotypeProducerRunner.Create(Self);
 try
  l_Runner.Key := Self.Key;
  //l_M := aCtx.rModifiers;
  l_Runner.DoIt(aCtx);
  //Assert(l_M = aCtx.rModifiers);
 finally
  FreeAndNil(l_Runner);
 end;//try..finally
//#UC END# *4DAEEDE10285_4F43B1C00019_impl*
end;//TkwCompiledStereotypeStereotypeProducer.DoDoIt

function TkwCompiledStereotypeStereotypeProducer.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F43B1C00019_var*
//#UC END# *4DB6D7F70155_4F43B1C00019_var*
begin
//#UC START# *4DB6D7F70155_4F43B1C00019_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F43B1C00019_impl*
end;//TkwCompiledStereotypeStereotypeProducer.IsImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledStereotypeStereotypeProducer
 TkwCompiledStereotypeStereotypeProducer.RegisterClass;
{$IfEnd} //not NoScripts

end.