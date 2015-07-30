unit kwCheckVar;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCheckVar.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::MembersWorking::MembersWorkingPack::CheckVar
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCheckVarPrim,
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  l3ParserInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCheckVar = {final scriptword} class(TkwCheckVarPrim)
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   procedure UnknownWord(var aContext: TtfwContext); override;
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
   procedure DoKeyword(var aContext: TtfwContext;
     aWord: TtfwWord;
     const aFinder: Il3KeywordFinder;
     const aPrevContext: TtfwContext); override;
 end;//TkwCheckVar
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledCheckVar
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCheckVar

class function TkwCheckVar.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '->';
end;//TkwCheckVar.GetWordNameForRegister

procedure TkwCheckVar.UnknownWord(var aContext: TtfwContext);
//#UC START# *4DB6F2760023_4F3F9B9A0382_var*
//#UC END# *4DB6F2760023_4F3F9B9A0382_var*
begin
//#UC START# *4DB6F2760023_4F3F9B9A0382_impl*
 DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString);
//#UC END# *4DB6F2760023_4F3F9B9A0382_impl*
end;//TkwCheckVar.UnknownWord

function TkwCheckVar.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F3F9B9A0382_var*
//#UC END# *4DCBD67C0362_4F3F9B9A0382_var*
begin
//#UC START# *4DCBD67C0362_4F3F9B9A0382_impl*
 Result := TkwCompiledCheckVar;
//#UC END# *4DCBD67C0362_4F3F9B9A0382_impl*
end;//TkwCheckVar.CompiledWorkerClass

procedure TkwCheckVar.DoKeyword(var aContext: TtfwContext;
  aWord: TtfwWord;
  const aFinder: Il3KeywordFinder;
  const aPrevContext: TtfwContext);
//#UC START# *53E21481021D_4F3F9B9A0382_var*
//#UC END# *53E21481021D_4F3F9B9A0382_var*
begin
//#UC START# *53E21481021D_4F3F9B9A0382_impl*
 DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString);
//#UC END# *53E21481021D_4F3F9B9A0382_impl*
end;//TkwCheckVar.DoKeyword

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация CheckVar
 TkwCheckVar.RegisterInEngine;
{$IfEnd} //not NoScripts

end.