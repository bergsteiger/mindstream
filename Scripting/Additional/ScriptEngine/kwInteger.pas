unit kwInteger;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwInteger.pas"
// Начат: 26.04.2011 17:47
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::PrimitiveWords::TkwInteger
//
// Зарезервированное слово Interger
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
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInteger = class(TtfwWord)
  {* Зарезервированное слово Interger }
 private
 // private fields
   f_Value : Integer;
    {* Поле для свойства Value}
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // public methods
   constructor Create(aValue: Integer); reintroduce;
 public
 // public properties
   property Value: Integer
     read f_Value;
 end;//TkwInteger
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwInteger

constructor TkwInteger.Create(aValue: Integer);
//#UC START# *4DB6CD0F02C5_4DB6CCE100E0_var*
//#UC END# *4DB6CD0F02C5_4DB6CCE100E0_var*
begin
//#UC START# *4DB6CD0F02C5_4DB6CCE100E0_impl*
 inherited Create;
 f_Value := aValue;
//#UC END# *4DB6CD0F02C5_4DB6CCE100E0_impl*
end;//TkwInteger.Create

procedure TkwInteger.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6CCE100E0_var*
//#UC END# *4DAEEDE10285_4DB6CCE100E0_var*
begin
//#UC START# *4DAEEDE10285_4DB6CCE100E0_impl*
 aCtx.rEngine.PushInt(f_Value);
//#UC END# *4DAEEDE10285_4DB6CCE100E0_impl*
end;//TkwInteger.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA5C070057*
 TkwInteger.RegisterClass;
//#UC END# *53DA5C070057*
{$IfEnd} //not NoScripts

end.