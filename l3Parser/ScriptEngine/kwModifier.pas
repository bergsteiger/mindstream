unit kwModifier;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwModifier.pas"
// Начат: 11.05.2011 21:28
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::Modifier
//
// Поддержка модификаторов.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwTypeInfo,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwModifier = {abstract scriptword} class(TtfwRegisterableWord)
  {* Поддержка модификаторов. }
 protected
 // property methods
   function pm_GetModifier: TtfwTypeInfo; virtual; abstract;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
 protected
 // protected properties
   property Modifier: TtfwTypeInfo
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
 aCtx.SetWordInfo(aCtx.rTypeInfo.IncludeType(Self.Modifier));
//#UC END# *4DAEEDE10285_4DCACE1201A3_impl*
end;//TkwModifier.DoDoIt

function TkwModifier.IsImmediate(const aCtx: TtfwContext): Boolean;
 {-}
begin
 Result := true;
end;//TkwModifier.IsImmediate

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация Modifier
 TkwModifier.RegisterClass;
{$IfEnd} //not NoScripts

end.