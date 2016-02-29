unit kwCompiledWordWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwCompiledWordWorker.pas"
// Начат: 12.05.2011 16:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledWordWorker
//
// Базовый класс для исполняемых скомпилированных слов.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  kwSourcePointWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordWorker = class of TkwCompiledWordWorker;

 TkwCompiledWordWorker = {abstract} class(TkwSourcePointWord)
  {* Базовый класс для исполняемых скомпилированных слов. }
 private
 // private fields
   f_WordToWork : TtfwWord;
    {* Поле для свойства WordToWork}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aWordToPush: TtfwWord;
     aWordToRun: TtfwWord;
     const aCtx: TtfwContext); reintroduce; virtual;
 public
 // public properties
   property WordToWork: TtfwWord
     read f_WordToWork;
 end;//TkwCompiledWordWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  l3Base
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWordWorker

constructor TkwCompiledWordWorker.Create(aWordToPush: TtfwWord;
  aWordToRun: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4DCBB0CD028D_4DCBD50101CB_var*
//#UC END# *4DCBB0CD028D_4DCBD50101CB_var*
begin
//#UC START# *4DCBB0CD028D_4DCBD50101CB_impl*
 inherited Create(aCtx);
 aWordToPush.SetRefTo(f_WordToWork);
//#UC END# *4DCBB0CD028D_4DCBD50101CB_impl*
end;//TkwCompiledWordWorker.Create

procedure TkwCompiledWordWorker.Cleanup;
//#UC START# *479731C50290_4DCBD50101CB_var*
//#UC END# *479731C50290_4DCBD50101CB_var*
begin
//#UC START# *479731C50290_4DCBD50101CB_impl*
 FreeAndNil(f_WordToWork);
 inherited;
//#UC END# *479731C50290_4DCBD50101CB_impl*
end;//TkwCompiledWordWorker.Cleanup

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordWorker
 TkwCompiledWordWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.