unit tfwString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwString.pas"
// Начат: 27.05.2011 20:29
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TtfwString
//
// Базовый предок для добавления слов в словарь.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  TypInfo,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwString = {abstract} class(TtfwRegisterableWord)
  {* Базовый предок для добавления слов в словарь. }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 protected
 // protected methods
   function GetString: AnsiString; virtual;
 end;//TtfwString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3Except
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwString

function TtfwString.GetString: AnsiString;
//#UC START# *4DDFD2EA0116_4DDFD1430390_var*
//#UC END# *4DDFD2EA0116_4DDFD1430390_var*
begin
//#UC START# *4DDFD2EA0116_4DDFD1430390_impl*
 Result := '';
 Assert(false);
//#UC END# *4DDFD2EA0116_4DDFD1430390_impl*
end;//TtfwString.GetString

procedure TtfwString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DDFD1430390_var*
//#UC END# *4DAEEDE10285_4DDFD1430390_var*
begin
//#UC START# *4DAEEDE10285_4DDFD1430390_impl*
 aCtx.rEngine.PushString(TtfwCStringFactory.C(GetString));
//#UC END# *4DAEEDE10285_4DDFD1430390_impl*
end;//TtfwString.DoDoIt

function TtfwString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_4DDFD1430390_var*
//#UC END# *551544E2001A_4DDFD1430390_var*
begin
//#UC START# *551544E2001A_4DDFD1430390_impl*
 Result := @tfw_tiString;
//#UC END# *551544E2001A_4DDFD1430390_impl*
end;//TtfwString.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwString
 TtfwString.RegisterClass;
{$IfEnd} //not NoScripts

end.