unit kwIncludesInChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwIncludesInChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::IncludesAndUsesPack::IncludesInChildren
//
// Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - в коробку детей (%C) - откуда
// слово было вызвано
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwCompilingWord,
  kwIncluded,
  kwCompiledWordPrim,
  l3Interfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwUsesLike.imp.pas}
 TkwIncludesInChildren = {final scriptword} class(_kwUsesLike_)
  {* Как USES, но позволяет включать слова во ВНУТРЕННИЙ словарь - в коробку детей (%C) - откуда слово было вызвано }
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function MakeIncluded(const aFileName: AnsiString;
     const aContext: TtfwContext): TkwIncluded; override;
 end;//TkwIncludesInChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwInnerIncludedInChildren,
  kwCompiledProcedure,
  kwCompiledWord,
  kwStandardProcedureCloseBracket,
  l3String,
  SysUtils,
  l3Types
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwUsesLike.imp.pas}

// start class TkwIncludesInChildren

class function TkwIncludesInChildren.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '%INCLUDES';
end;//TkwIncludesInChildren.GetWordNameForRegister

function TkwIncludesInChildren.MakeIncluded(const aFileName: AnsiString;
  const aContext: TtfwContext): TkwIncluded;
//#UC START# *4F47673F03B0_4F476A0301B8_var*
var
 l_C  : ItfwCompiler;
 l_W  : TkwCompiledWord;
 l_KW : TtfwKeyWord;
 l_WC : TkwCompiledWord;
 l_ProducerKW : TtfwKeyWord;
//#UC END# *4F47673F03B0_4F476A0301B8_var*
begin
//#UC START# *4F47673F03B0_4F476A0301B8_impl*
 l_C := aContext.rCompiler;
 l_C := aContext.rCompiler.KeywordFinder.ParentFinder As ItfwCompiler;
 l_W := l_C.GetWordCompilingNow As TkwCompiledWord;
 l_KW := ItfwNewWordDefinitor(l_W).CheckWord(TtfwCStringFactory.C('%C'));
 if (l_KW.Word = nil) then
 begin
  l_ProducerKW := ItfwCompiler(l_W).KeywordFinder.KeywordByName[TtfwCStringFactory.C('%CHILDREN')] As TtfwKeyWord;
  //l_ProducerKW := aContext.rEngine.As_ItfwKeywordFinder.KeywordByName['%CHILDREN'] As TtfwKeyWord;
  CompilerAssert(l_ProducerKW <> nil, 'Слово %CHILDREN не найдено', aContext);
  CompilerAssert(l_ProducerKW.Word <> nil, 'Слово %CHILDREN не найдено', aContext);
  l_WC := RkwCompiledWordPrim(l_ProducerKW.Word.
                          CompiledWordClassPrim(aContext)).Create(l_ProducerKW.Word,
                                                        // - чтобы обеспечить слову нужный "стереотип"
                                                        //   хак конечно, надо как-то константу хотя бы завести,
                                                        l_W{PrevFinder},
                                                        TtfwTypeInfo_C([tfw_wmCanBeMerged]),
                                                        aContext,
                                                        l_KW) As TkwCompiledWord;
  try
   l_KW.Word := l_WC;
  finally
   FreeAndNil(l_WC);
  end;//try..finally
  l_WC := l_KW.Word As TkwCompiledWord;
 end//l_KW.Word = nil
 else
  l_WC := l_KW.Word As TkwCompiledWord;
 Result := TkwInnerIncludedInChildren.Create(aFileName, l_WC); 
//#UC END# *4F47673F03B0_4F476A0301B8_impl*
end;//TkwIncludesInChildren.MakeIncluded

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация IncludesInChildren
 TkwIncludesInChildren.RegisterInEngine;
{$IfEnd} //not NoScripts

end.