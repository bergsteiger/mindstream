{$IfNDef kwIncludedPrim_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwIncludedPrim.imp.pas"
// Начат: 15.07.2011 21:34
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<Impurity::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::kwIncludedPrim
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define kwIncludedPrim_imp}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwCompilingWord.imp.pas}
 _kwIncludedPrim_ = {mixin} class(_tfwCompilingWord_)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   procedure AfterCompile(const aPrevContext: TtfwContext;
     var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   function AcceptsEOF: Boolean; override;
   class function ReallyNeedRegister: Boolean; override;
 protected
 // protected methods
   procedure DoFiler(aFiler: TtfwStreamFactory;
     const aCtx: TtfwContext);
   procedure FillContext(const anOldContext: TtfwContext;
     var theNewContext: TtfwContext); virtual;
 end;//_kwIncludedPrim_
{$IfEnd} //not NoScripts

{$Else kwIncludedPrim_imp}

{$IfNDef kwIncludedPrim_imp_impl}
{$Define kwIncludedPrim_imp_impl}

{$If not defined(NoScripts)}


{$Include ..\ScriptEngine\tfwCompilingWord.imp.pas}

// start class _kwIncludedPrim_

procedure _kwIncludedPrim_.DoFiler(aFiler: TtfwStreamFactory;
  const aCtx: TtfwContext);
//#UC START# *4E207ACF02D5_4E207A0002B2_var*
var
 l_P : ItfwParser;
 l_Ctx : TtfwContext;
//#UC END# *4E207ACF02D5_4E207A0002B2_var*
begin
//#UC START# *4E207ACF02D5_4E207A0002B2_impl*
 l_Ctx := aCtx;
 l_Ctx.rTypeInfo := TtfwTypeInfo_E;
 l_Ctx.rScriptFileName := aFiler.FileName;
 try
  l_P := TtfwParser.Make(aFiler);
  try
(*    l_P.CheckStringBracket := aCtx.rParser.CheckStringBracket;
    l_P.SkipSoftEnter := aCtx.rParser.SkipSoftEnter;
    l_P.SkipHardEnter := aCtx.rParser.SkipHardEnter;
    l_P.AddDigits2WordChars := aCtx.rParser.AddDigits2WordChars;
    l_P.WordChars := aCtx.rParser.WordChars;
    //l_P.KeyWords := aCtx.rParser.KeyWords;*)
    l_P.KeyWords := aCtx.rEngine.As_ItfwKeywordFinder; {!!! - чтобы слова искались в ScriptEngine}
    try
     l_Ctx.rCompiler := nil; {!!! - чтобы слова попадали в ScriptEngine}
     l_Ctx.rParser := l_P;
     FillContext(aCtx, l_Ctx);
     inherited DoDoIt(l_Ctx);
    finally
     l_P.KeyWords := nil;
    end;//try..finally
  finally
   l_P := nil;
  end;//try..finally
 finally
  Finalize(l_Ctx);
 end;//try..finally
//#UC END# *4E207ACF02D5_4E207A0002B2_impl*
end;//_kwIncludedPrim_.DoFiler

procedure _kwIncludedPrim_.FillContext(const anOldContext: TtfwContext;
  var theNewContext: TtfwContext);
//#UC START# *4F3AA59B025A_4E207A0002B2_var*
//#UC END# *4F3AA59B025A_4E207A0002B2_var*
begin
//#UC START# *4F3AA59B025A_4E207A0002B2_impl*
 // - ничего не делаем
//#UC END# *4F3AA59B025A_4E207A0002B2_impl*
end;//_kwIncludedPrim_.FillContext

function _kwIncludedPrim_.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4E207A0002B2_var*
//#UC END# *4DB6C99F026E_4E207A0002B2_var*
begin
//#UC START# *4DB6C99F026E_4E207A0002B2_impl*
 Result := DisabledEndBracket(aContext, aSilent);
//#UC END# *4DB6C99F026E_4E207A0002B2_impl*
end;//_kwIncludedPrim_.EndBracket

procedure _kwIncludedPrim_.AfterCompile(const aPrevContext: TtfwContext;
  var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4E207A0002B2_var*
//#UC END# *4DB6CE2302C9_4E207A0002B2_var*
begin
//#UC START# *4DB6CE2302C9_4E207A0002B2_impl*
 CompilerAssert(not aCompiled.HasCode, 'Слово не может иметь собственный код', aPrevContext);
 CompilerAssert(not aCompiled.HasLocalDictionary, 'Слово не может иметь локальный словарь', aPrevContext);
 inherited;
//#UC END# *4DB6CE2302C9_4E207A0002B2_impl*
end;//_kwIncludedPrim_.AfterCompile

function _kwIncludedPrim_.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4E207A0002B2_var*
//#UC END# *4DBAEE0D028D_4E207A0002B2_var*
begin
//#UC START# *4DBAEE0D028D_4E207A0002B2_impl*
 Result := TkwCompiledIncluded;
//#UC END# *4DBAEE0D028D_4E207A0002B2_impl*
end;//_kwIncludedPrim_.CompiledWordClass

function _kwIncludedPrim_.AcceptsEOF: Boolean;
//#UC START# *4DC2DEE70178_4E207A0002B2_var*
//#UC END# *4DC2DEE70178_4E207A0002B2_var*
begin
//#UC START# *4DC2DEE70178_4E207A0002B2_impl*
 Result := true;
//#UC END# *4DC2DEE70178_4E207A0002B2_impl*
end;//_kwIncludedPrim_.AcceptsEOF

class function _kwIncludedPrim_.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4E207A0002B2_var*
//#UC END# *4DC2E05B03DD_4E207A0002B2_var*
begin
//#UC START# *4DC2E05B03DD_4E207A0002B2_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4E207A0002B2_impl*
end;//_kwIncludedPrim_.ReallyNeedRegister

{$IfEnd} //not NoScripts

{$Else  kwIncludedPrim_imp_impl}
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\tfwCompilingWord.imp.pas}
{$IfEnd} //not NoScripts

{$EndIf kwIncludedPrim_imp_impl}
{$EndIf kwIncludedPrim_imp}
