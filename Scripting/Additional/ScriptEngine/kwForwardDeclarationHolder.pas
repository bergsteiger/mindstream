unit kwForwardDeclarationHolder;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwForwardDeclarationHolder.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwForwardDeclarationHolder
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
 TkwForwardDeclarationHolder = class(TtfwWord)
 private
 // private fields
   f_Holded : TtfwWord;
    {* Поле для свойства Holded}
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 public
 // public methods
   constructor Create(aHolded: TtfwWord); reintroduce;
 public
 // public properties
   property Holded: TtfwWord
     read f_Holded;
 end;//TkwForwardDeclarationHolder
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwForwardDeclarationHolder

constructor TkwForwardDeclarationHolder.Create(aHolded: TtfwWord);
//#UC START# *52D405B300E2_4F4BC6DB02F4_var*
//#UC END# *52D405B300E2_4F4BC6DB02F4_var*
begin
//#UC START# *52D405B300E2_4F4BC6DB02F4_impl*
 inherited Create;
 f_Holded := aHolded;
//#UC END# *52D405B300E2_4F4BC6DB02F4_impl*
end;//TkwForwardDeclarationHolder.Create

procedure TkwForwardDeclarationHolder.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4BC6DB02F4_var*
//#UC END# *4DAEEDE10285_4F4BC6DB02F4_var*
begin
//#UC START# *4DAEEDE10285_4F4BC6DB02F4_impl*
 RunnerAssert(f_Holded <> nil, 'Невалидная ссылка на слово', aCtx);
 f_Holded.DoIt(aCtx);
//#UC END# *4DAEEDE10285_4F4BC6DB02F4_impl*
end;//TkwForwardDeclarationHolder.DoDoIt

procedure TkwForwardDeclarationHolder.Cleanup;
//#UC START# *479731C50290_4F4BC6DB02F4_var*
//#UC END# *479731C50290_4F4BC6DB02F4_var*
begin
//#UC START# *479731C50290_4F4BC6DB02F4_impl*
 f_Holded := nil;
 inherited;
//#UC END# *479731C50290_4F4BC6DB02F4_impl*
end;//TkwForwardDeclarationHolder.Cleanup

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DF7BB203C6*
 TkwForwardDeclarationHolder.RegisterClass;
//#UC END# *53DF7BB203C6*
{$IfEnd} //not NoScripts

end.