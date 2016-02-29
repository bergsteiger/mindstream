unit kwValue;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwValue.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::PrimitiveWords::TkwValue
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwTypeInfo,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwValue = class(TtfwWord)
 private
 // private fields
   f_Value : TtfwStackValue;
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // overridden public methods
   function WordName: Il3CString; override;
 public
 // public methods
   constructor Create(const aValue: TtfwStackValue); reintroduce;
 end;//TkwValue
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwValue

constructor TkwValue.Create(const aValue: TtfwStackValue);
//#UC START# *52B46E1B0256_52B46DD80194_var*
//#UC END# *52B46E1B0256_52B46DD80194_var*
begin
//#UC START# *52B46E1B0256_52B46DD80194_impl*
 inherited Create;
 f_Value := aValue;
//#UC END# *52B46E1B0256_52B46DD80194_impl*
end;//TkwValue.Create

procedure TkwValue.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52B46DD80194_var*
//#UC END# *4DAEEDE10285_52B46DD80194_var*
begin
//#UC START# *4DAEEDE10285_52B46DD80194_impl*
 aCtx.rEngine.Push(f_Value);
//#UC END# *4DAEEDE10285_52B46DD80194_impl*
end;//TkwValue.DoDoIt

procedure TkwValue.Cleanup;
//#UC START# *479731C50290_52B46DD80194_var*
//#UC END# *479731C50290_52B46DD80194_var*
begin
//#UC START# *479731C50290_52B46DD80194_impl*
 Finalize(f_Value);
 inherited;
//#UC END# *479731C50290_52B46DD80194_impl*
end;//TkwValue.Cleanup

function TkwValue.WordName: Il3CString;
//#UC START# *55AFD7DA0258_52B46DD80194_var*
//#UC END# *55AFD7DA0258_52B46DD80194_var*
begin
//#UC START# *55AFD7DA0258_52B46DD80194_impl*
 if (f_Value.rType = tfw_vtObj) AND (f_Value.AsObject Is TtfwWord) then
  Result := TtfwWord(f_Value.AsObject).WordName
 else
  Result := f_Value.AsPrintable;
//#UC END# *55AFD7DA0258_52B46DD80194_impl*
end;//TkwValue.WordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwValue
 TkwValue.RegisterClass;
{$IfEnd} //not NoScripts

end.