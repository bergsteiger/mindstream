unit kwCompiledWordContainer;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWordContainer.pas"
// Начат: 26.04.2011 19:30
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWordContainer
//
// Контейнер для зарезервированных слов.
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
 TkwCompiledWordContainer = {abstract} class(TtfwWord)
  {* Контейнер для зарезервированных слов. }
 private
 // private fields
   f_Compiled : TtfwWord;
    {* Поле для свойства Compiled}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aCompiled: TtfwWord); reintroduce;
 public
 // public properties
   property Compiled: TtfwWord
     read f_Compiled;
 end;//TkwCompiledWordContainer
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWordContainer

constructor TkwCompiledWordContainer.Create(aCompiled: TtfwWord);
//#UC START# *4DB6E4AB01B1_4DB6E4630256_var*
//#UC END# *4DB6E4AB01B1_4DB6E4630256_var*
begin
//#UC START# *4DB6E4AB01B1_4DB6E4630256_impl*
 inherited Create;
 aCompiled.SetRefTo(f_Compiled);
//#UC END# *4DB6E4AB01B1_4DB6E4630256_impl*
end;//TkwCompiledWordContainer.Create

procedure TkwCompiledWordContainer.Cleanup;
//#UC START# *479731C50290_4DB6E4630256_var*
//#UC END# *479731C50290_4DB6E4630256_var*
begin
//#UC START# *479731C50290_4DB6E4630256_impl*
 FreeAndNil(f_Compiled);
 inherited;
//#UC END# *479731C50290_4DB6E4630256_impl*
end;//TkwCompiledWordContainer.Cleanup

{$IfEnd} //not NoScripts

end.