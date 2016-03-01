unit kwCompiledFunction;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwCompiledFunction.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwCompiledFunction
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledVar,
  kwCompiledProcedureWithStackChecking,
  tfwScriptingInterfaces,
  tfwKeyWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledFunction = class(TkwCompiledProcedureWithStackChecking)
 private
 // private fields
   f_ResultVar : TkwCompiledVar;
    {* Поле для свойства ResultVar}
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function StackCheckingMessage: AnsiString; override;
 public
 // overridden public methods
   constructor Create(aWordProducer: TtfwWord;
     aPrevFinder: TtfwWord;
     aTypeInfo: TtfwWordInfo;
     const aCtx: TtfwContext;
     aKey: TtfwKeyWordPrim); override;
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
     const aCtx: TtfwContext); override;
   function GetResultVar(const aCtx: TtfwContext): TtfwWord; override;
 private
 // private properties
   property ResultVar: TkwCompiledVar
     read f_ResultVar;
 end;//TkwCompiledFunction
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3Base,
  SysUtils,
  tfwClassRef
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

const
   { Local }
  cResult = 'Result';

// start class TkwCompiledFunction

procedure TkwCompiledFunction.Cleanup;
//#UC START# *479731C50290_4F3BEDFE0051_var*
//#UC END# *479731C50290_4F3BEDFE0051_var*
begin
//#UC START# *479731C50290_4F3BEDFE0051_impl*
 f_ResultVar := nil;
 inherited;
//#UC END# *479731C50290_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.Cleanup

procedure TkwCompiledFunction.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3BEDFE0051_var*

 procedure DoPushResult;
 var
  l_V : PtfwStackValue;
 begin//DoPushResult
  l_V := ResultVar.GetValue(aCtx);
  if (l_V.rType = tfw_vtVoid) then
   RunnerError('Результат функции не инициализирован', aCtx);
  aCtx.rEngine.Push(l_V^);
 end;//DoPushResult

//#UC END# *4DAEEDE10285_4F3BEDFE0051_var*
begin
//#UC START# *4DAEEDE10285_4F3BEDFE0051_impl*
 try
  inherited;
 except
  on EtfwBreakIterator do
  begin
   DoPushResult;
   raise;
  end;//EtfwBreakIterator
  on EtfwExit do
  begin
   DoPushResult;
   Exit;
  end;//on EtfwExit
 end;//try..except
 DoPushResult;
//#UC END# *4DAEEDE10285_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.DoDoIt

constructor TkwCompiledFunction.Create(aWordProducer: TtfwWord;
  aPrevFinder: TtfwWord;
  aTypeInfo: TtfwWordInfo;
  const aCtx: TtfwContext;
  aKey: TtfwKeyWordPrim);
//#UC START# *4DC9723702F5_4F3BEDFE0051_var*
var
 l_Var : TkwCompiledVar;
 l_KW : TtfwKeyWord;
//#UC END# *4DC9723702F5_4F3BEDFE0051_var*
begin
//#UC START# *4DC9723702F5_4F3BEDFE0051_impl*
 l_KW := Self.CheckWord(TtfwCStringFactory.C(cResult));
 l_Var := TkwCompiledVar.Create(Self,
                                Self{nil{PrevFinder},
                                aTypeInfo{TtfwTypeInfo_E{Modifiers},
                                aCtx,
                                l_KW);
 try
  l_KW.SetWord(aCtx, l_Var);
  f_ResultVar := l_Var;
  f_ResultVar.SetResultTypeInfo(aTypeInfo, aCtx);
  f_ResultVar.InitValue(aCtx);
 finally
  FreeAndNil(l_Var);
 end;//try..finally
 inherited;
//#UC END# *4DC9723702F5_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.Create

function TkwCompiledFunction.StackCheckingMessage: AnsiString;
//#UC START# *528F7301033E_4F3BEDFE0051_var*
//#UC END# *528F7301033E_4F3BEDFE0051_var*
begin
//#UC START# *528F7301033E_4F3BEDFE0051_impl*
 Result := 'После выполнения функции остался мусор на стеке';
//#UC END# *528F7301033E_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.StackCheckingMessage

function TkwCompiledFunction.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_4F3BEDFE0051get_var*
//#UC END# *52CFC11603C8_4F3BEDFE0051get_var*
begin
//#UC START# *52CFC11603C8_4F3BEDFE0051get_impl*
 Result := f_Modifiers;
//#UC END# *52CFC11603C8_4F3BEDFE0051get_impl*
end;//TkwCompiledFunction.pm_GetResultTypeInfo

procedure TkwCompiledFunction.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F3BEDFE0051_var*
//#UC END# *52EA6A2C0111_4F3BEDFE0051_var*
begin
//#UC START# *52EA6A2C0111_4F3BEDFE0051_impl*
 f_Modifiers := aValue.Clone;
 CompilerAssert(f_ResultVar <> nil, 'Не определена переменная Result', aCtx);
 if (f_ResultVar <> nil) then
  f_ResultVar.SetResultTypeInfo(f_Modifiers, aCtx);
//#UC END# *52EA6A2C0111_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.SetResultTypeInfo

function TkwCompiledFunction.GetResultVar(const aCtx: TtfwContext): TtfwWord;
//#UC START# *558D1A4C0082_4F3BEDFE0051_var*
//#UC END# *558D1A4C0082_4F3BEDFE0051_var*
begin
//#UC START# *558D1A4C0082_4F3BEDFE0051_impl*
 Result := ResultVar;
//#UC END# *558D1A4C0082_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.GetResultVar

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledFunction
 TkwCompiledFunction.RegisterClass;
{$IfEnd} //not NoScripts

end.