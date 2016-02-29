unit tfwScriptingInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwScriptingInterfaces.pas"
// Начат: 20.04.2011 21:48
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: InternalInterfaces::Category Shared Delphi Low Level::ScriptEngine$Core::tfwScriptingInterfaces
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  l3Types,
  l3PureMixIns,
  l3EtalonsWorking,
  tfwParserInterfaces,
  tfwScriptingTypes,
  tfwScriptingExceptions,
  tfwTypeInfo,
  Types,
  TypInfo,
  SysUtils,
  l3ProtoObject,
  tfwDictionaryPrim,
  tfwCStringFactory,
  tfwKeyWordPrim,
  tfwStreamFactory,
  l3Variant,
  tfwValueTypes
  ;

(*
 ScriptCaller = PureMixIn
   procedure Check(aCondition: Boolean;
    const aMessage: AnsiString = '');
     {* Проверяет инвариант }
   procedure Print(const aStr: Tl3WString); overload; 
   procedure Print(const aStr: Il3CString); overload; 
 end;//ScriptCaller
*)

(*
 PrintingCaller = PureMixIn
   function GetIsWritingToK: Boolean;
   function GetIsFakeCVS: Boolean;
   function GetCVSPath: AnsiString;
   procedure DontRaiseIfEtalonCreated;
   procedure TimeToLog(aTime: Cardinal;
     const aSt: AnsiString;
     const aSubName: AnsiString);
   function GetTestSetFolderName: AnsiString;
   function GetEtalonSuffix: AnsiString;
   procedure CheckPrintEtalon(const aLogName: AnsiString;
    const aOutputName: AnsiString);
   function ShouldStop: Boolean;
   procedure CheckTimeout(aNow: Cardinal;
    aTimeout: Cardinal);
   function StartTimer: Longword;
   function StopTimer(const aSt: AnsiString = '';
    const aSubName: AnsiString = '';
    aNeedTimeToLog: Boolean = true): Longword;
 end;//PrintingCaller
*)

type
 ItfwScriptCaller = interface(IUnknown)
   ['{9A3B1A85-FE74-4761-9100-0FC6F4EE0BD3}']
   function CompileOnly: Boolean;
   function ResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
   function ResolveOutputFilePath(const aFile: AnsiString): AnsiString;
   function ResolveInputFilePath(const aFile: AnsiString): AnsiString;
   function KPage: AnsiString;
   procedure ToLog(const aSt: AnsiString);
  // ScriptCaller
   procedure Check(aCondition: Boolean;
    const aMessage: AnsiString = '');
     {* Проверяет инвариант }
   procedure Print(const aStr: Tl3WString); overload; 
   procedure Print(const aStr: Il3CString); overload; 
  // PrintingCaller
   function GetIsWritingToK: Boolean;
   function GetIsFakeCVS: Boolean;
   function GetCVSPath: AnsiString;
   procedure DontRaiseIfEtalonCreated;
   procedure TimeToLog(aTime: Cardinal;
     const aSt: AnsiString;
     const aSubName: AnsiString);
   function GetTestSetFolderName: AnsiString;
   function GetEtalonSuffix: AnsiString;
   procedure CheckPrintEtalon(const aLogName: AnsiString;
    const aOutputName: AnsiString);
   function ShouldStop: Boolean;
   procedure CheckTimeout(aNow: Cardinal;
    aTimeout: Cardinal);
   function StartTimer: Longword;
   function StopTimer(const aSt: AnsiString = '';
    const aSubName: AnsiString = '';
    aNeedTimeToLog: Boolean = true): Longword;
  // EtalonsWorking
   procedure CheckOutputWithInput(const aIn: AnsiString;
     const aOut: AnsiString;
     aHeaderBegin: AnsiChar;
     aEtalonNeedsComputerName: Boolean;
     aEtalonCanHaveDiff: Boolean;
     const anExtraFileName: AnsiString;
     aNeedsCheck: Boolean); overload; 
   procedure CheckOutputWithInput(const aSt: AnsiString;
     aHeaderBegin: AnsiChar = #0;
     const anExtraFileName: AnsiString = '';
     aNeedsCheck: Boolean = true); overload; 
   procedure CheckPictureOnly;
   procedure CheckWithEtalon(const aFileName: AnsiString;
    aHeaderBegin: AnsiChar);
 end;//ItfwScriptCaller

 EtfwCodeFlowException = {abstract} class(EtfwException)
 end;//EtfwCodeFlowException

 EtfwCodeFlowError = class(EtfwCodeFlowException)
 end;//EtfwCodeFlowError

 TtfwSuppressNextImmediate = (
   tfw_sniNo
 , tfw_sniYes
 , tfw_sniForce
 );//TtfwSuppressNextImmediate

(*
 MtfwValueList = PureMixIn
   procedure Clear;
 end;//MtfwValueList
*)

 TtfwSourcePoint = {$IfDef XE4}record{$Else}object{$EndIf}
  {* Место в исходниках }
 public
   rFileName : Il3CString;
   rLine : Integer;
   rName : Il3CString;
   rProducerName : Il3CString;
 public
    function Empty: Boolean;
    function ToString: AnsiString;
 end;//TtfwSourcePoint

 TtfwAccessType = tfwScriptingTypes.TtfwAccessType;

 EtfwScriptException = class(EtfwException)
  {* Исключение кидаемое скриптом }
 end;//EtfwScriptException

 TtfwLinkType = tfwScriptingTypes.TtfwLinkType;

 TtfwWordInfo = {abstract} class(Tl3ProtoObject)
  {* Информация о типе }
 public
 // public methods
   function IncludeModifier(aModifier: TtfwWordModifier): TtfwWordInfo; virtual; abstract;
   function Empty: Boolean; virtual; abstract;
   function Has(aModifier: TtfwWordModifier): Boolean; overload;  virtual; abstract;
   function Clone: TtfwWordInfo; virtual; abstract;
   function PRec: PtfwWordInfoRec; virtual; abstract;
   function IncludeTypeModifier(aType: TtfwValueType): TtfwWordInfo; virtual; abstract;
   function Has(aType: TtfwValueType): Boolean; overload;  virtual; abstract;
   function AcceptsValue(const aValue: TtfwStackValue): Boolean; virtual; abstract;
   class function Make(const aTypeInfoRec: TtfwWordInfoRec): TtfwWordInfo; overload; 
   class function Make(aTypeInfo: PTypeInfo): TtfwWordInfo; overload; 
   function Has(anAccess: TtfwAccessType): Boolean; overload;  virtual; abstract;
   function IncludeAccesType(anAccess: TtfwAccessType): TtfwWordInfo; virtual; abstract;
   class function Make(aTypes: TtfwValueTypes;
     aModifiers: TtfwWordModifiers;
     anAccess: TtfwAccessType;
     aLinkType: TtfwLinkType): TtfwWordInfo; overload; 
   function EQwm(aValue: TtfwWordModifiers): Boolean; virtual; abstract;
   function IncludeType(const aType: TtfwTypeInfo): TtfwWordInfo; virtual; abstract;
   function TypeName: Il3CString; virtual; abstract;
   class function Make(const aType: TtfwTypeInfo): TtfwWordInfo; overload; 
   function ValueTypes: TtfwValueTypes; virtual; abstract;
   function IncludeLinkType(aLinkType: TtfwLinkType): TtfwWordInfo; virtual; abstract;
   function Has(aLinkType: TtfwLinkType): Boolean; overload;  virtual; abstract;
   function LinkType: TtfwLinkType; virtual; abstract;
   function AccessType: TtfwAccessType; virtual; abstract;
   function Compare(anOther: TtfwWordInfo): Integer; virtual; abstract;
   function Modifiers: TtfwWordModifiers; virtual; abstract;
   function ToString: Il3CString; virtual; abstract;
 end;//TtfwWordInfo

 EtfwExitOrBreak = class(EtfwCodeFlowException)
 end;//EtfwExitOrBreak

 EtfwContinue = class(EtfwExitOrBreak)
 end;//EtfwContinue

 EtfwExit = class(EtfwExitOrBreak)
 end;//EtfwExit

 EtfwHalt = class(EtfwExitOrBreak)
 end;//EtfwHalt

 TtfwStackValue = tfwTypeInfo.TtfwStackValue;

 TtfwCStringFactory = tfwCStringFactory.TtfwCStringFactory;


 TtfwWord = class;


 TtfwKeyWord = class;

 ItfwScriptEngine = interface;
 { - предварительное описание ItfwScriptEngine. }


 PtfwContext = ^TtfwContext;
 ItfwStoredValuesStack = interface;
 { - предварительное описание ItfwStoredValuesStack. }

 TtfwContext = {$IfDef XE4}record{$Else}object{$EndIf}
 public
   rCaller : ItfwScriptCaller;
   rEngine : ItfwScriptEngine;
   rParser : ItfwParserEx;
   rException : Exception;
   rTypeInfo : TtfwWordInfo; // Информация о типе слова
   rStreamFactory : TtfwStreamFactory;
   rKeyWordCompilingNow : TtfwKeyWord;
   rFirstHalfOfDualWord : TtfwWord; // Первая половина двойного слова
   rStoredValuesStack : ItfwStoredValuesStack; // Стек для сохранения состояния слов при обработке рекурсивных вызовов
   rWordCompilingNow : TtfwWord; // Текущее компилируемое слово
   rWordDefiningNow : TtfwWord; // Текущее определяемое ИМЕНОВАННОЕ слово
   rKeyWordDefiningNow : TtfwKeyWord; // Текущее определяемое ИМЕНОВАННОЕ слово
   rWasCloseBracket : Boolean;
   rPrev : PtfwContext;
   rWordProducerForCompiledClass : TtfwWord;
   rNewWordName : Il3CString;
   rCompiler : TtfwWord;
   rPrevFinder : TtfwWord;
   rKeyWords : TtfwWord;
 public
    procedure SetWordInfo(aValue: TtfwWordInfo);
    function ResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
 end;//TtfwContext

 TtfwWordPrim = {abstract} class(Tl3ProtoObject)
 private
 // private fields
   f_NestedCallsCount : Integer;
 protected
 // protected methods
   procedure StoreState(const aCtx: TtfwContext); virtual;
   procedure RestoreState(const aCtx: TtfwContext); virtual;
   procedure DoDoIt(const aCtx: TtfwContext); virtual; abstract;
   procedure ClearState(const aCtx: TtfwContext); virtual;
   procedure PushAdditionalParams(const aCtx: TtfwContext); virtual;
 public
 // public methods
   function IsCompiled: Boolean; virtual;
   procedure DoIt(const aCtx: TtfwContext); // can raise EtfwCodeFlowError
   function SourcePoint: TtfwSourcePoint; virtual;
 end;//TtfwWordPrim

(*
 MtfwKeywordFinderSource = PureMixIn
   function KeywordFinder(const aCtx: TtfwContext): TtfwWord;
 end;//MtfwKeywordFinderSource
*)

(*
 MtfwInParameterDefinitor = PureMixIn
   function DefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aStereo: TtfwWord;
     aTypeInfo: TtfwWordInfo): TtfwWord;
 end;//MtfwInParameterDefinitor
*)

(*
 MtfwWordChecker = PureMixIn
   function CheckWord(const aName: Il3CString): TtfwKeyWord;
 end;//MtfwWordChecker
*)

(*
 MtfwNewWordDefinitor = PureMixIn(MtfwKeywordFinderSource)
 end;//MtfwNewWordDefinitor
*)

 EtfwBreakIterator = class(EtfwExitOrBreak)
 end;//EtfwBreakIterator

(*
 MtfwCodeCompiler = PureMixIn
   procedure AddCodePart(aWord: TtfwWord;
    const aCtx: TtfwContext;
    aSNI: TtfwSuppressNextImmediate);
     {* Добавляет скомпилированный код к текущему компилируемуму слову }
 end;//MtfwCodeCompiler
*)

(*
 MtfwNewWordDefinitorSource = PureMixIn
   function NewWordDefinitor: TtfwWord;
 end;//MtfwNewWordDefinitorSource
*)

(*
 MtfwCompiler = PureMixIn(MtfwKeywordFinderSource)
   procedure CompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord);
     {* Компилирует код извлечения входного параметра в код компилируемого слова }
 end;//MtfwCompiler
*)

(*
 MtfwKeywordFinder = PureMixIn
   function KeywordByName(const aName: Il3CString): Tl3PrimString;
   function ParentFinder: TtfwWord;
 end;//MtfwKeywordFinder
*)

 RtfwWord = class of TtfwWord;

 TtfwWord = {abstract} class(TtfwWordPrim)
  {* Элемент словаря }
 private
 // private fields
   f_Redefines : TtfwWord;
    {* Поле для свойства Redefines}
   f_Key : TtfwKeyWordPrim;
    {* Поле для свойства Key}
 protected
 // property methods
   procedure pm_SetRedefines(aValue: TtfwWord);
   function pm_GetWordProducer: TtfwWord; virtual;
   procedure pm_SetWordProducer(aValue: TtfwWord); virtual;
   function pm_GetInnerDictionary: TtfwDictionaryPrim; virtual;
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; virtual;
   function pm_GetParentWord: TtfwWord; virtual;
 public
 // realized methods
   procedure AddCodePart(aWord: TtfwWord;
    const aCtx: TtfwContext;
    aSNI: TtfwSuppressNextImmediate);
     {* Добавляет скомпилированный код к текущему компилируемуму слову }
   procedure CompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord);
     {* Компилирует код извлечения входного параметра в код компилируемого слова }
   function CheckWord(const aName: Il3CString): TtfwKeyWord;
   function DefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aStereo: TtfwWord;
     aTypeInfo: TtfwWordInfo): TtfwWord;
   function NewWordDefinitor: TtfwWord;
   function KeywordFinder(const aCtx: TtfwContext): TtfwWord;
   function KeywordByName(const aName: Il3CString): Tl3PrimString;
   function ParentFinder: TtfwWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // overridden public methods
   function SourcePoint: TtfwSourcePoint; override;
 protected
 // protected methods
   procedure CompilerAssert(aCondition: Boolean;
     const aMessage: AnsiString;
     const aContext: TtfwContext);
   procedure CompilerAssertFmt(aCondition: Boolean;
     const aMessage: AnsiString;
     const aParams: array of const;
     const aContext: TtfwContext);
   procedure RunnerAssertFmt(aCondition: Boolean;
     const aMessage: AnsiString;
     const aParams: array of const;
     const aContext: TtfwContext);
   procedure DoAddCodePart(aWord: TtfwWord;
     const aCtx: TtfwContext;
     aSNI: TtfwSuppressNextImmediate); virtual;
   procedure BadValueType(aType: TtfwValueType;
     const aCtx: TtfwContext);
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; virtual;
   function GetNewWordDefinitor: TtfwWord; virtual;
   function GetKeywordFinder(const aCtx: TtfwContext): TtfwWord; virtual;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord;
     aCheckCode: Boolean); virtual;
   function DoCheckWord(const aName: Il3CString): TtfwKeyWord; virtual;
   function GetKeywordByName(const aName: Il3CString): Tl3PrimString; virtual;
   function GetParentFinder: TtfwWord; virtual;
 public
 // public methods
   function IsImmediate(const aCtx: TtfwContext): Boolean; virtual;
   function IsDefaultBranch: Boolean; virtual;
   procedure RunnerAssert(aCondition: Boolean;
     const aMessage: AnsiString;
     const aContext: TtfwContext);
   function IsAnonimous(const aCtx: TtfwContext): Boolean; virtual;
   function CompiledWordClassPrim(const aCtx: TtfwContext): RtfwWord; virtual;
   function IsForwardDeclaration: Boolean; virtual;
   function GetValue(const aCtx: TtfwContext): PtfwStackValue; virtual;
   function IsVarLike: Boolean; virtual;
   procedure SetValue(const aValue: TtfwStackValue;
     const aCtx: TtfwContext;
     aNeedCheckType: Boolean = true); virtual;
   function HasCode: Boolean; virtual;
     {* Есть ли у слова компилированный код }
   function HasLocalDictionary: Boolean; virtual;
     {* Есть ли у слова локальный словарь }
   function CodeCount: Integer; virtual;
     {* Число элементов скомпилированного кода }
   function GetCompiler(const aCtx: TtfwContext): TtfwWord; virtual;
   function DoDefineInParameter(const aCtx: TtfwContext;
     const aParamName: Il3CString;
     aStereo: TtfwWord;
     aTypeInfo: TtfwWordInfo): TtfwWord; virtual;
     {* Определяет слову входной параметр }
   procedure CompileInParameterPopCodeFromString(const aContext: TtfwContext;
     const aParameterToPop: Il3CString); virtual;
   function IsCloseBracket: Boolean; virtual;
   function GetEndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; virtual;
   class function NameForRegister: AnsiString; virtual;
   function AcceptMedianBracket(aBracket: TtfwWord;
     var aCtx: TtfwContext): Boolean; virtual;
   function GetAsCaller(const aCtx: TtfwContext): TtfwWord; virtual;
   function IsRightParam(const aCtx: TtfwContext): Boolean; virtual;
   function RightParamsCount(const aCtx: TtfwContext): Integer; virtual;
   function GetInParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; virtual;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
     const aCtx: TtfwContext); virtual;
   function IsLeftWordRefParam(const aCtx: TtfwContext): Boolean; virtual;
   class procedure RegisterClass;
   function LeftWordRefParamsCount(const aCtx: TtfwContext): Integer; virtual;
   procedure AddLeftWordRefValue(const aCtx: TtfwContext;
     aValue: TtfwWord); virtual;
   function GetLeftWordRefValue(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; virtual;
   function LeftWordRefValuesCount(const aCtx: TtfwContext): Integer; virtual;
   procedure RunnerError(const aMessage: AnsiString;
     const aContext: TtfwContext); virtual;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; virtual;
   function GetRightParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; virtual;
   function GetResultVar(const aCtx: TtfwContext): TtfwWord; virtual;
   constructor Create; reintroduce;
   function GetRef(const aCtx: TtfwContext): TtfwWord; virtual;
   function CanClearInRecursiveCalls: Boolean; virtual;
   function IsInParam: Boolean; virtual;
   procedure InitValue(const aCtx: TtfwContext);
   function WordName: Il3CString; virtual;
   function IsForHelp: Boolean; virtual;
   function MakeRefForCompile(const aCtx: TtfwContext;
     aSNI: TtfwSuppressNextImmediate): TtfwWord; virtual;
 public
 // public properties
   property Redefines: TtfwWord
     read f_Redefines
     write pm_SetRedefines;
     {* Слово, которое переопределяет данное (Self) }
   property WordProducer: TtfwWord
     read pm_GetWordProducer
     write pm_SetWordProducer;
     {* Слово, которое породило данное }
   property Key: TtfwKeyWordPrim
     read f_Key
     write f_Key;
     {* Слово словаря к которому привязан данный код }
   property InnerDictionary: TtfwDictionaryPrim
     read pm_GetInnerDictionary;
     {* Внутренний словарь слова }
   property ResultTypeInfo[const aCtx: TtfwContext]: TtfwWordInfo
     read pm_GetResultTypeInfo;
   property ParentWord: TtfwWord
     read pm_GetParentWord;
 end;//TtfwWord

 EtfwCompiler = class(EtfwCheck)
 end;//EtfwCompiler

 EtfwRunner = class(EtfwCheck)
 end;//EtfwRunner

 TtfwKeyWord = class(TtfwKeyWordPrim)
 private
 // private fields
   f_Word : TtfwWord;
    {* Поле для свойства Word}
   f_Dictionary : TtfwDictionaryPrim;
    {* Поле для свойства Dictionary}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetAsPCharLen: Tl3WString; override;
   procedure DoSetAsPCharLen(const Value: Tl3PCharLen); override;
 public
 // public methods
   constructor Create(aDictionary: TtfwDictionaryPrim;
     const aKeyword: AnsiString;
     aWord: TtfwWord); overload; 
   constructor Create(aDictionary: TtfwDictionaryPrim;
     const aKeyword: Tl3WString); overload; 
   constructor Create(aDictionary: TtfwDictionaryPrim;
     const aKeyword: Il3CString); overload; 
   procedure ChangeDictionary(aValue: TtfwDictionaryPrim);
   procedure SetWord(const aCtx: TtfwContext;
     aWord: TtfwWord);
 public
 // public properties
   property Word: TtfwWord
     read f_Word;
     {* Код данного ключевого слова }
   property Dictionary: TtfwDictionaryPrim
     read f_Dictionary;
 end;//TtfwKeyWord
 ItfwValueList = interface;
 { - предварительное описание ItfwValueList. }

 ItfwFile = interface;
 { - предварительное описание ItfwFile. }


(*
 ValueStack = PureMixIn
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
   function Get_ValuesCount: Integer;
   procedure PushString(aString: Tl3PrimString); overload; 
   procedure PushString(const aString: Il3CString); overload; 
   procedure PushString(const aString: AnsiString); overload; 
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
   procedure PushInt(aValue: Integer);
   function PopInt: Integer;
   procedure PushBool(aValue: Boolean);
   function PopBool: Boolean;
   function IsTopBool: Boolean;
   property ValuesCount: Integer
     read Get_ValuesCount;
 end;//ValueStack
*)

 EtfwBreak = class(EtfwExitOrBreak)
 end;//EtfwBreak

 EtfwFail = class(EtfwCheck)
 end;//EtfwFail

 EtfwManualBreak = class(EtfwScriptException)
 end;//EtfwManualBreak

 ItfwScriptEngine = interface(IUnknown)
   ['{29CD3B5A-963E-4630-AE73-2D2D05667FAA}']
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
   procedure DisableForHelp(aWord: TtfwWord);
   function Get_CascadeDict: Boolean;
   procedure Set_CascadeDict(aValue: Boolean);
   property CascadeDict: Boolean
     read Get_CascadeDict
     write Set_CascadeDict;
  // ValueStack
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
   function Get_ValuesCount: Integer;
   procedure PushString(aString: Tl3PrimString); overload; 
   procedure PushString(const aString: Il3CString); overload; 
   procedure PushString(const aString: AnsiString); overload; 
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
   procedure PushInt(aValue: Integer);
   function PopInt: Integer;
   procedure PushBool(aValue: Boolean);
   function PopBool: Boolean;
   function IsTopBool: Boolean;
   property ValuesCount: Integer
     read Get_ValuesCount;
  // MtfwKeywordFinderSource
   function KeywordFinder(const aCtx: TtfwContext): TtfwWord;
  // MtfwKeywordFinder
   function KeywordByName(const aName: Il3CString): Tl3PrimString;
   function ParentFinder: TtfwWord;
 end;//ItfwScriptEngine

(*
 MtfwIterator = PureMixIn
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 end;//MtfwIterator
*)

 ItfwIterator = interface(IUnknown)
   ['{CA80840A-0DB7-4754-842E-BB5BFE93A927}']
  // MtfwIterator
   procedure ForEach(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
   procedure ForEachBack(aLambda: TtfwWordPrim;
     const aCtx: TtfwContext);
 end;//ItfwIterator

 ItfwValueList = interface(ItfwIterator)
   ['{95FE5CAE-0988-49C5-A0E1-BDA62233AA8C}']
   procedure SetItem(anIndex: Integer;
     const aValue: TtfwStackValue);
   function ItemsCountInSlice: Integer;
  // Ml3ListEx
   function IndexOf(const anItem: TtfwStackValue): Integer;
   function Add(const anItem: TtfwStackValue): Integer;
  // Ml3List
   function pm_GetEmpty: Boolean;
   function pm_GetFirst: TtfwStackValue;
   function pm_GetLast: TtfwStackValue;
   function pm_GetItems(anIndex: Integer): TtfwStackValue;
   property Empty: Boolean
     read pm_GetEmpty;
   property First: TtfwStackValue
     read pm_GetFirst;
     {* Первый элемент. }
   property Last: TtfwStackValue
     read pm_GetLast;
     {* Последний элемент. }
   property Items[anIndex: Integer]: TtfwStackValue
     read pm_GetItems;
     default;
  // Ml3CountHolder
   function pm_GetCount: Integer;
   property Count: Integer
     read pm_GetCount;
     {* Число элементов. }
  // MtfwValueList
   procedure Clear;
 end;//ItfwValueList

 TtfwStoredValue = record
  {* Сохранённое значение переменной для восстановления }
   rValue : TtfwStackValue; // Значение для восстановления
   rWord : TtfwWord; // Переменная для восстановления
 end;//TtfwStoredValue

(*
 MtfwStoredValuesStack = PureMixIn
   procedure Restore(const aCtx: TtfwContext);
   procedure StoreDictionary(aDictionary: TtfwDictionaryPrim;
     const aCtx: TtfwContext);
 end;//MtfwStoredValuesStack
*)

 ItfwStoredValues = interface;
 { - предварительное описание ItfwStoredValues. }

 ItfwStoredValuesStack = interface(IUnknown)
   ['{DABE9CDD-34A6-43DB-BFB5-4F58BE50A720}']
  // Ml3ListEx
   function IndexOf(const anItem: ItfwStoredValues): Integer;
   function Add(const anItem: ItfwStoredValues): Integer;
  // Ml3List
   function pm_GetEmpty: Boolean;
   function pm_GetFirst: ItfwStoredValues;
   function pm_GetLast: ItfwStoredValues;
   function pm_GetItems(anIndex: Integer): ItfwStoredValues;
   property Empty: Boolean
     read pm_GetEmpty;
   property First: ItfwStoredValues
     read pm_GetFirst;
     {* Первый элемент. }
   property Last: ItfwStoredValues
     read pm_GetLast;
     {* Последний элемент. }
   property Items[anIndex: Integer]: ItfwStoredValues
     read pm_GetItems;
     default;
  // Ml3CountHolder
   function pm_GetCount: Integer;
   property Count: Integer
     read pm_GetCount;
     {* Число элементов. }
  // MtfwStoredValuesStack
   procedure Restore(const aCtx: TtfwContext);
   procedure StoreDictionary(aDictionary: TtfwDictionaryPrim;
     const aCtx: TtfwContext);
 end;//ItfwStoredValuesStack

 ItfwStoredValues = interface(IUnknown)
   ['{39369047-E783-4A4B-9657-6C2450D737C3}']
   procedure Restore(const aCtx: TtfwContext);
  // Ml3ListEx
   function IndexOf(const anItem: TtfwStoredValue): Integer;
   function Add(const anItem: TtfwStoredValue): Integer;
  // Ml3List
   function pm_GetEmpty: Boolean;
   function pm_GetFirst: TtfwStoredValue;
   function pm_GetLast: TtfwStoredValue;
   function pm_GetItems(anIndex: Integer): TtfwStoredValue;
   property Empty: Boolean
     read pm_GetEmpty;
   property First: TtfwStoredValue
     read pm_GetFirst;
     {* Первый элемент. }
   property Last: TtfwStoredValue
     read pm_GetLast;
     {* Последний элемент. }
   property Items[anIndex: Integer]: TtfwStoredValue
     read pm_GetItems;
     default;
  // Ml3CountHolder
   function pm_GetCount: Integer;
   property Count: Integer
     read pm_GetCount;
     {* Число элементов. }
 end;//ItfwStoredValues

 ItfwFile = interface(ItfwIterator)
   ['{BBB2A3FB-A633-40F3-BE85-9E997623BA12}']
   function ReadLn: Il3CString;
   procedure WriteLn(const aString: Il3CString);
   procedure WriteChar(aChar: AnsiChar);
   function ReadWStrLn: Tl3WString;
   procedure WriteWStrLn(const aStr: Tl3WString);
   procedure WriteWStr(const aStr: Tl3WString);
   function EOF: Boolean;
 end;//ItfwFile

 TtfwKeywordFinder = TtfwWord;

 TtfwCompiler = TtfwWord;

 TtfwWordCallContext = record
   rCtx : PtfwContext;
   rWord : TtfwWord;
 end;//TtfwWordCallContext

 PtfwWordCallContext = ^TtfwWordCallContext;

 TtfwValueType = tfwTypeInfo.TtfwValueType;

 TtfwWordModifier = tfwScriptingTypes.TtfwWordModifier;

 TtfwWordInfoF = class(TtfwWordInfo)
 private
 // private fields
   f_WordInfo : TtfwWordInfoRec;
 protected
 // realized methods
   function IncludeModifier(aModifier: TtfwWordModifier): TtfwWordInfo; override;
   function Empty: Boolean; override;
   function Has(aModifier: TtfwWordModifier): Boolean; override;
   function Clone: TtfwWordInfo; override;
   function PRec: PtfwWordInfoRec; override;
   function IncludeTypeModifier(aType: TtfwValueType): TtfwWordInfo; override;
   function Has(aType: TtfwValueType): Boolean; override;
   function AcceptsValue(const aValue: TtfwStackValue): Boolean; override;
   function Has(anAccess: TtfwAccessType): Boolean; override;
   function IncludeAccesType(anAccess: TtfwAccessType): TtfwWordInfo; override;
   function EQwm(aValue: TtfwWordModifiers): Boolean; override;
   function IncludeType(const aType: TtfwTypeInfo): TtfwWordInfo; override;
   function TypeName: Il3CString; override;
   function ValueTypes: TtfwValueTypes; override;
   function IncludeLinkType(aLinkType: TtfwLinkType): TtfwWordInfo; override;
   function Has(aLinkType: TtfwLinkType): Boolean; override;
   function LinkType: TtfwLinkType; override;
   function AccessType: TtfwAccessType; override;
   function Compare(anOther: TtfwWordInfo): Integer; override;
   function Modifiers: TtfwWordModifiers; override;
   function ToString: Il3CString; override;
 protected
 // overridden protected methods
   {$If not defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
     {* функция класса, определяющая могут ли объекты данного класса попадать в кэш повторного использования. }
   {$IfEnd} //not DesignTimeLibrary
 public
 // public methods
   constructor Create(const aModifiers: TtfwWordInfoRec); reintroduce;
 end;//TtfwWordInfoF

 TtfwWordInfoRec = tfwScriptingTypes.TtfwWordInfoRec;

 EtfwException = tfwScriptingExceptions.EtfwException;

 EtfwCheck = tfwScriptingExceptions.EtfwCheck;

 TtfwNewWordDefinitor = TtfwWord;

 TtfwValueTypes = tfwScriptingTypes.TtfwValueTypes;

 TtfwWordInfoE = class(TtfwWordInfo)
 protected
 // realized methods
   function IncludeModifier(aModifier: TtfwWordModifier): TtfwWordInfo; override;
   function Empty: Boolean; override;
   function Has(aModifier: TtfwWordModifier): Boolean; override;
   function Clone: TtfwWordInfo; override;
   function PRec: PtfwWordInfoRec; override;
   function IncludeTypeModifier(aType: TtfwValueType): TtfwWordInfo; override;
   function Has(aType: TtfwValueType): Boolean; override;
   function AcceptsValue(const aValue: TtfwStackValue): Boolean; override;
   function Has(anAccess: TtfwAccessType): Boolean; override;
   function IncludeAccesType(anAccess: TtfwAccessType): TtfwWordInfo; override;
   function EQwm(aValue: TtfwWordModifiers): Boolean; override;
   function IncludeType(const aType: TtfwTypeInfo): TtfwWordInfo; override;
   function TypeName: Il3CString; override;
   function ValueTypes: TtfwValueTypes; override;
   function IncludeLinkType(aLinkType: TtfwLinkType): TtfwWordInfo; override;
   function Has(aLinkType: TtfwLinkType): Boolean; override;
   function LinkType: TtfwLinkType; override;
   function AccessType: TtfwAccessType; override;
   function Compare(anOther: TtfwWordInfo): Integer; override;
   function Modifiers: TtfwWordModifiers; override;
   function ToString: Il3CString; override;
 public
 // public methods
   class function Exists: Boolean;
     {* Проверяет создан экземпляр синглетона или нет }
 public
 // singleton factory method
   class function Instance: TtfwWordInfoE;
    {- возвращает экземпляр синглетона. }
 end;//TtfwWordInfoE

 PtfwStackValue = tfwTypeInfo.PtfwStackValue;

const
  { Алиасы для значений tfwTypeInfo.TtfwValueType }
 tfw_vtVoid = tfwTypeInfo.tfw_vtVoid;
 tfw_vtInt = tfwTypeInfo.tfw_vtInt;
 tfw_vtBool = tfwTypeInfo.tfw_vtBool;
 tfw_vtStr = tfwTypeInfo.tfw_vtStr;
 tfw_vtObj = tfwTypeInfo.tfw_vtObj;
 tfw_vtList = tfwTypeInfo.tfw_vtList;
 tfw_vtIntf = tfwTypeInfo.tfw_vtIntf;
  { Интерфейс }
 tfw_vtNil = tfwTypeInfo.tfw_vtNil;
 tfw_vtFile = tfwTypeInfo.tfw_vtFile;
 tfw_vtChar = tfwTypeInfo.tfw_vtChar;
 tfw_vtWStr = tfwTypeInfo.tfw_vtWStr;
 tfw_vtBracket = tfwTypeInfo.tfw_vtBracket;
  { Псевдо-значение. "Скобка" }
 tfw_vtClass = tfwTypeInfo.tfw_vtClass;
  { Ссылка на класс }

const
  { Алиасы для значений tfwScriptingTypes.TtfwWordModifier }
 tfw_wmVirtual = tfwScriptingTypes.tfw_wmVirtual;
 tfw_wmAbstract = tfwScriptingTypes.tfw_wmAbstract;
 tfw_wmFinal = tfwScriptingTypes.tfw_wmFinal;
 tfw_wmSummoned = tfwScriptingTypes.tfw_wmSummoned;
 tfw_wmOverride = tfwScriptingTypes.tfw_wmOverride;
 tfw_wmRealize = tfwScriptingTypes.tfw_wmRealize;
 tfw_wmRedefinition = tfwScriptingTypes.tfw_wmRedefinition;
 tfw_wmRedefineable = tfwScriptingTypes.tfw_wmRedefineable;
 tfw_wmSealed = tfwScriptingTypes.tfw_wmSealed;
 tfw_wmCanBeMerged = tfwScriptingTypes.tfw_wmCanBeMerged;
  { Одноимённые слова с одинаковыми стереотипами МОГУТ склеиваться в одно, как например %CHILDREN. }
 tfw_wmRightWordRef = tfwScriptingTypes.tfw_wmRightWordRef;
 tfw_wmLeftWordRef = tfwScriptingTypes.tfw_wmLeftWordRef;
 tfw_wmImmediate = tfwScriptingTypes.tfw_wmImmediate;
 tfw_wmInline = tfwScriptingTypes.tfw_wmInline;
 tfw_wmTreatUnknownAsString = tfwScriptingTypes.tfw_wmTreatUnknownAsString;
 tfw_wmCaller = tfwScriptingTypes.tfw_wmCaller;

const
  { Алиасы для значений tfwScriptingTypes.TtfwAccessType }
 tfw_atNone = tfwScriptingTypes.tfw_atNone;
 tfw_atPrivate = tfwScriptingTypes.tfw_atPrivate;
 tfw_atProtected = tfwScriptingTypes.tfw_atProtected;
 tfw_atPublic = tfwScriptingTypes.tfw_atPublic;

const
  { Алиасы для значений tfwScriptingTypes.TtfwLinkType }
 tfw_ltNone = tfwScriptingTypes.tfw_ltNone;
 tfw_ltAggregation = tfwScriptingTypes.tfw_ltAggregation;
 tfw_ltLink = tfwScriptingTypes.tfw_ltLink;
 tfw_ltReference = tfwScriptingTypes.tfw_ltReference;


function TtfwSourcePoint_E: TtfwSourcePoint;

function TtfwStoredValue_C(aWord: TtfwWord;
     const aValue: TtfwStackValue): TtfwStoredValue;

function TtfwStackValue_C(const aValue: ItfwFile): TtfwStackValue; overload;
function TtfwStackValue_C(const aValue: ItfwValueList): TtfwStackValue; overload;
function TtfwStackValue_C(aValue: Integer): TtfwStackValue; overload;
function TtfwStackValue_E: TtfwStackValue; overload;
function TtfwStackValue_NULL: TtfwStackValue; overload;
function TtfwStackValue_C(aValue: Boolean): TtfwStackValue; overload;
function TtfwStackValue_C(aValue: TObject): TtfwStackValue; overload;
function TtfwStackValue_C(const aValue: Il3CString): TtfwStackValue; overload;
function TtfwStackValue_C(const anIntf: IUnknown): TtfwStackValue; overload;
function TtfwStackValue_C(aClass: TClass): TtfwStackValue; overload;
function TtfwStackValue_C(aValue: AnsiChar): TtfwStackValue; overload;
function TtfwStackValue_C(const aValue: Tl3WString): TtfwStackValue; overload;
function TtfwStackValue_CBracket: TtfwStackValue; overload;
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwWordInfoWordsPack,
  StrUtils,
  l3Parser,
  tfwClassRef,
  ArrayProcessingPack,
  BasicsPack,
  FileProcessingPack,
  SysUtilsPack,
  WordsRTTIPack,
  l3Base,
  l3String,
  kwForwardDeclaration,
  KeyWordPack,
  ItfwKeywordFinderWordsPack,
  ItfwCompilerWordsPack,
  tfwWordInfoCache,
  NewWordDefinitorPack
  ;


function TtfwSourcePoint_E: TtfwSourcePoint;
//#UC START# *55647E560346_55647DF70372_var*
//#UC END# *55647E560346_55647DF70372_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *55647E560346_55647DF70372_impl*
 Result.rName := nil;
 Result.rFileName := nil;
 Result.rProducerName := nil;
 Result.rLine := -1;
//#UC END# *55647E560346_55647DF70372_impl*
end;//TtfwSourcePoint.E

// start class TtfwSourcePoint

function TtfwSourcePoint.Empty: Boolean;
//#UC START# *55648E7E02DE_55647DF70372_var*
//#UC END# *55648E7E02DE_55647DF70372_var*
begin
//#UC START# *55648E7E02DE_55647DF70372_impl*
 Result := (l3IsNil(rName) AND l3IsNil(rFileName)){ OR (rLine <= 0)};
//#UC END# *55648E7E02DE_55647DF70372_impl*
end;//TtfwSourcePoint.Empty

function TtfwSourcePoint.ToString: AnsiString;
//#UC START# *556493D60163_55647DF70372_var*
var
 l_S : AnsiString;
 l_N : AnsiString;
 l_P : AnsiString;
//#UC END# *556493D60163_55647DF70372_var*
begin
//#UC START# *556493D60163_55647DF70372_impl*
 Result := l3Str(rName);
 if (Result <> '') then
 begin
  l_P := l3Str(Self.rProducerName);
  if (l_P <> '') then
   if (l_P <> Result) then
    Result := l3ConcatText(l_P, Result);
 end;//Result <> ''

 l_S := '';
 if (rLine > 0) then
  l_S := 'Line ' + IntToStr(rLine);

 l_N := ExtractFileName(l3Str(rFileName));
 if (l_N <> '') then
 begin
  if (l_S <> '') then
   l_S := l_S + ', ' + l_N
  else
   l_S := l_N;
 end;//l_N <> ''
 
 if (l_S <> '') then
 begin
  l_S := '(' + l_S + ')';
  Result := l3ConcatText(Result, l_S);
 end;//l_S <> ''
//#UC END# *556493D60163_55647DF70372_impl*
end;//TtfwSourcePoint.ToString
// start class TtfwWordInfo

class function TtfwWordInfo.Make(const aTypeInfoRec: TtfwWordInfoRec): TtfwWordInfo;
//#UC START# *55B25CDC00AF_559D504A0081_var*
//#UC END# *55B25CDC00AF_559D504A0081_var*
begin
//#UC START# *55B25CDC00AF_559D504A0081_impl*
 Result := TtfwWordInfoCache.Instance.GetTypeInfo(aTypeInfoRec);
//#UC END# *55B25CDC00AF_559D504A0081_impl*
end;//TtfwWordInfo.Make

class function TtfwWordInfo.Make(aTypeInfo: PTypeInfo): TtfwWordInfo;
//#UC START# *559D51990164_559D504A0081_var*
//#UC END# *559D51990164_559D504A0081_var*
begin
//#UC START# *559D51990164_559D504A0081_impl*
 Result := Make(TtfwWordInfoRec_C(TtfwValueTypes.Make(aTypeInfo), [], tfw_atNone, tfw_ltNone));
//#UC END# *559D51990164_559D504A0081_impl*
end;//TtfwWordInfo.Make

class function TtfwWordInfo.Make(aTypes: TtfwValueTypes;
  aModifiers: TtfwWordModifiers;
  anAccess: TtfwAccessType;
  aLinkType: TtfwLinkType): TtfwWordInfo;
//#UC START# *55BB8EDE02C5_559D504A0081_var*
//#UC END# *55BB8EDE02C5_559D504A0081_var*
begin
//#UC START# *55BB8EDE02C5_559D504A0081_impl*
 Result := Make(TtfwWordInfoRec_C(aTypes, aModifiers, anAccess, aLinkType));
//#UC END# *55BB8EDE02C5_559D504A0081_impl*
end;//TtfwWordInfo.Make

class function TtfwWordInfo.Make(const aType: TtfwTypeInfo): TtfwWordInfo;
//#UC START# *55C0C85702A4_559D504A0081_var*
//#UC END# *55C0C85702A4_559D504A0081_var*
begin
//#UC START# *55C0C85702A4_559D504A0081_impl*
 Result := Make(TtfwWordInfoRec_C(TtfwValueTypes.Make(aType), [], tfw_atNone, tfw_ltNone));
//#UC END# *55C0C85702A4_559D504A0081_impl*
end;//TtfwWordInfo.Make
// start class TtfwContext

procedure TtfwContext.SetWordInfo(aValue: TtfwWordInfo);
//#UC START# *55C386170161_4DB0091E033E_var*
//#UC END# *55C386170161_4DB0091E033E_var*
begin
//#UC START# *55C386170161_4DB0091E033E_impl*
 rTypeInfo := aValue;
//#UC END# *55C386170161_4DB0091E033E_impl*
end;//TtfwContext.SetWordInfo

function TtfwContext.ResolveIncludedFilePath(const aFile: AnsiString): AnsiString;
//#UC START# *55C89C5C015C_4DB0091E033E_var*
//#UC END# *55C89C5C015C_4DB0091E033E_var*
begin
//#UC START# *55C89C5C015C_4DB0091E033E_impl*
 if (ExtractFileDrive(aFile) <> '') OR
    AnsiStartsText('axiom:', aFile) then
 begin
  Result := aFile;
  if (Length(Result) > 2) then
   if (Result[2] = ':') then
    l3MakeLowerCase(@Result[1], 1);
 end//ExtractFileDrive(aFile) <> ''
 else
  Result := rCaller.ResolveIncludedFilePath(aFile);
//#UC END# *55C89C5C015C_4DB0091E033E_impl*
end;//TtfwContext.ResolveIncludedFilePath
// start class TtfwWordPrim

function TtfwWordPrim.IsCompiled: Boolean;
//#UC START# *4DB6CF7202CB_52EA594400DD_var*
//#UC END# *4DB6CF7202CB_52EA594400DD_var*
begin
//#UC START# *4DB6CF7202CB_52EA594400DD_impl*
 Result := false;
//#UC END# *4DB6CF7202CB_52EA594400DD_impl*
end;//TtfwWordPrim.IsCompiled

procedure TtfwWordPrim.StoreState(const aCtx: TtfwContext);
//#UC START# *4F49428A01EA_52EA594400DD_var*
//#UC END# *4F49428A01EA_52EA594400DD_var*
begin
//#UC START# *4F49428A01EA_52EA594400DD_impl*
 // - ничего не делаем
//#UC END# *4F49428A01EA_52EA594400DD_impl*
end;//TtfwWordPrim.StoreState

procedure TtfwWordPrim.RestoreState(const aCtx: TtfwContext);
//#UC START# *4F4942C50339_52EA594400DD_var*
//#UC END# *4F4942C50339_52EA594400DD_var*
begin
//#UC START# *4F4942C50339_52EA594400DD_impl*
 // - ничего не делаем
//#UC END# *4F4942C50339_52EA594400DD_impl*
end;//TtfwWordPrim.RestoreState

procedure TtfwWordPrim.DoIt(const aCtx: TtfwContext); // can raise EtfwCodeFlowError
//#UC START# *4F22776902FC_52EA594400DD_var*
//#UC END# *4F22776902FC_52EA594400DD_var*
begin
//#UC START# *4F22776902FC_52EA594400DD_impl*
 EtfwCheck.IsTrue(f_NestedCallsCount >= 0, 'Сломанный счётчик рекурсивных вызовов');
 try
  if (f_NestedCallsCount > 0) then
   if IsCompiled then
   // - отсекаем некомпилированные слова, т.к. с ними наверное всё хорошо
   //   а иначе падает например на том же INCLUDE
    begin
     Self.StoreState(aCtx);
     try
      Inc(f_NestedCallsCount);
      try
       DoDoIt(aCtx);
      finally
       Dec(f_NestedCallsCount);
      end;//try..finally
     finally
      Self.RestoreState(aCtx);
     end;//try..finally
     Exit;
     //raise EtfwRecursionNotSupportedYet.Create('Вложенные вызовы слов пока не поддерживаются');
     // - тут вообще говоря надо сложить значения переменных в стек, вызвать DoDoIt, а потом восстановит переменные
    end;//IsCompiled
  Inc(f_NestedCallsCount);
  try
   try
    DoDoIt(aCtx);
   finally
    ClearState(aCtx);
   end;///try..finally
  finally
   Dec(f_NestedCallsCount);
  end;//try..finally
 except
  on EtfwExitOrBreak do
   raise;
  else
  begin
   aCtx.rEngine.WordFail(SourcePoint);
   raise;
  end;//else 
 end;//try..except
//#UC END# *4F22776902FC_52EA594400DD_impl*
end;//TtfwWordPrim.DoIt

procedure TtfwWordPrim.ClearState(const aCtx: TtfwContext);
//#UC START# *53C90EC00136_52EA594400DD_var*
//#UC END# *53C90EC00136_52EA594400DD_var*
begin
//#UC START# *53C90EC00136_52EA594400DD_impl*
 // - ничего не делаем
//#UC END# *53C90EC00136_52EA594400DD_impl*
end;//TtfwWordPrim.ClearState

function TtfwWordPrim.SourcePoint: TtfwSourcePoint;
//#UC START# *556317DE02B5_52EA594400DD_var*
//#UC END# *556317DE02B5_52EA594400DD_var*
begin
//#UC START# *556317DE02B5_52EA594400DD_impl*
 Result := TtfwSourcePoint_E;
//#UC END# *556317DE02B5_52EA594400DD_impl*
end;//TtfwWordPrim.SourcePoint

procedure TtfwWordPrim.PushAdditionalParams(const aCtx: TtfwContext);
//#UC START# *55EED3920052_52EA594400DD_var*
//#UC END# *55EED3920052_52EA594400DD_var*
begin
//#UC START# *55EED3920052_52EA594400DD_impl*
 EtfwCheck.Fail('Недоделано. Может и не пригодится');
//#UC END# *55EED3920052_52EA594400DD_impl*
end;//TtfwWordPrim.PushAdditionalParams
// start class TtfwWord

function TtfwWord.IsImmediate(const aCtx: TtfwContext): Boolean;
//#UC START# *4DB6D7F70155_4DAEED140007_var*
//#UC END# *4DB6D7F70155_4DAEED140007_var*
begin
//#UC START# *4DB6D7F70155_4DAEED140007_impl*
 Result := false;
//#UC END# *4DB6D7F70155_4DAEED140007_impl*
end;//TtfwWord.IsImmediate

function TtfwWord.IsDefaultBranch: Boolean;
//#UC START# *4DBAF4630154_4DAEED140007_var*
//#UC END# *4DBAF4630154_4DAEED140007_var*
begin
//#UC START# *4DBAF4630154_4DAEED140007_impl*
 Result := false;
//#UC END# *4DBAF4630154_4DAEED140007_impl*
end;//TtfwWord.IsDefaultBranch

procedure TtfwWord.CompilerAssert(aCondition: Boolean;
  const aMessage: AnsiString;
  const aContext: TtfwContext);
//#UC START# *4EF4A312023F_4DAEED140007_var*

 function locName : AnsiString;
 begin
  if (f_Key <> nil) then
   Result := f_Key.AsString
  else
   Result := '';
 end;

 function locProducer: AnsiString;
 begin
  if (Self.WordProducer = nil) then
   Result := ''
  else
   Result := ' Producer: ' + Self.WordProducer.Key.AsString;
 end;

 function locParent: AnsiString;
 begin
  if (Self.ParentWord = nil) then
   Result := ''
  else
   Result := ' Parent: ' + Self.ParentWord.Key.AsString;
 end;

//#UC END# *4EF4A312023F_4DAEED140007_var*
begin
//#UC START# *4EF4A312023F_4DAEED140007_impl*
 if not aCondition then
 begin
  if (aContext.rParser <> nil) then
   EtfwCompiler.IsTrue(aCondition,
         Format('Ошибка компиляции: "%s". Тип токена: %s : %s в строке %d. Файл: %s. Класс: %s. Слово: %s%s%s',
                [aMessage,
                 GetEnumName(TypeInfo(Tl3TokenType),
                             Ord(aContext.rParser.TokenType)),
                 l3Str(aContext.rParser.TokenLongString),
                 aContext.rParser.SourceLine,
                 aContext.rParser.FileName,
                 ClassName,
                 locName,
                 locProducer,
                 locParent
                ]))
  else
   EtfwRunner.IsTrue(aCondition,
         Format('Ошибка выполнения: "%s". Главный файл: %s. Класс: %s. Слово: %s%s%s',
                [aMessage,
                 aContext.rStreamFactory.FileName,
                 ClassName,
                 locName,
                 locProducer,
                 locParent
                ]));
 end;//not aCondition              
//#UC END# *4EF4A312023F_4DAEED140007_impl*
end;//TtfwWord.CompilerAssert

procedure TtfwWord.RunnerAssert(aCondition: Boolean;
  const aMessage: AnsiString;
  const aContext: TtfwContext);
//#UC START# *4EF4AE480303_4DAEED140007_var*
//#UC END# *4EF4AE480303_4DAEED140007_var*
begin
//#UC START# *4EF4AE480303_4DAEED140007_impl*
 CompilerAssert(aCondition, aMessage, aContext);
//#UC END# *4EF4AE480303_4DAEED140007_impl*
end;//TtfwWord.RunnerAssert

function TtfwWord.IsAnonimous(const aCtx: TtfwContext): Boolean;
//#UC START# *4F3AB3600008_4DAEED140007_var*
//#UC END# *4F3AB3600008_4DAEED140007_var*
begin
//#UC START# *4F3AB3600008_4DAEED140007_impl*
 Result := false;
//#UC END# *4F3AB3600008_4DAEED140007_impl*
end;//TtfwWord.IsAnonimous

procedure TtfwWord.CompilerAssertFmt(aCondition: Boolean;
  const aMessage: AnsiString;
  const aParams: array of const;
  const aContext: TtfwContext);
//#UC START# *4F3E369002A2_4DAEED140007_var*
//#UC END# *4F3E369002A2_4DAEED140007_var*
begin
//#UC START# *4F3E369002A2_4DAEED140007_impl*
 CompilerAssert(aCondition, Format(aMessage, aParams), aContext);
//#UC END# *4F3E369002A2_4DAEED140007_impl*
end;//TtfwWord.CompilerAssertFmt

procedure TtfwWord.RunnerAssertFmt(aCondition: Boolean;
  const aMessage: AnsiString;
  const aParams: array of const;
  const aContext: TtfwContext);
//#UC START# *4F3E36A5031F_4DAEED140007_var*
//#UC END# *4F3E36A5031F_4DAEED140007_var*
begin
//#UC START# *4F3E36A5031F_4DAEED140007_impl*
 RunnerAssert(aCondition, Format(aMessage, aParams), aContext);
//#UC END# *4F3E36A5031F_4DAEED140007_impl*
end;//TtfwWord.RunnerAssertFmt

function TtfwWord.CompiledWordClassPrim(const aCtx: TtfwContext): RtfwWord;
//#UC START# *4F477C2C03B9_4DAEED140007_var*
//#UC END# *4F477C2C03B9_4DAEED140007_var*
begin
//#UC START# *4F477C2C03B9_4DAEED140007_impl*
 Result := nil;
//#UC END# *4F477C2C03B9_4DAEED140007_impl*
end;//TtfwWord.CompiledWordClassPrim

function TtfwWord.IsForwardDeclaration: Boolean;
//#UC START# *4F4BB6CD0359_4DAEED140007_var*
//#UC END# *4F4BB6CD0359_4DAEED140007_var*
begin
//#UC START# *4F4BB6CD0359_4DAEED140007_impl*
 Result := false;
//#UC END# *4F4BB6CD0359_4DAEED140007_impl*
end;//TtfwWord.IsForwardDeclaration

function TtfwWord.GetValue(const aCtx: TtfwContext): PtfwStackValue;
//#UC START# *52D399A00173_4DAEED140007_var*
//#UC END# *52D399A00173_4DAEED140007_var*
begin
//#UC START# *52D399A00173_4DAEED140007_impl*
 RunnerError('Невозможно получить значение', aCtx);
 Result := nil;
//#UC END# *52D399A00173_4DAEED140007_impl*
end;//TtfwWord.GetValue

function TtfwWord.IsVarLike: Boolean;
//#UC START# *52D399D40140_4DAEED140007_var*
//#UC END# *52D399D40140_4DAEED140007_var*
begin
//#UC START# *52D399D40140_4DAEED140007_impl*
 Result := false;
//#UC END# *52D399D40140_4DAEED140007_impl*
end;//TtfwWord.IsVarLike

procedure TtfwWord.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_4DAEED140007_var*
//#UC END# *52D00B00031A_4DAEED140007_var*
begin
//#UC START# *52D00B00031A_4DAEED140007_impl*
 RunnerError('Невозможно записать значение', aCtx);
//#UC END# *52D00B00031A_4DAEED140007_impl*
end;//TtfwWord.SetValue

function TtfwWord.HasCode: Boolean;
//#UC START# *52D40F640308_4DAEED140007_var*
//#UC END# *52D40F640308_4DAEED140007_var*
begin
//#UC START# *52D40F640308_4DAEED140007_impl*
 Result := false;
//#UC END# *52D40F640308_4DAEED140007_impl*
end;//TtfwWord.HasCode

function TtfwWord.HasLocalDictionary: Boolean;
//#UC START# *52D40FAA0073_4DAEED140007_var*
//#UC END# *52D40FAA0073_4DAEED140007_var*
begin
//#UC START# *52D40FAA0073_4DAEED140007_impl*
 Result := false;
//#UC END# *52D40FAA0073_4DAEED140007_impl*
end;//TtfwWord.HasLocalDictionary

function TtfwWord.CodeCount: Integer;
//#UC START# *52D4191402A2_4DAEED140007_var*
//#UC END# *52D4191402A2_4DAEED140007_var*
begin
//#UC START# *52D4191402A2_4DAEED140007_impl*
 Result := 0;
//#UC END# *52D4191402A2_4DAEED140007_impl*
end;//TtfwWord.CodeCount

function TtfwWord.GetCompiler(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D523A40118_4DAEED140007_var*
//#UC END# *52D523A40118_4DAEED140007_var*
begin
//#UC START# *52D523A40118_4DAEED140007_impl*
 Result := nil;
 CompilerAssert(false, 'Слово некомпилируемое', aCtx);
//#UC END# *52D523A40118_4DAEED140007_impl*
end;//TtfwWord.GetCompiler

function TtfwWord.DoDefineInParameter(const aCtx: TtfwContext;
  const aParamName: Il3CString;
  aStereo: TtfwWord;
  aTypeInfo: TtfwWordInfo): TtfwWord;
//#UC START# *4F4161BC0024_4DAEED140007_var*
//#UC END# *4F4161BC0024_4DAEED140007_var*
begin
//#UC START# *4F4161BC0024_4DAEED140007_impl*
 Result := nil;
 CompilerAssert(false, 'Слово не может иметь входных параметров', aCtx);
//#UC END# *4F4161BC0024_4DAEED140007_impl*
end;//TtfwWord.DoDefineInParameter

procedure TtfwWord.CompileInParameterPopCodeFromString(const aContext: TtfwContext;
  const aParameterToPop: Il3CString);
//#UC START# *4F4177910352_4DAEED140007_var*
//#UC END# *4F4177910352_4DAEED140007_var*
begin
//#UC START# *4F4177910352_4DAEED140007_impl*
 CompilerAssert(false, 'Слово не может иметь входных параметров и кода для их инициализации', aContext);
//#UC END# *4F4177910352_4DAEED140007_impl*
end;//TtfwWord.CompileInParameterPopCodeFromString

procedure TtfwWord.DoAddCodePart(aWord: TtfwWord;
  const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate);
//#UC START# *4DB6CB1703AD_4DAEED140007_var*
//#UC END# *4DB6CB1703AD_4DAEED140007_var*
begin
//#UC START# *4DB6CB1703AD_4DAEED140007_impl*
 CompilerAssert(false, 'Слово не может содержать кода', aCtx);
//#UC END# *4DB6CB1703AD_4DAEED140007_impl*
end;//TtfwWord.DoAddCodePart

function TtfwWord.IsCloseBracket: Boolean;
//#UC START# *52D6ABCB0026_4DAEED140007_var*
//#UC END# *52D6ABCB0026_4DAEED140007_var*
begin
//#UC START# *52D6ABCB0026_4DAEED140007_impl*
 Result := false;
//#UC END# *52D6ABCB0026_4DAEED140007_impl*
end;//TtfwWord.IsCloseBracket

function TtfwWord.GetEndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *52D6B62E001B_4DAEED140007_var*
//#UC END# *52D6B62E001B_4DAEED140007_var*
begin
//#UC START# *52D6B62E001B_4DAEED140007_impl*
 Result := nil;
//#UC END# *52D6B62E001B_4DAEED140007_impl*
end;//TtfwWord.GetEndBracket

class function TtfwWord.NameForRegister: AnsiString;
//#UC START# *52D7B67501CE_4DAEED140007_var*
//#UC END# *52D7B67501CE_4DAEED140007_var*
begin
//#UC START# *52D7B67501CE_4DAEED140007_impl*
 Result := '';
//#UC END# *52D7B67501CE_4DAEED140007_impl*
end;//TtfwWord.NameForRegister

function TtfwWord.AcceptMedianBracket(aBracket: TtfwWord;
  var aCtx: TtfwContext): Boolean;
//#UC START# *52D7DC84019E_4DAEED140007_var*
//#UC END# *52D7DC84019E_4DAEED140007_var*
begin
//#UC START# *52D7DC84019E_4DAEED140007_impl*
 Result := false;
//#UC END# *52D7DC84019E_4DAEED140007_impl*
end;//TtfwWord.AcceptMedianBracket

function TtfwWord.GetAsCaller(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52DFE48500BB_4DAEED140007_var*
//#UC END# *52DFE48500BB_4DAEED140007_var*
begin
//#UC START# *52DFE48500BB_4DAEED140007_impl*
 Result := aCtx.rCompiler;
(* CompilerAssert(aCtx.rWordDefiningNow = aCtx.rCompiler.GetWordCompilingNow, 'Компилируемое слово не совпадает с определяемым, а должно', aCtx);
 CompilerAssert(aCtx.rWordDefiningNow = Self, 'Текущее слово не совпадает с определяемым, а должно', aCtx);
 Result := Self;*)
//#UC END# *52DFE48500BB_4DAEED140007_impl*
end;//TtfwWord.GetAsCaller

function TtfwWord.IsRightParam(const aCtx: TtfwContext): Boolean;
//#UC START# *52E91D9D0024_4DAEED140007_var*
//#UC END# *52E91D9D0024_4DAEED140007_var*
begin
//#UC START# *52E91D9D0024_4DAEED140007_impl*
 Result := false;
//#UC END# *52E91D9D0024_4DAEED140007_impl*
end;//TtfwWord.IsRightParam

function TtfwWord.RightParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *52E9282B0271_4DAEED140007_var*
//#UC END# *52E9282B0271_4DAEED140007_var*
begin
//#UC START# *52E9282B0271_4DAEED140007_impl*
 Result := 0;
 CompilerAssert(false, 'Слово не имеет параметров справа', aCtx);
//#UC END# *52E9282B0271_4DAEED140007_impl*
end;//TtfwWord.RightParamsCount

function TtfwWord.GetInParam(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *52D5425A037F_4DAEED140007_var*
//#UC END# *52D5425A037F_4DAEED140007_var*
begin
//#UC START# *52D5425A037F_4DAEED140007_impl*
 Result := nil;
//#UC END# *52D5425A037F_4DAEED140007_impl*
end;//TtfwWord.GetInParam

procedure TtfwWord.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4DAEED140007_var*
//#UC END# *52EA6A2C0111_4DAEED140007_var*
begin
//#UC START# *52EA6A2C0111_4DAEED140007_impl*
 CompilerAssert(aValue.EQwm([]) AND aValue.ValueTypes.Empty,
                'Непустой список модификаторов в: ' + ClassName, aCtx);
//#UC END# *52EA6A2C0111_4DAEED140007_impl*
end;//TtfwWord.SetResultTypeInfo

function TtfwWord.IsLeftWordRefParam(const aCtx: TtfwContext): Boolean;
//#UC START# *53E389100169_4DAEED140007_var*
//#UC END# *53E389100169_4DAEED140007_var*
begin
//#UC START# *53E389100169_4DAEED140007_impl*
 Result := false;
//#UC END# *53E389100169_4DAEED140007_impl*
end;//TtfwWord.IsLeftWordRefParam

class procedure TtfwWord.RegisterClass;
//#UC START# *53E46C0A033C_4DAEED140007_var*
//#UC END# *53E46C0A033C_4DAEED140007_var*
begin
//#UC START# *53E46C0A033C_4DAEED140007_impl*
 TtfwClassRef.Register(Self);
//#UC END# *53E46C0A033C_4DAEED140007_impl*
end;//TtfwWord.RegisterClass

function TtfwWord.LeftWordRefParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4914101D2_4DAEED140007_var*
//#UC END# *53E4914101D2_4DAEED140007_var*
begin
//#UC START# *53E4914101D2_4DAEED140007_impl*
 Result := 0;
//#UC END# *53E4914101D2_4DAEED140007_impl*
end;//TtfwWord.LeftWordRefParamsCount

procedure TtfwWord.AddLeftWordRefValue(const aCtx: TtfwContext;
  aValue: TtfwWord);
//#UC START# *53E49B2F01E4_4DAEED140007_var*
//#UC END# *53E49B2F01E4_4DAEED140007_var*
begin
//#UC START# *53E49B2F01E4_4DAEED140007_impl*
 CompilerAssert(false, 'Слово не может принимать параметры слева по ссылке', aCtx);
//#UC END# *53E49B2F01E4_4DAEED140007_impl*
end;//TtfwWord.AddLeftWordRefValue

function TtfwWord.GetLeftWordRefValue(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *53E4A3C100AB_4DAEED140007_var*
//#UC END# *53E4A3C100AB_4DAEED140007_var*
begin
//#UC START# *53E4A3C100AB_4DAEED140007_impl*
 Result := nil;
 CompilerAssert(false, 'Нету значений для левых параметров по ссылке', aCtx);
//#UC END# *53E4A3C100AB_4DAEED140007_impl*
end;//TtfwWord.GetLeftWordRefValue

function TtfwWord.LeftWordRefValuesCount(const aCtx: TtfwContext): Integer;
//#UC START# *53E4A96A0085_4DAEED140007_var*
//#UC END# *53E4A96A0085_4DAEED140007_var*
begin
//#UC START# *53E4A96A0085_4DAEED140007_impl*
 Result := 0;
//#UC END# *53E4A96A0085_4DAEED140007_impl*
end;//TtfwWord.LeftWordRefValuesCount

procedure TtfwWord.RunnerError(const aMessage: AnsiString;
  const aContext: TtfwContext);
//#UC START# *551271AF0112_4DAEED140007_var*
//#UC END# *551271AF0112_4DAEED140007_var*
begin
//#UC START# *551271AF0112_4DAEED140007_impl*
 RunnerAssert(false, aMessage, aContext);
//#UC END# *551271AF0112_4DAEED140007_impl*
end;//TtfwWord.RunnerError

function TtfwWord.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
//#UC START# *551544E2001A_4DAEED140007_var*
//#UC END# *551544E2001A_4DAEED140007_var*
begin
//#UC START# *551544E2001A_4DAEED140007_impl*
 Result := nil;
//#UC END# *551544E2001A_4DAEED140007_impl*
end;//TtfwWord.GetResultTypeInfo

procedure TtfwWord.BadValueType(aType: TtfwValueType;
  const aCtx: TtfwContext);
//#UC START# *551A8FD70119_4DAEED140007_var*
//#UC END# *551A8FD70119_4DAEED140007_var*
begin
//#UC START# *551A8FD70119_4DAEED140007_impl*
 RunnerError('Неверный тип значения: ' + GetEnumName(TypeInfo(TtfwValueType), Ord(aType)), aCtx);
//#UC END# *551A8FD70119_4DAEED140007_impl*
end;//TtfwWord.BadValueType

function TtfwWord.GetRightParam(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *55769895035B_4DAEED140007_var*
//#UC END# *55769895035B_4DAEED140007_var*
begin
//#UC START# *55769895035B_4DAEED140007_impl*
 Result := nil;
//#UC END# *55769895035B_4DAEED140007_impl*
end;//TtfwWord.GetRightParam

function TtfwWord.GetResultVar(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D1A4C0082_4DAEED140007_var*
//#UC END# *558D1A4C0082_4DAEED140007_var*
begin
//#UC START# *558D1A4C0082_4DAEED140007_impl*
 Result := nil;
 RunnerError('Слово не имеет возвращаемого значения', aCtx);
//#UC END# *558D1A4C0082_4DAEED140007_impl*
end;//TtfwWord.GetResultVar

constructor TtfwWord.Create;
//#UC START# *558D4AC70295_4DAEED140007_var*
//#UC END# *558D4AC70295_4DAEED140007_var*
begin
//#UC START# *558D4AC70295_4DAEED140007_impl*
 inherited;
//#UC END# *558D4AC70295_4DAEED140007_impl*
end;//TtfwWord.Create

function TtfwWord.GetRef(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D2BCA0324_4DAEED140007_var*
//#UC END# *558D2BCA0324_4DAEED140007_var*
begin
//#UC START# *558D2BCA0324_4DAEED140007_impl*
 Result := Self;
//#UC END# *558D2BCA0324_4DAEED140007_impl*
end;//TtfwWord.GetRef

function TtfwWord.GetAllParamsCount(const aCtx: TtfwContext): Integer;
//#UC START# *559687E6025A_4DAEED140007_var*
//#UC END# *559687E6025A_4DAEED140007_var*
begin
//#UC START# *559687E6025A_4DAEED140007_impl*
 Result := 0;
//#UC END# *559687E6025A_4DAEED140007_impl*
end;//TtfwWord.GetAllParamsCount

function TtfwWord.CanClearInRecursiveCalls: Boolean;
//#UC START# *559A470F0288_4DAEED140007_var*
//#UC END# *559A470F0288_4DAEED140007_var*
begin
//#UC START# *559A470F0288_4DAEED140007_impl*
 Result := false;
//#UC END# *559A470F0288_4DAEED140007_impl*
end;//TtfwWord.CanClearInRecursiveCalls

function TtfwWord.IsInParam: Boolean;
//#UC START# *559A4C5801D8_4DAEED140007_var*
//#UC END# *559A4C5801D8_4DAEED140007_var*
begin
//#UC START# *559A4C5801D8_4DAEED140007_impl*
 Result := false;
//#UC END# *559A4C5801D8_4DAEED140007_impl*
end;//TtfwWord.IsInParam

procedure TtfwWord.InitValue(const aCtx: TtfwContext);
//#UC START# *55A5244400BD_4DAEED140007_var*
//#UC END# *55A5244400BD_4DAEED140007_var*
begin
//#UC START# *55A5244400BD_4DAEED140007_impl*
 Self.SetValue(Self.ResultTypeInfo[aCtx].ValueTypes.DefaultValue, aCtx, false);
//#UC END# *55A5244400BD_4DAEED140007_impl*
end;//TtfwWord.InitValue

function TtfwWord.GetNewWordDefinitor: TtfwWord;
//#UC START# *52D56341033B_4DAEED140007_var*
//#UC END# *52D56341033B_4DAEED140007_var*
begin
//#UC START# *52D56341033B_4DAEED140007_impl*
 Result := nil;
//#UC END# *52D56341033B_4DAEED140007_impl*
end;//TtfwWord.GetNewWordDefinitor

function TtfwWord.GetKeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D5637A031E_4DAEED140007_var*
//#UC END# *52D5637A031E_4DAEED140007_var*
begin
//#UC START# *52D5637A031E_4DAEED140007_impl*
 Result := nil;
//#UC END# *52D5637A031E_4DAEED140007_impl*
end;//TtfwWord.GetKeywordFinder

procedure TtfwWord.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord;
  aCheckCode: Boolean);
//#UC START# *52D56A980103_4DAEED140007_var*
//#UC END# *52D56A980103_4DAEED140007_var*
begin
//#UC START# *52D56A980103_4DAEED140007_impl*
 CompilerAssert(false, 'Слово не может иметь входные параметры', aContext);
//#UC END# *52D56A980103_4DAEED140007_impl*
end;//TtfwWord.DoCompileInParameterPopCode

function TtfwWord.DoCheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *55A7D34102A0_4DAEED140007_var*

 function locName : AnsiString;
 begin
  if (f_Key <> nil) then
   Result := f_Key.AsString
  else
   Result := '';
 end;

//#UC END# *55A7D34102A0_4DAEED140007_var*
begin
//#UC START# *55A7D34102A0_4DAEED140007_impl*
 Result := nil;
 Assert(false, 'Слово ' + locName + ' не может иметь вложенные слова');
//#UC END# *55A7D34102A0_4DAEED140007_impl*
end;//TtfwWord.DoCheckWord

function TtfwWord.GetKeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *55ACE5210310_4DAEED140007_var*
//#UC END# *55ACE5210310_4DAEED140007_var*
begin
//#UC START# *55ACE5210310_4DAEED140007_impl*
 Result := nil;
//#UC END# *55ACE5210310_4DAEED140007_impl*
end;//TtfwWord.GetKeywordByName

function TtfwWord.GetParentFinder: TtfwWord;
//#UC START# *55ACF0F5025D_4DAEED140007_var*
//#UC END# *55ACF0F5025D_4DAEED140007_var*
begin
//#UC START# *55ACF0F5025D_4DAEED140007_impl*
 Result := nil;
//#UC END# *55ACF0F5025D_4DAEED140007_impl*
end;//TtfwWord.GetParentFinder

function TtfwWord.WordName: Il3CString;
//#UC START# *55AFD7DA0258_4DAEED140007_var*
//#UC END# *55AFD7DA0258_4DAEED140007_var*
begin
//#UC START# *55AFD7DA0258_4DAEED140007_impl*
 if (f_Key = nil) then
  Result := TtfwCStringFactory.C(ClassName)
 else
  Result := f_Key.AsCStr;
//#UC END# *55AFD7DA0258_4DAEED140007_impl*
end;//TtfwWord.WordName

function TtfwWord.IsForHelp: Boolean;
//#UC START# *55C399C9009B_4DAEED140007_var*
//#UC END# *55C399C9009B_4DAEED140007_var*
begin
//#UC START# *55C399C9009B_4DAEED140007_impl*
 Result := true;
//#UC END# *55C399C9009B_4DAEED140007_impl*
end;//TtfwWord.IsForHelp

function TtfwWord.MakeRefForCompile(const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate): TtfwWord;
//#UC START# *55CB5B8C004E_4DAEED140007_var*
//#UC END# *55CB5B8C004E_4DAEED140007_var*
begin
//#UC START# *55CB5B8C004E_4DAEED140007_impl*
 Result := Use;
//#UC END# *55CB5B8C004E_4DAEED140007_impl*
end;//TtfwWord.MakeRefForCompile

procedure TtfwWord.pm_SetRedefines(aValue: TtfwWord);
//#UC START# *4F41FF0C01A6_4DAEED140007set_var*
//#UC END# *4F41FF0C01A6_4DAEED140007set_var*
begin
//#UC START# *4F41FF0C01A6_4DAEED140007set_impl*
 EtfwCheck.IsTrue((f_Redefines = nil) OR (aValue = f_Redefines), 'Слово не может переопределять БОЛЕЕ одного слова');
 EtfwCheck.IsTrue(aValue <> Self, 'Слово не может переопределять самого себя');
 aValue.SetRefTo(f_Redefines);
//#UC END# *4F41FF0C01A6_4DAEED140007set_impl*
end;//TtfwWord.pm_SetRedefines

function TtfwWord.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_4DAEED140007get_var*
//#UC END# *4F43C9A10139_4DAEED140007get_var*
begin
//#UC START# *4F43C9A10139_4DAEED140007get_impl*
 Result := nil;
//#UC END# *4F43C9A10139_4DAEED140007get_impl*
end;//TtfwWord.pm_GetWordProducer

procedure TtfwWord.pm_SetWordProducer(aValue: TtfwWord);
//#UC START# *4F43C9A10139_4DAEED140007set_var*
//#UC END# *4F43C9A10139_4DAEED140007set_var*
begin
//#UC START# *4F43C9A10139_4DAEED140007set_impl*
 Assert(false);
//#UC END# *4F43C9A10139_4DAEED140007set_impl*
end;//TtfwWord.pm_SetWordProducer

function TtfwWord.pm_GetInnerDictionary: TtfwDictionaryPrim;
//#UC START# *52B43311021D_4DAEED140007get_var*
//#UC END# *52B43311021D_4DAEED140007get_var*
begin
//#UC START# *52B43311021D_4DAEED140007get_impl*
 Result := nil;
//#UC END# *52B43311021D_4DAEED140007get_impl*
end;//TtfwWord.pm_GetInnerDictionary

function TtfwWord.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_4DAEED140007get_var*
//#UC END# *52CFC11603C8_4DAEED140007get_var*
begin
//#UC START# *52CFC11603C8_4DAEED140007get_impl*
 Result := TtfwWordInfo.Make(GetResultTypeInfo(aCtx));
//#UC END# *52CFC11603C8_4DAEED140007get_impl*
end;//TtfwWord.pm_GetResultTypeInfo

function TtfwWord.pm_GetParentWord: TtfwWord;
//#UC START# *52CFCF4B02C6_4DAEED140007get_var*
//#UC END# *52CFCF4B02C6_4DAEED140007get_var*
begin
//#UC START# *52CFCF4B02C6_4DAEED140007get_impl*
 Result := nil;
//#UC END# *52CFCF4B02C6_4DAEED140007get_impl*
end;//TtfwWord.pm_GetParentWord

procedure TtfwWord.AddCodePart(aWord: TtfwWord;
  const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate);
//#UC START# *4DB6E3090290_4DAEED140007_var*
//#UC END# *4DB6E3090290_4DAEED140007_var*
begin
//#UC START# *4DB6E3090290_4DAEED140007_impl*
 DoAddCodePart(aWord, aCtx, aSNI);
//#UC END# *4DB6E3090290_4DAEED140007_impl*
end;//TtfwWord.AddCodePart

procedure TtfwWord.CompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord);
//#UC START# *4F416F900048_4DAEED140007_var*
//#UC END# *4F416F900048_4DAEED140007_var*
begin
//#UC START# *4F416F900048_4DAEED140007_impl*
 DoCompileInParameterPopCode(aContext, aParameterToPop, true);
//#UC END# *4F416F900048_4DAEED140007_impl*
end;//TtfwWord.CompileInParameterPopCode

function TtfwWord.CheckWord(const aName: Il3CString): TtfwKeyWord;
//#UC START# *4F46588B021E_4DAEED140007_var*
//#UC END# *4F46588B021E_4DAEED140007_var*
begin
//#UC START# *4F46588B021E_4DAEED140007_impl*
 Result := DoCheckWord(aName);
//#UC END# *4F46588B021E_4DAEED140007_impl*
end;//TtfwWord.CheckWord

function TtfwWord.DefineInParameter(const aCtx: TtfwContext;
  const aParamName: Il3CString;
  aStereo: TtfwWord;
  aTypeInfo: TtfwWordInfo): TtfwWord;
//#UC START# *559D25E90141_4DAEED140007_var*
//#UC END# *559D25E90141_4DAEED140007_var*
begin
//#UC START# *559D25E90141_4DAEED140007_impl*
 Result := DoDefineInParameter(aCtx, aParamName, aStereo, aTypeInfo);
//#UC END# *559D25E90141_4DAEED140007_impl*
end;//TtfwWord.DefineInParameter

function TtfwWord.NewWordDefinitor: TtfwWord;
//#UC START# *55A7C9680222_4DAEED140007_var*
//#UC END# *55A7C9680222_4DAEED140007_var*
begin
//#UC START# *55A7C9680222_4DAEED140007_impl*
 Result := GetNewWordDefinitor;
//#UC END# *55A7C9680222_4DAEED140007_impl*
end;//TtfwWord.NewWordDefinitor

function TtfwWord.KeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *55A7C9EC0295_4DAEED140007_var*
//#UC END# *55A7C9EC0295_4DAEED140007_var*
begin
//#UC START# *55A7C9EC0295_4DAEED140007_impl*
 Result := GetKeywordFinder(aCtx);
//#UC END# *55A7C9EC0295_4DAEED140007_impl*
end;//TtfwWord.KeywordFinder

function TtfwWord.KeywordByName(const aName: Il3CString): Tl3PrimString;
//#UC START# *55ACD5F10301_4DAEED140007_var*
//#UC END# *55ACD5F10301_4DAEED140007_var*
begin
//#UC START# *55ACD5F10301_4DAEED140007_impl*
 Result := GetKeywordByName(aName);
//#UC END# *55ACD5F10301_4DAEED140007_impl*
end;//TtfwWord.KeywordByName

function TtfwWord.ParentFinder: TtfwWord;
//#UC START# *55ACF0CF0320_4DAEED140007_var*
//#UC END# *55ACF0CF0320_4DAEED140007_var*
begin
//#UC START# *55ACF0CF0320_4DAEED140007_impl*
 Result := GetParentFinder;
//#UC END# *55ACF0CF0320_4DAEED140007_impl*
end;//TtfwWord.ParentFinder

procedure TtfwWord.Cleanup;
//#UC START# *479731C50290_4DAEED140007_var*
//#UC END# *479731C50290_4DAEED140007_var*
begin
//#UC START# *479731C50290_4DAEED140007_impl*
 f_Key := nil;
 FreeAndNil(f_Redefines);
 inherited;
//#UC END# *479731C50290_4DAEED140007_impl*
end;//TtfwWord.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TtfwWord.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_4DAEED140007_var*
//#UC END# *47A6FEE600FC_4DAEED140007_var*
begin
//#UC START# *47A6FEE600FC_4DAEED140007_impl*
 Result := true;
//#UC END# *47A6FEE600FC_4DAEED140007_impl*
end;//TtfwWord.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function TtfwWord.SourcePoint: TtfwSourcePoint;
//#UC START# *556317DE02B5_4DAEED140007_var*
//#UC END# *556317DE02B5_4DAEED140007_var*
begin
//#UC START# *556317DE02B5_4DAEED140007_impl*
 Result := TtfwSourcePoint_E;
 if (f_Key <> nil) then
  Result.rName := f_Key.AsCStr;
 if (Self.WordProducer <> nil) then
  if (Self.WordProducer.Key <> nil) then
   Result.rProducerName := Self.WordProducer.Key.AsCStr;
//#UC END# *556317DE02B5_4DAEED140007_impl*
end;//TtfwWord.SourcePoint
// start class TtfwKeyWord

constructor TtfwKeyWord.Create(aDictionary: TtfwDictionaryPrim;
  const aKeyword: AnsiString;
  aWord: TtfwWord);
//#UC START# *4DB578450319_4DAEF23D00EE_var*
//#UC END# *4DB578450319_4DAEF23D00EE_var*
begin
//#UC START# *4DB578450319_4DAEF23D00EE_impl*
 Create(aDictionary, TtfwCStringFactory.C(aKeyword));
 EtfwCheck.IsTrue(f_Word = nil, 'Слово уже присвоено');
 f_Word := aWord.Use;
 if (f_Word <> nil) then
  f_Word.f_Key := Self;
//#UC END# *4DB578450319_4DAEF23D00EE_impl*
end;//TtfwKeyWord.Create

constructor TtfwKeyWord.Create(aDictionary: TtfwDictionaryPrim;
  const aKeyword: Tl3WString);
//#UC START# *4F46550C03E5_4DAEF23D00EE_var*
//#UC END# *4F46550C03E5_4DAEF23D00EE_var*
begin
//#UC START# *4F46550C03E5_4DAEF23D00EE_impl*
 Create(aDictionary, TtfwCStringFactory.C(aKeyword));
//#UC END# *4F46550C03E5_4DAEF23D00EE_impl*
end;//TtfwKeyWord.Create

constructor TtfwKeyWord.Create(aDictionary: TtfwDictionaryPrim;
  const aKeyword: Il3CString);
//#UC START# *4F4658D00140_4DAEF23D00EE_var*
//#UC END# *4F4658D00140_4DAEF23D00EE_var*
begin
//#UC START# *4F4658D00140_4DAEF23D00EE_impl*
 inherited Create(aKeyword);
 f_Dictionary := aDictionary;
//#UC END# *4F4658D00140_4DAEF23D00EE_impl*
end;//TtfwKeyWord.Create

procedure TtfwKeyWord.ChangeDictionary(aValue: TtfwDictionaryPrim);
//#UC START# *55B1FDAD0118_4DAEF23D00EE_var*
//#UC END# *55B1FDAD0118_4DAEF23D00EE_var*
begin
//#UC START# *55B1FDAD0118_4DAEF23D00EE_impl*
 f_Dictionary := aValue;
//#UC END# *55B1FDAD0118_4DAEF23D00EE_impl*
end;//TtfwKeyWord.ChangeDictionary

procedure TtfwKeyWord.SetWord(const aCtx: TtfwContext;
  aWord: TtfwWord);
//#UC START# *55B794CC0388_4DAEF23D00EE_var*
//#UC END# *55B794CC0388_4DAEF23D00EE_var*
begin
//#UC START# *55B794CC0388_4DAEF23D00EE_impl*
 if (aWord <> f_Word) then
 begin
  if (aWord <> nil) AND (f_Word <> nil) AND f_Word.IsForwardDeclaration then
  begin
   aWord.CompilerAssert(f_Word <> aWord, 'Присваиваем самому себе', aCtx);
   aWord.CompilerAssert(TkwForwardDeclaration(f_Word).RealWord = nil,
          Format('Предварительное определение слова %s уже было завершено',
                 [Self.AsString]), aCtx
          );
   TkwForwardDeclaration(f_Word).RealWord := aWord;
  end//(f_Word <> nil) AND f_Word.IsForwardDeclaration
  else
  begin
   if (f_Word <> nil) then
    if (f_Word.f_Key = Self) then
    begin
     if (aWord <> nil) AND aWord.ResultTypeInfo[aCtx].Has(tfw_wmRedefinition) then
      aWord.Redefines := f_Word
     else
      f_Word.f_Key := nil;
    end;//f_Word.f_Key = Self
   aWord.SetRefTo(f_Word);
   if (f_Word <> nil) then
    f_Word.f_Key := Self;
  end//(f_Word <> nil) AND f_Word.IsForwardDeclaration
 end;//aWord <> f_Word
//#UC END# *55B794CC0388_4DAEF23D00EE_impl*
end;//TtfwKeyWord.SetWord

procedure TtfwKeyWord.Cleanup;
//#UC START# *479731C50290_4DAEF23D00EE_var*
//#UC END# *479731C50290_4DAEF23D00EE_var*
begin
//#UC START# *479731C50290_4DAEF23D00EE_impl*
 if (f_Word <> nil) then
  if (f_Word.f_Key = Self) then
   f_Word.f_Key := nil;
 FreeAndNil(f_Word);
 inherited;
//#UC END# *479731C50290_4DAEF23D00EE_impl*
end;//TtfwKeyWord.Cleanup

function TtfwKeyWord.GetAsPCharLen: Tl3WString;
//#UC START# *47A869BB02DE_4DAEF23D00EE_var*
//#UC END# *47A869BB02DE_4DAEF23D00EE_var*
begin
//#UC START# *47A869BB02DE_4DAEF23D00EE_impl*
 Result := l3PCharLen(AsCStr);
//#UC END# *47A869BB02DE_4DAEF23D00EE_impl*
end;//TtfwKeyWord.GetAsPCharLen

procedure TtfwKeyWord.DoSetAsPCharLen(const Value: Tl3PCharLen);
//#UC START# *47A869D10074_4DAEF23D00EE_var*
//#UC END# *47A869D10074_4DAEF23D00EE_var*
begin
//#UC START# *47A869D10074_4DAEF23D00EE_impl*
 EtfwCheck.Fail('Нельзя править значение ключевого слова');
//#UC END# *47A869D10074_4DAEF23D00EE_impl*
end;//TtfwKeyWord.DoSetAsPCharLen

function TtfwStoredValue_C(aWord: TtfwWord;
       const aValue: TtfwStackValue): TtfwStoredValue;
//#UC START# *4F49402A03C2_4F493FAE01C7_var*
//#UC END# *4F49402A03C2_4F493FAE01C7_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F49402A03C2_4F493FAE01C7_impl*
 Result.rWord := aWord;
 Result.rValue := aValue;
//#UC END# *4F49402A03C2_4F493FAE01C7_impl*
end;//TtfwStoredValue.C

// start class TtfwWordInfoF

constructor TtfwWordInfoF.Create(const aModifiers: TtfwWordInfoRec);
//#UC START# *559E663E0307_559D51430285_var*
//#UC END# *559E663E0307_559D51430285_var*
begin
//#UC START# *559E663E0307_559D51430285_impl*
 inherited Create;
 f_WordInfo := aModifiers;
(* if f_WordInfo.Has(tfw_wmRightWordRef) OR
    f_WordInfo.Has(tfw_wmLeftWordRef) then
  f_WordInfo.rTypeModifiers := TtfwValueTypes.Make(TypeInfo(TtfwWord));
  // - незачем тут ничего складывать*)
//#UC END# *559E663E0307_559D51430285_impl*
end;//TtfwWordInfoF.Create

function TtfwWordInfoF.IncludeModifier(aModifier: TtfwWordModifier): TtfwWordInfo;
//#UC START# *559D50760320_559D51430285_var*
//#UC END# *559D50760320_559D51430285_var*
begin
//#UC START# *559D50760320_559D51430285_impl*
 if f_WordInfo.Has(aModifier) then
  Result := Self
 else
  Result := Make(TtfwWordInfoRec_C(f_WordInfo.rTypeModifiers, f_WordInfo.rModifiers + [aModifier], f_WordInfo.rAccessType, f_WordInfo.rLinkType));
//#UC END# *559D50760320_559D51430285_impl*
end;//TtfwWordInfoF.IncludeModifier

function TtfwWordInfoF.Empty: Boolean;
//#UC START# *559D50D40233_559D51430285_var*
//#UC END# *559D50D40233_559D51430285_var*
begin
//#UC START# *559D50D40233_559D51430285_impl*
 Result := f_WordInfo.Empty;
//#UC END# *559D50D40233_559D51430285_impl*
end;//TtfwWordInfoF.Empty

function TtfwWordInfoF.Has(aModifier: TtfwWordModifier): Boolean;
//#UC START# *559D50EA02F1_559D51430285_var*
//#UC END# *559D50EA02F1_559D51430285_var*
begin
//#UC START# *559D50EA02F1_559D51430285_impl*
 Result := f_WordInfo.Has(aModifier);
//#UC END# *559D50EA02F1_559D51430285_impl*
end;//TtfwWordInfoF.Has

function TtfwWordInfoF.Clone: TtfwWordInfo;
//#UC START# *559D62F40210_559D51430285_var*
//#UC END# *559D62F40210_559D51430285_var*
begin
//#UC START# *559D62F40210_559D51430285_impl*
 Result := Self;
//#UC END# *559D62F40210_559D51430285_impl*
end;//TtfwWordInfoF.Clone

function TtfwWordInfoF.PRec: PtfwWordInfoRec;
//#UC START# *55B2543C0304_559D51430285_var*
//#UC END# *55B2543C0304_559D51430285_var*
begin
//#UC START# *55B2543C0304_559D51430285_impl*
 Result := @f_WordInfo;
//#UC END# *55B2543C0304_559D51430285_impl*
end;//TtfwWordInfoF.PRec

function TtfwWordInfoF.IncludeTypeModifier(aType: TtfwValueType): TtfwWordInfo;
//#UC START# *55B264D6035A_559D51430285_var*
//#UC END# *55B264D6035A_559D51430285_var*
begin
//#UC START# *55B264D6035A_559D51430285_impl*
 if f_WordInfo.Has(aType) then
  Result := Self
 else
  Result := Make(TtfwWordInfoRec_C(ValueTypes.Add(TtfwTypeInfo_C(aType)), f_WordInfo.rModifiers, f_WordInfo.rAccessType, f_WordInfo.rLinkType));
//#UC END# *55B264D6035A_559D51430285_impl*
end;//TtfwWordInfoF.IncludeTypeModifier

function TtfwWordInfoF.Has(aType: TtfwValueType): Boolean;
//#UC START# *55B2651800DB_559D51430285_var*
//#UC END# *55B2651800DB_559D51430285_var*
begin
//#UC START# *55B2651800DB_559D51430285_impl*
 Result := f_WordInfo.Has(aType);
//#UC END# *55B2651800DB_559D51430285_impl*
end;//TtfwWordInfoF.Has

function TtfwWordInfoF.AcceptsValue(const aValue: TtfwStackValue): Boolean;
//#UC START# *55B763C701FC_559D51430285_var*
//#UC END# *55B763C701FC_559D51430285_var*
begin
//#UC START# *55B763C701FC_559D51430285_impl*
 Result := f_WordInfo.rTypeModifiers.AcceptsValue(aValue);
 {$IfNDef seTypeCheck}
 if Result then
  if Self.Has(tfw_wmRightWordRef) OR
     Self.Has(tfw_wmLeftWordRef) then
   if (aValue.rType <> tfw_vtNil) then
    Result := (aValue.AsObject Is TtfwWord);
 {$EndIf  seTypeCheck}   
//#UC END# *55B763C701FC_559D51430285_impl*
end;//TtfwWordInfoF.AcceptsValue

function TtfwWordInfoF.Has(anAccess: TtfwAccessType): Boolean;
//#UC START# *55BA4C6D024B_559D51430285_var*
//#UC END# *55BA4C6D024B_559D51430285_var*
begin
//#UC START# *55BA4C6D024B_559D51430285_impl*
 Result := f_WordInfo.Has(anAccess);
//#UC END# *55BA4C6D024B_559D51430285_impl*
end;//TtfwWordInfoF.Has

function TtfwWordInfoF.IncludeAccesType(anAccess: TtfwAccessType): TtfwWordInfo;
//#UC START# *55BA4CB60097_559D51430285_var*
//#UC END# *55BA4CB60097_559D51430285_var*
begin
//#UC START# *55BA4CB60097_559D51430285_impl*
 if f_WordInfo.Has(anAccess) then
  Result := Self
 else
  Result := Make(TtfwWordInfoRec_C(f_WordInfo.rTypeModifiers, f_WordInfo.rModifiers, anAccess, f_WordInfo.rLinkType));
//#UC END# *55BA4CB60097_559D51430285_impl*
end;//TtfwWordInfoF.IncludeAccesType

function TtfwWordInfoF.EQwm(aValue: TtfwWordModifiers): Boolean;
//#UC START# *55BBB0DC0384_559D51430285_var*
//#UC END# *55BBB0DC0384_559D51430285_var*
begin
//#UC START# *55BBB0DC0384_559D51430285_impl*
 Result := (f_WordInfo.rModifiers = aValue);
//#UC END# *55BBB0DC0384_559D51430285_impl*
end;//TtfwWordInfoF.EQwm

function TtfwWordInfoF.IncludeType(const aType: TtfwTypeInfo): TtfwWordInfo;
//#UC START# *55BBB8FE02C0_559D51430285_var*
//#UC END# *55BBB8FE02C0_559D51430285_var*
begin
//#UC START# *55BBB8FE02C0_559D51430285_impl*
 Result := Make(TtfwWordInfoRec_C(ValueTypes.Add(aType), f_WordInfo.rModifiers, f_WordInfo.rAccessType, f_WordInfo.rLinkType));
//#UC END# *55BBB8FE02C0_559D51430285_impl*
end;//TtfwWordInfoF.IncludeType

function TtfwWordInfoF.TypeName: Il3CString;
//#UC START# *55BF05E70219_559D51430285_var*
//#UC END# *55BF05E70219_559D51430285_var*
begin
//#UC START# *55BF05E70219_559D51430285_impl*
 Result := f_WordInfo.TypeName;
//#UC END# *55BF05E70219_559D51430285_impl*
end;//TtfwWordInfoF.TypeName

function TtfwWordInfoF.ValueTypes: TtfwValueTypes;
//#UC START# *55C0D6C20094_559D51430285_var*
//#UC END# *55C0D6C20094_559D51430285_var*
begin
//#UC START# *55C0D6C20094_559D51430285_impl*
 Result := f_WordInfo.rTypeModifiers;
//#UC END# *55C0D6C20094_559D51430285_impl*
end;//TtfwWordInfoF.ValueTypes

function TtfwWordInfoF.IncludeLinkType(aLinkType: TtfwLinkType): TtfwWordInfo;
//#UC START# *55C23CD603CC_559D51430285_var*
//#UC END# *55C23CD603CC_559D51430285_var*
begin
//#UC START# *55C23CD603CC_559D51430285_impl*
 if f_WordInfo.Has(aLinkType) then
  Result := Self
 else
  Result := Make(TtfwWordInfoRec_C(f_WordInfo.rTypeModifiers, f_WordInfo.rModifiers, f_WordInfo.rAccessType, aLinkType));
//#UC END# *55C23CD603CC_559D51430285_impl*
end;//TtfwWordInfoF.IncludeLinkType

function TtfwWordInfoF.Has(aLinkType: TtfwLinkType): Boolean;
//#UC START# *55C23DC202FE_559D51430285_var*
//#UC END# *55C23DC202FE_559D51430285_var*
begin
//#UC START# *55C23DC202FE_559D51430285_impl*
 Result := f_WordInfo.Has(aLinkType);
//#UC END# *55C23DC202FE_559D51430285_impl*
end;//TtfwWordInfoF.Has

function TtfwWordInfoF.LinkType: TtfwLinkType;
//#UC START# *55C34B8600C9_559D51430285_var*
//#UC END# *55C34B8600C9_559D51430285_var*
begin
//#UC START# *55C34B8600C9_559D51430285_impl*
 Result := f_WordInfo.rLinkType;
//#UC END# *55C34B8600C9_559D51430285_impl*
end;//TtfwWordInfoF.LinkType

function TtfwWordInfoF.AccessType: TtfwAccessType;
//#UC START# *55C34BC601FE_559D51430285_var*
//#UC END# *55C34BC601FE_559D51430285_var*
begin
//#UC START# *55C34BC601FE_559D51430285_impl*
 Result := f_WordInfo.rAccessType;
//#UC END# *55C34BC601FE_559D51430285_impl*
end;//TtfwWordInfoF.AccessType

function TtfwWordInfoF.Compare(anOther: TtfwWordInfo): Integer;
//#UC START# *55C356030225_559D51430285_var*
//#UC END# *55C356030225_559D51430285_var*
begin
//#UC START# *55C356030225_559D51430285_impl*
 Result := f_WordInfo.Compare(anOther.pRec^);
//#UC END# *55C356030225_559D51430285_impl*
end;//TtfwWordInfoF.Compare

function TtfwWordInfoF.Modifiers: TtfwWordModifiers;
//#UC START# *55C385AD025D_559D51430285_var*
//#UC END# *55C385AD025D_559D51430285_var*
begin
//#UC START# *55C385AD025D_559D51430285_impl*
 Result := f_WordInfo.rModifiers;
//#UC END# *55C385AD025D_559D51430285_impl*
end;//TtfwWordInfoF.Modifiers

function TtfwWordInfoF.ToString: Il3CString;
//#UC START# *55C385DE0038_559D51430285_var*

 function locCat(const aA: Il3CString; const aB: Il3CString): Il3CString;
 begin
  if l3IsNil(aA) then
   Result := aB
  else
  if l3IsNil(aB) then
   Result := aA
  else
   Result := l3Cat([aA, TtfwCStringFactory.C(' '), aB]);
 end;

var
 l_TI : TtfwWordInfo;
//#UC END# *55C385DE0038_559D51430285_var*
begin
//#UC START# *55C385DE0038_559D51430285_impl*
 Result := nil;
 l_TI := Self;

 if l_TI.Has(tfw_wmImmediate) {OR (aWord.IsImmediate AND not aWord.IsCompiled)} then
  Result := locCat(Result, TtfwCStringFactory.C('IMMEDIATE'));

 if l_TI.Has(tfw_wmInline) then
  Result := locCat(Result, TtfwCStringFactory.C('INLINE'));

 if l_TI.Has(tfw_wmRedefinition) then
  Result := locCat(Result, TtfwCStringFactory.C('REDIFINITION'));

 if l_TI.Has(tfw_wmSummoned) then
  Result := locCat(Result, TtfwCStringFactory.C('SUMMONED'));

 if l_TI.Has(tfw_wmRealize) then
  Result := locCat(Result, TtfwCStringFactory.C('REALIZE'))
 else
 if l_TI.Has(tfw_wmOverride) then
  Result := locCat(Result, TtfwCStringFactory.C('OVERRIDE'));

 if l_TI.Has(tfw_atPrivate) then
  Result := locCat(Result, TtfwCStringFactory.C('PRIVATE'))
 else
 if l_TI.Has(tfw_atProtected) then
  Result := locCat(Result, TtfwCStringFactory.C('PROTECTED'));

 if l_TI.Has(tfw_wmAbstract) then
  Result := locCat(Result, TtfwCStringFactory.C('ABSTRACT'))
 else
 if l_TI.Has(tfw_wmFinal) then
  Result := locCat(Result, TtfwCStringFactory.C('FINAL'));

 if l_TI.Has(tfw_ltLink) then
  Result := locCat(Result, TtfwCStringFactory.C('LINK'))
 else
 if l_TI.Has(tfw_ltReference) then
  Result := locCat(Result, TtfwCStringFactory.C('REFERENCE'));

 if l_TI.Has(tfw_wmRightWordRef) then
 begin
  if l_TI.Has(tfw_wmTreatUnknownAsString) then
   Result := locCat(Result, TtfwCStringFactory.C('^L'))
  else
   Result := locCat(Result, TtfwCStringFactory.C('^'));
 end//aWord.IsRightParam(aCtx)
 else
 if l_TI.Has(tfw_wmTreatUnknownAsString) then
  Result := locCat(Result, TtfwCStringFactory.C('TreatUnknownAsString'));

 if l_TI.Has(tfw_wmLeftWordRef) then
  Result := locCat(Result, TtfwCStringFactory.C('^@'));

 if l_TI.Has(tfw_wmLeftWordRef) then
  Result := locCat(Result, nil)
 else
 if l_TI.Has(tfw_wmRightWordRef) then
  Result := locCat(Result, nil)
 else
  Result := locCat(Result, l_TI.TypeName);

 if l_TI.Has(tfw_wmCaller) then
  Result := locCat(Result, TtfwCStringFactory.C('CALLER'));
//#UC END# *55C385DE0038_559D51430285_impl*
end;//TtfwWordInfoF.ToString

{$If not defined(DesignTimeLibrary)}
class function TtfwWordInfoF.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_559D51430285_var*
//#UC END# *47A6FEE600FC_559D51430285_var*
begin
//#UC START# *47A6FEE600FC_559D51430285_impl*
 Result := true;
//#UC END# *47A6FEE600FC_559D51430285_impl*
end;//TtfwWordInfoF.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function TtfwStackValue_C(const aValue: ItfwFile): TtfwStackValue;
//#UC START# *4F4E5D6C038D_55C0AEF80328_var*
//#UC END# *4F4E5D6C038D_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F4E5D6C038D_55C0AEF80328_impl*
 Result.rType := tfw_vtFile;
 ItfwFile(Result.rString) := aValue;
//#UC END# *4F4E5D6C038D_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(const aValue: ItfwValueList): TtfwStackValue;
//#UC START# *4DCC17860019_55C0AEF80328_var*
//#UC END# *4DCC17860019_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DCC17860019_55C0AEF80328_impl*
 Result.rType := tfw_vtList;
 ItfwValueList(Result.rString) := aValue;
//#UC END# *4DCC17860019_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(aValue: Integer): TtfwStackValue;
//#UC START# *4DB00AAB02FA_55C0AEF80328_var*
//#UC END# *4DB00AAB02FA_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DB00AAB02FA_55C0AEF80328_impl*
 Result.rType := tfw_vtInt;
 Result.rInteger := aValue;
//#UC END# *4DB00AAB02FA_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_E: TtfwStackValue;
//#UC START# *4DBAF93202ED_55C0AEF80328_var*
//#UC END# *4DBAF93202ED_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DBAF93202ED_55C0AEF80328_impl*
 Result.rType := tfw_vtVoid;
//#UC END# *4DBAF93202ED_55C0AEF80328_impl*
end;//TtfwStackValueEx.E


function TtfwStackValue_NULL: TtfwStackValue;
//#UC START# *4F280A220140_55C0AEF80328_var*
//#UC END# *4F280A220140_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F280A220140_55C0AEF80328_impl*
 Result.rType := tfw_vtNil;
//#UC END# *4F280A220140_55C0AEF80328_impl*
end;//TtfwStackValueEx.NULL


function TtfwStackValue_C(aValue: Boolean): TtfwStackValue;
//#UC START# *4DB01368005C_55C0AEF80328_var*
//#UC END# *4DB01368005C_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DB01368005C_55C0AEF80328_impl*
 Result.rType := tfw_vtBool;
 if aValue then
  Result.rInteger := 1
 else
  Result.rInteger := 0;
//#UC END# *4DB01368005C_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(aValue: TObject): TtfwStackValue;
//#UC START# *4DBAF9410061_55C0AEF80328_var*
//#UC END# *4DBAF9410061_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DBAF9410061_55C0AEF80328_impl*
 Result.rType := tfw_vtObj;
 Result.rInteger := Integer(aValue);
//#UC END# *4DBAF9410061_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(const aValue: Il3CString): TtfwStackValue;
//#UC START# *4DB04AC6039F_55C0AEF80328_var*
//#UC END# *4DB04AC6039F_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4DB04AC6039F_55C0AEF80328_impl*
 Result.rType := tfw_vtStr;
 Result.rString := aValue;
//#UC END# *4DB04AC6039F_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(const anIntf: IUnknown): TtfwStackValue;
//#UC START# *4EB275570202_55C0AEF80328_var*
//#UC END# *4EB275570202_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4EB275570202_55C0AEF80328_impl*
 Result.rType := tfw_vtIntf;
 IUnknown(Result.rString) := anIntf;
//#UC END# *4EB275570202_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(aClass: TClass): TtfwStackValue;
//#UC START# *50852D1B015E_55C0AEF80328_var*
//#UC END# *50852D1B015E_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *50852D1B015E_55C0AEF80328_impl*
 Result.rType := tfw_vtClass;
 Result.rInteger := Integer(aClass);
//#UC END# *50852D1B015E_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(aValue: AnsiChar): TtfwStackValue;
//#UC START# *4F4FDCD4016D_55C0AEF80328_var*
//#UC END# *4F4FDCD4016D_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F4FDCD4016D_55C0AEF80328_impl*
 Result.rType := tfw_vtChar;
 Result.rInteger := Ord(aValue);
//#UC END# *4F4FDCD4016D_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_C(const aValue: Tl3WString): TtfwStackValue;
//#UC START# *4F4FE12601E1_55C0AEF80328_var*
//#UC END# *4F4FE12601E1_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F4FE12601E1_55C0AEF80328_impl*
 Result.rType := tfw_vtWStr;
 Result.rInteger := Integer(aValue.S);
 Result.rSLen := aValue.SLen;
 Result.rSCodePage := aValue.SCodePage;
//#UC END# *4F4FE12601E1_55C0AEF80328_impl*
end;//TtfwStackValueEx.C


function TtfwStackValue_CBracket: TtfwStackValue;
//#UC START# *4F5030660367_55C0AEF80328_var*
//#UC END# *4F5030660367_55C0AEF80328_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4F5030660367_55C0AEF80328_impl*
 Result.rType := tfw_vtBracket;
//#UC END# *4F5030660367_55C0AEF80328_impl*
end;//TtfwStackValueEx.CBracket


// start class TtfwWordInfoE

var g_TtfwWordInfoE : TtfwWordInfoE = nil;

procedure TtfwWordInfoEFree;
begin
 l3Free(g_TtfwWordInfoE);
end;

class function TtfwWordInfoE.Instance: TtfwWordInfoE;
begin
 if (g_TtfwWordInfoE = nil) then
 begin
  l3System.AddExitProc(TtfwWordInfoEFree);
  g_TtfwWordInfoE := Create;
 end;
 Result := g_TtfwWordInfoE;
end;


class function TtfwWordInfoE.Exists: Boolean;
 {-}
begin
 Result := g_TtfwWordInfoE <> nil;
end;//TtfwWordInfoE.Exists

function TtfwWordInfoE.IncludeModifier(aModifier: TtfwWordModifier): TtfwWordInfo;
//#UC START# *559D50760320_559D6D060382_var*
//#UC END# *559D50760320_559D6D060382_var*
begin
//#UC START# *559D50760320_559D6D060382_impl*
 Result := TtfwWordInfo.Make(nil, [aModifier], tfw_atNone, tfw_ltNone);
//#UC END# *559D50760320_559D6D060382_impl*
end;//TtfwWordInfoE.IncludeModifier

function TtfwWordInfoE.Empty: Boolean;
//#UC START# *559D50D40233_559D6D060382_var*
//#UC END# *559D50D40233_559D6D060382_var*
begin
//#UC START# *559D50D40233_559D6D060382_impl*
 Result := true;
//#UC END# *559D50D40233_559D6D060382_impl*
end;//TtfwWordInfoE.Empty

function TtfwWordInfoE.Has(aModifier: TtfwWordModifier): Boolean;
//#UC START# *559D50EA02F1_559D6D060382_var*
//#UC END# *559D50EA02F1_559D6D060382_var*
begin
//#UC START# *559D50EA02F1_559D6D060382_impl*
 Result := false;
//#UC END# *559D50EA02F1_559D6D060382_impl*
end;//TtfwWordInfoE.Has

function TtfwWordInfoE.Clone: TtfwWordInfo;
//#UC START# *559D62F40210_559D6D060382_var*
//#UC END# *559D62F40210_559D6D060382_var*
begin
//#UC START# *559D62F40210_559D6D060382_impl*
 Result := Self;
//#UC END# *559D62F40210_559D6D060382_impl*
end;//TtfwWordInfoE.Clone

function TtfwWordInfoE.PRec: PtfwWordInfoRec;
//#UC START# *55B2543C0304_559D6D060382_var*
//#UC END# *55B2543C0304_559D6D060382_var*
begin
//#UC START# *55B2543C0304_559D6D060382_impl*
 Result := nil;
//#UC END# *55B2543C0304_559D6D060382_impl*
end;//TtfwWordInfoE.PRec

function TtfwWordInfoE.IncludeTypeModifier(aType: TtfwValueType): TtfwWordInfo;
//#UC START# *55B264D6035A_559D6D060382_var*
//#UC END# *55B264D6035A_559D6D060382_var*
begin
//#UC START# *55B264D6035A_559D6D060382_impl*
 Result := TtfwWordInfo.Make(TtfwWordInfoRec_C(TtfwValueTypes.Make(TtfwTypeInfo_C(aType)), [], tfw_atNone, tfw_ltNone));
//#UC END# *55B264D6035A_559D6D060382_impl*
end;//TtfwWordInfoE.IncludeTypeModifier

function TtfwWordInfoE.Has(aType: TtfwValueType): Boolean;
//#UC START# *55B2651800DB_559D6D060382_var*
//#UC END# *55B2651800DB_559D6D060382_var*
begin
//#UC START# *55B2651800DB_559D6D060382_impl*
 Result := false;
//#UC END# *55B2651800DB_559D6D060382_impl*
end;//TtfwWordInfoE.Has

function TtfwWordInfoE.AcceptsValue(const aValue: TtfwStackValue): Boolean;
//#UC START# *55B763C701FC_559D6D060382_var*
//#UC END# *55B763C701FC_559D6D060382_var*
begin
//#UC START# *55B763C701FC_559D6D060382_impl*
 Result := true;
//#UC END# *55B763C701FC_559D6D060382_impl*
end;//TtfwWordInfoE.AcceptsValue

function TtfwWordInfoE.Has(anAccess: TtfwAccessType): Boolean;
//#UC START# *55BA4C6D024B_559D6D060382_var*
//#UC END# *55BA4C6D024B_559D6D060382_var*
begin
//#UC START# *55BA4C6D024B_559D6D060382_impl*
 Result := (anAccess = tfw_atNone);
//#UC END# *55BA4C6D024B_559D6D060382_impl*
end;//TtfwWordInfoE.Has

function TtfwWordInfoE.IncludeAccesType(anAccess: TtfwAccessType): TtfwWordInfo;
//#UC START# *55BA4CB60097_559D6D060382_var*
//#UC END# *55BA4CB60097_559D6D060382_var*
begin
//#UC START# *55BA4CB60097_559D6D060382_impl*
 Result := TtfwWordInfo.Make(nil, [], anAccess, tfw_ltNone);
//#UC END# *55BA4CB60097_559D6D060382_impl*
end;//TtfwWordInfoE.IncludeAccesType

function TtfwWordInfoE.EQwm(aValue: TtfwWordModifiers): Boolean;
//#UC START# *55BBB0DC0384_559D6D060382_var*
//#UC END# *55BBB0DC0384_559D6D060382_var*
begin
//#UC START# *55BBB0DC0384_559D6D060382_impl*
 Result := (aValue = []); 
//#UC END# *55BBB0DC0384_559D6D060382_impl*
end;//TtfwWordInfoE.EQwm

function TtfwWordInfoE.IncludeType(const aType: TtfwTypeInfo): TtfwWordInfo;
//#UC START# *55BBB8FE02C0_559D6D060382_var*
//#UC END# *55BBB8FE02C0_559D6D060382_var*
begin
//#UC START# *55BBB8FE02C0_559D6D060382_impl*
 Result := TtfwWordInfo.Make(aType);
//#UC END# *55BBB8FE02C0_559D6D060382_impl*
end;//TtfwWordInfoE.IncludeType

function TtfwWordInfoE.TypeName: Il3CString;
//#UC START# *55BF05E70219_559D6D060382_var*
//#UC END# *55BF05E70219_559D6D060382_var*
begin
//#UC START# *55BF05E70219_559D6D060382_impl*
 Result := nil;
//#UC END# *55BF05E70219_559D6D060382_impl*
end;//TtfwWordInfoE.TypeName

function TtfwWordInfoE.ValueTypes: TtfwValueTypes;
//#UC START# *55C0D6C20094_559D6D060382_var*
//#UC END# *55C0D6C20094_559D6D060382_var*
begin
//#UC START# *55C0D6C20094_559D6D060382_impl*
 Result := nil;
//#UC END# *55C0D6C20094_559D6D060382_impl*
end;//TtfwWordInfoE.ValueTypes

function TtfwWordInfoE.IncludeLinkType(aLinkType: TtfwLinkType): TtfwWordInfo;
//#UC START# *55C23CD603CC_559D6D060382_var*
//#UC END# *55C23CD603CC_559D6D060382_var*
begin
//#UC START# *55C23CD603CC_559D6D060382_impl*
 Result := TtfwWordInfo.Make(nil, [], tfw_atNone, aLinkType);
//#UC END# *55C23CD603CC_559D6D060382_impl*
end;//TtfwWordInfoE.IncludeLinkType

function TtfwWordInfoE.Has(aLinkType: TtfwLinkType): Boolean;
//#UC START# *55C23DC202FE_559D6D060382_var*
//#UC END# *55C23DC202FE_559D6D060382_var*
begin
//#UC START# *55C23DC202FE_559D6D060382_impl*
 Result := (aLinkType = tfw_ltNone);
//#UC END# *55C23DC202FE_559D6D060382_impl*
end;//TtfwWordInfoE.Has

function TtfwWordInfoE.LinkType: TtfwLinkType;
//#UC START# *55C34B8600C9_559D6D060382_var*
//#UC END# *55C34B8600C9_559D6D060382_var*
begin
//#UC START# *55C34B8600C9_559D6D060382_impl*
 Result := tfw_ltNone;
//#UC END# *55C34B8600C9_559D6D060382_impl*
end;//TtfwWordInfoE.LinkType

function TtfwWordInfoE.AccessType: TtfwAccessType;
//#UC START# *55C34BC601FE_559D6D060382_var*
//#UC END# *55C34BC601FE_559D6D060382_var*
begin
//#UC START# *55C34BC601FE_559D6D060382_impl*
 Result := tfw_atNone;
//#UC END# *55C34BC601FE_559D6D060382_impl*
end;//TtfwWordInfoE.AccessType

function TtfwWordInfoE.Compare(anOther: TtfwWordInfo): Integer;
//#UC START# *55C356030225_559D6D060382_var*
//#UC END# *55C356030225_559D6D060382_var*
begin
//#UC START# *55C356030225_559D6D060382_impl*
 if anOther.Empty then
  Result := 0
 else
  Result := -1; 
//#UC END# *55C356030225_559D6D060382_impl*
end;//TtfwWordInfoE.Compare

function TtfwWordInfoE.Modifiers: TtfwWordModifiers;
//#UC START# *55C385AD025D_559D6D060382_var*
//#UC END# *55C385AD025D_559D6D060382_var*
begin
//#UC START# *55C385AD025D_559D6D060382_impl*
 Result := [];
//#UC END# *55C385AD025D_559D6D060382_impl*
end;//TtfwWordInfoE.Modifiers

function TtfwWordInfoE.ToString: Il3CString;
//#UC START# *55C385DE0038_559D6D060382_var*
//#UC END# *55C385DE0038_559D6D060382_var*
begin
//#UC START# *55C385DE0038_559D6D060382_impl*
 Result := nil;
//#UC END# *55C385DE0038_559D6D060382_impl*
end;//TtfwWordInfoE.ToString
{$IfEnd} //not NoScripts


initialization
{$If not defined(NoScripts)}
// Регистрация TtfwWord
 TtfwWord.RegisterClass;
{$IfEnd} //not NoScripts

end.