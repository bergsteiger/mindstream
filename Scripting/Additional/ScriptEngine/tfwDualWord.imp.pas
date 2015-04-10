{$IfNDef tfwDualWord_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/tfwDualWord.imp.pas"
// Начат: 29.04.2011 17:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::tfwDualWord
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define tfwDualWord_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
 _tfwDualWord_ = {abstract mixin} class(_tfwAnonimousWord_)
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
 public
 // overridden public methods
   function AcceptMedianBracket(aBracket: TtfwWord;
     var aCtx: TtfwContext): Boolean; override;
 protected
 // protected methods
   function MedianBracket: RtfwWord; virtual; abstract;
   function MakeDualCompiled(const aContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim;
     aCompiled2: TkwCompiledWordPrim): TkwDualCompiledWordContainer; virtual; abstract;
   function MedianBracket2: RtfwWord; virtual; abstract;
 end;//_tfwDualWord_
{$IfEnd} //not NoScripts

{$Else tfwDualWord_imp}

{$IfNDef tfwDualWord_imp_impl}
{$Define tfwDualWord_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}

// start class _tfwDualWord_

procedure _tfwDualWord_.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4DBAC32F02B5_var*
var
 l_CI : TkwDualCompiledWordContainer;
//#UC END# *4DB6CE2302C9_4DBAC32F02B5_var*
begin
//#UC START# *4DB6CE2302C9_4DBAC32F02B5_impl*
 if (theNewContext.rFirstHalfOfDualWord = nil) then
  l_CI := MakeDualCompiled(aPrevContext, aCompiled, nil)
 else
  l_CI := MakeDualCompiled(aPrevContext, theNewContext.rFirstHalfOfDualWord As TkwCompiledWordPrim, aCompiled);
 try
  DoCompiledWord(l_CI, aPrevContext);
 finally
  FreeAndNil(l_CI);
 end;//try..finally
 FreeAndNil(theNewContext.rFirstHalfOfDualWord);
 inherited;
//#UC END# *4DB6CE2302C9_4DBAC32F02B5_impl*
end;//_tfwDualWord_.AfterCompile

function _tfwDualWord_.AcceptMedianBracket(aBracket: TtfwWord;
  var aCtx: TtfwContext): Boolean;
//#UC START# *52D7DC84019E_4DBAC32F02B5_var*
//#UC END# *52D7DC84019E_4DBAC32F02B5_var*
begin
//#UC START# *52D7DC84019E_4DBAC32F02B5_impl*
 CompilerAssert(aCtx.rFirstHalfOfDualWord = nil, 'Неожиданные данные при проверке середины структуры', aCtx);
 if (aBracket.ClassType = MedianBracket)
    OR (aBracket.ClassType = MedianBracket2) then
 begin
  Result := true;
  aCtx.rWordCompilingNow.SetRefTo(aCtx.rFirstHalfOfDualWord);
  FreeAndNil(aCtx.rWordCompilingNow);
  aCtx.rWordCompilingNow := CompiledWordClass(aCtx).Create(Self, aCtx.rPrevFinder, TtfwTypeInfo_E, aCtx, aBracket.Key);
  //aCtx.rWordCompilingNow.Key := aBracket.Key;
  // - чтобы под отладчиком можно было смотреть
  aCtx.rCompiler := aCtx.rWordCompilingNow.GetCompiler(aCtx) {As ItfwCompiler};
  aCtx.rParser.KeyWords := aCtx.rCompiler.KeywordFinder{theCompiled};
 end//aBracket.ClassType = MedianBracket..
 else
  Result := false;
//#UC END# *52D7DC84019E_4DBAC32F02B5_impl*
end;//_tfwDualWord_.AcceptMedianBracket

{$IfEnd} //not NoScripts

{$Else  tfwDualWord_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwAnonimousWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf tfwDualWord_imp_impl}
{$EndIf tfwDualWord_imp}
