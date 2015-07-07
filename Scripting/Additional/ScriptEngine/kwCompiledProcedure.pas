unit kwCompiledProcedure;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledProcedure.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledProcedure
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

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
   function pm_GetResultTypeInfo: TtfwTypeInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(const aValue: TtfwTypeInfo;
     const aCtx: TtfwContext); override;
 protected
 // protected fields
   f_Modifiers : TtfwTypeInfo;
 end;//TkwCompiledProcedure
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledProcedure

procedure TkwCompiledProcedure.Cleanup;
//#UC START# *479731C50290_4F216D8D01A0_var*
//#UC END# *479731C50290_4F216D8D01A0_var*
begin
//#UC START# *479731C50290_4F216D8D01A0_impl*
 f_Modifiers.Clear;
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

function TkwCompiledProcedure.pm_GetResultTypeInfo: TtfwTypeInfo;
//#UC START# *52CFC11603C8_4F216D8D01A0get_var*
//#UC END# *52CFC11603C8_4F216D8D01A0get_var*
begin
//#UC START# *52CFC11603C8_4F216D8D01A0get_impl*
 Result := f_Modifiers; 
//#UC END# *52CFC11603C8_4F216D8D01A0get_impl*
end;//TkwCompiledProcedure.pm_GetResultTypeInfo

procedure TkwCompiledProcedure.SetResultTypeInfo(const aValue: TtfwTypeInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F216D8D01A0_var*
//#UC END# *52EA6A2C0111_4F216D8D01A0_var*
begin
//#UC START# *52EA6A2C0111_4F216D8D01A0_impl*
 CompilerAssert(aValue.Modifiers - [tfw_wmPrivate, tfw_wmVirtual..tfw_wmPublic, tfw_wmRealize, tfw_wmOverride, tfw_wmRedefinition, tfw_wmAggregation .. tfw_wmSealed, tfw_wmCanBeMerged, tfw_wmVoid, tfw_wmImmediate] = [], 'Неверный список модификаторов', aCtx);
 f_Modifiers := aValue
//#UC END# *52EA6A2C0111_4F216D8D01A0_impl*
end;//TkwCompiledProcedure.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA53A200F3*
 TkwCompiledProcedure.RegisterClass;
//#UC END# *53DA53A200F3*
{$IfEnd} //not NoScripts

end.