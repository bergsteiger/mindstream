unit kwSetFuzzInPercent;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSetFuzzInPercent.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::WinUtils::SetFuzzInPercent
//
// Описание: устанавливает погрешность сравнения картинок в процентах.
// {code}
// aValue SetFuzzInPercent
// {code}
// где aValue - целое число от 0 до 100. Если число будет меньше 0 и больше 100, то будет
// установлено значение по умолчанию (3%)
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
 TkwSetFuzzInPercent = {final} class(_tfwAutoregisteringWord_)
  {* Описание: устанавливает погрешность сравнения картинок в процентах.
[code]
aValue SetFuzzInPercent
[code]
где aValue - целое число от 0 до 100. Если число будет меньше 0 и больше 100, то будет установлено значение по умолчанию (3%) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSetFuzzInPercent
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3ImageUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSetFuzzInPercent;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwSetFuzzInPercent

procedure TkwSetFuzzInPercent.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5375BDB10180_var*
//#UC END# *4DAEEDE10285_5375BDB10180_var*
begin
//#UC START# *4DAEEDE10285_5375BDB10180_impl*
 RunnerAssert(aCtx.rEngine.IsTopInt, 'Значение не задано!', aCtx);
 l3SetFuzzValueInPercent(aCtx.rEngine.PopInt);
//#UC END# *4DAEEDE10285_5375BDB10180_impl*
end;//TkwSetFuzzInPercent.DoDoIt

class function TkwSetFuzzInPercent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'SetFuzzInPercent';
end;//TkwSetFuzzInPercent.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.