unit tfwRevertedArrayView;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwRevertedArrayView.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::TtfwRevertedArrayView
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
  tfwArrayView,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwRevertedArrayView = class(TtfwArrayView)
 protected
 // overridden protected methods
   function Reverted: Boolean; override;
     {* Определяет тот факт, что исходный массив надо перебирать в обратном порядке }
 public
 // overridden public methods
   procedure DoForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); override;
   procedure DoForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext); override;
 end;//TtfwRevertedArrayView
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwRevertedArrayView

function TtfwRevertedArrayView.Reverted: Boolean;
//#UC START# *52E271570101_52E271D60114_var*
//#UC END# *52E271570101_52E271D60114_var*
begin
//#UC START# *52E271570101_52E271D60114_impl*
 Result := true;
//#UC END# *52E271570101_52E271D60114_impl*
end;//TtfwRevertedArrayView.Reverted

procedure TtfwRevertedArrayView.DoForEach(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666E80335_52E271D60114_var*
//#UC END# *52E666E80335_52E271D60114_var*
begin
//#UC START# *52E666E80335_52E271D60114_impl*
 inherited DoForEachBack(aLambda, aCtx);
//#UC END# *52E666E80335_52E271D60114_impl*
end;//TtfwRevertedArrayView.DoForEach

procedure TtfwRevertedArrayView.DoForEachBack(aLambda: TtfwWordPrim;
  const aCtx: TtfwContext);
//#UC START# *52E666F6036E_52E271D60114_var*
//#UC END# *52E666F6036E_52E271D60114_var*
begin
//#UC START# *52E666F6036E_52E271D60114_impl*
 inherited DoForEach(aLambda, aCtx);
//#UC END# *52E666F6036E_52E271D60114_impl*
end;//TtfwRevertedArrayView.DoForEachBack

{$IfEnd} //not NoScripts

end.