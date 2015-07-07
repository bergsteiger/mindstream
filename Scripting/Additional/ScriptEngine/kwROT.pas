unit kwROT;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwROT.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwROT
//
// Прокрутить три верхних элемента стека: ( x1 x2 x3 -- x2 x3 x1 )
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
 TkwROT = class(_tfwAutoregisteringWord_)
  {* Прокрутить три верхних элемента стека: ( x1 x2 x3 -- x2 x3 x1 ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwROT
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwROT;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwROT

procedure TkwROT.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF290A0071_var*
//#UC END# *4DAEEDE10285_4DEF290A0071_var*
begin
//#UC START# *4DAEEDE10285_4DEF290A0071_impl*
 aCtx.rEngine.ROT;
//#UC END# *4DAEEDE10285_4DEF290A0071_impl*
end;//TkwROT.DoDoIt

class function TkwROT.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF290A0071_var*
//#UC END# *4DB0614603C8_4DEF290A0071_var*
begin
//#UC START# *4DB0614603C8_4DEF290A0071_impl*
 Result := 'ROT';
//#UC END# *4DB0614603C8_4DEF290A0071_impl*
end;//TkwROT.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.