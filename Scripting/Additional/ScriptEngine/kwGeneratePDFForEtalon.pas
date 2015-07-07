unit kwGeneratePDFForEtalon;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwGeneratePDFForEtalon.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::FiltersAndGenerators::GeneratePDFForEtalon
//
// *Формат*:
// {code}
// aFlag GeneratePDFForEtalon
// {code}
// где aFlag - true или false.
// Включить/выключить режим генерации текстового PDF, который удобно использовать для сравнения.
// Нужно выставлять при каждом экспорте, т.к.флаг сбрасывается в False.
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
 TkwGeneratePDFForEtalon = {final} class(_tfwAutoregisteringWord_)
  {* *Формат*:
[code]
aFlag GeneratePDFForEtalon
[code]
где aFlag - true или false.
Включить/выключить режим генерации текстового PDF, который удобно использовать для сравнения. Нужно выставлять при каждом экспорте, т.к.флаг сбрасывается в False. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwGeneratePDFForEtalon
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  ddPicturePathListner,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwGeneratePDFForEtalon;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwGeneratePDFForEtalon

procedure TkwGeneratePDFForEtalon.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_54647A7203B2_var*
//#UC END# *4DAEEDE10285_54647A7203B2_var*
begin
//#UC START# *4DAEEDE10285_54647A7203B2_impl*
 RunnerAssert(aCtx.rEngine.IsTopBool, 'Ожидается флаг для формата PDF!', aCtx);
 TddPicturePathListner.Instance.PDF4Etalon := aCtx.rEngine.PopBool;
//#UC END# *4DAEEDE10285_54647A7203B2_impl*
end;//TkwGeneratePDFForEtalon.DoDoIt

class function TkwGeneratePDFForEtalon.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'GeneratePDFForEtalon';
end;//TkwGeneratePDFForEtalon.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.