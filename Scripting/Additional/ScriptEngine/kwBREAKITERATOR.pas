unit kwBREAKITERATOR;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwBREAKITERATOR.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeFlowWords::BREAK_ITERATOR
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
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwBREAKITERATOR = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwBREAKITERATOR
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwBREAKITERATOR;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwBREAKITERATOR

procedure TkwBREAKITERATOR.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F62FA80018B_var*
//#UC END# *4DAEEDE10285_4F62FA80018B_var*
begin
//#UC START# *4DAEEDE10285_4F62FA80018B_impl*
 raise EtfwBreakIterator.Create('Выход из итератора'); 
//#UC END# *4DAEEDE10285_4F62FA80018B_impl*
end;//TkwBREAKITERATOR.DoDoIt

class function TkwBREAKITERATOR.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'BREAK-ITERATOR';
end;//TkwBREAKITERATOR.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.