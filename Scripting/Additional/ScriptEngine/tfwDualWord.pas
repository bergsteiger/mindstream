unit tfwDualWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "tfwDualWord.pas"
// Начат: 29.04.2011 17:55
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TtfwDualWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwAnonimousWord,
  kwDualCompiledWordContainer,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwDualWord = {abstract} class(TtfwAnonimousWord)
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
 end;//TtfwDualWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwDualWord

procedure TtfwDualWord.AfterCompile(const aPrevContext: TtfwContext;
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
end;//TtfwDualWord.AfterCompile

function TtfwDualWord.AcceptMedianBracket(aBracket: TtfwWord;
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
end;//TtfwDualWord.AcceptMedianBracket

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwDualWord
 TtfwDualWord.RegisterClass;
{$IfEnd} //not NoScripts

end.