unit kwDualCompiledWordContainer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwDualCompiledWordContainer.pas"
// Начат: 29.04.2011 17:52
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwDualCompiledWordContainer
//
// Контейнер для хранения парных скомпилированных слов (begin end)
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwCompiledWordContainer
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwDualCompiledWordContainer = {abstract} class(TkwCompiledWordContainer)
  {* Контейнер для хранения парных скомпилированных слов (begin end) }
 protected
 // property methods
   function pm_GetElseBranch: TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected fields
   f_ElseBranch : TtfwWord;
 public
 // public methods
   constructor Create(aIf: TtfwWord;
     aElse: TtfwWord); reintroduce;
 public
 // public properties
   property ElseBranch: TtfwWord
     read pm_GetElseBranch;
 end;//TkwDualCompiledWordContainer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  SysUtils,
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwDualCompiledWordContainer

constructor TkwDualCompiledWordContainer.Create(aIf: TtfwWord;
  aElse: TtfwWord);
//#UC START# *4DB6F4CB03BE_4DBAC27801EF_var*
//#UC END# *4DB6F4CB03BE_4DBAC27801EF_var*
begin
//#UC START# *4DB6F4CB03BE_4DBAC27801EF_impl*
 inherited Create(aIf);
 aElse.SetRefTo(f_ElseBranch);
//#UC END# *4DB6F4CB03BE_4DBAC27801EF_impl*
end;//TkwDualCompiledWordContainer.Create

function TkwDualCompiledWordContainer.pm_GetElseBranch: TtfwWord;
//#UC START# *53DB68CF0124_4DBAC27801EFget_var*
//#UC END# *53DB68CF0124_4DBAC27801EFget_var*
begin
//#UC START# *53DB68CF0124_4DBAC27801EFget_impl*
 Result := f_ElseBranch;
//#UC END# *53DB68CF0124_4DBAC27801EFget_impl*
end;//TkwDualCompiledWordContainer.pm_GetElseBranch

procedure TkwDualCompiledWordContainer.Cleanup;
//#UC START# *479731C50290_4DBAC27801EF_var*
//#UC END# *479731C50290_4DBAC27801EF_var*
begin
//#UC START# *479731C50290_4DBAC27801EF_impl*
 FreeAndNil(f_ElseBranch);
 inherited;
//#UC END# *479731C50290_4DBAC27801EF_impl*
end;//TkwDualCompiledWordContainer.Cleanup

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA7B70013D*
 TkwDualCompiledWordContainer.RegisterClass;
//#UC END# *53DA7B70013D*
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwDualCompiledWordContainer
 TkwDualCompiledWordContainer.RegisterClass;
{$IfEnd} //not NoScripts

end.