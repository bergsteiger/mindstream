unit tfwConst;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwConst.pas"
// Начат: 03.05.2011 12:57
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwConst
//
// Поддержка констант.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwConstLike
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwConst = {abstract} class(TtfwConstLike)
  {* Поддержка констант. }
 protected
 // overridden protected methods
   function AcceptsKeyWordAfter: Boolean; override;
 end;//TtfwConst
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwConst

function TtfwConst.AcceptsKeyWordAfter: Boolean;
//#UC START# *4DB9B502013D_4DBFC3520093_var*
//#UC END# *4DB9B502013D_4DBFC3520093_var*
begin
//#UC START# *4DB9B502013D_4DBFC3520093_impl*
 Result := false;
//#UC END# *4DB9B502013D_4DBFC3520093_impl*
end;//TtfwConst.AcceptsKeyWordAfter

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwConst
 TtfwConst.RegisterClass;
{$IfEnd} //not NoScripts

end.