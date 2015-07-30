unit tfwVarWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwVarWorker.pas"
// Начат: 12.05.2011 16:23
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwVarWorker
//
// Поддержка слов для работы с переменными.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwBeginLikeWord,
  kwCompiledVarWorker,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwVarWorker = {abstract} class(TtfwBeginLikeWord)
  {* Поддержка слов для работы с переменными. }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   procedure DoCompiledWord(aWord: TtfwWord;
     const aContext: TtfwContext); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 protected
 // protected methods
   function CompiledVarWorkerClass: RkwCompiledVarWorker; virtual;
 end;//TtfwVarWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwVarWorkerCompiledCode
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwVarWorker

function TtfwVarWorker.CompiledVarWorkerClass: RkwCompiledVarWorker;
//#UC START# *4DCC193801F1_4DCBD36B01C4_var*
//#UC END# *4DCC193801F1_4DCBD36B01C4_var*
begin
//#UC START# *4DCC193801F1_4DCBD36B01C4_impl*
 Result := TkwCompiledVarWorker;
//#UC END# *4DCC193801F1_4DCBD36B01C4_impl*
end;//TtfwVarWorker.CompiledVarWorkerClass

function TtfwVarWorker.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DCBD36B01C4_var*
//#UC END# *4DB6C99F026E_4DCBD36B01C4_var*
begin
//#UC START# *4DB6C99F026E_4DCBD36B01C4_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4DCBD36B01C4_impl*
end;//TtfwVarWorker.EndBracket

function TtfwVarWorker.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4DCBD36B01C4_var*
//#UC END# *4DB9B446039A_4DCBD36B01C4_var*
begin
//#UC START# *4DB9B446039A_4DCBD36B01C4_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4DCBD36B01C4_impl*
end;//TtfwVarWorker.AfterWordMaxCount

procedure TtfwVarWorker.DoCompiledWord(aWord: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4DB9BBD6024F_4DCBD36B01C4_var*
var
 l_VarWorker : TkwCompiledVarWorker;
//#UC END# *4DB9BBD6024F_4DCBD36B01C4_var*
begin
//#UC START# *4DB9BBD6024F_4DCBD36B01C4_impl*
 CompilerAssert(aWord.CodeCount = 1, 'Слово принимает только один параметр справа', aContext);
 l_VarWorker := CompiledVarWorkerClass.Create((aWord As TkwCompiledWordPrim).GetCode(aContext)[0], Self);
 try
  if (l_VarWorker.Key = nil) then
   l_VarWorker.Key := Self.Key;
   // - чтобы легче было опознавать слова по их Runner'ам
  inherited DoCompiledWord(l_VarWorker, aContext);
 finally
  FreeAndNil(l_VarWorker);
 end;//try..finally
//#UC END# *4DB9BBD6024F_4DCBD36B01C4_impl*
end;//TtfwVarWorker.DoCompiledWord

function TtfwVarWorker.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DCBD36B01C4_var*
//#UC END# *4DBAEE0D028D_4DCBD36B01C4_var*
begin
//#UC START# *4DBAEE0D028D_4DCBD36B01C4_impl*
 //Result := CompiledVarWorkerClass;
 Result := TkwVarWorkerCompiledCode;
 //Result := inherited CompiledWordClass(aCtx);
//#UC END# *4DBAEE0D028D_4DCBD36B01C4_impl*
end;//TtfwVarWorker.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwVarWorker
 TtfwVarWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.