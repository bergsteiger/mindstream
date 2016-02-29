unit ArrayProcessingPack;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Axiomatics"
// Модуль: "ArrayProcessingPack.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeywordsPack::Class Shared Delphi Low Level::ScriptEngine$Axiomatics::ArrayProcessing::ArrayProcessingPack
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwBeginLikeWord,
  kwCloseBracket,
  kwBeginLikeCompiledCode,
  tfwRegisterableWord,
  tfwAxiomaticsResNameGetter,
  tfwTypeInfo,
  tfwClassLike,
  l3PureMixIns
  ;

{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwArray,
  SysUtils,
  kwCompiledWordPrim,
  tfwRevertedArrayView,
  tfwFilteredArrayView,
  tfwMappedArrayView,
  tfwIteratorFromFunctor,
  tfwJoinIterator,
  tfwTruncatedArrayView,
  tfwSliceView,
  tfwScriptingTypes,
  TypInfo,
  tfwTypeRegistrator
  ;

type
 TkwCompiledArray = class(TkwBeginLikeCompiledCode)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 end;//TkwCompiledArray

 TkwOpenArray = {final scriptword} class(TtfwBeginLikeWord)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
 end;//TkwOpenArray

  TkwCloseArray = {final scriptword} class(TkwCloseBracket)
  protected
  // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
  end;//TkwCloseArray

// start class TkwCloseArray

class function TkwCloseArray.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := ']';
end;//TkwCloseArray.GetWordNameForRegister
// start class TkwCompiledArray

procedure TkwCompiledArray.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_52EB991C028F_var*
var
 l_A : TtfwArray;
 l_V : TtfwStackValue;
//#UC END# *4DAEEDE10285_52EB991C028F_var*
begin
//#UC START# *4DAEEDE10285_52EB991C028F_impl*
 aCtx.rEngine.PushBracket;
 inherited;
 l_A := TtfwArray.Create;
 try
  try
   while true do
   begin
    l_V := aCtx.rEngine.Pop;
    if l_V.IsBracket then
     break;
    l_A.Insert(0, l_V);
   end;//while true
  finally
   aCtx.rEngine.PushList(l_A);
  end;//try..finally
 finally
  FreeAndNil(l_A);
 end;//try..finally
//#UC END# *4DAEEDE10285_52EB991C028F_impl*
end;//TkwCompiledArray.DoDoIt

function TkwOpenArray.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F5037E30231_var*
//#UC END# *4DB6C99F026E_4F5037E30231_var*
begin
//#UC START# *4DB6C99F026E_4F5037E30231_impl*
 Result := TkwCloseArray;
//#UC END# *4DB6C99F026E_4F5037E30231_impl*
end;//TkwOpenArray.EndBracket

class function TkwOpenArray.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '[';
end;//TkwOpenArray.GetWordNameForRegister

function TkwOpenArray.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F5037E30231_var*
//#UC END# *4DBAEE0D028D_4F5037E30231_var*
begin
//#UC START# *4DBAEE0D028D_4F5037E30231_impl*
 Result := TkwCompiledArray;
//#UC END# *4DBAEE0D028D_4F5037E30231_impl*
end;//TkwOpenArray.CompiledWordClass

type
//#UC START# *DB8D8DCA5554ci*
//#UC END# *DB8D8DCA5554ci*
 TArrayProcessingPackResNameGetter = {final} class(TtfwAxiomaticsResNameGetter)
  {* Регистрация скриптованой аксиоматики }
 public
 // realized methods
   class function ResName: AnsiString; override;
//#UC START# *DB8D8DCA5554publ*
//#UC END# *DB8D8DCA5554publ*
 end;//TArrayProcessingPackResNameGetter

// start class TArrayProcessingPackResNameGetter

class function TArrayProcessingPackResNameGetter.ResName: AnsiString;
 {-}
begin
 Result := 'ArrayProcessingPack';
end;//TArrayProcessingPackResNameGetter.ResName

 {$R ArrayProcessingPack.res}

type
 TkwArrayClear = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Clear
*Пример:*
[code]
 aArray Array:Clear
[code]  }
 private
 // private methods
   procedure Clear(const aCtx: TtfwContext;
    const aArray: ItfwValueList);
     {* Реализация слова скрипта Array:Clear }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayClear

// start class TkwArrayClear

procedure TkwArrayClear.Clear(const aCtx: TtfwContext;
  const aArray: ItfwValueList);
 {-}
begin
 aArray.Clear;
end;//TkwArrayClear.Clear

procedure TkwArrayClear.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Clear(aCtx, l_aArray);
end;//TkwArrayClear.DoDoIt

class function TkwArrayClear.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Clear';
end;//TkwArrayClear.GetWordNameForRegister

function TkwArrayClear.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwArrayClear.GetResultTypeInfo

type
 TkwArrayGetItem = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:GetItem
*Тип результата:* TtfwStackValue
*Пример:*
[code]
VAR l_TtfwStackValue
 anIndex aArray Array:GetItem >>> l_TtfwStackValue
[code]  }
 private
 // private methods
   function GetItem(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    anIndex: Integer): TtfwStackValue;
     {* Реализация слова скрипта Array:GetItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayGetItem

// start class TkwArrayGetItem

function TkwArrayGetItem.GetItem(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  anIndex: Integer): TtfwStackValue;
//#UC START# *66E011EC054E_E14E90E5EF2D_var*
//#UC END# *66E011EC054E_E14E90E5EF2D_var*
begin
//#UC START# *66E011EC054E_E14E90E5EF2D_impl*
 RunnerAssert(anIndex >= 0, 'Мне нужно положительное число.', aCtx);
 RunnerAssert(anIndex < aArray.Count, 'В массиве нет столько элементов.', aCtx);
 Result := aArray.Items[anIndex];
//#UC END# *66E011EC054E_E14E90E5EF2D_impl*
end;//TkwArrayGetItem.GetItem

procedure TkwArrayGetItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_anIndex : Integer;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.Push((GetItem(aCtx, l_aArray, l_anIndex)));
end;//TkwArrayGetItem.DoDoIt

class function TkwArrayGetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:GetItem';
end;//TkwArrayGetItem.GetWordNameForRegister

function TkwArrayGetItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiStruct;
end;//TkwArrayGetItem.GetResultTypeInfo

type
 TkwArrayReverted = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Reverted
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aArray Array:Reverted >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Reverted(const aCtx: TtfwContext;
    const aArray: ItfwValueList): ItfwValueList;
     {* Реализация слова скрипта Array:Reverted }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayReverted

// start class TkwArrayReverted

function TkwArrayReverted.Reverted(const aCtx: TtfwContext;
  const aArray: ItfwValueList): ItfwValueList;
//#UC START# *155569C67894_68189B4B7D71_var*
//#UC END# *155569C67894_68189B4B7D71_var*
begin
//#UC START# *155569C67894_68189B4B7D71_impl*
 Result := TtfwRevertedArrayView.Make(aArray);
//#UC END# *155569C67894_68189B4B7D71_impl*
end;//TkwArrayReverted.Reverted

procedure TkwArrayReverted.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Reverted(aCtx, l_aArray)));
end;//TkwArrayReverted.DoDoIt

class function TkwArrayReverted.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Reverted';
end;//TkwArrayReverted.GetWordNameForRegister

function TkwArrayReverted.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayReverted.GetResultTypeInfo

type
 TkwArrayFilter = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Filter
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aLambda aArray Array:Filter >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Filter(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    aLambda: TtfwWord): ItfwValueList;
     {* Реализация слова скрипта Array:Filter }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayFilter

// start class TkwArrayFilter

function TkwArrayFilter.Filter(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  aLambda: TtfwWord): ItfwValueList;
//#UC START# *781431CE844D_BE2AD2FE44CF_var*
//#UC END# *781431CE844D_BE2AD2FE44CF_var*
begin
//#UC START# *781431CE844D_BE2AD2FE44CF_impl*
 Result := TtfwFilteredArrayView.Make(aArray, aLambda);
//#UC END# *781431CE844D_BE2AD2FE44CF_impl*
end;//TkwArrayFilter.Filter

procedure TkwArrayFilter.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aLambda : TtfwWord;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Filter(aCtx, l_aArray, l_aLambda)));
end;//TkwArrayFilter.DoDoIt

class function TkwArrayFilter.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Filter';
end;//TkwArrayFilter.GetWordNameForRegister

function TkwArrayFilter.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayFilter.GetResultTypeInfo

type
 TkwArrayMap = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Map
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aLambda aArray Array:Map >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Map(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    aLambda: TtfwWord): ItfwValueList;
     {* Реализация слова скрипта Array:Map }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayMap

// start class TkwArrayMap

function TkwArrayMap.Map(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  aLambda: TtfwWord): ItfwValueList;
//#UC START# *7FA64661B5E5_4D82A8E4E72B_var*
//#UC END# *7FA64661B5E5_4D82A8E4E72B_var*
begin
//#UC START# *7FA64661B5E5_4D82A8E4E72B_impl*
 Result := TtfwMappedArrayView.Make(aArray, aLambda);
//#UC END# *7FA64661B5E5_4D82A8E4E72B_impl*
end;//TkwArrayMap.Map

procedure TkwArrayMap.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aLambda : TtfwWord;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Map(aCtx, l_aArray, l_aLambda)));
end;//TkwArrayMap.DoDoIt

class function TkwArrayMap.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Map';
end;//TkwArrayMap.GetWordNameForRegister

function TkwArrayMap.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayMap.GetResultTypeInfo

type
 TkwArrayIterate = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Iterate
*Пример:*
[code]
 aLambda aArray Array:Iterate
[code]  }
 private
 // private methods
   procedure Iterate(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    aLambda: TtfwWord);
     {* Реализация слова скрипта Array:Iterate }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayIterate

// start class TkwArrayIterate

procedure TkwArrayIterate.Iterate(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  aLambda: TtfwWord);
//#UC START# *78836988FFF5_67F9FD4545C9_var*
//#UC END# *78836988FFF5_67F9FD4545C9_var*
begin
//#UC START# *78836988FFF5_67F9FD4545C9_impl*
 aArray.ForEach(aLambda, aCtx);
//#UC END# *78836988FFF5_67F9FD4545C9_impl*
end;//TkwArrayIterate.Iterate

procedure TkwArrayIterate.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aLambda : TtfwWord;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Iterate(aCtx, l_aArray, l_aLambda);
end;//TkwArrayIterate.DoDoIt

class function TkwArrayIterate.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Iterate';
end;//TkwArrayIterate.GetWordNameForRegister

function TkwArrayIterate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwArrayIterate.GetResultTypeInfo

type
 TkwArrayAdd = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Add
*Пример:*
[code]
 aValue aArray Array:Add
[code]  }
 private
 // private methods
   procedure Add(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта Array:Add }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayAdd

// start class TkwArrayAdd

procedure TkwArrayAdd.Add(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  const aValue: TtfwStackValue);
 {-}
begin
 aArray.Add(aValue);
end;//TkwArrayAdd.Add

procedure TkwArrayAdd.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aValue : TtfwStackValue;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 Add(aCtx, l_aArray, l_aValue);
end;//TkwArrayAdd.DoDoIt

class function TkwArrayAdd.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Add';
end;//TkwArrayAdd.GetWordNameForRegister

function TkwArrayAdd.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwArrayAdd.GetResultTypeInfo

type
 TkwArrayFunctorToIterator = {final scriptword} class(TtfwRegisterableWord)
  {* Слово скрипта Array:FunctorToIterator
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aLambda Array:FunctorToIterator >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function FunctorToIterator(const aCtx: TtfwContext;
    aLambda: TtfwWord): ItfwValueList;
     {* Реализация слова скрипта Array:FunctorToIterator }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayFunctorToIterator

// start class TkwArrayFunctorToIterator

function TkwArrayFunctorToIterator.FunctorToIterator(const aCtx: TtfwContext;
  aLambda: TtfwWord): ItfwValueList;
//#UC START# *D84558AB12E8_AC4DA64FB94F_var*
//#UC END# *D84558AB12E8_AC4DA64FB94F_var*
begin
//#UC START# *D84558AB12E8_AC4DA64FB94F_impl*
 Result := TtfwIteratorFromFunctor.Make(aLambda);
//#UC END# *D84558AB12E8_AC4DA64FB94F_impl*
end;//TkwArrayFunctorToIterator.FunctorToIterator

procedure TkwArrayFunctorToIterator.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aLambda : TtfwWord;
begin
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((FunctorToIterator(aCtx, l_aLambda)));
end;//TkwArrayFunctorToIterator.DoDoIt

class function TkwArrayFunctorToIterator.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:FunctorToIterator';
end;//TkwArrayFunctorToIterator.GetWordNameForRegister

function TkwArrayFunctorToIterator.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayFunctorToIterator.GetResultTypeInfo

type
 TkwArraySetItem = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:SetItem
*Пример:*
[code]
 aValue anIndex aArray Array:SetItem
[code]  }
 private
 // private methods
   procedure SetItem(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    anIndex: Integer;
    const aValue: TtfwStackValue);
     {* Реализация слова скрипта Array:SetItem }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArraySetItem

// start class TkwArraySetItem

procedure TkwArraySetItem.SetItem(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  anIndex: Integer;
  const aValue: TtfwStackValue);
//#UC START# *5C8498486DBB_657EB53C9658_var*
//#UC END# *5C8498486DBB_657EB53C9658_var*
begin
//#UC START# *5C8498486DBB_657EB53C9658_impl*
 RunnerAssert(anIndex >= 0, 'Мне нужно положительное число.', aCtx);
 RunnerAssert(anIndex < aArray.Count, 'В массиве нет столько элементов.', aCtx);
 RunnerError('Недоделано', aCtx);
 //aArray.Items[anIndex] := aValue;
//#UC END# *5C8498486DBB_657EB53C9658_impl*
end;//TkwArraySetItem.SetItem

procedure TkwArraySetItem.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_anIndex : Integer;
 l_aValue : TtfwStackValue;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anIndex := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anIndex: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aValue := aCtx.rEngine.Pop;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aValue: TtfwStackValue : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 SetItem(aCtx, l_aArray, l_anIndex, l_aValue);
end;//TkwArraySetItem.DoDoIt

class function TkwArraySetItem.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:SetItem';
end;//TkwArraySetItem.GetWordNameForRegister

function TkwArraySetItem.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := @tfw_tiVoid;
end;//TkwArraySetItem.GetResultTypeInfo

type
 TkwArrayJoin = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Join
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 anOther aArray Array:Join >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Join(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    const anOther: ItfwValueList): ItfwValueList;
     {* Реализация слова скрипта Array:Join }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayJoin

// start class TkwArrayJoin

function TkwArrayJoin.Join(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  const anOther: ItfwValueList): ItfwValueList;
//#UC START# *AE1CCBE76617_F83E51FB5EAA_var*
//#UC END# *AE1CCBE76617_F83E51FB5EAA_var*
begin
//#UC START# *AE1CCBE76617_F83E51FB5EAA_impl*
 Result := TtfwJoinIterator.Make(aArray, anOther);
//#UC END# *AE1CCBE76617_F83E51FB5EAA_impl*
end;//TkwArrayJoin.Join

procedure TkwArrayJoin.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_anOther : ItfwValueList;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_anOther := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра anOther: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Join(aCtx, l_aArray, l_anOther)));
end;//TkwArrayJoin.DoDoIt

class function TkwArrayJoin.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Join';
end;//TkwArrayJoin.GetWordNameForRegister

function TkwArrayJoin.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayJoin.GetResultTypeInfo

type
 TkwArrayTrunc = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Trunc
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aLambda aArray Array:Trunc >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Trunc(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    aLambda: TtfwWord): ItfwValueList;
     {* Реализация слова скрипта Array:Trunc }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayTrunc

// start class TkwArrayTrunc

function TkwArrayTrunc.Trunc(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  aLambda: TtfwWord): ItfwValueList;
//#UC START# *3CA55B4BDAA5_BD92B7361A83_var*
//#UC END# *3CA55B4BDAA5_BD92B7361A83_var*
begin
//#UC START# *3CA55B4BDAA5_BD92B7361A83_impl*
 Result := TtfwTruncatedArrayView.Make(aArray, aLambda);
//#UC END# *3CA55B4BDAA5_BD92B7361A83_impl*
end;//TkwArrayTrunc.Trunc

procedure TkwArrayTrunc.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aLambda : TtfwWord;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aLambda := TtfwWord(aCtx.rEngine.PopObjAs(TtfwWord));
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aLambda: TtfwWord : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Trunc(aCtx, l_aArray, l_aLambda)));
end;//TkwArrayTrunc.DoDoIt

class function TkwArrayTrunc.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Trunc';
end;//TkwArrayTrunc.GetWordNameForRegister

function TkwArrayTrunc.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArrayTrunc.GetResultTypeInfo

type
 TkwArraySlice = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Slice
[panel]Возвращает итератор, который выдаёт наборы элементов по aCount штук[panel]
*Тип результата:* ItfwValueList
*Пример:*
[code]
ARRAY VAR l_ItfwValueList
 aCount aArray Array:Slice >>> l_ItfwValueList
[code]  }
 private
 // private methods
   function Slice(const aCtx: TtfwContext;
    const aArray: ItfwValueList;
    aCount: Integer): ItfwValueList;
     {* Реализация слова скрипта Array:Slice }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArraySlice

// start class TkwArraySlice

function TkwArraySlice.Slice(const aCtx: TtfwContext;
  const aArray: ItfwValueList;
  aCount: Integer): ItfwValueList;
//#UC START# *A24C2DBFCDED_2892AD069398_var*
//#UC END# *A24C2DBFCDED_2892AD069398_var*
begin
//#UC START# *A24C2DBFCDED_2892AD069398_impl*
 Result := TtfwSliceView.Make(aArray, aCount);
//#UC END# *A24C2DBFCDED_2892AD069398_impl*
end;//TkwArraySlice.Slice

procedure TkwArraySlice.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
 l_aCount : Integer;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 try
  l_aCount := aCtx.rEngine.PopInt;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aCount: Integer : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushList((Slice(aCtx, l_aArray, l_aCount)));
end;//TkwArraySlice.DoDoIt

class function TkwArraySlice.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Slice';
end;//TkwArraySlice.GetWordNameForRegister

function TkwArraySlice.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(ItfwValueList);
end;//TkwArraySlice.GetResultTypeInfo

type
 TkwArrayCount = {final scriptword} class(TtfwClassLike)
  {* Слово скрипта Array:Count
*Тип результата:* Integer
*Пример:*
[code]
INTEGER VAR l_Integer
 aArray Array:Count >>> l_Integer
[code]  }
 private
 // private methods
   function Count(const aCtx: TtfwContext;
    const aArray: ItfwValueList): Integer;
     {* Реализация слова скрипта Array:Count }
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
 end;//TkwArrayCount

// start class TkwArrayCount

function TkwArrayCount.Count(const aCtx: TtfwContext;
  const aArray: ItfwValueList): Integer;
 {-}
begin
 Result := aArray.Count;
end;//TkwArrayCount.Count

procedure TkwArrayCount.DoDoIt(const aCtx: TtfwContext);
 {-}
var
 l_aArray : ItfwValueList;
begin
 try
  l_aArray := aCtx.rEngine.PopList;
 except
  on E: Exception do
  begin
   RunnerError('Ошибка при получении параметра aArray: ItfwValueList : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushInt((Count(aCtx, l_aArray)));
end;//TkwArrayCount.DoDoIt

class function TkwArrayCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'Array:Count';
end;//TkwArrayCount.GetWordNameForRegister

procedure TkwArrayCount.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
 {-}
begin
 RunnerError('Нельзя присваивать значение readonly свойству Count', aCtx);
end;//TkwArrayCount.SetValue

function TkwArrayCount.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
 {-}
begin
 Result := TypeInfo(Integer);
end;//TkwArrayCount.GetResultTypeInfo
{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledArray
 TkwCompiledArray.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация CloseArray
 TkwCloseArray.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация OpenArray
 TkwOpenArray.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация скриптованой аксиоматики
 TArrayProcessingPackResNameGetter.Register;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Clear
 TkwArrayClear.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_GetItem
 TkwArrayGetItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Reverted
 TkwArrayReverted.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Filter
 TkwArrayFilter.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Map
 TkwArrayMap.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Iterate
 TkwArrayIterate.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Add
 TkwArrayAdd.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_FunctorToIterator
 TkwArrayFunctorToIterator.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_SetItem
 TkwArraySetItem.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Join
 TkwArrayJoin.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Trunc
 TkwArrayTrunc.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Slice
 TkwArraySlice.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация Array_Count
 TkwArrayCount.RegisterInEngine;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwContext
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа ItfwValueList
 TtfwTypeRegistrator.RegisterType(TypeInfo(ItfwValueList));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа Integer
 TtfwTypeRegistrator.RegisterType(TypeInfo(Integer));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwWord
 TtfwTypeRegistrator.RegisterType(TypeInfo(TtfwWord));
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация типа TtfwStackValue
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
{$IfEnd} //not NoScripts

end.