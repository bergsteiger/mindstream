unit kwCompiledWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledWord.pas"
// Начат: 26.04.2011 17:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledWord
//
// Поддержка скомпилированных слов
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
  tfwWordRefList,
  kwRuntimeWordWithCodeExecution,
  tfwParserInterfaces,
  l3Interfaces,
  tfwDictionaryPrim,
  l3Variant,
  l3ParserInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWord = class(TkwRuntimeWordWithCodeExecution, ItfwNewWordDefinitor, ItfwKeywordFinder)
  {* Поддержка скомпилированных слов }
 private
 // private fields
   f_RightParams : TtfwWordRefList;
   f_LeftWordRefs : TtfwWordRefList;
   f_LocalDictionary : TtfwDictionary;
    {* Поле для свойства LocalDictionary}
   f_InParams : TtfwWordRefList;
    {* Поле для свойства InParams}
 protected
 // realized methods
   function Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
   function Get_ParentFinder: Il3KeywordFinder;
   function CheckWord(const aName: Il3CString): TtfwKeyWord;
 protected
 // overridden property methods
   function pm_GetInnerDictionary: TtfwDictionaryPrim; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
   function AllowNestedCalls: Boolean; override;
   procedure StoreState(const aCtx: TtfwContext); override;
   procedure RestoreState(const aCtx: TtfwContext); override;
   function GetNewWordDefinitor: ItfwNewWordDefinitor; override;
   function GetKeywordFinder: ItfwKeywordFinder; override;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord); override;
   procedure ClearState(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function IsCompiled: Boolean; override;
   procedure DefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aModifiers: TtfwWordModifiers); override;
     {* Определяет слову входной параметр }
   procedure CompileInParameterPopCodeFromString(const aContext: TtfwContext;
     const aParameterToPop: Il3CString); override;
   function HasLocalDictionary: Boolean; override;
     {* Есть ли у слова локальный словарь }
   function GetInParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
   function RightParamsCount(const aCtx: TtfwContext): Integer; override;
   function LeftWordRefParamsCount(const aCtx: TtfwContext): Integer; override;
 protected
 // protected properties
   property LocalDictionary: TtfwDictionary
     read f_LocalDictionary;
   property InParams: TtfwWordRefList
     read f_InParams;
     {* Входные параметры слова }
 end;//TkwCompiledWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwRightParam,
  kwIn,
  kwCompiledInitParam,
  tfwStoredValues,
  tfwArray,
  kwLeftParam,
  l3String,
  kwLeftWordRefParam
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWord

function TkwCompiledWord.Get_KeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *4DC95AF703B8_4DB6CA4F010Dget_var*
//#UC END# *4DC95AF703B8_4DB6CA4F010Dget_var*
begin
//#UC START# *4DC95AF703B8_4DB6CA4F010Dget_impl*
 if (f_LocalDictionary = nil) then
  Result := nil
 else
  Result := f_LocalDictionary.DRbyCName[aName];
 if (Result = nil) then
  if (f_PrevFinder <> nil) then
  begin
   Result := Il3KeywordFinder(f_PrevFinder).KeywordByName[aName];
   (*if (Result <> nil) AND
      (Result Is TtfwKeyWord) AND
      (TtfwKeyWord(Result).Word Is TkwCompiledWord) AND
      (tfw_wmPrivate in TkwCompiledWord(TtfwKeyWord(Result).Word).Modifiers) then
       Result := nil;*)
   // - пока отключаем эту красоту, видимость можно по разному интерпретировать    
  end;//f_PrevFinder <> nil
//#UC END# *4DC95AF703B8_4DB6CA4F010Dget_impl*
end;//TkwCompiledWord.Get_KeywordByName

function TkwCompiledWord.Get_ParentFinder: Il3KeywordFinder;
//#UC START# *4F3A922803CD_4DB6CA4F010Dget_var*
//#UC END# *4F3A922803CD_4DB6CA4F010Dget_var*
begin
//#UC START# *4F3A922803CD_4DB6CA4F010Dget_impl*
 Result := Il3KeywordFinder(f_PrevFinder);
//#UC END# *4F3A922803CD_4DB6CA4F010Dget_impl*
end;//TkwCompiledWord.Get_ParentFinder

function TkwCompiledWord.CheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F46588B021E_4DB6CA4F010D_var*
//#UC END# *4F46588B021E_4DB6CA4F010D_var*
begin
//#UC START# *4F46588B021E_4DB6CA4F010D_impl*
 if (f_LocalDictionary = nil) then
  f_LocalDictionary := TtfwDictionary.Create;
 Result := f_LocalDictionary.CheckWord(aName);
//#UC END# *4F46588B021E_4DB6CA4F010D_impl*
end;//TkwCompiledWord.CheckWord

procedure TkwCompiledWord.Cleanup;
//#UC START# *479731C50290_4DB6CA4F010D_var*
//#UC END# *479731C50290_4DB6CA4F010D_var*
begin
//#UC START# *479731C50290_4DB6CA4F010D_impl*
 //f_PrevFinder := nil;
 FreeAndNil(f_InParams);
 FreeAndNil(f_RightParams);
 FreeAndNil(f_LeftWordRefs);
 FreeAndNil(f_LocalDictionary);
 inherited;
//#UC END# *479731C50290_4DB6CA4F010D_impl*
end;//TkwCompiledWord.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TkwCompiledWord.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4DB6CA4F010D_var*
//#UC END# *47A6FEE600FC_4DB6CA4F010D_var*
begin
//#UC START# *47A6FEE600FC_4DB6CA4F010D_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4DB6CA4F010D_impl*
end;//TkwCompiledWord.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function TkwCompiledWord.IsCompiled: Boolean;
//#UC START# *4DB6CF7202CB_4DB6CA4F010D_var*
//#UC END# *4DB6CF7202CB_4DB6CA4F010D_var*
begin
//#UC START# *4DB6CF7202CB_4DB6CA4F010D_impl*
 Result := true;
//#UC END# *4DB6CF7202CB_4DB6CA4F010D_impl*
end;//TkwCompiledWord.IsCompiled

function TkwCompiledWord.AllowNestedCalls: Boolean;
//#UC START# *4F3C06550278_4DB6CA4F010D_var*
//#UC END# *4F3C06550278_4DB6CA4F010D_var*
begin
//#UC START# *4F3C06550278_4DB6CA4F010D_impl*
 Result := ((f_LocalDictionary = nil) OR f_LocalDictionary.Empty) AND
           // - словаря нет, значит и переменных - нет
           ((f_InParams = nil) OR f_InParams.Empty)
           // - нет входных параметров
           ;
//#UC END# *4F3C06550278_4DB6CA4F010D_impl*
end;//TkwCompiledWord.AllowNestedCalls

procedure TkwCompiledWord.DefineInParameter(const aCtx: TtfwContext;
  const aParamName: Il3CString;
  aModifiers: TtfwWordModifiers);
//#UC START# *4F4161BC0024_4DB6CA4F010D_var*
var
 l_Var : TkwLeftParam;
 l_KW : TtfwKeyWord;
//#UC END# *4F4161BC0024_4DB6CA4F010D_var*
begin
//#UC START# *4F4161BC0024_4DB6CA4F010D_impl*
 l_KW := Self.CheckWord(aParamName);
 if not (tfw_wmRightWordRef in aModifiers) then
 begin
  if not (tfw_wmLeftWordRef in aModifiers) then
// if l3Same(aParamName, 'Caller') OR l3Same(aParamName, '%S') then
   l_Var := TkwLeftParam.Create((aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(TkwIn.GetWordNameForRegister)] As TtfwKeyWord).Word,
                                   // - чтобы обеспечить слову нужный "стереотип"
                                   //   хак конечно, надо как-то константу хотя бы завести
                                  Self{PrevFinder},
                                  TtfwTypeInfo_C(aModifiers),
                                  aCtx,
                                  l_KW)
  else
   l_Var := TkwLeftWordRefParam.Create((aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(TkwIn.GetWordNameForRegister)] As TtfwKeyWord).Word,
                                   // - чтобы обеспечить слову нужный "стереотип"
                                   //   хак конечно, надо как-то константу хотя бы завести
                                  Self{PrevFinder},
                                  TtfwTypeInfo_C(aModifiers),
                                  aCtx,
                                  l_KW)
 end//not (tfw_wmRightWordRef in aModifiers)
 else
  l_Var := TkwRightParam.Create((aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(TkwIn.GetWordNameForRegister)] As TtfwKeyWord).Word,
                                  // - чтобы обеспечить слову нужный "стереотип"
                                  //   хак конечно, надо как-то константу хотя бы завести
                                 Self{PrevFinder},
                                 TtfwTypeInfo_C(aModifiers),
                                 aCtx,
                                 l_KW);
 try
  l_KW.Word := l_Var;
 finally
  FreeAndNil(l_Var);
 end;//try..finally
//#UC END# *4F4161BC0024_4DB6CA4F010D_impl*
end;//TkwCompiledWord.DefineInParameter

procedure TkwCompiledWord.CompileInParameterPopCodeFromString(const aContext: TtfwContext;
  const aParameterToPop: Il3CString);
//#UC START# *4F4177910352_4DB6CA4F010D_var*
//#UC END# *4F4177910352_4DB6CA4F010D_var*
begin
//#UC START# *4F4177910352_4DB6CA4F010D_impl*
 CompileInParameterPopCode(aContext, CheckWord(aParameterToPop).Word);
//#UC END# *4F4177910352_4DB6CA4F010D_impl*
end;//TkwCompiledWord.CompileInParameterPopCodeFromString

procedure TkwCompiledWord.StoreState(const aCtx: TtfwContext);
//#UC START# *4F49428A01EA_4DB6CA4F010D_var*
var
 l_SV : ItfwStoredValues;
 l_Index : Integer;
 l_W : TtfwWord;
 l_V : TtfwStackValue;
 l_SVE : TtfwStoredValue;
//#UC END# *4F49428A01EA_4DB6CA4F010D_var*
begin
//#UC START# *4F49428A01EA_4DB6CA4F010D_impl*
 inherited;
 l_SV := TtfwStoredValues.Make;
 for l_Index := 0 to Pred(f_LocalDictionary.Count) do
 begin
  l_W := (f_LocalDictionary.Items[l_Index] As TtfwKeyWord).Word;
  if l_W.IsVarLike then
  begin
   l_V := l_W.GetValue(aCtx);
   try
    l_SVE := TtfwStoredValue_C(l_W, l_V);
    try
     l_SV.Add(l_SVE);
    finally
     l_SVE.rValue.rString := nil;
     Finalize(l_SVE);
    end;//try..finally
    if (l_V.rType = tfw_svtList) then
     l_W.SetValue(TtfwStackValue_C(TtfwArray.Make), aCtx);
     // - чтобы последующий вызов не испортил наш массив
   finally
    Finalize(l_V);
   end;//try..finally
  end;//l_W.IsVarLike
 end;//for l_Index
 aCtx.rStoredValuesStack.Add(l_SV);
//#UC END# *4F49428A01EA_4DB6CA4F010D_impl*
end;//TkwCompiledWord.StoreState

procedure TkwCompiledWord.RestoreState(const aCtx: TtfwContext);
//#UC START# *4F4942C50339_4DB6CA4F010D_var*
//#UC END# *4F4942C50339_4DB6CA4F010D_var*
begin
//#UC START# *4F4942C50339_4DB6CA4F010D_impl*
 aCtx.rStoredValuesStack.Restore(aCtx);
 inherited;
//#UC END# *4F4942C50339_4DB6CA4F010D_impl*
end;//TkwCompiledWord.RestoreState

function TkwCompiledWord.pm_GetInnerDictionary: TtfwDictionaryPrim;
//#UC START# *52B43311021D_4DB6CA4F010Dget_var*
//#UC END# *52B43311021D_4DB6CA4F010Dget_var*
begin
//#UC START# *52B43311021D_4DB6CA4F010Dget_impl*
 Result := LocalDictionary;
//#UC END# *52B43311021D_4DB6CA4F010Dget_impl*
end;//TkwCompiledWord.pm_GetInnerDictionary

function TkwCompiledWord.HasLocalDictionary: Boolean;
//#UC START# *52D40FAA0073_4DB6CA4F010D_var*
//#UC END# *52D40FAA0073_4DB6CA4F010D_var*
begin
//#UC START# *52D40FAA0073_4DB6CA4F010D_impl*
 Result := (LocalDictionary <> nil) AND not LocalDictionary.Empty;
//#UC END# *52D40FAA0073_4DB6CA4F010D_impl*
end;//TkwCompiledWord.HasLocalDictionary

function TkwCompiledWord.GetInParam(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *52D5425A037F_4DB6CA4F010D_var*
//#UC END# *52D5425A037F_4DB6CA4F010D_var*
begin
//#UC START# *52D5425A037F_4DB6CA4F010D_impl*
 if (InParams = nil) OR InParams.Empty then
  Result := inherited GetInParam(aCtx, anIndex)
 else
  Result := InParams[anIndex];
//#UC END# *52D5425A037F_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetInParam

function TkwCompiledWord.GetNewWordDefinitor: ItfwNewWordDefinitor;
//#UC START# *52D56341033B_4DB6CA4F010D_var*
//#UC END# *52D56341033B_4DB6CA4F010D_var*
begin
//#UC START# *52D56341033B_4DB6CA4F010D_impl*
 Result := Self;
//#UC END# *52D56341033B_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetNewWordDefinitor

function TkwCompiledWord.GetKeywordFinder: ItfwKeywordFinder;
//#UC START# *52D5637A031E_4DB6CA4F010D_var*
//#UC END# *52D5637A031E_4DB6CA4F010D_var*
begin
//#UC START# *52D5637A031E_4DB6CA4F010D_impl*
 Result := Self;
//#UC END# *52D5637A031E_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetKeywordFinder

procedure TkwCompiledWord.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord);
//#UC START# *52D56A980103_4DB6CA4F010D_var*
var
 l_Pop : TkwCompiledInitParam;
//#UC END# *52D56A980103_4DB6CA4F010D_var*
begin
//#UC START# *52D56A980103_4DB6CA4F010D_impl*
 CompilerAssert(aParameterToPop <> nil, 'Параметр для заполнения не может быть nil', aContext);
 // l_Var := aParameterToPop As TkwCompiledIn;
 (* l_Pop := TkwCompiledPopToVar.Create((aContext.rEngine.As_ItfwKeywordFinder.KeywordByName[TkwPopToVar.GetWordNameForRegister] As TtfwKeyWord).Word,
                                      // - чтобы обеспечить слову нужный "стереотип"
                                      //   хак конечно, надо как-то константу хотя бы завести
                                      Self{PrevFinder},
                                      TtfwTypeInfo_E{Modifiers},
                                      aContext);
  try
   l_Pop.DoAddCodePart(l_Var, false, aContext);*)
 l_Pop := TkwCompiledInitParam.Create(aParameterToPop);
 try
  Self.DoAddCodePart(l_Pop, true, aContext);

  if (f_InParams = nil) then
   f_InParams := TtfwWordRefList.Create;
  CompilerAssertFmt(f_InParams.IndexOf(aParameterToPop) < 0, 'Параметр %s уже был добавлен', [aParameterToPop.Key.AsString],  aContext);
  f_InParams.Add(aParameterToPop);

  if aParameterToPop.IsRightParam(aContext) then
  begin
   if (f_RightParams = nil) then
    f_RightParams := TtfwWordRefList.Create;
   if (f_RightParams.IndexOf(aParameterToPop) < 0) then
    f_RightParams.Add(aParameterToPop);
  end//aParameterToPop.IsRightParam(aContext)
  else
  if aParameterToPop.IsLeftWordRefParam(aContext) then
  begin
   if (f_LeftWordRefs = nil) then
    f_LeftWordRefs := TtfwWordRefList.Create;
   if (f_LeftWordRefs.IndexOf(aParameterToPop) < 0) then
    f_LeftWordRefs.Add(aParameterToPop);
  end;//aParameterToPop.IsRightParam(aContext)
 finally
  FreeAndNil(l_Pop);
 end;//try..finally
//#UC END# *52D56A980103_4DB6CA4F010D_impl*
end;//TkwCompiledWord.DoCompileInParameterPopCode

function TkwCompiledWord.RightParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *52E9282B0271_4DB6CA4F010D_var*
//#UC END# *52E9282B0271_4DB6CA4F010D_var*
begin
//#UC START# *52E9282B0271_4DB6CA4F010D_impl*
 if (f_RightParams = nil) then
  Result := 0
 else
  Result := f_RightParams.Count; 
//#UC END# *52E9282B0271_4DB6CA4F010D_impl*
end;//TkwCompiledWord.RightParamsCount

procedure TkwCompiledWord.ClearState(const aCtx: TtfwContext);
//#UC START# *53C90EC00136_4DB6CA4F010D_var*
var
 l_Index : Integer;
 l_W : TtfwWord;
//#UC END# *53C90EC00136_4DB6CA4F010D_var*
begin
//#UC START# *53C90EC00136_4DB6CA4F010D_impl*
 inherited;
 if (f_LocalDictionary <> nil) then
  for l_Index := 0 to Pred(f_LocalDictionary.Count) do
  begin
   l_W := (f_LocalDictionary.Items[l_Index] As TtfwKeyWord).Word;
   if l_W.IsVarLike then
    if not l_W.IsRightParam(aCtx) then
    // http://mdp.garant.ru/pages/viewpage.action?pageId=356071766&focusedCommentId=556760508&#comment-556760508
     if not l_W.IsLeftWordRefParam(aCtx) then
     begin
      l_W.SetValue(TtfwStackValue_E, aCtx, false);
     end;//l_W.IsVarLike
  end;//for l_Index
//#UC END# *53C90EC00136_4DB6CA4F010D_impl*
end;//TkwCompiledWord.ClearState

function TkwCompiledWord.LeftWordRefParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4914101D2_4DB6CA4F010D_var*
//#UC END# *53E4914101D2_4DB6CA4F010D_var*
begin
//#UC START# *53E4914101D2_4DB6CA4F010D_impl*
 if (f_LeftWordRefs = nil) then
  Result := 0
 else
  Result := f_LeftWordRefs.Count; 
//#UC END# *53E4914101D2_4DB6CA4F010D_impl*
end;//TkwCompiledWord.LeftWordRefParamsCount

{$IfEnd} //not NoScripts

end.