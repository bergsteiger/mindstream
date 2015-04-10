unit kwPopFinderSetToCtx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopFinderSetToCtx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Finder_SetToCtx
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
 TkwPopFinderSetToCtx = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopFinderSetToCtx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwParserInterfaces,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopFinderSetToCtx;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwPopFinderSetToCtx

procedure TkwPopFinderSetToCtx.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD6A50382_var*
var
 l_F : ItfwKeywordFinder;
//#UC END# *4DAEEDE10285_4F4FD6A50382_var*
begin
//#UC START# *4DAEEDE10285_4F4FD6A50382_impl*
 if aCtx.rEngine.IsTopIntf then
  PtfwContext(@aCtx)^.rParser.KeyWords := aCtx.rEngine.PopIntf As ItfwKeywordFinder
 else
 if aCtx.rEngine.IsTopObj then
 begin
  if Supports(aCtx.rEngine.PopObj, ItfwKeywordFinder, l_F) then
   PtfwContext(@aCtx)^.rParser.KeyWords := l_F
  else
   CompilerAssert(false, 'В стеке не лежит ItfwKeywordFinder', aCtx);
 end//aCtx.rEngine.IsTopObj
 else
  CompilerAssert(false, 'В стеке не лежит ItfwKeywordFinder', aCtx);
//#UC END# *4DAEEDE10285_4F4FD6A50382_impl*
end;//TkwPopFinderSetToCtx.DoDoIt

class function TkwPopFinderSetToCtx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Finder:SetToCtx';
end;//TkwPopFinderSetToCtx.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.