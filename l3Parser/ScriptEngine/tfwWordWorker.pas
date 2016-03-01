unit tfwWordWorker;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwWordWorker.pas"
// Начат: 12.05.2011 16:37
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwWordWorker
//
// Поддержка исполняемых скомпилированных слов.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwAnonimousWord,
  kwCompiledWordWorker,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwWordWorker = {abstract} class(TtfwAnonimousWord)
  {* Поддержка исполняемых скомпилированных слов. }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure AfterCompile(var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Integer; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 protected
 // protected methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; virtual; abstract;
   procedure FillCompiledWorker(aWorker: TtfwWord;
     const aContext: TtfwContext); virtual;
   procedure CompileWordWorker(const aContext: TtfwContext;
     aRightParams: TkwCompiledWordPrim);
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aRightParams: TkwCompiledWordPrim): TtfwWord; virtual;
 end;//TtfwWordWorker
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwTemporaryCompiledCode,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwWordWorker

procedure TtfwWordWorker.FillCompiledWorker(aWorker: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4F219FA10268_4DCBD489023A_var*
//#UC END# *4F219FA10268_4DCBD489023A_var*
begin
//#UC START# *4F219FA10268_4DCBD489023A_impl*
 // - ничего не делаем, это чтобы предок мог aWorker заполнить по своему усмотрению
//#UC END# *4F219FA10268_4DCBD489023A_impl*
end;//TtfwWordWorker.FillCompiledWorker

procedure TtfwWordWorker.CompileWordWorker(const aContext: TtfwContext;
  aRightParams: TkwCompiledWordPrim);
//#UC START# *4F41566A02E5_4DCBD489023A_var*
var
 l_CPW : TtfwWord{TkwCompiledWordWorker};
//#UC END# *4F41566A02E5_4DCBD489023A_var*
begin
//#UC START# *4F41566A02E5_4DCBD489023A_impl*
 l_CPW := MakeCompiledWordWorker(aContext, aRightParams);
 try
  //_Assert(l_CPW.Key = nil);
  if (l_CPW.Key = nil) then
   //l_CPW.Key := aContext.rKeyWordDefiningNow;
   l_CPW.Key := Self.Key;
   // - чтобы легче было опознавать слова по их Runner'ам
  FillCompiledWorker(l_CPW, aContext);
  DoCompiledWord(l_CPW, aContext);
 finally
  FreeAndNil(l_CPW);
 end;//try..finally
//#UC END# *4F41566A02E5_4DCBD489023A_impl*
end;//TtfwWordWorker.CompileWordWorker

function TtfwWordWorker.MakeCompiledWordWorker(const aContext: TtfwContext;
  aRightParams: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_4DCBD489023A_var*
//#UC END# *5284D8180211_4DCBD489023A_var*
begin
//#UC START# *5284D8180211_4DCBD489023A_impl*
 if (AfterWordMaxCount(aContext) = 1) then
 begin
  CompilerAssert((aRightParams.CodeCount = 1),
                 'Допустим только один параметр после слова, a их: ' + IntToStr(aRightParams.CodeCount),
                 aContext);
  Result := CompiledWorkerClass(aContext).Create(aRightParams.GetCode(aContext)[0], Self, aContext);
 end//AfterWordMaxCount = 1
 else
  Result := CompiledWorkerClass(aContext).Create(aRightParams, Self, aContext);
//#UC END# *5284D8180211_4DCBD489023A_impl*
end;//TtfwWordWorker.MakeCompiledWordWorker

function TtfwWordWorker.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DCBD489023A_var*
//#UC END# *4DB6C99F026E_4DCBD489023A_var*
begin
//#UC START# *4DB6C99F026E_4DCBD489023A_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4DCBD489023A_impl*
end;//TtfwWordWorker.EndBracket

procedure TtfwWordWorker.AfterCompile(var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DCBD489023A_var*
//#UC END# *4DB6CE2302C9_4DCBD489023A_var*
begin
//#UC START# *4DB6CE2302C9_4DCBD489023A_impl*
 CompileWordWorker(theNewContext.rPrev^, aCompiled);
 inherited;
//#UC END# *4DB6CE2302C9_4DCBD489023A_impl*
end;//TtfwWordWorker.AfterCompile

function TtfwWordWorker.AfterWordMaxCount(const aCtx: TtfwContext): Integer;
//#UC START# *4DB9B446039A_4DCBD489023A_var*
//#UC END# *4DB9B446039A_4DCBD489023A_var*
begin
//#UC START# *4DB9B446039A_4DCBD489023A_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4DCBD489023A_impl*
end;//TtfwWordWorker.AfterWordMaxCount

function TtfwWordWorker.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DCBD489023A_var*
//#UC END# *4DBAEE0D028D_4DCBD489023A_var*
begin
//#UC START# *4DBAEE0D028D_4DCBD489023A_impl*
 Result := TkwTemporaryCompiledCode;
//#UC END# *4DBAEE0D028D_4DCBD489023A_impl*
end;//TtfwWordWorker.CompiledWordClass

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwWordWorker
 TtfwWordWorker.RegisterClass;
{$IfEnd} //not NoScripts

end.