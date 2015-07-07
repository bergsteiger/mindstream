unit kwCompiledImmediateExecute;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledImmediateExecute.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwCompiledImmediateExecute
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
  kwCompiledWordWorker,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledImmediateExecute = class(TkwCompiledWordWorker)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
   function IsRunner: Boolean; override;
 end;//TkwCompiledImmediateExecute
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledImmediateExecute

procedure TkwCompiledImmediateExecute.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EBA1480170_var*
//#UC END# *4DAEEDE10285_52EBA1480170_var*
begin
//#UC START# *4DAEEDE10285_52EBA1480170_impl*
 f_Word.DoIt(aCtx);
//#UC END# *4DAEEDE10285_52EBA1480170_impl*
end;//TkwCompiledImmediateExecute.DoDoIt

function TkwCompiledImmediateExecute.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_52EBA1480170_var*
//#UC END# *4DB6D7F70155_52EBA1480170_var*
begin
//#UC START# *4DB6D7F70155_52EBA1480170_impl*
 Result := true;
//#UC END# *4DB6D7F70155_52EBA1480170_impl*
end;//TkwCompiledImmediateExecute.IsImmediate

function TkwCompiledImmediateExecute.IsRunner: Boolean;
//#UC START# *4F3FB2E202A2_52EBA1480170_var*
//#UC END# *4F3FB2E202A2_52EBA1480170_var*
begin
//#UC START# *4F3FB2E202A2_52EBA1480170_impl*
 Result := true;
//#UC END# *4F3FB2E202A2_52EBA1480170_impl*
end;//TkwCompiledImmediateExecute.IsRunner

{$IfEnd} //not NoScripts

end.