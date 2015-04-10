unit kwFunctorToIterator;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwFunctorToIterator.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ArrayProcessing::FunctorToIterator
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwFunctorToIterator = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwFunctorToIterator
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwIteratorFromFunctor,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwFunctorToIterator;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwFunctorToIterator

procedure TkwFunctorToIterator.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EB85E8006B_var*
//#UC END# *4DAEEDE10285_52EB85E8006B_var*
begin
//#UC START# *4DAEEDE10285_52EB85E8006B_impl*
 aCtx.rEngine.Push(TtfwStackValue_C(TtfwIteratorFromFunctor.Make(aCtx.rEngine.PopObj As TtfwWord)));
//#UC END# *4DAEEDE10285_52EB85E8006B_impl*
end;//TkwFunctorToIterator.DoDoIt

class function TkwFunctorToIterator.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'FunctorToIterator';
end;//TkwFunctorToIterator.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.