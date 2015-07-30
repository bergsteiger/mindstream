unit kwIfElse;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIfElse.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::CodeBranchingWords::if_else
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwWordWorker,
  tfwScriptingInterfaces,
  kwCompiledWordPrim,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwIfElse = {final scriptword} class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; override;
 end;//TkwIfElse
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledIfElse,
  kwTemporaryCompiledCode
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwIfElse

function TkwIfElse.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_5284E9670258_var*
//#UC END# *4DCBD67C0362_5284E9670258_var*
begin
//#UC START# *4DCBD67C0362_5284E9670258_impl*
 RunnerError('Не должны сюда попадать', aCtx);
 Result := nil;
//#UC END# *4DCBD67C0362_5284E9670258_impl*
end;//TkwIfElse.CompiledWorkerClass

class function TkwIfElse.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'if';
end;//TkwIfElse.GetWordNameForRegister

function TkwIfElse.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_5284E9670258_var*
//#UC END# *4DB9B446039A_5284E9670258_var*
begin
//#UC START# *4DB9B446039A_5284E9670258_impl*
 Result := 2;
//#UC END# *4DB9B446039A_5284E9670258_impl*
end;//TkwIfElse.AfterWordMaxCount

function TkwIfElse.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_5284E9670258_var*
//#UC END# *4DBAEE0D028D_5284E9670258_var*
begin
//#UC START# *4DBAEE0D028D_5284E9670258_impl*
 Result := TkwTemporaryCompiledCode;
//#UC END# *4DBAEE0D028D_5284E9670258_impl*
end;//TkwIfElse.CompiledWordClass

function TkwIfElse.MakeCompiledWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_5284E9670258_var*
//#UC END# *5284D8180211_5284E9670258_var*
begin
//#UC START# *5284D8180211_5284E9670258_impl*
 CompilerAssert((aCompiled.CodeCount = 2),
                'Допустимо только два параметра после слова',
                aContext);
 Result := TkwCompiledIfElse.Create(aCompiled.GetCode(aContext)[0], aCompiled.GetCode(aContext)[1], nil);
//#UC END# *5284D8180211_5284E9670258_impl*
end;//TkwIfElse.MakeCompiledWordWorker

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация if_else
 TkwIfElse.RegisterInEngine;
{$IfEnd} //not NoScripts

end.