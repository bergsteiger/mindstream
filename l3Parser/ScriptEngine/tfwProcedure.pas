unit tfwProcedure;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "tfwProcedure.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TtfwProcedure
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwNewWord,
  tfwScriptingInterfaces,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwProcedure = {abstract} class(TtfwNewWord)
 protected
 // realized methods
   function EndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
 protected
 // overridden protected methods
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
     aCompiled: TkwCompiledWordPrim;
     const aContext: TtfwContext); override;
     {* Завершает определение вновь созданного слова }
   procedure FillCompiledWord(aCompiled: TtfwWord;
     const aCtx: TtfwContext); override;
 protected
 // protected methods
   function AddedParameters: Tl3CStringArray; virtual;
 end;//TtfwProcedure
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwStandardProcedureCloseBracket,
  kwCompiledWordWorkerWord,
  SysUtils,
  kwCompiledProcedure,
  kwCompiledFunction,
  kwCompiledProcedureWithStackChecking,
  kwInlinedWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

const
   { Inner }
  cCaller = 'Caller';

// start class TtfwProcedure

function TtfwProcedure.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F37B27502EE_var*
//#UC END# *4F3FF55403AB_4F37B27502EE_var*
begin
//#UC START# *4F3FF55403AB_4F37B27502EE_impl*
 Result := nil;
//#UC END# *4F3FF55403AB_4F37B27502EE_impl*
end;//TtfwProcedure.AddedParameters

function TtfwProcedure.EndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37B27502EE_var*
//#UC END# *4DB6C99F026E_4F37B27502EE_var*
begin
//#UC START# *4DB6C99F026E_4F37B27502EE_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37B27502EE_impl*
end;//TtfwProcedure.EndBracket

function TtfwProcedure.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F37B27502EE_var*
//#UC END# *4DBAEE0D028D_4F37B27502EE_var*
begin
//#UC START# *4DBAEE0D028D_4F37B27502EE_impl*
 if (aCtx.rTypeInfo.EQwm([tfw_wmInline])) then
  Result := TkwInlinedWord
 else
 if not aCtx.rTypeInfo.ValueTypes.Empty{ OR aCtx.rTypeInfo.Has(tfw_wmLeftWordRef)} then
 begin
  if aCtx.rTypeInfo.Has(tfw_vtVoid) then
   Result := TkwCompiledProcedureWithStackChecking
  else
   Result := TkwCompiledFunction;
 end//not aCtx.rTypeInfo.. OR (tfw_wmLeftWordRef in l_M)
 else
  Result := TkwCompiledProcedure;
//#UC END# *4DBAEE0D028D_4F37B27502EE_impl*
end;//TtfwProcedure.CompiledWordClass

procedure TtfwProcedure.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F37B27502EE_var*
var
 l_Worker : TkwCompiledWordWorkerWord;
 l_S : Tl3CStringArray;
 l_Index : Integer;
 l_NeedCaller : Boolean;
//#UC END# *4F219629036A_4F37B27502EE_var*
begin
//#UC START# *4F219629036A_4F37B27502EE_impl*
 l_NeedCaller := false;
 if aCompiled.ResultTypeInfo[aContext].Has(tfw_wmCaller) then
 begin
  l_NeedCaller := true;
  aCompiled.CompileInParameterPopCodeFromString(aContext, TtfwCStringFactory.C(cCaller));
 end;//aCompiled.ResultTypeInfo[aContext].HasModifier(tfw_wmCaller)

 l_S := AddedParameters;
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.CompileInParameterPopCodeFromString(aContext, l_S[l_Index]);

 if l_NeedCaller OR
    (aCompiled.LeftWordRefParamsCount(aContext) > 0) OR
    (aCompiled.RightParamsCount(aContext) > 0) {OR
    aCompiled.ResultTypeInfo[aContext].HasModifier(tfw_wmImmediate)}
    then
 begin
  aCompiled.Key := aWordToFinish;
  l_Worker := TkwCompiledWordWorkerWord.Create(aCompiled);
  try
   aWordToFinish.SetWord(aContext, l_Worker);
  finally
   FreeAndNil(l_Worker);
  end;//try..finally
 end//l_NeedCaller..
 else
  aWordToFinish.SetWord(aContext, aCompiled);
  
 //inherited;
 // - не надо это звать
//#UC END# *4F219629036A_4F37B27502EE_impl*
end;//TtfwProcedure.FinishDefinitionOfNewWord

procedure TtfwProcedure.FillCompiledWord(aCompiled: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F21A4F60049_4F37B27502EE_var*
var
 l_S : Tl3CStringArray;
 l_Index : Integer;
//#UC END# *4F21A4F60049_4F37B27502EE_var*
begin
//#UC START# *4F21A4F60049_4F37B27502EE_impl*
 inherited;
 l_S := AddedParameters;
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.DefineInParameter(aCtx, l_S[l_Index], nil, TtfwWordInfo.Make(nil, [tfw_wmRightWordRef], tfw_atNone, tfw_ltNone));

 if aCompiled.ResultTypeInfo[aCtx].Has(tfw_wmCaller) then
  aCompiled.DefineInParameter(aCtx, TtfwCStringFactory.C(cCaller), nil, TtfwWordInfo.Make(TypeInfo(TtfwWord)));

//#UC END# *4F21A4F60049_4F37B27502EE_impl*
end;//TtfwProcedure.FillCompiledWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwProcedure
 TtfwProcedure.RegisterClass;
{$IfEnd} //not NoScripts

end.