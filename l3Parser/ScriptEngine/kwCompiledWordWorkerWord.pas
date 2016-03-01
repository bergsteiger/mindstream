unit kwCompiledWordWorkerWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledWordWorkerWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledWordWorkerWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordWorker,
  kwCompiledWordWorkerWordRunner,
  kwTemporaryCompiledCode,
  tfwScriptingTypes,
  kwCompiledWordPrim,
  tfwDictionaryPrim,
  kwCompiledWordWorker
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordWorkerWord = class of TkwCompiledWordWorkerWord;

 TkwImmediateTemporaryCompiledCode = class(TkwTemporaryCompiledCode)
 public
 // overridden public methods
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
    const aCtx: TtfwContext); override;
 end;//TkwImmediateTemporaryCompiledCode

 TkwCompiledWordWorkerWord = class(TtfwWordWorker)
 private
 // private fields
   f_Compiled : TtfwWord;
    {* Поле для свойства Compiled}
 protected
 // realized methods
   function CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker; override;
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
   procedure pm_SetWordProducer(aValue: TtfwWord); override;
   function pm_GetInnerDictionary: TtfwDictionaryPrim; override;
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
   function pm_GetParentWord: TtfwWord; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
   procedure UnknownWord(var aContext: TtfwContext;
     aWordNumber: Integer); override;
   function AfterWordMaxCount(const aCtx: TtfwContext): Integer; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   class function ReallyNeedRegister: Boolean; override;
   procedure FillCompiledWorker(aWorker: TtfwWord;
     const aContext: TtfwContext); override;
   function SuppressNextImmediate(const aContext: TtfwContext;
     aWordNumber: Integer): TtfwSuppressNextImmediate; override;
   procedure DoKeyword(var aContext: TtfwContext;
     aWord: TtfwWord;
     aFinder: TtfwWord;
     aWordNumber: Integer); override;
 public
 // overridden public methods
   function IsAnonimous(const aCtx: TtfwContext): Boolean; override;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   function RunnerClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWordRunner;
   function TreatUnknownAsStringInParam(const aContext: TtfwContext;
     aParamNumber: Integer): Boolean;
   function ParamHasModifer(const aContext: TtfwContext;
     aParamNumber: Integer;
     aModifier: TtfwWordModifier): Boolean; overload; 
   function ParamHasModifer(const aContext: TtfwContext;
     aParamNumber: Integer;
     aModifier: TtfwLinkType): Boolean; overload; 
 public
 // public methods
   constructor Create(aCompiled: TtfwWord); reintroduce;
 public
 // public properties
   property Compiled: TtfwWord
     read f_Compiled;
 end;//TkwCompiledWordWorkerWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwWordRefList,
  kwCompiledWordWorkerWordPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWordWorkerWord

constructor TkwCompiledWordWorkerWord.Create(aCompiled: TtfwWord);
//#UC START# *4F219F0F0176_4F21976E01C2_var*
//#UC END# *4F219F0F0176_4F21976E01C2_var*
begin
//#UC START# *4F219F0F0176_4F21976E01C2_impl*
 inherited Create;
 aCompiled.SetRefTo(f_Compiled);
//#UC END# *4F219F0F0176_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.Create

function TkwCompiledWordWorkerWord.RunnerClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWordRunner;
//#UC START# *4F3FAC0C0170_4F21976E01C2_var*
//#UC END# *4F3FAC0C0170_4F21976E01C2_var*
begin
//#UC START# *4F3FAC0C0170_4F21976E01C2_impl*
 Result := TkwCompiledWordWorkerWordRunner;
//#UC END# *4F3FAC0C0170_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.RunnerClass

function TkwCompiledWordWorkerWord.TreatUnknownAsStringInParam(const aContext: TtfwContext;
  aParamNumber: Integer): Boolean;
//#UC START# *55893819034D_4F21976E01C2_var*
//#UC END# *55893819034D_4F21976E01C2_var*
begin
//#UC START# *55893819034D_4F21976E01C2_impl*
 Result := ParamHasModifer(aContext, aParamNumber, tfw_wmTreatUnknownAsString);
//#UC END# *55893819034D_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.TreatUnknownAsStringInParam

function TkwCompiledWordWorkerWord.ParamHasModifer(const aContext: TtfwContext;
  aParamNumber: Integer;
  aModifier: TtfwWordModifier): Boolean;
//#UC START# *5589721B0279_4F21976E01C2_var*
var
 l_P : TtfwWord;
//#UC END# *5589721B0279_4F21976E01C2_var*
begin
//#UC START# *5589721B0279_4F21976E01C2_impl*
 l_P := Compiled.GetRightParam(aContext, aParamNumber);
 if (l_P = nil) then
  Result := false
 else
  Result := l_P.ResultTypeInfo[aContext].Has(aModifier);
//#UC END# *5589721B0279_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.ParamHasModifer

function TkwCompiledWordWorkerWord.ParamHasModifer(const aContext: TtfwContext;
  aParamNumber: Integer;
  aModifier: TtfwLinkType): Boolean;
//#UC START# *55C23E4D0305_4F21976E01C2_var*
var
 l_P : TtfwWord;
//#UC END# *55C23E4D0305_4F21976E01C2_var*
begin
//#UC START# *55C23E4D0305_4F21976E01C2_impl*
 l_P := Compiled.GetRightParam(aContext, aParamNumber);
 if (l_P = nil) then
  Result := false
 else
  Result := l_P.ResultTypeInfo[aContext].Has(aModifier);
//#UC END# *55C23E4D0305_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.ParamHasModifer
// start class TkwImmediateTemporaryCompiledCode

procedure TkwImmediateTemporaryCompiledCode.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_557562DF00B8_var*
//#UC END# *52EA6A2C0111_557562DF00B8_var*
begin
//#UC START# *52EA6A2C0111_557562DF00B8_impl*
 // - ничего не делаем. СПЕЦИАЛЬНО
//#UC END# *52EA6A2C0111_557562DF00B8_impl*
end;//TkwImmediateTemporaryCompiledCode.SetResultTypeInfo

function TkwCompiledWordWorkerWord.CompiledWorkerClass(const aCtx: TtfwContext): RkwCompiledWordWorker;
//#UC START# *4DCBD67C0362_4F21976E01C2_var*
//#UC END# *4DCBD67C0362_4F21976E01C2_var*
begin
//#UC START# *4DCBD67C0362_4F21976E01C2_impl*
 Result := RunnerClass(aCtx);
//#UC END# *4DCBD67C0362_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.CompiledWorkerClass

procedure TkwCompiledWordWorkerWord.Cleanup;
//#UC START# *479731C50290_4F21976E01C2_var*
//#UC END# *479731C50290_4F21976E01C2_var*
begin
//#UC START# *479731C50290_4F21976E01C2_impl*
 FreeAndNil(f_Compiled);
 inherited;
//#UC END# *479731C50290_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.Cleanup

procedure TkwCompiledWordWorkerWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F21976E01C2_var*
//#UC END# *4DAEEDE10285_4F21976E01C2_var*
begin
//#UC START# *4DAEEDE10285_4F21976E01C2_impl*
 CompilerAssert(aCtx.rParser <> nil, 'Возможно компиляция запускается из уже откомпилированнного кода. Вызов операторов по ссылке пока не поддерживается', aCtx);
 // - возможно здесь можно сделать, чтобы параметры справа брались из скомпилированного кода
 (*
   Тогда можно будет делать:

   operator X
    ^ IN aRight
    aRight DO
   ; // X

   @SELF -> X 2 . 
 *)
 inherited;
//#UC END# *4DAEEDE10285_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.DoDoIt

procedure TkwCompiledWordWorkerWord.UnknownWord(var aContext: TtfwContext;
  aWordNumber: Integer);
//#UC START# *4DB6F2760023_4F21976E01C2_var*
//#UC END# *4DB6F2760023_4F21976E01C2_var*
begin
//#UC START# *4DB6F2760023_4F21976E01C2_impl*
 if TreatUnknownAsStringInParam(aContext, aWordNumber) then
  DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString)
 else
  inherited;
//#UC END# *4DB6F2760023_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.UnknownWord

function TkwCompiledWordWorkerWord.AfterWordMaxCount(const aCtx: TtfwContext): Integer;
//#UC START# *4DB9B446039A_4F21976E01C2_var*
//#UC END# *4DB9B446039A_4F21976E01C2_var*
begin
//#UC START# *4DB9B446039A_4F21976E01C2_impl*
 Result := Compiled.RightParamsCount(aCtx);
//#UC END# *4DB9B446039A_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.AfterWordMaxCount

function TkwCompiledWordWorkerWord.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F21976E01C2_var*
//#UC END# *4DBAEE0D028D_4F21976E01C2_var*
begin
//#UC START# *4DBAEE0D028D_4F21976E01C2_impl*
 if Self.ResultTypeInfo[aCtx].Has(tfw_wmImmediate) then
  Result := TkwImmediateTemporaryCompiledCode
 else
  Result := TkwTemporaryCompiledCode; 
//#UC END# *4DBAEE0D028D_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.CompiledWordClass

class function TkwCompiledWordWorkerWord.ReallyNeedRegister: Boolean;
//#UC START# *4DC2E05B03DD_4F21976E01C2_var*
//#UC END# *4DC2E05B03DD_4F21976E01C2_var*
begin
//#UC START# *4DC2E05B03DD_4F21976E01C2_impl*
 Result := false;
//#UC END# *4DC2E05B03DD_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.ReallyNeedRegister

procedure TkwCompiledWordWorkerWord.FillCompiledWorker(aWorker: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4F219FA10268_4F21976E01C2_var*
var
 l_LeftWordRefCount : Integer;
 l_CodeIndex : Integer;
 l_Code : TtfwWordRefList;
//#UC END# *4F219FA10268_4F21976E01C2_var*
begin
//#UC START# *4F219FA10268_4F21976E01C2_impl*
 Compiled.Key := Self.Key;
 (aWorker As TkwCompiledWordWorkerWordRunner).WordToRun := Compiled;
 
 l_LeftWordRefCount := Compiled.LeftWordRefParamsCount(aContext);
 if (l_LeftWordRefCount > 0) then
 begin
  l_CodeIndex := aContext.rWordCompilingNow.CodeCount;
  CompilerAssert(l_LeftWordRefCount <= l_CodeIndex, 'Нужно ' + IntToStr(l_LeftWordRefCount) + ' штук слов перед ' + Self.Key.AsString + ', а их там ' + IntToStr(l_CodeIndex), aContext);
  Dec(l_CodeIndex);
  
  CompilerAssert(aContext.rWordCompilingNow Is TkwCompiledWordPrim, 'Нужно компилируемое слово', aContext);
  l_Code := TkwCompiledWordPrim(aContext.rWordCompilingNow).GetCode(aContext);
  CompilerAssert(l_Code <> nil, 'Нужно слово перед ' + Self.Key.AsString, aContext);
  
  while (l_LeftWordRefCount > 0) do
  begin
   aWorker.AddLeftWordRefValue(aContext, l_Code.Items[l_CodeIndex]);
   l_Code.Delete(l_CodeIndex);
   Dec(l_LeftWordRefCount);
   Dec(l_CodeIndex);
  end;//l_LeftWordRefCount > 0)
 end;//l_LeftWordRefCount > 0
 inherited;
 if (aContext.rCompiler = nil) then
  (aWorker As TkwCompiledWordWorkerWordRunner).Caller := nil
 else
  (aWorker As TkwCompiledWordWorkerWordRunner).Caller := aContext.rCompiler.GetAsCaller(aContext);
                                                        // м.б. тут надо aContext.rWordDefiningNow
                                                        // см. TkwCompilingWordSelf.DoDoIt
                                                        // см. ещё Assert выше
//#UC END# *4F219FA10268_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.FillCompiledWorker

function TkwCompiledWordWorkerWord.IsAnonimous(const aCtx: TtfwContext): Boolean;
//#UC START# *4F3AB3600008_4F21976E01C2_var*
//#UC END# *4F3AB3600008_4F21976E01C2_var*
begin
//#UC START# *4F3AB3600008_4F21976E01C2_impl*
 Result := false;
//#UC END# *4F3AB3600008_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.IsAnonimous

function TkwCompiledWordWorkerWord.SuppressNextImmediate(const aContext: TtfwContext;
  aWordNumber: Integer): TtfwSuppressNextImmediate;
//#UC START# *4F3AB3B101FC_4F21976E01C2_var*
//#UC END# *4F3AB3B101FC_4F21976E01C2_var*
begin
//#UC START# *4F3AB3B101FC_4F21976E01C2_impl*
 if ParamHasModifer(aContext, aWordNumber, tfw_ltLink) then
 // - если у параметра указан модификатор LINK, то мы игнорируем ВСЕ непосредственные слова
 //   Например для WordAlias.
  Result := tfw_sniForce
 else
 if ParamHasModifer(aContext, aWordNumber, tfw_ltReference) then
 // - если у параметра указан модификатор REFERENCE, то мы игнорируем ВСЕ непосредственные слова
 //   Например для [EXPORT].
  Result := tfw_sniYes
 else
 if TreatUnknownAsStringInParam(aContext, aWordNumber) then
 // - если мы рассматриваем параметр как идентификатор, а не как слово,
 //   то логично не раскрывать оператор соответствующий этому идентификатору.
  //Result := tfw_sniForce
  Result := tfw_sniYes
 else
 // - иначе - надо всё раскрывать, т.к. иначе можем получить ерунду и
 //   исключение 'Возможно компиляция запускается из уже откомпилированнного кода'
  Result := tfw_sniNo;
 //Result := inherited SupressNextImmediate(aContext, aWordNumber);
//#UC END# *4F3AB3B101FC_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.SuppressNextImmediate

function TkwCompiledWordWorkerWord.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_4F21976E01C2get_var*
//#UC END# *4F43C9A10139_4F21976E01C2get_var*
begin
//#UC START# *4F43C9A10139_4F21976E01C2get_impl*
 Result := Compiled.WordProducer;
//#UC END# *4F43C9A10139_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetWordProducer

procedure TkwCompiledWordWorkerWord.pm_SetWordProducer(aValue: TtfwWord);
//#UC START# *4F43C9A10139_4F21976E01C2set_var*
//#UC END# *4F43C9A10139_4F21976E01C2set_var*
begin
//#UC START# *4F43C9A10139_4F21976E01C2set_impl*
 Compiled.WordProducer := aValue;
//#UC END# *4F43C9A10139_4F21976E01C2set_impl*
end;//TkwCompiledWordWorkerWord.pm_SetWordProducer

function TkwCompiledWordWorkerWord.pm_GetInnerDictionary: TtfwDictionaryPrim;
//#UC START# *52B43311021D_4F21976E01C2get_var*
//#UC END# *52B43311021D_4F21976E01C2get_var*
begin
//#UC START# *52B43311021D_4F21976E01C2get_impl*
 Result := Compiled.InnerDictionary;
//#UC END# *52B43311021D_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetInnerDictionary

function TkwCompiledWordWorkerWord.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_4F21976E01C2get_var*
//#UC END# *52CFC11603C8_4F21976E01C2get_var*
begin
//#UC START# *52CFC11603C8_4F21976E01C2get_impl*
 if (Compiled <> nil) then
  Result := Compiled.ResultTypeInfo[aCtx]
 else
  Result := inherited pm_GetResultTypeInfo(aCtx);
//#UC END# *52CFC11603C8_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetResultTypeInfo

function TkwCompiledWordWorkerWord.pm_GetParentWord: TtfwWord;
//#UC START# *52CFCF4B02C6_4F21976E01C2get_var*
//#UC END# *52CFCF4B02C6_4F21976E01C2get_var*
begin
//#UC START# *52CFCF4B02C6_4F21976E01C2get_impl*
 Result := Compiled.ParentWord;
//#UC END# *52CFCF4B02C6_4F21976E01C2get_impl*
end;//TkwCompiledWordWorkerWord.pm_GetParentWord

procedure TkwCompiledWordWorkerWord.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F21976E01C2_var*
//#UC END# *52EA6A2C0111_4F21976E01C2_var*
begin
//#UC START# *52EA6A2C0111_4F21976E01C2_impl*
 inherited;
 if (Compiled <> nil) then
  Compiled.SetResultTypeInfo(aValue, aCtx);
//#UC END# *52EA6A2C0111_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.SetResultTypeInfo

procedure TkwCompiledWordWorkerWord.DoKeyword(var aContext: TtfwContext;
  aWord: TtfwWord;
  aFinder: TtfwWord;
  aWordNumber: Integer);
//#UC START# *53E21481021D_4F21976E01C2_var*
//#UC END# *53E21481021D_4F21976E01C2_var*
begin
//#UC START# *53E21481021D_4F21976E01C2_impl*
 if TreatUnknownAsStringInParam(aContext, aWordNumber) then
  DoStringToken(aContext, aContext.rWordCompilingNow, aContext.rParser.TokenLongString)
 else
  inherited;
//#UC END# *53E21481021D_4F21976E01C2_impl*
end;//TkwCompiledWordWorkerWord.DoKeyword

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwImmediateTemporaryCompiledCode
 TkwImmediateTemporaryCompiledCode.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordWorkerWord
 TkwCompiledWordWorkerWord.RegisterInEngine;
{$IfEnd} //not NoScripts

end.