unit kwMultiply;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMultiply.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwMultiply
//
// *                                 "star"
// ( n1 * n2 -- n3 )
// Умножает n1 на n2, возвращает n3.
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
 TkwMultiply = class(_tfwAutoregisteringWord_)
  {* *                                 "star"                        
( n1 * n2 -- n3 )
            Умножает n1 на n2, возвращает n3. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMultiply
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMultiply;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMultiply

procedure TkwMultiply.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F913F230133_var*
var
 l_Second: Integer;
//#UC END# *4DAEEDE10285_4F913F230133_var*
begin
//#UC START# *4DAEEDE10285_4F913F230133_impl*
 if aCtx.rEngine.IsTopInt then
  l_Second := aCtx.rEngine.PopInt
 else
  Assert(False, 'Умножение возможно только с целочисленными аргументами!');
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(aCtx.rEngine.PopInt * l_Second)
 else
  Assert(False, 'Умножение возможно только с целочисленными аргументами!');
//#UC END# *4DAEEDE10285_4F913F230133_impl*
end;//TkwMultiply.DoDoIt

class function TkwMultiply.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F913F230133_var*
//#UC END# *4DB0614603C8_4F913F230133_var*
begin
//#UC START# *4DB0614603C8_4F913F230133_impl*
 Result := '*';
//#UC END# *4DB0614603C8_4F913F230133_impl*
end;//TkwMultiply.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.