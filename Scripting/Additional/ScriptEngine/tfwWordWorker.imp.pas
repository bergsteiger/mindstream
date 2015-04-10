{$IfNDef tfwWordWorker_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwWordWorker.imp.pas"
// Начат: 12.05.2011 16:37
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwWordWorker
//
// Поддержка исполняемых скомпилированных слов.
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwWordWorker_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
 _tfwWordWorker_ = {abstract mixin} class(_tfwAnonimousWord_)
  {* Поддержка исполняемых скомпилированных слов. }
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Cardinal; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 protected
 // protected methods
   function CompiledWorkerClass: RkwCompiledWordWorker; virtual; abstract;
   procedure FillCompiledWorker(aWorker: TtfwWord;
     const aContext: TtfwContext); virtual;
   procedure CompileWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); virtual;
   function MakeCompiledWordWorker(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim): TtfwWord; virtual;
 end;//_tfwWordWorker_
{$IfEnd} //not NoScripts

{$Else tfwWordWorker_imp}

{$IfNDef tfwWordWorker_imp_impl}
{$Define tfwWordWorker_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}

// start class _tfwWordWorker_

procedure _tfwWordWorker_.FillCompiledWorker(aWorker: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4F219FA10268_4DCBD489023A_var*
//#UC END# *4F219FA10268_4DCBD489023A_var*
begin
//#UC START# *4F219FA10268_4DCBD489023A_impl*
 // - ничего не делаем, это чтобы предок мог aWorker заполнить по своему усмотрению
//#UC END# *4F219FA10268_4DCBD489023A_impl*
end;//_tfwWordWorker_.FillCompiledWorker

procedure _tfwWordWorker_.CompileWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4F41566A02E5_4DCBD489023A_var*
var
 l_CPW : TtfwWord{TkwCompiledWordWorker};
//#UC END# *4F41566A02E5_4DCBD489023A_var*
begin
//#UC START# *4F41566A02E5_4DCBD489023A_impl*
 l_CPW := MakeCompiledWordWorker(aContext, aCompiled);
 try
  //Assert(l_CPW.Key = nil);
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
end;//_tfwWordWorker_.CompileWordWorker

function _tfwWordWorker_.MakeCompiledWordWorker(const aContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim): TtfwWord;
//#UC START# *5284D8180211_4DCBD489023A_var*
//#UC END# *5284D8180211_4DCBD489023A_var*
begin
//#UC START# *5284D8180211_4DCBD489023A_impl*
 if (AfterWordMaxCount(aContext) = 1) then
 begin
  CompilerAssert((aCompiled.CodeCount = 1),
                 'Допустим только один параметр после слова',
                 aContext);
  Result := CompiledWorkerClass.Create(aCompiled.GetCode(aContext)[0]);
 end//AfterWordMaxCount = 1
 else
  Result := CompiledWorkerClass.Create(aCompiled);
//#UC END# *5284D8180211_4DCBD489023A_impl*
end;//_tfwWordWorker_.MakeCompiledWordWorker

function _tfwWordWorker_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4DCBD489023A_var*
//#UC END# *4DB6C99F026E_4DCBD489023A_var*
begin
//#UC START# *4DB6C99F026E_4DCBD489023A_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4DCBD489023A_impl*
end;//_tfwWordWorker_.EndBracket

procedure _tfwWordWorker_.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DCBD489023A_var*
//#UC END# *4DB6CE2302C9_4DCBD489023A_var*
begin
//#UC START# *4DB6CE2302C9_4DCBD489023A_impl*
 CompileWordWorker(aPrevContext, aCompiled);
 inherited;
//#UC END# *4DB6CE2302C9_4DCBD489023A_impl*
end;//_tfwWordWorker_.AfterCompile

function _tfwWordWorker_.AfterWordMaxCount(const aCtx: TtfwContext): Cardinal;
//#UC START# *4DB9B446039A_4DCBD489023A_var*
//#UC END# *4DB9B446039A_4DCBD489023A_var*
begin
//#UC START# *4DB9B446039A_4DCBD489023A_impl*
 Result := 1;
//#UC END# *4DB9B446039A_4DCBD489023A_impl*
end;//_tfwWordWorker_.AfterWordMaxCount

function _tfwWordWorker_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4DCBD489023A_var*
//#UC END# *4DBAEE0D028D_4DCBD489023A_var*
begin
//#UC START# *4DBAEE0D028D_4DCBD489023A_impl*
 Result := TkwTemporaryCompiledCode;
//#UC END# *4DBAEE0D028D_4DCBD489023A_impl*
end;//_tfwWordWorker_.CompiledWordClass

{$IfEnd} //not NoScripts

{$Else  tfwWordWorker_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwWordWorker_imp_impl}
{$EndIf tfwWordWorker_imp}
