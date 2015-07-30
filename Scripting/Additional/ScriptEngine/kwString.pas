unit kwString;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwString.pas"
// Начат: 26.04.2011 17:49
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TkwString
//
// Помещает значение в стек как строковое.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwRegisterableWordPrim,
  TypInfo,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwString = class(TtfwRegisterableWordPrim)
  {* Помещает значение в стек как строковое. }
 private
 // private fields
   f_Value : Il3CString;
    {* Поле для свойства Value}
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 public
 // public methods
   constructor Create(const aValue: Il3CString); reintroduce;
 public
 // public properties
   property Value: Il3CString
     read f_Value;
 end;//TkwString
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwString

constructor TkwString.Create(const aValue: Il3CString);
//#UC START# *4DB6CD7402A0_4DB6CD4203D4_var*
//#UC END# *4DB6CD7402A0_4DB6CD4203D4_var*
begin
//#UC START# *4DB6CD7402A0_4DB6CD4203D4_impl*
 inherited Create;
 f_Value := aValue;
//#UC END# *4DB6CD7402A0_4DB6CD4203D4_impl*
end;//TkwString.Create

procedure TkwString.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6CD4203D4_var*
//#UC END# *4DAEEDE10285_4DB6CD4203D4_var*
begin
//#UC START# *4DAEEDE10285_4DB6CD4203D4_impl*
 aCtx.rEngine.PushString(f_Value);
//#UC END# *4DAEEDE10285_4DB6CD4203D4_impl*
end;//TkwString.DoDoIt

procedure TkwString.Cleanup;
//#UC START# *479731C50290_4DB6CD4203D4_var*
//#UC END# *479731C50290_4DB6CD4203D4_var*
begin
//#UC START# *479731C50290_4DB6CD4203D4_impl*
 f_Value := nil;
 inherited;
//#UC END# *479731C50290_4DB6CD4203D4_impl*
end;//TkwString.Cleanup

procedure TkwString.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_Value := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TkwString.ClearFields

function TkwString.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_4DB6CD4203D4_var*
//#UC END# *551544E2001A_4DB6CD4203D4_var*
begin
//#UC START# *551544E2001A_4DB6CD4203D4_impl*
 Result := @tfw_tiString;
//#UC END# *551544E2001A_4DB6CD4203D4_impl*
end;//TkwString.GetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwString
 TkwString.RegisterClass;
{$IfEnd} //not NoScripts

end.