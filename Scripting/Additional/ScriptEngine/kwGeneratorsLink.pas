unit kwGeneratorsLink;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGeneratorsLink.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::generators_Link
//
// Берёт со стека два генератора и делает из них цепочку. В результате на стеке остаётся один
// генератор (к которому подклеен другой)
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
 TkwGeneratorsLink = {final} class(_tfwAutoregisteringWord_)
  {* Берёт со стека два генератора и делает из них цепочку. В результате на стеке остаётся один генератор (к которому подклеен другой) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGeneratorsLink
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Variant,
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGeneratorsLink;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGeneratorsLink

procedure TkwGeneratorsLink.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_505AE6F40132_var*
var
 l_GenHead, l_Gen: Ik2TagGenerator;
 l_GenHead_Origin: Ik2TagGenerator;
//#UC END# *4DAEEDE10285_505AE6F40132_var*
begin
//#UC START# *4DAEEDE10285_505AE6F40132_impl*
 Assert(aCtx.rEngine.IsTopIntf, 'generators:Link - на стеке не интерфейс (tail)');
 Assert(Supports(aCtx.rEngine.PopIntf, Ik2TagGenerator, l_Gen), 'generators:Link - на стеке не Ik2TagGenerator (tail)');
 Assert(aCtx.rEngine.IsTopIntf, 'generators:Link - на стеке не интерфейс (head)');
 Assert(Supports(aCtx.rEngine.PopIntf, Ik2TagGenerator, l_GenHead), 'generators:Link - на стеке не Ik2TagGenerator (head)');
 l_GenHead_Origin := l_GenHead;
 while l_GenHead.NextGenerator <> nil do
  l_GenHead := l_GenHead.NextGenerator;
 l_GenHead.NextGenerator := l_Gen;
 aCtx.rEngine.PushIntf(l_GenHead_Origin);
//#UC END# *4DAEEDE10285_505AE6F40132_impl*
end;//TkwGeneratorsLink.DoDoIt

class function TkwGeneratorsLink.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'generators:Link';
end;//TkwGeneratorsLink.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.