unit kwMainCodeController;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwMainCodeController.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::ScriptsCompilingAndProcessing::TkwMainCodeController
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwMain
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
   function CacheDict: Boolean; override;
 public
 // overridden public methods
   procedure RunCompiled(const aContext: TtfwContext); override;
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

procedure TkwMainCodeController.RunCompiled(const aContext: TtfwContext);
//#UC START# *4DC90A79006D_53DA257D011C_var*
//#UC END# *4DC90A79006D_53DA257D011C_var*
begin
//#UC START# *4DC90A79006D_53DA257D011C_impl*
 Assert(f_OuterContext <> nil);
 f_OuterContext.rEngine.PushObj(MainDictionary.CompiledCode);
 f_Lambda.DoIt(f_OuterContext^);
//#UC END# *4DC90A79006D_53DA257D011C_impl*
end;//TkwMainCodeController.RunCompiled

function TkwMainCodeController.CacheDict: Boolean;
//#UC START# *55AF8A9D03A2_53DA257D011C_var*
//#UC END# *55AF8A9D03A2_53DA257D011C_var*
begin
//#UC START# *55AF8A9D03A2_53DA257D011C_impl*
 Result := true;
//#UC END# *55AF8A9D03A2_53DA257D011C_impl*
end;//TkwMainCodeController.CacheDict

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwMainCodeController
 TkwMainCodeController.RegisterInEngine;
{$IfEnd} //not NoScripts

end.