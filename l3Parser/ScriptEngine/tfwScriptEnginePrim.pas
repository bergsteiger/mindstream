unit tfwScriptEnginePrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwScriptEnginePrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ScriptEngineCore::TtfwScriptEnginePrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  tfwValueStack,
  tfwCompilingWord,
  tfwWordRefList,
  tfwStreamFactory,
  tfwSourcePointList,
  tfwDictionaryStack,
  tfwDictionaryEx,
  tfwMainDictionary,
  tfwDictionaryList,
  tfwInitedDictionariesList,
  tfwScriptEngineExInterfaces,
  kwCompiledWordPrim,
  l3Variant,
  tfwTypeInfo,
  Types,
  tfwDictionaryPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwScriptEnginePrim = {abstract} class(TtfwCompilingWord, ItfwScriptEngine, ItfwScriptEngineEx)
 private
 // private fields
   f_UserDictionary : TtfwDictionaryEx;
   f_ScriptFileName : AnsiString;
   f_ExceptionStack : TtfwSourcePointList;
   f_Dictionaries : TtfwDictionaryList;
   f_DictionariesStack : TtfwDictionaryStack;
   f_InitedDictionaries : TtfwInitedDictionariesList;
   f_CascadeDict : Boolean;
   f_DisabledForHelp : TtfwWordRefList;
   f_ValueStack : TtfwValueStack;
    {* Поле для свойства ValueStack}
   f_MainDictionary : TtfwMainDictionary;
    {* Поле для свойства MainDictionary}
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function Get_ValuesCount: Integer;
   function Clone: ItfwScriptEngine;
   procedure WordFail(const aPoint: TtfwSourcePoint);
   procedure WordSuccess;
     {* Сигнатура метода WordSuccess }
   procedure ExceptionStackToLog;
     {* Сигнатура метода ExceptionStackToLog }
   function ExceptionStack: ItfwValueList;
   procedure FailToLog;
     {* Сигнатура метода FailToLog }
   function OpenDictionary(var aCtx: TtfwContext): Boolean;
   procedure CloseDictionary(const aCtx: TtfwContext);
   procedure AddInitialization(const aCtx: TtfwContext;
     aWord: TtfwWord);
   function CurrentCompilingDictionary: TtfwDictionaryPrim;
   function Get_CascadeDict: Boolean;
   procedure Set_CascadeDict(aValue: Boolean);
   procedure DisableForHelp(aWord: TtfwWord);
   function Get_Dictionaries: TtfwDictionaryList;
   function Get_InitedDictionaries: TtfwInitedDictionariesList;
   function Get_MainDictionary: TtfwMainDictionary;
   function Get_DisabledForHelp: TtfwWordRefList;
 public
 // realized methods
   procedure PushInt(aValue: Integer);
   function PopInt: Integer;
   procedure PushBool(aValue: Boolean);
   function PopBool: Boolean;
   function IsTopBool: Boolean;
   procedure PushString(const aString: AnsiString); overload; 
   procedure PushString(const aString: Il3CString); overload; 
   procedure PushString(aString: Tl3PrimString); overload; 
   function IsTopString: Boolean;
   function PopDelphiString: AnsiString;
   function PopString: Il3CString;
   function IsTopInt: Boolean;
   procedure Dup;
   procedure Drop;
   procedure Swap;
   procedure Push(const aValue: TtfwStackValue);
   function Pop: TtfwStackValue;
   function IsTopType(aType: TtfwValueType): Boolean;
   procedure PushObj(aValue: TObject);
   function PopObj: TObject;
   procedure DupIfNotZero;
   procedure Rot;
   procedure Pick;
   procedure InvertRot;
   procedure Swap2;
   procedure Over2;
   procedure Dup2;
   procedure Drop2;
   procedure Nip;
   procedure Tuck;
   procedure Over;
   procedure Roll;
   procedure PushIntf(const anIntf: IUnknown);
   function PopIntf(const aGUID: TGUID): IUnknown; overload; 
   function PopIntf: IUnknown; overload; 
   function IsTopIntf: Boolean;
     {* Определяет - лежит ли на верхушке стека интерфейс }
   procedure PushString(const aString: Tl3WString); overload; 
   procedure PushFile(const aFile: ItfwFile);
   function PopFile: ItfwFile;
   function IsTopObj: Boolean;
   function IsTopChar: Boolean;
   procedure PushChar(aChar: AnsiChar);
   function PopChar: AnsiChar;
   procedure PushWStr(const aStr: Tl3WString);
   function PopWStr: Tl3WString;
   function IsTopWStr: Boolean;
   function PopPrintable: Il3CString;
   function IsTopBracket: Boolean;
   procedure PushBracket;
   procedure PushClass(aClass: TClass);
   function PopClass: TClass;
   function IsTopClass: Boolean;
   function PopObjAs(aClass: TClass): Pointer;
   function PopClassAs(aClass: TClass): Pointer;
   function PopWideString: WideString;
   procedure PushWideString(const aValue: WideString);
   function PopPoint: TPoint;
   procedure PushPoint(const aPoint: TPoint);
   procedure PushList(const aList: ItfwValueList);
   function PopList: ItfwValueList;
   procedure DupN(aN: Integer);
   procedure DropN(aN: Integer);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoAddCodePart(aWord: TtfwWord;
     const aCtx: TtfwContext;
     aSNI: TtfwSuppressNextImmediate); override;
   procedure AfterCompile(var theNewContext: TtfwContext;
     aCompiled: TkwCompiledWordPrim); override;
   function GetNewWordDefinitor: TtfwWord; override;
   function GetKeywordFinder(const aCtx: TtfwContext): TtfwWord; override;
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; override;
   function GetKeywordByName(const aName: Il3CString): Tl3PrimString; override;
   function GetParentFinder: TtfwWord; override;
 public
 // overridden public methods
   function GetCompiler(const aCtx: TtfwContext): TtfwWord; override;
 protected
 // protected methods
   procedure RunInitCode(const aCtx: TtfwContext);
   function CacheDict: Boolean; virtual;
   class function Shift(anIndent: Integer): Il3CString;
 public
 // public methods
   procedure Script(aStream: TtfwStreamFactory;
     const aCaller: ItfwScriptCaller); virtual;
   procedure EnterCode(const aCtx: TtfwContext);
   procedure LeaveCode(const aCtx: TtfwContext);
   procedure RunCompiled(const aContext: TtfwContext); virtual;
 protected
 // protected properties
   property MainDictionary: TtfwMainDictionary
     read f_MainDictionary;
 public
 // public properties
   property ValueStack: TtfwValueStack
     read f_ValueStack;
 end;//TtfwScriptEnginePrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  l3String,
  SysUtils,
  l3StringList,
  l3Types,
  tfwParser,
  l3Filer,
  l3Parser,
  l3Chars,
  l3Stream,
  tfwStoredValuesStack,
  tfwAutoregisteredDiction,
  l3Memory,
  seWordsInfo,
  l3ScriptService,
  tfwArray,
  tfwParserInterfaces,
  tfwDictionaryListPrim,
  tfwDictionaryPtrList
  {$If defined(seCacheDict) AND not defined(NoScripts)}
  ,
  tfwDictionaryCache
  {$IfEnd} //seCacheDict AND not NoScripts
  ,
  tfwStoredValuesGlobalStack,
  seThreadSupport
  {$If defined(seCacheDict) AND not defined(NoScripts)}
  ,
  tfwMainDictionaryCache
  {$IfEnd} //seCacheDict AND not NoScripts
  ,
  tfwMainDictionaryList,
  tfwStandardDictionaries,
  ItfwScriptEngineWordsPack
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwScriptEnginePrim

procedure TtfwScriptEnginePrim.Script(aStream: TtfwStreamFactory;
  const aCaller: ItfwScriptCaller);
//#UC START# *4F733B9C0064_4F733A0701F0_var*

 {$IfDef seCacheDict}
 procedure ValidateCode;
 begin//ValidateCode
  TtfwDictionaryCache.Instance.RemoveNotValid;
  TtfwMainDictionaryCache.Instance.RemoveNotValid;
 end;//ValidateCode
 {$EndIf seCacheDict}

var
 l_P : ItfwParserEx;
 l_Ctx : TtfwContext;
 {$IfDef seCacheDict}
 l_D : TtfwMainDictionary;
 {$EndIf seCacheDict}
 l_N : Il3CString;
 l_NeedCompile : Boolean;
//#UC END# *4F733B9C0064_4F733A0701F0_var*
begin
//#UC START# *4F733B9C0064_4F733A0701F0_impl*
 Assert(f_UserDictionary = nil);
 {$IfDef seCacheDict}
 if Self.CacheDict then
  ValidateCode;
 {$EndIf seCacheDict}
 f_UserDictionary := nil;
 try
  f_Dictionaries := TtfwDictionaryList.Create;
  try
   f_CascadeDict := true;
   f_ScriptFileName := aStream.FileName;
   l_N := TtfwCStringFactory.C(f_ScriptFileName);
   l_NeedCompile := true;
   {$IfDef seCacheDict}
   if Self.CacheDict then
   begin
    l_D := TtfwMainDictionaryCache.Instance.FindDictionary(l_N);
    if (l_D <> nil) then
    begin
     l_D.SetRefTo(f_MainDictionary);
     l_NeedCompile := false;
    end//l_D <> nil
    else
    begin
     f_MainDictionary := TtfwMainDictionary.Create(aStream, [TtfwAutoregisteredDiction.Instance]);
     TtfwMainDictionaryCache.Instance.Add(f_MainDictionary);
    end;//l_D <> nil
   end//Self.CacheDict
   else
   {$EndIf seCacheDict}
    f_MainDictionary := TtfwMainDictionary.Create(aStream, [TtfwAutoregisteredDiction.Instance]);
   try
    f_MainDictionary.SetRefTo(f_UserDictionary);
    f_Dictionaries.Add(f_MainDictionary);
    if l_NeedCompile then
     l_P := TtfwParser.Make(aStream)
    else
     l_P := nil;
    try
     l3FillChar(l_Ctx, SizeOf(l_Ctx));
     l_Ctx.rCaller := aCaller;
     l_Ctx.rEngine := Self;
     l_Ctx.rParser := l_P;
     l_Ctx.rCompiler := Self;
     //l_Ctx.rCompiler := nil;
     l_Ctx.rException := nil;
     l_Ctx.rTypeInfo := TtfwWordInfoE.Instance;
     l_Ctx.rStoredValuesStack := TtfwStoredValuesStack.Make;
     l_Ctx.rStreamFactory := aStream;
     try
      if l_NeedCompile then
      begin
       try
        try
         l_Ctx.rKeyWords := Self;
         try
          try
           Self.DoIt(l_Ctx);
          except
           ExceptionStackToLog;
           {$IfDef seCacheDict}
           if Self.CacheDict then
            TtfwMainDictionaryCache.Instance.Remove(f_MainDictionary);
           {$EndIf seCacheDict}
           raise;
          end;//try..except
          if (l_Ctx.rEngine.ValuesCount <> 0) then
           CompilerAssert(false,
                  'После компиляции стек должнен быть пустой: ' +
                  f_ScriptFileName +
                  ' Верхнее значение стека: ' + l3Str(l_Ctx.rEngine.PopPrintable) +
                  ' Оставшееся количество элементов: ' + IntToStr(l_Ctx.rEngine.ValuesCount),
                  l_Ctx);
         finally
          l_Ctx.rKeyWords := nil;
         end;//try..finally
        finally
         l_P := nil;
        end;//try..finally

        FreeAndNil(f_ExceptionStack);
       finally
        try
         l_Ctx.rParser := nil;
        finally
         aStream.CloseStream;
        end;//try..finally 
       end;//try..finally
      end;//l_NeedCompile
      try
       if not aCaller.CompileOnly then
       begin
        Tl3ScriptService.Instance.EnterScript;
        try
         Self.RunCompiled(l_Ctx);
        finally
         Tl3ScriptService.Instance.LeaveScript;
        end;//try..finally 
       end;//not aCaller.CompileOnly
      except
       on EtfwExit do
        ;
       on EtfwHalt do
        ;
       else
       begin
        FailToLog;
        raise;
       end;//else
      end;//try..except
      if (l_Ctx.rEngine.ValuesCount <> 0) then
       RunnerError(
              'После выполнения стек должнен быть пустой: ' +
              f_ScriptFileName +
              ' Верхнее значение стека: ' + l3Str(l_Ctx.rEngine.PopPrintable) +
              ' Оставшееся количество элементов: ' + IntToStr(l_Ctx.rEngine.ValuesCount + 1),
              l_Ctx);

     finally
      try
       l_Ctx.rEngine := nil;
      finally
       l_Ctx.rStoredValuesStack := nil
      end;//try..finally
     end;//try..finally
    finally
     l_P := nil;
    end;//try..finally
   finally
    FreeAndNil(f_MainDictionary);
   end;//try..finally
  finally
   FreeAndNil(f_Dictionaries);
  end;//try..finally
 finally
  FreeAndNil(f_UserDictionary);
 end;//try..finally
//#UC END# *4F733B9C0064_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Script

procedure TtfwScriptEnginePrim.RunInitCode(const aCtx: TtfwContext);
//#UC START# *55A3BFB102D7_4F733A0701F0_var*
//#UC END# *55A3BFB102D7_4F733A0701F0_var*
begin
//#UC START# *55A3BFB102D7_4F733A0701F0_impl*
 RunnerAssert(f_MainDictionary <> nil, 'Код не скомпилирован', aCtx);
 RunnerAssert(f_InitedDictionaries = nil, 'Рекурсивный вызов', aCtx);
 f_InitedDictionaries := TtfwInitedDictionariesList.Create;
 f_MainDictionary.RunInitCode(f_InitedDictionaries, aCtx)
//#UC END# *55A3BFB102D7_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.RunInitCode

procedure TtfwScriptEnginePrim.EnterCode(const aCtx: TtfwContext);
//#UC START# *55A5290003B5_4F733A0701F0_var*
//#UC END# *55A5290003B5_4F733A0701F0_var*
begin
//#UC START# *55A5290003B5_4F733A0701F0_impl*
 RunInitCode(aCtx);
//#UC END# *55A5290003B5_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.EnterCode

procedure TtfwScriptEnginePrim.LeaveCode(const aCtx: TtfwContext);
//#UC START# *55A5291701A8_4F733A0701F0_var*
var
 l_Index : Integer;
//#UC END# *55A5291701A8_4F733A0701F0_var*
begin
//#UC START# *55A5291701A8_4F733A0701F0_impl*
 try
  if TseWorkThreadList.Exists then
   TseWorkThreadList.Instance.WaitForAllThreads;
  if (f_InitedDictionaries <> nil) then
   for l_Index := 0 to Pred(f_InitedDictionaries.Count) do
    aCtx.rStoredValuesStack.Restore(aCtx);
  // - восстанавливаем значения переменных
 finally
  FreeAndNil(f_InitedDictionaries);
 end;//try..finally 
//#UC END# *55A5291701A8_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.LeaveCode

procedure TtfwScriptEnginePrim.RunCompiled(const aContext: TtfwContext);
//#UC START# *4DC90A79006D_4F733A0701F0_var*
//#UC END# *4DC90A79006D_4F733A0701F0_var*
begin
//#UC START# *4DC90A79006D_4F733A0701F0_impl*
 RunnerAssert(f_MainDictionary <> nil, 'Код пустой', aContext);
 RunnerAssert(f_MainDictionary.CompiledCode <> nil, 'Код пустой', aContext);
 EnterCode(aContext);
 try
  f_MainDictionary.CompiledCode.DoIt(aContext);
 finally
  LeaveCode(aContext);
 end;//try..finally
//#UC END# *4DC90A79006D_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.RunCompiled

function TtfwScriptEnginePrim.CacheDict: Boolean;
//#UC START# *55AF8A9D03A2_4F733A0701F0_var*
//#UC END# *55AF8A9D03A2_4F733A0701F0_var*
begin
//#UC START# *55AF8A9D03A2_4F733A0701F0_impl*
 Result := true;
//#UC END# *55AF8A9D03A2_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.CacheDict

class function TtfwScriptEnginePrim.Shift(anIndent: Integer): Il3CString;
//#UC START# *55E9C2600353_4F733A0701F0_var*
//#UC END# *55E9C2600353_4F733A0701F0_var*
begin
//#UC START# *55E9C2600353_4F733A0701F0_impl*
 if (anIndent > 0) then
  Result := TtfwCStringFactory.C(ev_psFixLen('', anIndent, #32))
 else
  Result := nil;
//#UC END# *55E9C2600353_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Shift

procedure TtfwScriptEnginePrim.PushInt(aValue: Integer);
//#UC START# *4DB008F503BE_4F733A0701F0_var*
//#UC END# *4DB008F503BE_4F733A0701F0_var*
begin
//#UC START# *4DB008F503BE_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushInt(aValue);
//#UC END# *4DB008F503BE_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushInt

function TtfwScriptEnginePrim.PopInt: Integer;
//#UC START# *4DB0090A0000_4F733A0701F0_var*
//#UC END# *4DB0090A0000_4F733A0701F0_var*
begin
//#UC START# *4DB0090A0000_4F733A0701F0_impl*
 Assert(f_ValueStack <> nil);
 Result := f_ValueStack.PopInt;
//#UC END# *4DB0090A0000_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopInt

procedure TtfwScriptEnginePrim.PushBool(aValue: Boolean);
//#UC START# *4DB013A10166_4F733A0701F0_var*
//#UC END# *4DB013A10166_4F733A0701F0_var*
begin
//#UC START# *4DB013A10166_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushBool(aValue);
//#UC END# *4DB013A10166_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushBool

function TtfwScriptEnginePrim.PopBool: Boolean;
//#UC START# *4DB013AF01C9_4F733A0701F0_var*
//#UC END# *4DB013AF01C9_4F733A0701F0_var*
begin
//#UC START# *4DB013AF01C9_4F733A0701F0_impl*
 Assert(f_ValueStack <> nil);
 Result := f_ValueStack.PopBool;
//#UC END# *4DB013AF01C9_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopBool

function TtfwScriptEnginePrim.IsTopBool: Boolean;
//#UC START# *4DB04213007C_4F733A0701F0_var*
//#UC END# *4DB04213007C_4F733A0701F0_var*
begin
//#UC START# *4DB04213007C_4F733A0701F0_impl*
 if f_ValueStack.Empty then
  Result := false
 else
  Result := f_ValueStack.IsTopBool;  
//#UC END# *4DB04213007C_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopBool

procedure TtfwScriptEnginePrim.PushString(const aString: AnsiString);
//#UC START# *4DB047EF0005_4F733A0701F0_var*
//#UC END# *4DB047EF0005_4F733A0701F0_var*
begin
//#UC START# *4DB047EF0005_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushString(aString);
//#UC END# *4DB047EF0005_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushString

procedure TtfwScriptEnginePrim.PushString(const aString: Il3CString);
//#UC START# *4DB0480002EF_4F733A0701F0_var*
//#UC END# *4DB0480002EF_4F733A0701F0_var*
begin
//#UC START# *4DB0480002EF_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushString(aString);
//#UC END# *4DB0480002EF_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushString

procedure TtfwScriptEnginePrim.PushString(aString: Tl3PrimString);
//#UC START# *4DB0480A0174_4F733A0701F0_var*
//#UC END# *4DB0480A0174_4F733A0701F0_var*
begin
//#UC START# *4DB0480A0174_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushString(aString);
//#UC END# *4DB0480A0174_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushString

function TtfwScriptEnginePrim.IsTopString: Boolean;
//#UC START# *4DB0488A0157_4F733A0701F0_var*
//#UC END# *4DB0488A0157_4F733A0701F0_var*
begin
//#UC START# *4DB0488A0157_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopString;
//#UC END# *4DB0488A0157_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopString

function TtfwScriptEnginePrim.PopDelphiString: AnsiString;
//#UC START# *4DB0489C0129_4F733A0701F0_var*
//#UC END# *4DB0489C0129_4F733A0701F0_var*
begin
//#UC START# *4DB0489C0129_4F733A0701F0_impl*
 Result := f_ValueStack.PopDelphiString;
//#UC END# *4DB0489C0129_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopDelphiString

function TtfwScriptEnginePrim.PopString: Il3CString;
//#UC START# *4DB1784F0388_4F733A0701F0_var*
//#UC END# *4DB1784F0388_4F733A0701F0_var*
begin
//#UC START# *4DB1784F0388_4F733A0701F0_impl*
 Result := f_ValueStack.PopString;
//#UC END# *4DB1784F0388_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopString

function TtfwScriptEnginePrim.IsTopInt: Boolean;
//#UC START# *4DB17E8502F0_4F733A0701F0_var*
//#UC END# *4DB17E8502F0_4F733A0701F0_var*
begin
//#UC START# *4DB17E8502F0_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopInt;
//#UC END# *4DB17E8502F0_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopInt

function TtfwScriptEnginePrim.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F733A0701F0_var*
//#UC END# *4DB6C99F026E_4F733A0701F0_var*
begin
//#UC START# *4DB6C99F026E_4F733A0701F0_impl*
 Result := nil;
//#UC END# *4DB6C99F026E_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.EndBracket

procedure TtfwScriptEnginePrim.Dup;
//#UC START# *4DB6EE5E031F_4F733A0701F0_var*
//#UC END# *4DB6EE5E031F_4F733A0701F0_var*
begin
//#UC START# *4DB6EE5E031F_4F733A0701F0_impl*
 f_ValueStack.Dup;
//#UC END# *4DB6EE5E031F_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Dup

procedure TtfwScriptEnginePrim.Drop;
//#UC START# *4DB6F04F02D2_4F733A0701F0_var*
//#UC END# *4DB6F04F02D2_4F733A0701F0_var*
begin
//#UC START# *4DB6F04F02D2_4F733A0701F0_impl*
 f_ValueStack.Drop;
//#UC END# *4DB6F04F02D2_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Drop

procedure TtfwScriptEnginePrim.Swap;
//#UC START# *4DB704AA00BF_4F733A0701F0_var*
//#UC END# *4DB704AA00BF_4F733A0701F0_var*
begin
//#UC START# *4DB704AA00BF_4F733A0701F0_impl*
 f_ValueStack.Swap;
//#UC END# *4DB704AA00BF_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Swap

procedure TtfwScriptEnginePrim.Push(const aValue: TtfwStackValue);
//#UC START# *4DBAF89E0328_4F733A0701F0_var*
//#UC END# *4DBAF89E0328_4F733A0701F0_var*
begin
//#UC START# *4DBAF89E0328_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.Push(aValue);
//#UC END# *4DBAF89E0328_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Push

function TtfwScriptEnginePrim.Pop: TtfwStackValue;
//#UC START# *4DBAF8B002CA_4F733A0701F0_var*
//#UC END# *4DBAF8B002CA_4F733A0701F0_var*
begin
//#UC START# *4DBAF8B002CA_4F733A0701F0_impl*
 Result := f_ValueStack.Pop;
//#UC END# *4DBAF8B002CA_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Pop

function TtfwScriptEnginePrim.IsTopType(aType: TtfwValueType): Boolean;
//#UC START# *4DBAF8C200E2_4F733A0701F0_var*
//#UC END# *4DBAF8C200E2_4F733A0701F0_var*
begin
//#UC START# *4DBAF8C200E2_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopType(aType);
//#UC END# *4DBAF8C200E2_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopType

procedure TtfwScriptEnginePrim.PushObj(aValue: TObject);
//#UC START# *4DBAF910011B_4F733A0701F0_var*
//#UC END# *4DBAF910011B_4F733A0701F0_var*
begin
//#UC START# *4DBAF910011B_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushObj(aValue);
//#UC END# *4DBAF910011B_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushObj

function TtfwScriptEnginePrim.PopObj: TObject;
//#UC START# *4DBAF9210150_4F733A0701F0_var*
//#UC END# *4DBAF9210150_4F733A0701F0_var*
begin
//#UC START# *4DBAF9210150_4F733A0701F0_impl*
 Result := f_ValueStack.PopObj;
//#UC END# *4DBAF9210150_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopObj

procedure TtfwScriptEnginePrim.DupIfNotZero;
//#UC START# *4DCBD16302CD_4F733A0701F0_var*
//#UC END# *4DCBD16302CD_4F733A0701F0_var*
begin
//#UC START# *4DCBD16302CD_4F733A0701F0_impl*
 f_ValueStack.DupIfNotZero;
//#UC END# *4DCBD16302CD_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DupIfNotZero

procedure TtfwScriptEnginePrim.Rot;
//#UC START# *4DEF28E400E0_4F733A0701F0_var*
//#UC END# *4DEF28E400E0_4F733A0701F0_var*
begin
//#UC START# *4DEF28E400E0_4F733A0701F0_impl*
 f_ValueStack.Rot;
//#UC END# *4DEF28E400E0_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Rot

procedure TtfwScriptEnginePrim.Pick;
//#UC START# *4DEF5D850232_4F733A0701F0_var*
//#UC END# *4DEF5D850232_4F733A0701F0_var*
begin
//#UC START# *4DEF5D850232_4F733A0701F0_impl*
 f_ValueStack.Pick;
//#UC END# *4DEF5D850232_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Pick

procedure TtfwScriptEnginePrim.InvertRot;
//#UC START# *4DEF5FBB0157_4F733A0701F0_var*
//#UC END# *4DEF5FBB0157_4F733A0701F0_var*
begin
//#UC START# *4DEF5FBB0157_4F733A0701F0_impl*
 f_ValueStack.InvertRot;
//#UC END# *4DEF5FBB0157_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.InvertRot

procedure TtfwScriptEnginePrim.Swap2;
//#UC START# *4DEF5FE202B1_4F733A0701F0_var*
//#UC END# *4DEF5FE202B1_4F733A0701F0_var*
begin
//#UC START# *4DEF5FE202B1_4F733A0701F0_impl*
 f_ValueStack.Swap2;
//#UC END# *4DEF5FE202B1_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Swap2

procedure TtfwScriptEnginePrim.Over2;
//#UC START# *4DEF5FF802E6_4F733A0701F0_var*
//#UC END# *4DEF5FF802E6_4F733A0701F0_var*
begin
//#UC START# *4DEF5FF802E6_4F733A0701F0_impl*
 f_ValueStack.Over2;
//#UC END# *4DEF5FF802E6_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Over2

procedure TtfwScriptEnginePrim.Dup2;
//#UC START# *4DEF60050174_4F733A0701F0_var*
//#UC END# *4DEF60050174_4F733A0701F0_var*
begin
//#UC START# *4DEF60050174_4F733A0701F0_impl*
 f_ValueStack.Dup2;
//#UC END# *4DEF60050174_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Dup2

procedure TtfwScriptEnginePrim.Drop2;
//#UC START# *4DEF6013023F_4F733A0701F0_var*
//#UC END# *4DEF6013023F_4F733A0701F0_var*
begin
//#UC START# *4DEF6013023F_4F733A0701F0_impl*
 f_ValueStack.Drop2;
//#UC END# *4DEF6013023F_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Drop2

procedure TtfwScriptEnginePrim.Nip;
//#UC START# *4DEF602000E4_4F733A0701F0_var*
//#UC END# *4DEF602000E4_4F733A0701F0_var*
begin
//#UC START# *4DEF602000E4_4F733A0701F0_impl*
 f_ValueStack.Nip;
//#UC END# *4DEF602000E4_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Nip

procedure TtfwScriptEnginePrim.Tuck;
//#UC START# *4DEF602B03A2_4F733A0701F0_var*
//#UC END# *4DEF602B03A2_4F733A0701F0_var*
begin
//#UC START# *4DEF602B03A2_4F733A0701F0_impl*
 f_ValueStack.Tuck;
//#UC END# *4DEF602B03A2_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Tuck

procedure TtfwScriptEnginePrim.Over;
//#UC START# *4DF06491010E_4F733A0701F0_var*
//#UC END# *4DF06491010E_4F733A0701F0_var*
begin
//#UC START# *4DF06491010E_4F733A0701F0_impl*
 f_ValueStack.Over;
//#UC END# *4DF06491010E_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Over

procedure TtfwScriptEnginePrim.Roll;
//#UC START# *4DF0649B0073_4F733A0701F0_var*
//#UC END# *4DF0649B0073_4F733A0701F0_var*
begin
//#UC START# *4DF0649B0073_4F733A0701F0_impl*
 f_ValueStack.Roll;
//#UC END# *4DF0649B0073_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Roll

procedure TtfwScriptEnginePrim.PushIntf(const anIntf: IUnknown);
//#UC START# *4EB2747D0294_4F733A0701F0_var*
//#UC END# *4EB2747D0294_4F733A0701F0_var*
begin
//#UC START# *4EB2747D0294_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushIntf(anIntf);
//#UC END# *4EB2747D0294_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushIntf

function TtfwScriptEnginePrim.PopIntf(const aGUID: TGUID): IUnknown;
//#UC START# *4EB274C402BC_4F733A0701F0_var*
//#UC END# *4EB274C402BC_4F733A0701F0_var*
begin
//#UC START# *4EB274C402BC_4F733A0701F0_impl*
 Result := f_ValueStack.PopIntf(aGUID);
//#UC END# *4EB274C402BC_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopIntf

function TtfwScriptEnginePrim.PopIntf: IUnknown;
//#UC START# *4EB274E201C2_4F733A0701F0_var*
//#UC END# *4EB274E201C2_4F733A0701F0_var*
begin
//#UC START# *4EB274E201C2_4F733A0701F0_impl*
 Result := f_ValueStack.PopIntf;
//#UC END# *4EB274E201C2_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopIntf

function TtfwScriptEnginePrim.IsTopIntf: Boolean;
//#UC START# *4EB2759D021C_4F733A0701F0_var*
//#UC END# *4EB2759D021C_4F733A0701F0_var*
begin
//#UC START# *4EB2759D021C_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopIntf;
//#UC END# *4EB2759D021C_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopIntf

function TtfwScriptEnginePrim.Get_ValuesCount: Integer;
//#UC START# *4F3E34A1009A_4F733A0701F0get_var*
//#UC END# *4F3E34A1009A_4F733A0701F0get_var*
begin
//#UC START# *4F3E34A1009A_4F733A0701F0get_impl*
 if (f_ValueStack = nil) then
  Result := 0
 else
  Result := f_ValueStack.Count;
//#UC END# *4F3E34A1009A_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_ValuesCount

procedure TtfwScriptEnginePrim.PushString(const aString: Tl3WString);
//#UC START# *4F4749150158_4F733A0701F0_var*
//#UC END# *4F4749150158_4F733A0701F0_var*
begin
//#UC START# *4F4749150158_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushString(aString);
//#UC END# *4F4749150158_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushString

procedure TtfwScriptEnginePrim.PushFile(const aFile: ItfwFile);
//#UC START# *4F4FD9790124_4F733A0701F0_var*
//#UC END# *4F4FD9790124_4F733A0701F0_var*
begin
//#UC START# *4F4FD9790124_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushFile(aFile);
//#UC END# *4F4FD9790124_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushFile

function TtfwScriptEnginePrim.PopFile: ItfwFile;
//#UC START# *4F4FD99A0182_4F733A0701F0_var*
//#UC END# *4F4FD99A0182_4F733A0701F0_var*
begin
//#UC START# *4F4FD99A0182_4F733A0701F0_impl*
 Result := f_ValueStack.PopFile;
//#UC END# *4F4FD99A0182_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopFile

function TtfwScriptEnginePrim.IsTopObj: Boolean;
//#UC START# *4F4FDC210286_4F733A0701F0_var*
//#UC END# *4F4FDC210286_4F733A0701F0_var*
begin
//#UC START# *4F4FDC210286_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopObj;
//#UC END# *4F4FDC210286_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopObj

function TtfwScriptEnginePrim.IsTopChar: Boolean;
//#UC START# *4F4FDCFB0195_4F733A0701F0_var*
//#UC END# *4F4FDCFB0195_4F733A0701F0_var*
begin
//#UC START# *4F4FDCFB0195_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopChar;
//#UC END# *4F4FDCFB0195_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopChar

procedure TtfwScriptEnginePrim.PushChar(aChar: AnsiChar);
//#UC START# *4F4FDD140127_4F733A0701F0_var*
//#UC END# *4F4FDD140127_4F733A0701F0_var*
begin
//#UC START# *4F4FDD140127_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushChar(aChar);
//#UC END# *4F4FDD140127_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushChar

function TtfwScriptEnginePrim.PopChar: AnsiChar;
//#UC START# *4F4FDD38028A_4F733A0701F0_var*
//#UC END# *4F4FDD38028A_4F733A0701F0_var*
begin
//#UC START# *4F4FDD38028A_4F733A0701F0_impl*
 Result := f_ValueStack.PopChar;
//#UC END# *4F4FDD38028A_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopChar

procedure TtfwScriptEnginePrim.PushWStr(const aStr: Tl3WString);
//#UC START# *4F4FE1DC0081_4F733A0701F0_var*
//#UC END# *4F4FE1DC0081_4F733A0701F0_var*
begin
//#UC START# *4F4FE1DC0081_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushWStr(aStr);
//#UC END# *4F4FE1DC0081_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushWStr

function TtfwScriptEnginePrim.PopWStr: Tl3WString;
//#UC START# *4F4FE2000271_4F733A0701F0_var*
//#UC END# *4F4FE2000271_4F733A0701F0_var*
begin
//#UC START# *4F4FE2000271_4F733A0701F0_impl*
 Result := f_ValueStack.PopWStr;
//#UC END# *4F4FE2000271_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopWStr

function TtfwScriptEnginePrim.IsTopWStr: Boolean;
//#UC START# *4F4FE2210169_4F733A0701F0_var*
//#UC END# *4F4FE2210169_4F733A0701F0_var*
begin
//#UC START# *4F4FE2210169_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopWStr;
//#UC END# *4F4FE2210169_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopWStr

function TtfwScriptEnginePrim.PopPrintable: Il3CString;
//#UC START# *4F4FEB6100A7_4F733A0701F0_var*
//#UC END# *4F4FEB6100A7_4F733A0701F0_var*
begin
//#UC START# *4F4FEB6100A7_4F733A0701F0_impl*
 Result := f_ValueStack.PopPrintable;
//#UC END# *4F4FEB6100A7_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopPrintable

function TtfwScriptEnginePrim.IsTopBracket: Boolean;
//#UC START# *4F5030B002E0_4F733A0701F0_var*
//#UC END# *4F5030B002E0_4F733A0701F0_var*
begin
//#UC START# *4F5030B002E0_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopBracket;
//#UC END# *4F5030B002E0_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopBracket

procedure TtfwScriptEnginePrim.PushBracket;
//#UC START# *4F5030D00022_4F733A0701F0_var*
//#UC END# *4F5030D00022_4F733A0701F0_var*
begin
//#UC START# *4F5030D00022_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushBracket;
//#UC END# *4F5030D00022_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushBracket

procedure TtfwScriptEnginePrim.PushClass(aClass: TClass);
//#UC START# *508526FE0229_4F733A0701F0_var*
//#UC END# *508526FE0229_4F733A0701F0_var*
begin
//#UC START# *508526FE0229_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushClass(aClass);
//#UC END# *508526FE0229_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushClass

function TtfwScriptEnginePrim.PopClass: TClass;
//#UC START# *5085273502AA_4F733A0701F0_var*
//#UC END# *5085273502AA_4F733A0701F0_var*
begin
//#UC START# *5085273502AA_4F733A0701F0_impl*
 Result := f_ValueStack.PopClass;
//#UC END# *5085273502AA_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopClass

function TtfwScriptEnginePrim.IsTopClass: Boolean;
//#UC START# *5085275F0044_4F733A0701F0_var*
//#UC END# *5085275F0044_4F733A0701F0_var*
begin
//#UC START# *5085275F0044_4F733A0701F0_impl*
 Result := f_ValueStack.IsTopClass;
//#UC END# *5085275F0044_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.IsTopClass

function TtfwScriptEnginePrim.Clone: ItfwScriptEngine;
//#UC START# *519A29C802E1_4F733A0701F0_var*
type
 RClass = class of TtfwScriptEnginePrim;
var
 l_C : TtfwScriptEnginePrim;
//#UC END# *519A29C802E1_4F733A0701F0_var*
begin
//#UC START# *519A29C802E1_4F733A0701F0_impl*
 l_C := RClass(ClassType).Create;
 try
  l_C.f_ScriptFileName := f_ScriptFileName;
  f_UserDictionary.SetRefTo(l_C.f_UserDictionary);
  f_MainDictionary.SetRefTo(l_C.f_MainDictionary);
  f_Dictionaries.SetRefTo(l_C.f_Dictionaries);
  Result := l_C;
 finally
  FreeAndNil(l_C);
 end;//try..finally
//#UC END# *519A29C802E1_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Clone

function TtfwScriptEnginePrim.PopObjAs(aClass: TClass): Pointer;
//#UC START# *54F7390300EC_4F733A0701F0_var*
//#UC END# *54F7390300EC_4F733A0701F0_var*
begin
//#UC START# *54F7390300EC_4F733A0701F0_impl*
 Result := f_ValueStack.PopObjAs(aClass);
//#UC END# *54F7390300EC_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopObjAs

function TtfwScriptEnginePrim.PopClassAs(aClass: TClass): Pointer;
//#UC START# *54F8664200B0_4F733A0701F0_var*
//#UC END# *54F8664200B0_4F733A0701F0_var*
begin
//#UC START# *54F8664200B0_4F733A0701F0_impl*
 Result := f_ValueStack.PopClassAs(aClass);
//#UC END# *54F8664200B0_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopClassAs

function TtfwScriptEnginePrim.PopWideString: WideString;
//#UC START# *54F9C2A502E9_4F733A0701F0_var*
//#UC END# *54F9C2A502E9_4F733A0701F0_var*
begin
//#UC START# *54F9C2A502E9_4F733A0701F0_impl*
 Result := f_ValueStack.PopWideString;
//#UC END# *54F9C2A502E9_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopWideString

procedure TtfwScriptEnginePrim.PushWideString(const aValue: WideString);
//#UC START# *54F9C2CF0044_4F733A0701F0_var*
//#UC END# *54F9C2CF0044_4F733A0701F0_var*
begin
//#UC START# *54F9C2CF0044_4F733A0701F0_impl*
 f_ValueStack.PushWideString(aValue);
//#UC END# *54F9C2CF0044_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushWideString

function TtfwScriptEnginePrim.PopPoint: TPoint;
//#UC START# *54F9C6530229_4F733A0701F0_var*
//#UC END# *54F9C6530229_4F733A0701F0_var*
begin
//#UC START# *54F9C6530229_4F733A0701F0_impl*
 Result := f_ValueStack.PopPoint;
//#UC END# *54F9C6530229_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopPoint

procedure TtfwScriptEnginePrim.PushPoint(const aPoint: TPoint);
//#UC START# *54F9C66902E3_4F733A0701F0_var*
//#UC END# *54F9C66902E3_4F733A0701F0_var*
begin
//#UC START# *54F9C66902E3_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushPoint(aPoint);
//#UC END# *54F9C66902E3_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushPoint

procedure TtfwScriptEnginePrim.PushList(const aList: ItfwValueList);
//#UC START# *5510153F001C_4F733A0701F0_var*
//#UC END# *5510153F001C_4F733A0701F0_var*
begin
//#UC START# *5510153F001C_4F733A0701F0_impl*
 if (f_ValueStack = nil) then
  f_ValueStack := TtfwValueStack.Create;
 f_ValueStack.PushList(aList);
//#UC END# *5510153F001C_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PushList

function TtfwScriptEnginePrim.PopList: ItfwValueList;
//#UC START# *551015680218_4F733A0701F0_var*
//#UC END# *551015680218_4F733A0701F0_var*
begin
//#UC START# *551015680218_4F733A0701F0_impl*
 Result := f_ValueStack.PopList;
//#UC END# *551015680218_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.PopList

procedure TtfwScriptEnginePrim.WordFail(const aPoint: TtfwSourcePoint);
//#UC START# *556486F200B4_4F733A0701F0_var*
//#UC END# *556486F200B4_4F733A0701F0_var*
begin
//#UC START# *556486F200B4_4F733A0701F0_impl*
 if aPoint.Empty then
  Exit;
 if (f_ExceptionStack = nil) then
  f_ExceptionStack := TtfwSourcePointList.Create;
 f_ExceptionStack.Add(aPoint);
//#UC END# *556486F200B4_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.WordFail

procedure TtfwScriptEnginePrim.WordSuccess;
//#UC START# *55648729006C_4F733A0701F0_var*
//#UC END# *55648729006C_4F733A0701F0_var*
begin
//#UC START# *55648729006C_4F733A0701F0_impl*
 FreeAndNil(f_ExceptionStack);
//#UC END# *55648729006C_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.WordSuccess

procedure TtfwScriptEnginePrim.ExceptionStackToLog;
//#UC START# *5565BD5B01FC_4F733A0701F0_var*
var
 l_Index : Integer;
//#UC END# *5565BD5B01FC_4F733A0701F0_var*
begin
//#UC START# *5565BD5B01FC_4F733A0701F0_impl*
 if (f_ExceptionStack <> nil) then
 begin
  if not f_ExceptionStack.Empty then
  begin
   for l_Index := 0 to Pred(f_ExceptionStack.Count) do
    l3System.Msg2Log(Format('  [Stack #%3d] %s', [l_Index, f_ExceptionStack.Items[l_Index].ToString]));
  end;//not f_ExceptionStack.Empty
  FreeAndNil(f_ExceptionStack);
 end;//f_ExceptionStack <> nil
//#UC END# *5565BD5B01FC_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.ExceptionStackToLog

function TtfwScriptEnginePrim.ExceptionStack: ItfwValueList;
//#UC START# *5565BD6C02FE_4F733A0701F0_var*
var
 l_A : TtfwArray;

 procedure DoAdd(const aStr: Il3CString);
 begin//DoAdd
  l_A.Add(TtfwStackValue_C(aStr));
 end;//DoAdd

var
 l_Index : Integer;
//#UC END# *5565BD6C02FE_4F733A0701F0_var*
begin
//#UC START# *5565BD6C02FE_4F733A0701F0_impl*
 l_A := TtfwArray.Create;
 try
  if (f_ExceptionStack <> nil) then
   if not f_ExceptionStack.Empty then
   begin
    for l_Index := 0 to Pred(f_ExceptionStack.Count) do
     DoAdd(TtfwCStringFactory.C(f_ExceptionStack.Items[l_Index].ToString));
   end;//not f_ExceptionStack.Empty
  Result := l_A; 
 finally
  FreeAndNil(l_A);
 end;//try..finally
//#UC END# *5565BD6C02FE_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.ExceptionStack

procedure TtfwScriptEnginePrim.FailToLog;
//#UC START# *55681AA70056_4F733A0701F0_var*
//#UC END# *55681AA70056_4F733A0701F0_var*
begin
//#UC START# *55681AA70056_4F733A0701F0_impl*
 l3System.Msg2Log('Script failed: ' + f_ScriptFileName);
 ExceptionStackToLog;
//#UC END# *55681AA70056_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.FailToLog

function TtfwScriptEnginePrim.OpenDictionary(var aCtx: TtfwContext): Boolean;
//#UC START# *559E7749009C_4F733A0701F0_var*

 procedure AddToDictionaries(aD: TtfwDictionaryEx);
 var
  l_Index : Integer;
  l_D : TtfwDictionaryEx;
 begin//AddToDictionaries
  f_Dictionaries.Add(aD);
  if not f_CascadeDict then
   if (aD.UsedDictionaries <> nil) then
    for l_Index := 0 to Pred(aD.UsedDictionaries.Count) do
    begin
     l_D := aD.UsedDictionaries.Items[l_Index] As TtfwDictionaryEx;
     if (f_Dictionaries.IndexOf(l_D) < 0) then
      AddToDictionaries(l_D);
    end;//for l_Index
 end;//AddToDictionaries

var
 l_N : Il3CString;
 l_D : TtfwDictionaryEx;
//#UC END# *559E7749009C_4F733A0701F0_var*
begin
//#UC START# *559E7749009C_4F733A0701F0_impl*
 Result := true;
 if (f_DictionariesStack = nil) then
  f_DictionariesStack := TtfwDictionaryStack.Create;
 f_DictionariesStack.Add(f_UserDictionary);
 if (aCtx.rCompiler = nil) then
 // - это не внутренний словарь
 begin
  if TtfwAutoregisteredDiction.Instance.AllAxiomaticsDefined OR
     (aCtx.rStreamfactory.FileName <> '') then
  begin
   CompilerAssert(aCtx.rStreamfactory.FileName <> '', 'Имя словаря пустое', aCtx);
   if (aCtx.rStreamfactory.FileName <> '') then
   begin
    Result := false;
    CompilerAssert(f_Dictionaries <> nil, 'Список словарей пуст', aCtx);
    l_N := TtfwCStringFactory.C(aCtx.rStreamfactory.FileName);
    l_D := nil;
    if l3Starts(l3PCharLen('res:'), l3PCharLen(l_N), true) then
    begin
     l_D := TtfwAutoregisteredDiction.Instance;
     Result := not TtfwAutoregisteredDiction.Instance.AllAxiomaticsDefined;
    end//l3Starts(TtfwCStringFactory.C('res:'), l_N, true)
    else
     l_D := TtfwStandardDictionaries.Instance.FindDictionary(l_N);
    {$IfDef seCacheDict}
    if (l_D = nil) then
    begin
     if Self.CacheDict then
      l_D := TtfwDictionaryCache.Instance.FindDictionary(l_N)
     else
      l_D := nil;
     if (l_D <> nil) then
     begin
      if (f_Dictionaries.FindDictionary(l_N) = nil) then
       AddToDictionaries(l_D);
     end//l_D <> nil
    end;//l_D = nil
    {$EndIf seCacheDict}
    if (l_D = nil) then
    begin
     l_D := f_Dictionaries.FindDictionary(l_N);
     if (l_D = nil) then
     begin
      l_D := TtfwDictionaryEx.Create(aCtx.rStreamfactory, [TtfwAutoregisteredDiction.Instance]);
      try
       AddToDictionaries(l_D);
       {$IfDef seCacheDict}
       if Self.CacheDict then
        TtfwDictionaryCache.Instance.Add(l_D);
       {$EndIf seCacheDict} 
       Result := true;
      finally
       l_D.Free;
      end;//try..finally
     end;//l_D <> nil
    end;//l_D = nil
    Assert(l_D <> nil); 
    l_D.SetRefTo(f_UserDictionary);
   end;//aCtx.rFileName <> ''
  end//TtfwAutoregisteredDiction.Instance.AllAxiomaticsDefined
  else
   TtfwAutoregisteredDiction.Instance.SetRefTo(f_UserDictionary);
  aCtx.rCompiler := f_UserDictionary.InitCode;
 end;//aCtx.rCompiler = nil
//#UC END# *559E7749009C_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.OpenDictionary

procedure TtfwScriptEnginePrim.CloseDictionary(const aCtx: TtfwContext);
//#UC START# *559E77840265_4F733A0701F0_var*
var
 l_Last : TtfwDictionaryEx;
//#UC END# *559E77840265_4F733A0701F0_var*
begin
//#UC START# *559E77840265_4F733A0701F0_impl*
 CompilerAssert(f_DictionariesStack <> nil, 'Стек словарей пуст', aCtx);
 l_Last := f_DictionariesStack.Last;
 if (l_Last <> nil) then
  if (f_UserDictionary <> nil) then
   l_Last.UseDictionary(f_UserDictionary);
 l_Last.SetRefTo(f_UserDictionary);
 f_DictionariesStack.Delete(Pred(f_DictionariesStack.Count));
//#UC END# *559E77840265_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.CloseDictionary

procedure TtfwScriptEnginePrim.AddInitialization(const aCtx: TtfwContext;
  aWord: TtfwWord);
//#UC START# *559E77B00246_4F733A0701F0_var*
//#UC END# *559E77B00246_4F733A0701F0_var*
begin
//#UC START# *559E77B00246_4F733A0701F0_impl*
 CompilerAssert(f_UserDictionary <> nil, 'Нет текущего компилируемого словаря', aCtx);
 f_UserDictionary.AddCodePart(aWord, aCtx, tfw_sniNo);
//#UC END# *559E77B00246_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.AddInitialization

function TtfwScriptEnginePrim.CurrentCompilingDictionary: TtfwDictionaryPrim;
//#UC START# *55AE59EC022F_4F733A0701F0_var*
//#UC END# *55AE59EC022F_4F733A0701F0_var*
begin
//#UC START# *55AE59EC022F_4F733A0701F0_impl*
 Result := f_UserDictionary;
//#UC END# *55AE59EC022F_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.CurrentCompilingDictionary

function TtfwScriptEnginePrim.Get_CascadeDict: Boolean;
//#UC START# *55AF7BE601CF_4F733A0701F0get_var*
//#UC END# *55AF7BE601CF_4F733A0701F0get_var*
begin
//#UC START# *55AF7BE601CF_4F733A0701F0get_impl*
 Result := f_CascadeDict;
//#UC END# *55AF7BE601CF_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_CascadeDict

procedure TtfwScriptEnginePrim.Set_CascadeDict(aValue: Boolean);
//#UC START# *55AF7BE601CF_4F733A0701F0set_var*
//#UC END# *55AF7BE601CF_4F733A0701F0set_var*
begin
//#UC START# *55AF7BE601CF_4F733A0701F0set_impl*
 f_CascadeDict := aValue;
//#UC END# *55AF7BE601CF_4F733A0701F0set_impl*
end;//TtfwScriptEnginePrim.Set_CascadeDict

procedure TtfwScriptEnginePrim.DisableForHelp(aWord: TtfwWord);
//#UC START# *55AFBAA10337_4F733A0701F0_var*
//#UC END# *55AFBAA10337_4F733A0701F0_var*
begin
//#UC START# *55AFBAA10337_4F733A0701F0_impl*
 if (f_DisabledForHelp = nil) then
  f_DisabledForHelp := TtfwWordRefList.Create;
 f_DisabledForHelp.Add(aWord); 
//#UC END# *55AFBAA10337_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DisableForHelp

procedure TtfwScriptEnginePrim.DupN(aN: Integer);
//#UC START# *55E848EA003D_4F733A0701F0_var*
//#UC END# *55E848EA003D_4F733A0701F0_var*
begin
//#UC START# *55E848EA003D_4F733A0701F0_impl*
 f_ValueStack.DupN(aN);
//#UC END# *55E848EA003D_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DupN

procedure TtfwScriptEnginePrim.DropN(aN: Integer);
//#UC START# *55E84904001E_4F733A0701F0_var*
//#UC END# *55E84904001E_4F733A0701F0_var*
begin
//#UC START# *55E84904001E_4F733A0701F0_impl*
 f_ValueStack.DropN(aN);
//#UC END# *55E84904001E_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DropN

function TtfwScriptEnginePrim.Get_Dictionaries: TtfwDictionaryList;
//#UC START# *55E9A95F027B_4F733A0701F0get_var*
//#UC END# *55E9A95F027B_4F733A0701F0get_var*
begin
//#UC START# *55E9A95F027B_4F733A0701F0get_impl*
 Result := f_Dictionaries;
//#UC END# *55E9A95F027B_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_Dictionaries

function TtfwScriptEnginePrim.Get_InitedDictionaries: TtfwInitedDictionariesList;
//#UC START# *55E9A993038B_4F733A0701F0get_var*
//#UC END# *55E9A993038B_4F733A0701F0get_var*
begin
//#UC START# *55E9A993038B_4F733A0701F0get_impl*
 Result := f_InitedDictionaries;
//#UC END# *55E9A993038B_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_InitedDictionaries

function TtfwScriptEnginePrim.Get_MainDictionary: TtfwMainDictionary;
//#UC START# *55E9A9BA02AD_4F733A0701F0get_var*
//#UC END# *55E9A9BA02AD_4F733A0701F0get_var*
begin
//#UC START# *55E9A9BA02AD_4F733A0701F0get_impl*
 Result := f_MainDictionary;
//#UC END# *55E9A9BA02AD_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_MainDictionary

function TtfwScriptEnginePrim.Get_DisabledForHelp: TtfwWordRefList;
//#UC START# *55ED597602F4_4F733A0701F0get_var*
//#UC END# *55ED597602F4_4F733A0701F0get_var*
begin
//#UC START# *55ED597602F4_4F733A0701F0get_impl*
 Result := f_DisabledForHelp;
//#UC END# *55ED597602F4_4F733A0701F0get_impl*
end;//TtfwScriptEnginePrim.Get_DisabledForHelp

procedure TtfwScriptEnginePrim.Cleanup;
//#UC START# *479731C50290_4F733A0701F0_var*
//#UC END# *479731C50290_4F733A0701F0_var*
begin
//#UC START# *479731C50290_4F733A0701F0_impl*
 FreeAndNil(f_DisabledForHelp);
 FreeAndNil(f_ValueStack);
 FreeAndNil(f_UserDictionary);
 FreeAndNil(f_MainDictionary);
 FreeAndNil(f_Dictionaries);
 FreeAndNil(f_DictionariesStack);
 FreeAndNil(f_ExceptionStack);
 inherited;
//#UC END# *479731C50290_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.Cleanup

procedure TtfwScriptEnginePrim.DoAddCodePart(aWord: TtfwWord;
  const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate);
//#UC START# *4DB6CB1703AD_4F733A0701F0_var*
//#UC END# *4DB6CB1703AD_4F733A0701F0_var*
begin
//#UC START# *4DB6CB1703AD_4F733A0701F0_impl*
 if not f_CascadeDict then
  AddInitialization(aCtx, aWord)
 else
  inherited;
//#UC END# *4DB6CB1703AD_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DoAddCodePart

procedure TtfwScriptEnginePrim.AfterCompile(var theNewContext: TtfwContext;
  aCompiled: TkwCompiledWordPrim);
//#UC START# *4DB6CE2302C9_4F733A0701F0_var*
//#UC END# *4DB6CE2302C9_4F733A0701F0_var*
begin
//#UC START# *4DB6CE2302C9_4F733A0701F0_impl*
 f_MainDictionary.CompiledCode := aCompiled;
 inherited;
//#UC END# *4DB6CE2302C9_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.AfterCompile

function TtfwScriptEnginePrim.GetCompiler(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D523A40118_4F733A0701F0_var*
//#UC END# *52D523A40118_4F733A0701F0_var*
begin
//#UC START# *52D523A40118_4F733A0701F0_impl*
 Result := Self;
//#UC END# *52D523A40118_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.GetCompiler

function TtfwScriptEnginePrim.GetNewWordDefinitor: TtfwWord;
//#UC START# *52D56341033B_4F733A0701F0_var*
//#UC END# *52D56341033B_4F733A0701F0_var*
begin
//#UC START# *52D56341033B_4F733A0701F0_impl*
 Result := Self;
//#UC END# *52D56341033B_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.GetNewWordDefinitor

function TtfwScriptEnginePrim.GetKeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D5637A031E_4F733A0701F0_var*
//#UC END# *52D5637A031E_4F733A0701F0_var*
begin
//#UC START# *52D5637A031E_4F733A0701F0_impl*
 Result := Self;
//#UC END# *52D5637A031E_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.GetKeywordFinder

function TtfwScriptEnginePrim.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A7D34102A0_4F733A0701F0_var*
//#UC END# *55A7D34102A0_4F733A0701F0_var*
begin
//#UC START# *55A7D34102A0_4F733A0701F0_impl*
 Assert(f_UserDictionary <> nil);
 Result := f_UserDictionary.CheckWord(aName);
//#UC END# *55A7D34102A0_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.DoCheckWord

function TtfwScriptEnginePrim.GetKeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *55ACE5210310_4F733A0701F0_var*
var
 l_Index : Integer;
//#UC END# *55ACE5210310_4F733A0701F0_var*
begin
//#UC START# *55ACE5210310_4F733A0701F0_impl*
 Result := nil;
 if f_CascadeDict then
 begin
  if (f_UserDictionary <> nil) then
   Result := f_UserDictionary.DRbyCName[aName];
 end//f_CascadeDict
 else
 begin
  if (f_Dictionaries <> nil) then
  begin
   //for l_Index := Pred(f_Dictionaries.Count) downto 0 do
   for l_Index := 0 to Pred(f_Dictionaries.Count) do
   begin
    Result := f_Dictionaries.Items[l_Index].DRbyCName[aName];
    if (Result <> nil) then
     Exit;
   end;//for l_Index
  end;//f_Dictionaries <> nil
 end;//f_CascadeDict
//#UC END# *55ACE5210310_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.GetKeywordByName

function TtfwScriptEnginePrim.GetParentFinder: TtfwWord;
//#UC START# *55ACF0F5025D_4F733A0701F0_var*
//#UC END# *55ACF0F5025D_4F733A0701F0_var*
begin
//#UC START# *55ACF0F5025D_4F733A0701F0_impl*
 Result := nil;
//#UC END# *55ACF0F5025D_4F733A0701F0_impl*
end;//TtfwScriptEnginePrim.GetParentFinder

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwScriptEnginePrim
 TtfwScriptEnginePrim.RegisterClass;
{$IfEnd} //not NoScripts

end.