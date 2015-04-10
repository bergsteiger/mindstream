unit kwAdd;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwAdd.pas"
// Начат: 26.04.2011 20:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::StandartWords::TkwAdd
//
// +                                 "plus"
// ( n1|u1 n2|u2 -- n3|u3 )
// Прибавляет n2|u2 к n1|u1, возвращая сумму n3|u3.
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
 TkwAdd = class(_tfwAutoregisteringWord_)
  {* +                                 "plus"                        
( n1|u1 n2|u2 -- n3|u3 )
            Прибавляет n2|u2 к n1|u1, возвращая сумму n3|u3. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwAdd
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwAdd;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwAdd

procedure TkwAdd.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6F7950341_var*
var
 l_A   : Integer;
 l_Srr : AnsiString;
//#UC END# *4DAEEDE10285_4DB6F7950341_var*
begin
//#UC START# *4DAEEDE10285_4DB6F7950341_impl*
 if aCtx.rEngine.IsTopInt then
 begin
  l_A := aCtx.rEngine.PopInt;
  if aCtx.rEngine.IsTopInt then
   aCtx.rEngine.PushInt(aCtx.rEngine.PopInt + l_A)
  else
   if aCtx.rEngine.IsTopString then
    aCtx.rEngine.PushString(IntToStr(l_A) + aCtx.rEngine.PopDelphiString)
   else
    Assert(False, 'Складывать можно только одинаковые типы!');
 end // if aCtx.rEngine.IsTopInt then
 else
  if aCtx.rEngine.IsTopString then
  begin
   l_Srr := aCtx.rEngine.PopDelphiString;
   if aCtx.rEngine.IsTopString then
    aCtx.rEngine.PushString(l_Srr + aCtx.rEngine.PopDelphiString)
   else
    if aCtx.rEngine.IsTopInt then
     aCtx.rEngine.PushString(l_Srr + IntToStr(aCtx.rEngine.PopInt))
    else
     Assert(False, 'Складывать можно только одинаковые типы!')
  end // if aCtx.rEngine.IsTopString then
  else
   Assert(False, 'Сложение других типов данных не поддерживается!')
//#UC END# *4DAEEDE10285_4DB6F7950341_impl*
end;//TkwAdd.DoDoIt

class function TkwAdd.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4DB6F7950341_var*
//#UC END# *4DB0614603C8_4DB6F7950341_var*
begin
//#UC START# *4DB0614603C8_4DB6F7950341_impl*
 Result := '+';
//#UC END# *4DB0614603C8_4DB6F7950341_impl*
end;//TkwAdd.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.