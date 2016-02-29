unit tfwInitCodeWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwInitCodeWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptingKeywordsCore::TtfwInitCodeWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwDictionaryExPrim,
  tfwWordRefList,
  l3Interfaces,
  l3Variant
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _tfwCodeCompiler_Parent_ = TtfwWord;
 {$Include ..\ScriptEngine\tfwCodeCompiler.imp.pas}
 TtfwInitCodeWord = class(_tfwCodeCompiler_)
 private
 // private fields
   f_Dictionary : TtfwDictionaryExPrim;
    {* Поле для свойства Dictionary}
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   function GetNewWordDefinitor: TtfwWord; override;
   function GetKeywordFinder(const aCtx: TtfwContext): TtfwWord; override;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord;
     aCheckCode: Boolean); override;
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; override;
   function GetKeywordByName(const aName: Il3CString): Tl3PrimString; override;
   function GetParentFinder: TtfwWord; override;
 public
 // overridden public methods
   function DoDefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aStereo: TtfwWord;
     aTypeInfo: TtfwWordInfo): TtfwWord; override;
     {* Определяет слову входной параметр }
 public
 // public methods
   constructor Create(aDictionary: TtfwDictionaryExPrim); reintroduce;
 public
 // public properties
   property Dictionary: TtfwDictionaryExPrim
     read f_Dictionary;
 end;//TtfwInitCodeWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwDictionaryEx,
  tfwAutoregisteredDiction,
  kwForwardDeclarationHolder,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwCodeCompiler.imp.pas}

// start class TtfwInitCodeWord

constructor TtfwInitCodeWord.Create(aDictionary: TtfwDictionaryExPrim);
//#UC START# *55A7DB260310_55A7DA0200C0_var*
//#UC END# *55A7DB260310_55A7DA0200C0_var*
begin
//#UC START# *55A7DB260310_55A7DA0200C0_impl*
 Assert(aDictionary <> nil);
 inherited Create;
 f_Dictionary := aDictionary;
//#UC END# *55A7DB260310_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.Create

procedure TtfwInitCodeWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55A7DA0200C0_var*
//#UC END# *4DAEEDE10285_55A7DA0200C0_var*
begin
//#UC START# *4DAEEDE10285_55A7DA0200C0_impl*
 RunCode(aCtx);
//#UC END# *4DAEEDE10285_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.DoDoIt

function TtfwInitCodeWord.DoDefineInParameter(const aCtx: TtfwContext;
  const aParamName: Il3CString;
  aStereo: TtfwWord;
  aTypeInfo: TtfwWordInfo): TtfwWord;
//#UC START# *4F4161BC0024_55A7DA0200C0_var*
//#UC END# *4F4161BC0024_55A7DA0200C0_var*
begin
//#UC START# *4F4161BC0024_55A7DA0200C0_impl*
 Result := nil;
 CompilerAssert(false, 'Слово не может определять параметры', aCtx);
//#UC END# *4F4161BC0024_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.DoDefineInParameter

function TtfwInitCodeWord.GetNewWordDefinitor: TtfwWord;
//#UC START# *52D56341033B_55A7DA0200C0_var*
//#UC END# *52D56341033B_55A7DA0200C0_var*
begin
//#UC START# *52D56341033B_55A7DA0200C0_impl*
 Result := Self;
 //Result := inherited GetNewWordDefinitor;
 //Assert(false, 'Должны ли попадать сюда?');
//#UC END# *52D56341033B_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.GetNewWordDefinitor

function TtfwInitCodeWord.GetKeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D5637A031E_55A7DA0200C0_var*
//#UC END# *52D5637A031E_55A7DA0200C0_var*
begin
//#UC START# *52D5637A031E_55A7DA0200C0_impl*
 if aCtx.rEngine.CascadeDict then
  Result := Self
 else
  Result := aCtx.rEngine.KeywordFinder(aCtx);
//#UC END# *52D5637A031E_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.GetKeywordFinder

procedure TtfwInitCodeWord.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord;
  aCheckCode: Boolean);
//#UC START# *52D56A980103_55A7DA0200C0_var*
//#UC END# *52D56A980103_55A7DA0200C0_var*
begin
//#UC START# *52D56A980103_55A7DA0200C0_impl*
 CompilerAssert(false, 'Слово не может определять параметры', aContext);
//#UC END# *52D56A980103_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.DoCompileInParameterPopCode

function TtfwInitCodeWord.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A7D34102A0_55A7DA0200C0_var*
//#UC END# *55A7D34102A0_55A7DA0200C0_var*
begin
//#UC START# *55A7D34102A0_55A7DA0200C0_impl*
 Result := f_Dictionary.CheckWord(aName);
//#UC END# *55A7D34102A0_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.DoCheckWord

function TtfwInitCodeWord.GetKeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *55ACE5210310_55A7DA0200C0_var*
//#UC END# *55ACE5210310_55A7DA0200C0_var*
begin
//#UC START# *55ACE5210310_55A7DA0200C0_impl*
 Result := f_Dictionary.DRByCName[aName];
//#UC END# *55ACE5210310_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.GetKeywordByName

function TtfwInitCodeWord.GetParentFinder: TtfwWord;
//#UC START# *55ACF0F5025D_55A7DA0200C0_var*
//#UC END# *55ACF0F5025D_55A7DA0200C0_var*
begin
//#UC START# *55ACF0F5025D_55A7DA0200C0_impl*
 Result := nil;
//#UC END# *55ACF0F5025D_55A7DA0200C0_impl*
end;//TtfwInitCodeWord.GetParentFinder

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwInitCodeWord
 TtfwInitCodeWord.RegisterClass;
{$IfEnd} //not NoScripts

end.