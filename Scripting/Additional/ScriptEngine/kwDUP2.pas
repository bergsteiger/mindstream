unit kwDUP2;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwDUP2.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwDUP2
//
// Дублирует пару-ячеек x1 x2. ( x1 x2 -- x1 x2 x1 x2 )
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
 TkwDUP2 = class(_tfwAutoregisteringWord_)
  {* Дублирует пару-ячеек x1 x2. ( x1 x2 -- x1 x2 x1 x2 ) }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwDUP2
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwDUP2;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwDUP2

procedure TkwDUP2.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DEF609902B3_var*
//#UC END# *4DAEEDE10285_4DEF609902B3_var*
begin
//#UC START# *4DAEEDE10285_4DEF609902B3_impl*
 aCtx.rEngine.Dup2;
//#UC END# *4DAEEDE10285_4DEF609902B3_impl*
end;//TkwDUP2.DoDoIt

class function TkwDUP2.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DEF609902B3_var*
//#UC END# *4DB0614603C8_4DEF609902B3_var*
begin
//#UC START# *4DB0614603C8_4DEF609902B3_impl*
 Result := '2DUP';
//#UC END# *4DB0614603C8_4DEF609902B3_impl*
end;//TkwDUP2.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.