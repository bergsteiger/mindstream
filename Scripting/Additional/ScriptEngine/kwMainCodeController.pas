unit kwMainCodeController;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMainCodeController.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ScriptsCompilingAndProcessing::TkwMainCodeController
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
  kwMain,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwMainCodeController = class(TkwMain)
 private
 // private fields
   f_Lambda : TtfwWord;
   f_OuterContext : PtfwContext;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
 public
 // public methods
   constructor Create(aLambda: TtfwWord;
     aOuterContext: PtfwContext); reintroduce;
 end;//TkwMainCodeController
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwMainCodeController

constructor TkwMainCodeController.Create(aLambda: TtfwWord;
  aOuterContext: PtfwContext);
//#UC START# *53DA263600C7_53DA257D011C_var*
//#UC END# *53DA263600C7_53DA257D011C_var*
begin
//#UC START# *53DA263600C7_53DA257D011C_impl*
 inherited Create;
 aLambda.SetRefTo(f_Lambda);
 f_OuterContext := aOuterContext;
 Assert(f_OuterContext <> nil);
//#UC END# *53DA263600C7_53DA257D011C_impl*
end;//TkwMainCodeController.Create

procedure TkwMainCodeController.Cleanup;
//#UC START# *479731C50290_53DA257D011C_var*
//#UC END# *479731C50290_53DA257D011C_var*
begin
//#UC START# *479731C50290_53DA257D011C_impl*
 FreeAndNil(f_Lambda);
 inherited;
//#UC END# *479731C50290_53DA257D011C_impl*
end;//TkwMainCodeController.Cleanup

procedure TkwMainCodeController.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_53DA257D011C_var*
//#UC END# *4DB6CE2302C9_53DA257D011C_var*
begin
//#UC START# *4DB6CE2302C9_53DA257D011C_impl*
 inherited;
 Assert(f_OuterContext <> nil);
 f_OuterContext.rEngine.PushObj(aCompiled);
 f_Lambda.DoIt(f_OuterContext^);
//#UC END# *4DB6CE2302C9_53DA257D011C_impl*
end;//TkwMainCodeController.AfterCompile

{$IfEnd} //not NoScripts

end.