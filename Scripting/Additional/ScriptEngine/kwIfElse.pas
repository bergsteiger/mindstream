unit kwIfElse;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIfElse.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CodeBranchingWords::if_else
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
  tfwScriptingInterfaces,
  kwCompiledWordWorker,
  kwCompiledWordPrim,
  l3Interfaces,
  l3ParserInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
 TkwIfElse = {final} class(_tfwWordWorker_)
 protected
 // realized methods
   function CompiledWorkerClass: RkwCompiledWordWorker; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwIfElse
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledIfElse,
  kwTemporaryCompiledCode,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  SysUtils,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwIfElse;

{$Include ..\ScriptEngine\tfwWordWorker.imp.pas}

// start class TkwIfElse

function TkwIfElse.CompiledWorkerClass: RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_5284E9670258_var*
//#UC END# *4DCBD67C0362_5284E9670258_var*
begin
//#UC START# *4DCBD67C0362_5284E9670258_impl*
 Assert(false, 'Не должны сюда попадать');
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
 {$Include ..\ScriptEngine\tfwWordWorker.imp.pas}
{$IfEnd} //not NoScripts

end.