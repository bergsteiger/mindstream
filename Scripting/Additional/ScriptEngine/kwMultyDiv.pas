unit kwMultyDiv;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwMultyDiv.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwMultyDiv
//
// */                             "star-slash"
// ( n1 n2 n3 -- n4 )
// Умножает n1 на n2, с промежуточным результатом d.
// Делит d на n3, выдает частное n4.
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
 TkwMultyDiv = {final} class(_tfwAutoregisteringWord_)
  {* */                             "star-slash"
( n1 n2 n3 -- n4 )
            Умножает n1 на n2, с промежуточным результатом d. 
            Делит d на n3, выдает частное n4. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwMultyDiv
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Math,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwMultyDiv;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwMultyDiv

procedure TkwMultyDiv.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F911FDC006A_var*
var
 l_Third  : Integer;
 l_Second : Integer;
//#UC END# *4DAEEDE10285_4F911FDC006A_var*
begin
//#UC START# *4DAEEDE10285_4F911FDC006A_impl*
 if aCtx.rEngine.IsTopInt then
  l_Third := aCtx.rEngine.PopInt
 else
  Assert(False, 'Операции умножения и деления возможны только с целочисленными аргументами!');
 if aCtx.rEngine.IsTopInt then
  l_Second := aCtx.rEngine.PopInt
 else
  Assert(False, 'Операции умножения и деления возможны только с целочисленными аргументами!');
 if aCtx.rEngine.IsTopInt then
  aCtx.rEngine.PushInt(l3MulDiv(aCtx.rEngine.PopInt, l_Second, l_Third))
 else
  Assert(False, 'Операции умножения и деления возможны только с целочисленными аргументами!');
//#UC END# *4DAEEDE10285_4F911FDC006A_impl*
end;//TkwMultyDiv.DoDoIt

class function TkwMultyDiv.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F911FDC006A_var*
//#UC END# *4DB0614603C8_4F911FDC006A_var*
begin
//#UC START# *4DB0614603C8_4F911FDC006A_impl*
 Result := '*/';
//#UC END# *4DB0614603C8_4F911FDC006A_impl*
end;//TkwMultyDiv.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.