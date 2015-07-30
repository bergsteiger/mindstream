unit kwAtomicIF;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwAtomicIF.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwAtomicIF
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
 TkwAtomicIF = class(TtfwWordWorker)
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; override;
 end;//TkwAtomicIF
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledIF
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwAtomicIF

function TkwAtomicIF.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F2176FF03D3_var*
//#UC END# *4DCBD67C0362_4F2176FF03D3_var*
begin
//#UC START# *4DCBD67C0362_4F2176FF03D3_impl*
 RunnerError('Не должны сюда попадать', aCtx);
 Result := nil;
 //Result := TkwCompiledAtomicIF;
//#UC END# *4DCBD67C0362_4F2176FF03D3_impl*
end;//TkwAtomicIF.CompiledWorkerClass

class function TkwAtomicIF.GetWordNameForRegister: AnsiString;
//#UC START# *4DB0614603C8_4F2176FF03D3_var*
//#UC END# *4DB0614603C8_4F2176FF03D3_var*
begin
//#UC START# *4DB0614603C8_4F2176FF03D3_impl*
 Result := '?';
//#UC END# *4DB0614603C8_4F2176FF03D3_impl*
end;//TkwAtomicIF.GetWordNameForRegister

function TkwAtomicIF.MakeCompiledWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_4F2176FF03D3_var*
//#UC END# *5284D8180211_4F2176FF03D3_var*
begin
//#UC START# *5284D8180211_4F2176FF03D3_impl*
 CompilerAssert((aCompiled.CodeCount = 1),
                'Допустим только один параметр после слова',
                aContext);
 Result := TkwCompiledIF.Create(aCompiled.GetCode(aContext)[0], nil);
//#UC END# *5284D8180211_4F2176FF03D3_impl*
end;//TkwAtomicIF.MakeCompiledWordWorker

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwAtomicIF
 TkwAtomicIF.RegisterInEngine;
{$IfEnd} //not NoScripts

end.