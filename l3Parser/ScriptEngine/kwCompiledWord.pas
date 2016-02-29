unit kwCompiledWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "kwCompiledWord.pas"
// Начат: 26.04.2011 17:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledWord
//
// Поддержка скомпилированных слов
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwDictionary,
  tfwWordRefList,
  kwRuntimeWordWithCodeExecution,
  tfwScriptingInterfaces,
  l3Interfaces,
  tfwDictionaryPrim,
  l3Variant
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWord = class(TkwRuntimeWordWithCodeExecution)
  {* Поддержка скомпилированных слов }
 private
 // private fields
   f_InParams : TtfwWordRefList;
    {* Входные параметры слова}
   f_RightParams : TtfwWordRefList;
   f_LeftWordRefs : TtfwWordRefList;
   f_LocalDictionary : TtfwDictionary;
    {* Поле для свойства LocalDictionary}
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
   procedure DoDoIt(const aCtx: TtfwContext); override;
   procedure StoreState(const aCtx: TtfwContext); override;
   procedure RestoreState(const aCtx: TtfwContext); override;
   function GetNewWordDefinitor: TtfwWord; override;
   function GetKeywordFinder(const aCtx: TtfwContext): TtfwWord; override;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord;
     aCheckCode: Boolean); override;
   procedure ClearState(const aCtx: TtfwContext); override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; override;
   function GetKeywordByName(const aName: Il3CString): Tl3PrimString; override;
   function GetParentFinder: TtfwWord; override;
 public
 // overridden public methods
   function IsCompiled: Boolean; override;
   function IsImmediate(const aCtx: TtfwContext): Boolean; override;
   function DoDefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aStereo: TtfwWord;
     aTypeInfo: TtfwWordInfo): TtfwWord; override;
     {* Определяет слову входной параметр }
   procedure CompileInParameterPopCodeFromString(const aContext: TtfwContext;
     const aParameterToPop: Il3CString); override;
   function HasLocalDictionary: Boolean; override;
     {* Есть ли у слова локальный словарь }
   function GetInParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
   function RightParamsCount(const aCtx: TtfwContext): Integer; override;
   function LeftWordRefParamsCount(const aCtx: TtfwContext): Integer; override;
   function GetRightParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
 protected
 // protected properties
   property LocalDictionary: TtfwDictionary
     read f_LocalDictionary;
 end;//TkwCompiledWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwStoredValues,
  tfwArray,
  kwLeftParam,
  l3String
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWord

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

procedure TkwCompiledWord.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4DB6CA4F010D_var*
var
 l_Index : Integer;
//#UC END# *4DAEEDE10285_4DB6CA4F010D_var*
begin
//#UC START# *4DAEEDE10285_4DB6CA4F010D_impl*
 if (f_RightParams <> nil) then
  for l_Index := Pred(f_RightParams.Count) downto 0 do
   f_RightParams[l_Index].SetValue(aCtx.rEngine.Pop, aCtx);

 if (f_LeftWordRefs <> nil) then
  for l_Index := Pred(f_LeftWordRefs.Count) downto 0 do
   f_LeftWordRefs[l_Index].SetValue(aCtx.rEngine.Pop, aCtx);

 if (f_InParams <> nil) then
  for l_Index := Pred(f_InParams.Count) downto 0 do
   f_InParams[l_Index].SetValue(aCtx.rEngine.Pop, aCtx);

 inherited;
//#UC END# *4DAEEDE10285_4DB6CA4F010D_impl*
end;//TkwCompiledWord.DoDoIt

function TkwCompiledWord.IsCompiled: Boolean;
//#UC START# *4DB6CF7202CB_4DB6CA4F010D_var*
//#UC END# *4DB6CF7202CB_4DB6CA4F010D_var*
begin
//#UC START# *4DB6CF7202CB_4DB6CA4F010D_impl*
 Result := true;
//#UC END# *4DB6CF7202CB_4DB6CA4F010D_impl*
end;//TkwCompiledWord.IsCompiled

function TkwCompiledWord.IsImmediate(const aCtx: TtfwContext): Boolean;
//#UC START# *4DB6D7F70155_4DB6CA4F010D_var*
//#UC END# *4DB6D7F70155_4DB6CA4F010D_var*
begin
//#UC START# *4DB6D7F70155_4DB6CA4F010D_impl*
 Result := inherited IsImmediate(aCtx);
//#UC END# *4DB6D7F70155_4DB6CA4F010D_impl*
end;//TkwCompiledWord.IsImmediate

function TkwCompiledWord.DoDefineInParameter(const aCtx: TtfwContext;
  const aParamName: Il3CString;
  aStereo: TtfwWord;
  aTypeInfo: TtfwWordInfo): TtfwWord;
//#UC START# *4F4161BC0024_4DB6CA4F010D_var*
var
 l_Var : TtfwWord;
 l_KW : TtfwKeyWord;
 l_ST : TtfwKeyWord;
 l_STW : TtfwWord;
//#UC END# *4F4161BC0024_4DB6CA4F010D_var*
begin
//#UC START# *4F4161BC0024_4DB6CA4F010D_impl*
 l_KW := Self.CheckWord(aParamName);
 if (l_KW.Word <> nil) then
  CompilerAssert(false, 'Слово ' + l3Str(aParamName) + ' уже определено. Нельзя определить одноимённый параметр', aCtx);
 if (aStereo = nil) then
 begin
  l_ST := TtfwKeyWord(aCtx.rEngine.KeywordByName(TtfwCStringFactory.C('IN')));
  l_STW := nil;
  if (l_ST <> nil) then
   l_STW := l_ST.Word;
  if (l_STW = nil) then
   l_STW := Self;
 end//aStereo = nil
 else
  l_STW := aStereo; 
 l_Var := TkwLeftParam.ClassForCreate(aTypeInfo, aCtx).
                         Create(l_STW,
                                Self{PrevFinder},
                                aTypeInfo,
                                aCtx,
                                l_KW);
 try
  l_KW.SetWord(aCtx, l_Var);
  Result := l_Var;
 finally
  FreeAndNil(l_Var);
 end;//try..finally
//#UC END# *4F4161BC0024_4DB6CA4F010D_impl*
end;//TkwCompiledWord.DoDefineInParameter

procedure TkwCompiledWord.CompileInParameterPopCodeFromString(const aContext: TtfwContext;
  const aParameterToPop: Il3CString);
//#UC START# *4F4177910352_4DB6CA4F010D_var*
//#UC END# *4F4177910352_4DB6CA4F010D_var*
begin
//#UC START# *4F4177910352_4DB6CA4F010D_impl*
 DoCompileInParameterPopCode(aContext, CheckWord(aParameterToPop).Word, false);
//#UC END# *4F4177910352_4DB6CA4F010D_impl*
end;//TkwCompiledWord.CompileInParameterPopCodeFromString

procedure TkwCompiledWord.StoreState(const aCtx: TtfwContext);
//#UC START# *4F49428A01EA_4DB6CA4F010D_var*
//#UC END# *4F49428A01EA_4DB6CA4F010D_var*
begin
//#UC START# *4F49428A01EA_4DB6CA4F010D_impl*
 inherited;
 aCtx.rStoredValuesStack.StoreDictionary(f_LocalDictionary, aCtx);
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
 if (f_InParams = nil) OR f_InParams.Empty then
  Result := inherited GetInParam(aCtx, anIndex)
 else
  Result := f_InParams[anIndex];
//#UC END# *52D5425A037F_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetInParam

function TkwCompiledWord.GetNewWordDefinitor: TtfwWord;
//#UC START# *52D56341033B_4DB6CA4F010D_var*
//#UC END# *52D56341033B_4DB6CA4F010D_var*
begin
//#UC START# *52D56341033B_4DB6CA4F010D_impl*
 Result := Self;
//#UC END# *52D56341033B_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetNewWordDefinitor

function TkwCompiledWord.GetKeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D5637A031E_4DB6CA4F010D_var*
//#UC END# *52D5637A031E_4DB6CA4F010D_var*
begin
//#UC START# *52D5637A031E_4DB6CA4F010D_impl*
 Result := Self;
//#UC END# *52D5637A031E_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetKeywordFinder

procedure TkwCompiledWord.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord;
  aCheckCode: Boolean);
//#UC START# *52D56A980103_4DB6CA4F010D_var*
var
 l_Index : Integer;
 l_W : TtfwWord;
//#UC END# *52D56A980103_4DB6CA4F010D_var*
begin
//#UC START# *52D56A980103_4DB6CA4F010D_impl*
 CompilerAssert(aParameterToPop <> nil, 'Параметр для заполнения не может быть nil', aContext);

 if aCheckCode then
 begin
  CompilerAssert((Code = nil) OR (Code.Count = 0), 'Нельзя определять параметры после кода', aContext);

  if (f_LocalDictionary <> nil) then
   for l_Index := 0 to Pred(f_LocalDictionary.Count) do
   begin
    l_W := TtfwKeyWord(f_LocalDictionary[l_Index]).Word;
    if (l_W <> nil) then
     CompilerAssert(l_W.{IsInParam}IsVarLike OR l_W.IsImmediate(aContext),
                    'Нельзя определять параметры после вложенных слов', aContext);
   end;//for l_Index
 end;//aCheckCode
  
 if aParameterToPop.IsRightParam(aContext) then
 begin
  if (f_RightParams = nil) then
   f_RightParams := TtfwWordRefList.Create;
  f_RightParams.Add(aParameterToPop);
 end//aParameterToPop.IsRightParam(aContext)
 else
 if aParameterToPop.IsLeftWordRefParam(aContext) then
 begin
  if (f_LeftWordRefs = nil) then
   f_LeftWordRefs := TtfwWordRefList.Create;
  f_LeftWordRefs.Add(aParameterToPop);
 end//aParameterToPop.IsRightParam(aContext)
 else
 begin
  if not((f_LeftWordRefs = nil) OR (f_LeftWordRefs.Count = 0)) then
   CompilerAssertFmt(false,  'Нельзя перемешивать левые ссылочные и левые нессылочные параметры: %s', [aParameterToPop.Key.AsString], aContext);
  if (f_InParams = nil) then
   f_InParams := TtfwWordRefList.Create;
  f_InParams.Add(aParameterToPop);
 end;//aParameterToPop.IsRightParam(aContext)
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
   l_W := TtfwKeyWord(f_LocalDictionary.Items[l_Index]).Word;
   if l_W.CanClearInRecursiveCalls then
    // http://mdp.garant.ru/pages/viewpage.action?pageId=356071766&focusedCommentId=556760508&#comment-556760508
     begin
      //l_TI := l_W.ResultTypeInfo[aCtx];
      //if not (tfw_wmLeftWordRef in l_TI.Modifiers) then
       l_W.InitValue(aCtx);
     end;//l_W.CanClearInRecursiveCalls
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

function TkwCompiledWord.GetRightParam(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *55769895035B_4DB6CA4F010D_var*
//#UC END# *55769895035B_4DB6CA4F010D_var*
begin
//#UC START# *55769895035B_4DB6CA4F010D_impl*
 if (anIndex < 0) then
  Result := nil
 else 
 if (f_RightParams = nil) then
  Result := nil
 else
 if (f_RightParams.Count <= anIndex) then
  Result := nil
 else
  Result := f_RightParams.Items[anIndex];
//#UC END# *55769895035B_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetRightParam

function TkwCompiledWord.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_4DB6CA4F010D_var*
//#UC END# *559687E6025A_4DB6CA4F010D_var*
begin
//#UC START# *559687E6025A_4DB6CA4F010D_impl*
 if (f_InParams = nil) then
  Result := 0
 else
  Result := f_InParams.Count;
 Result :=  Result + LeftWordRefParamsCount(aCtx) + RightParamsCount(aCtx); 
//#UC END# *559687E6025A_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetAllParamsCount

function TkwCompiledWord.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A7D34102A0_4DB6CA4F010D_var*
//#UC END# *55A7D34102A0_4DB6CA4F010D_var*
begin
//#UC START# *55A7D34102A0_4DB6CA4F010D_impl*
 if (f_LocalDictionary = nil) then
  f_LocalDictionary := TtfwDictionary.Create;
 Result := f_LocalDictionary.CheckWord(aName);
//#UC END# *55A7D34102A0_4DB6CA4F010D_impl*
end;//TkwCompiledWord.DoCheckWord

function TkwCompiledWord.GetKeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *55ACE5210310_4DB6CA4F010D_var*
//#UC END# *55ACE5210310_4DB6CA4F010D_var*
begin
//#UC START# *55ACE5210310_4DB6CA4F010D_impl*
 if (f_LocalDictionary = nil) then
  Result := nil
 else
  Result := f_LocalDictionary.DRbyCName[aName];
 if (Result = nil) then
  if (f_PrevFinder <> nil) then
  begin
   Result := f_PrevFinder.KeywordByName(aName);
   (*if (Result <> nil) AND
      (Result Is TtfwKeyWord) AND
      (TtfwKeyWord(Result).Word Is TkwCompiledWord) AND
      (tfw_wmPrivate in TkwCompiledWord(TtfwKeyWord(Result).Word).Modifiers) then
       Result := nil;*)
   // - пока отключаем эту красоту, видимость можно по разному интерпретировать    
  end;//f_PrevFinder <> nil
//#UC END# *55ACE5210310_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetKeywordByName

function TkwCompiledWord.GetParentFinder: TtfwWord;
//#UC START# *55ACF0F5025D_4DB6CA4F010D_var*
//#UC END# *55ACF0F5025D_4DB6CA4F010D_var*
begin
//#UC START# *55ACF0F5025D_4DB6CA4F010D_impl*
 Result := f_PrevFinder;
//#UC END# *55ACF0F5025D_4DB6CA4F010D_impl*
end;//TkwCompiledWord.GetParentFinder

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWord
 TkwCompiledWord.RegisterClass;
{$IfEnd} //not NoScripts

end.