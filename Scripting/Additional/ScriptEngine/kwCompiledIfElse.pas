unit kwCompiledIfElse;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledIfElse.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::CodeBranchingWords::TkwCompiledIfElse
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
  kwCompiledIF
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledIfElse = class(TkwCompiledIF)
 private
 // private fields
   f_Condition : TtfwWord;
 protected
 // property methods
   function pm_GetCondition: TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // public methods
   constructor Create(aCondition: TtfwWord;
     anIf: TtfwWord;
     anElse: TtfwWord); reintroduce;
   procedure SetElse(anElse: TtfwWord);
 public
 // public properties
   property Condition: TtfwWord
     read pm_GetCondition;
 end;//TkwCompiledIfElse
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledIfElse

constructor TkwCompiledIfElse.Create(aCondition: TtfwWord;
  anIf: TtfwWord;
  anElse: TtfwWord);
//#UC START# *5284EED900B6_5284E9510053_var*
//#UC END# *5284EED900B6_5284E9510053_var*
begin
//#UC START# *5284EED900B6_5284E9510053_impl*
 inherited Create(anIf, anElse);
 aCondition.SetRefTo(f_Condition);
//#UC END# *5284EED900B6_5284E9510053_impl*
end;//TkwCompiledIfElse.Create

procedure TkwCompiledIfElse.SetElse(anElse: TtfwWord);
//#UC START# *5284FE8F025F_5284E9510053_var*
//#UC END# *5284FE8F025F_5284E9510053_var*
begin
//#UC START# *5284FE8F025F_5284E9510053_impl*
 if (f_ElseBranch Is TkwCompiledIfElse) then
  TkwCompiledIfElse(f_ElseBranch).SetElse(anElse)
 else
 begin
  Assert(f_ElseBranch = nil);
  anElse.SetRefTo(f_ElseBranch);
 end;//f_Else Is TkwCompiledIfElse
//#UC END# *5284FE8F025F_5284E9510053_impl*
end;//TkwCompiledIfElse.SetElse

function TkwCompiledIfElse.pm_GetCondition: TtfwWord;
//#UC START# *53DB836902FC_5284E9510053get_var*
//#UC END# *53DB836902FC_5284E9510053get_var*
begin
//#UC START# *53DB836902FC_5284E9510053get_impl*
 Result := f_Condition;
//#UC END# *53DB836902FC_5284E9510053get_impl*
end;//TkwCompiledIfElse.pm_GetCondition

procedure TkwCompiledIfElse.Cleanup;
//#UC START# *479731C50290_5284E9510053_var*
//#UC END# *479731C50290_5284E9510053_var*
begin
//#UC START# *479731C50290_5284E9510053_impl*
 FreeAndNil(f_Condition);
 inherited;
//#UC END# *479731C50290_5284E9510053_impl*
end;//TkwCompiledIfElse.Cleanup

procedure TkwCompiledIfElse.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5284E9510053_var*
//#UC END# *4DAEEDE10285_5284E9510053_var*
begin
//#UC START# *4DAEEDE10285_5284E9510053_impl*
 f_Condition.DoIt(aCtx);
 inherited;
//#UC END# *4DAEEDE10285_5284E9510053_impl*
end;//TkwCompiledIfElse.DoDoIt

{$IfEnd} //not NoScripts

end.