unit kwCompiledFunction;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwCompiledFunction.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwCompiledFunction
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
  kwCompiledVar,
  kwCompiledProcedureWithStackChecking,
  tfwScriptingInterfaces,
  l3ParserInterfaces
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
   function pm_GetResultTypeInfo: TtfwTypeInfo; override;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function StackCheckingMessage: AnsiString; override;
 public
 // overridden public methods
   constructor Create(aWordProducer: TtfwWord;
     const aPrevFinder: Il3KeywordFinder;
     const aTypeInfo: TtfwTypeInfo;
     const aCtx: TtfwContext;
     aKey: TtfwKeyWordPrim); override;
   procedure SetResultTypeInfo(const aValue: TtfwTypeInfo;
     const aCtx: TtfwContext); override;
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
  kwVAR,
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
var
 l_V : TtfwStackValue;

 procedure DoPushResult;
 begin//DoPushResult
  RunnerAssert(l_V.rType <> tfw_svtVoid,
               'Результат функции не инициализирован',
               aCtx);
  aCtx.rEngine.Push(l_V);
 end;//DoPushResult

//#UC END# *4DAEEDE10285_4F3BEDFE0051_var*
begin
//#UC START# *4DAEEDE10285_4F3BEDFE0051_impl*
 try
  try
   inherited;
  finally
   l_V := ResultVar.GetValue(aCtx);
  end;//try..finally
 except
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
  const aPrevFinder: Il3KeywordFinder;
  const aTypeInfo: TtfwTypeInfo;
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
 l_Var := TkwCompiledVar.Create((aCtx.rEngine.As_ItfwKeywordFinder.KeywordByName[TtfwCStringFactory.C(TkwVar.GetWordNameForRegister)] As TtfwKeyWord).Word,
                                 // - чтобы обеспечить слову нужный "стереотип"
                                 //   хак конечно, надо как-то константу хотя бы завести
                                Self{nil{PrevFinder},
                                aTypeInfo{TtfwTypeInfo_E{Modifiers},
                                aCtx,
                                l_KW);
 try
  l_KW.Word := l_Var;
  f_ResultVar := l_Var;
  f_ResultVar.SetResultTypeInfo(aTypeInfo, aCtx);
  if (f_Modifiers.Modifiers = [tfw_wmStr]) then
   f_ResultVar.SetValue(TtfwStackValue_C(TtfwCStringFactory.C('')), aCtx)
  else
  if (f_Modifiers.Modifiers = [tfw_wmInt]) then
   f_ResultVar.SetValue(TtfwStackValue_C(0), aCtx)
  else
  if (f_Modifiers.Modifiers = [tfw_wmIntf]) then
   f_ResultVar.SetValue(TtfwStackValue_NULL, aCtx)
  else
  if (f_Modifiers.Modifiers = [tfw_wmObj]) then
   f_ResultVar.SetValue(TtfwStackValue_NULL, aCtx);
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

function TkwCompiledFunction.pm_GetResultTypeInfo: TtfwTypeInfo;
//#UC START# *52CFC11603C8_4F3BEDFE0051get_var*
//#UC END# *52CFC11603C8_4F3BEDFE0051get_var*
begin
//#UC START# *52CFC11603C8_4F3BEDFE0051get_impl*
 Result := f_Modifiers;
//#UC END# *52CFC11603C8_4F3BEDFE0051get_impl*
end;//TkwCompiledFunction.pm_GetResultTypeInfo

procedure TkwCompiledFunction.SetResultTypeInfo(const aValue: TtfwTypeInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_4F3BEDFE0051_var*
//#UC END# *52EA6A2C0111_4F3BEDFE0051_var*
begin
//#UC START# *52EA6A2C0111_4F3BEDFE0051_impl*
 f_Modifiers := aValue;
 CompilerAssert(f_ResultVar <> nil, 'Не определена переменная Result', aCtx);
 if (f_ResultVar <> nil) then
  f_ResultVar.SetResultTypeInfo(f_Modifiers, aCtx);
//#UC END# *52EA6A2C0111_4F3BEDFE0051_impl*
end;//TkwCompiledFunction.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
//#UC START# *53DA53D9012C*
 TkwCompiledFunction.RegisterClass;
//#UC END# *53DA53D9012C*
{$IfEnd} //not NoScripts

end.