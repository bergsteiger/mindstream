unit kwModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwModifier.pas"
// Начат: 11.05.2011 21:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Modifiers::TkwModifier
//
// Поддержка модификаторов.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwModifier = {abstract} class(TtfwRegisterableWord)
  {* Поддержка модификаторов. }
 protected
 // property methods
   function pm_GetModifier: TtfwWordModifier; virtual; abstract;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 protected
 // protected properties
   property Modifier: TtfwWordModifier
     read pm_GetModifier;
 end;//TkwModifier
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwModifier

procedure TkwModifier.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DCACE1201A3_var*
//#UC END# *4DAEEDE10285_4DCACE1201A3_var*
begin
//#UC START# *4DAEEDE10285_4DCACE1201A3_impl*
 aCtx.rTypeInfo.IncludeModifier(Self.Modifier);
//#UC END# *4DAEEDE10285_4DCACE1201A3_impl*
end;//TkwModifier.DoDoIt

function TkwModifier.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4DCACE1201A3_var*
//#UC END# *4DB6D7F70155_4DCACE1201A3_var*
begin
//#UC START# *4DB6D7F70155_4DCACE1201A3_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4DCACE1201A3_impl*
end;//TkwModifier.IsImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwModifier
 TkwModifier.RegisterClass;
{$IfEnd} //not NoScripts

end.