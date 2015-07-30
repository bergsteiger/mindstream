unit kwCompiledStereotypedWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledStereotypedWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Stereotyping::TkwCompiledStereotypedWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledStereotypedWord = class(TkwCompiledWord)
 private
 // private fields
   f_Modifiers : TtfwTypeInfo;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwTypeInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function AllowNestedCalls: Boolean; override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(const aValue: TtfwTypeInfo;
     const aCtx: TtfwContext); override;
 end;//TkwCompiledStereotypedWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledStereotypedWord

procedure TkwCompiledStereotypedWord.Cleanup;
//#UC START# *479731C50290_4F43F0490037_var*
//#UC END# *479731C50290_4F43F0490037_var*
begin
//#UC START# *479731C50290_4F43F0490037_impl*
 f_Modifiers.Clear;
 inherited;
//#UC END# *479731C50290_4F43F0490037_impl*
end;//TkwCompiledStereotypedWord.Cleanup

function TkwCompiledStereotypedWord.AllowNestedCalls: Boolean;
//#UC START# *4F3C06550278_4F43F0490037_var*
//#UC END# *4F3C06550278_4F43F0490037_var*
begin
//#UC START# *4F3C06550278_4F43F0490037_impl*
 Result := true;
//#UC END# *4F3C06550278_4F43F0490037_impl*
end;//TkwCompiledStereotypedWord.AllowNestedCalls

function TkwCompiledStereotypedWord.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwTypeInfo;
//#UC START# *52CFC11603C8_4F43F0490037get_var*
//#UC END# *52CFC11603C8_4F43F0490037get_var*
begin
//#UC START# *52CFC11603C8_4F43F0490037get_impl*
 Result := f_Modifiers;
//#UC END# *52CFC11603C8_4F43F0490037get_impl*
end;//TkwCompiledStereotypedWord.pm_GetResultTypeInfo

procedure TkwCompiledStereotypedWord.SetResultTypeInfo(const aValue: TtfwTypeInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F43F0490037_var*
//#UC END# *52EA6A2C0111_4F43F0490037_var*
begin
//#UC START# *52EA6A2C0111_4F43F0490037_impl*
 f_Modifiers := aValue;
//#UC END# *52EA6A2C0111_4F43F0490037_impl*
end;//TkwCompiledStereotypedWord.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledStereotypedWord
 TkwCompiledStereotypedWord.RegisterClass;
{$IfEnd} //not NoScripts

end.