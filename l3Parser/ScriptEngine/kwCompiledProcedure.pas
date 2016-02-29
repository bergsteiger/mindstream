unit kwCompiledProcedure;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledProcedure.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledProcedure
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledProcedure = class(TkwCompiledWord)
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
     const aCtx: TtfwContext); override;
 protected
 // protected fields
   f_Modifiers : TtfwWordInfo;
 end;//TkwCompiledProcedure
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef,
  tfwScriptingTypes,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledProcedure

procedure TkwCompiledProcedure.Cleanup;
//#UC START# *479731C50290_4F216D8D01A0_var*
//#UC END# *479731C50290_4F216D8D01A0_var*
begin
//#UC START# *479731C50290_4F216D8D01A0_impl*
 f_Modifiers := nil;
 inherited;
//#UC END# *479731C50290_4F216D8D01A0_impl*
end;//TkwCompiledProcedure.Cleanup

procedure TkwCompiledProcedure.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F216D8D01A0_var*
//#UC END# *4DAEEDE10285_4F216D8D01A0_var*
begin
//#UC START# *4DAEEDE10285_4F216D8D01A0_impl*
 try
  inherited;
 except
  on EtfwExit do
   ;
  on EtfwBreak do
   raise EtfwCodeFlowError.Create('BREAK не может пересекать границу процедуры');
  on EtfwContinue do
   raise EtfwCodeFlowError.Create('CONTINUE не может пересекать границу процедуры'); 
 end;//try..except
//#UC END# *4DAEEDE10285_4F216D8D01A0_impl*
end;//TkwCompiledProcedure.DoDoIt

function TkwCompiledProcedure.IsImmediate(const aCtx: TtfwContext): Boolean;
//#UC START# *4DB6D7F70155_4F216D8D01A0_var*
//#UC END# *4DB6D7F70155_4F216D8D01A0_var*
begin
//#UC START# *4DB6D7F70155_4F216D8D01A0_impl*
 Result := Self.ResultTypeInfo[aCtx].Has(tfw_wmImmediate);
 //Result := inherited IsImmediate(aCtx);
//#UC END# *4DB6D7F70155_4F216D8D01A0_impl*
end;//TkwCompiledProcedure.IsImmediate

function TkwCompiledProcedure.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_4F216D8D01A0get_var*
//#UC END# *52CFC11603C8_4F216D8D01A0get_var*
begin
//#UC START# *52CFC11603C8_4F216D8D01A0get_impl*
 Result := f_Modifiers; 
//#UC END# *52CFC11603C8_4F216D8D01A0get_impl*
end;//TkwCompiledProcedure.pm_GetResultTypeInfo

procedure TkwCompiledProcedure.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F216D8D01A0_var*
//#UC END# *52EA6A2C0111_4F216D8D01A0_var*
begin
//#UC START# *52EA6A2C0111_4F216D8D01A0_impl*
 CompilerAssert(aValue.ValueTypes.Empty OR aValue.ValueTypes.EQ(@tfw_tiVoid),
                'Неверный список модификаторов: ' + l3Str(aValue.ValueTypes.Name),
                aCtx);
 f_Modifiers := aValue.Clone;
//#UC END# *52EA6A2C0111_4F216D8D01A0_impl*
end;//TkwCompiledProcedure.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledProcedure
 TkwCompiledProcedure.RegisterClass;
{$IfEnd} //not NoScripts

end.