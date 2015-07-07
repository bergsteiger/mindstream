unit kwCompiledWordWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWordWorker.pas"
// Начат: 12.05.2011 16:39
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWordWorker
//
// Базовый класс для исполняемых скомпилированных слов.
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
 RkwCompiledWordWorker = class of TkwCompiledWordWorker;

 TkwCompiledWordWorker = {abstract} class(TtfwWord)
  {* Базовый класс для исполняемых скомпилированных слов. }
 protected
 // property methods
   function pm_GetWordToWork: TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected fields
   f_Word : TtfwWord;
 public
 // public methods
   constructor Create(aWordToPush: TtfwWord); reintroduce;
 public
 // public properties
   property WordToWork: TtfwWord
     read pm_GetWordToWork;
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

constructor TkwCompiledWordWorker.Create(aWordToPush: TtfwWord);
//#UC START# *4DCBB0CD028D_4DCBD50101CB_var*
//#UC END# *4DCBB0CD028D_4DCBD50101CB_var*
begin
//#UC START# *4DCBB0CD028D_4DCBD50101CB_impl*
 inherited Create;
 aWordToPush.SetRefTo(f_Word);
//#UC END# *4DCBB0CD028D_4DCBD50101CB_impl*
end;//TkwCompiledWordWorker.Create

function TkwCompiledWordWorker.pm_GetWordToWork: TtfwWord;
//#UC START# *53DB7F940102_4DCBD50101CBget_var*
//#UC END# *53DB7F940102_4DCBD50101CBget_var*
begin
//#UC START# *53DB7F940102_4DCBD50101CBget_impl*
 Result := f_Word;
//#UC END# *53DB7F940102_4DCBD50101CBget_impl*
end;//TkwCompiledWordWorker.pm_GetWordToWork

procedure TkwCompiledWordWorker.Cleanup;
//#UC START# *479731C50290_4DCBD50101CB_var*
//#UC END# *479731C50290_4DCBD50101CB_var*
begin
//#UC START# *479731C50290_4DCBD50101CB_impl*
 FreeAndNil(f_Word);
 inherited;
//#UC END# *479731C50290_4DCBD50101CB_impl*
end;//TkwCompiledWordWorker.Cleanup

{$IfEnd} //not NoScripts

end.