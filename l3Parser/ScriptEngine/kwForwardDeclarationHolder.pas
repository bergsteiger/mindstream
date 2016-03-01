unit kwForwardDeclarationHolder;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwForwardDeclarationHolder.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwForwardDeclarationHolder
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  l3Interfaces
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
 // overridden public methods
   function WordName: Il3CString; override;
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

function TkwForwardDeclarationHolder.WordName: Il3CString;
//#UC START# *55AFD7DA0258_4F4BC6DB02F4_var*
//#UC END# *55AFD7DA0258_4F4BC6DB02F4_var*
begin
//#UC START# *55AFD7DA0258_4F4BC6DB02F4_impl*
 Result := f_Holded.WordName;
//#UC END# *55AFD7DA0258_4F4BC6DB02F4_impl*
end;//TkwForwardDeclarationHolder.WordName

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwForwardDeclarationHolder
 TkwForwardDeclarationHolder.RegisterClass;
{$IfEnd} //not NoScripts

end.