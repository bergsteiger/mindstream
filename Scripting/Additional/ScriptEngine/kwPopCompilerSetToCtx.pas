unit kwPopCompilerSetToCtx;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopCompilerSetToCtx.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::Compilation::pop_Compiler_SetToCtx
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
 TkwPopCompilerSetToCtx = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopCompilerSetToCtx
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopCompilerSetToCtx;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

// start class TkwPopCompilerSetToCtx

procedure TkwPopCompilerSetToCtx.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F4FD67200B9_var*
//#UC END# *4DAEEDE10285_4F4FD67200B9_var*
begin
//#UC START# *4DAEEDE10285_4F4FD67200B9_impl*
 if aCtx.rEngine.IsTopIntf then
  PtfwContext(@aCtx)^.rCompiler := aCtx.rEngine.PopIntf As ItfwCompiler
 else
 if aCtx.rEngine.IsTopObj then
 begin
  if not Supports(aCtx.rEngine.PopObj, ItfwCompiler, PtfwContext(@aCtx)^.rCompiler) then
   CompilerAssert(false, 'В стеке не лежит ItfwCompiler', aCtx);
 end//aCtx.rEngine.IsTopObj
 else
  CompilerAssert(false, 'В стеке не лежит ItfwCompiler', aCtx);
//#UC END# *4DAEEDE10285_4F4FD67200B9_impl*
end;//TkwPopCompilerSetToCtx.DoDoIt

class function TkwPopCompilerSetToCtx.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:Compiler:SetToCtx';
end;//TkwPopCompilerSetToCtx.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.