unit kwINHERITED;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwINHERITED.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::INHERITED
//
// Слово для вызова унаследованного метода
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
 TkwINHERITED = {final} class(_tfwAutoregisteringWord_)
  {* Слово для вызова унаследованного метода }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwINHERITED
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwINHERITED;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwINHERITED

procedure TkwINHERITED.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F420DAD0039_var*
//#UC END# *4DAEEDE10285_4F420DAD0039_var*
begin
//#UC START# *4DAEEDE10285_4F420DAD0039_impl*
 RunnerAssert(false, 'Слово INHERITED пока не реализовано', aCtx);
//#UC END# *4DAEEDE10285_4F420DAD0039_impl*
end;//TkwINHERITED.DoDoIt

class function TkwINHERITED.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'INHERITED';
end;//TkwINHERITED.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.