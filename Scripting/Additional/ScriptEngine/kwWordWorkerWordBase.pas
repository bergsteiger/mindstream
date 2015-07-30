unit kwWordWorkerWordBase;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwWordWorkerWordBase.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwWordWorkerWordBase
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces,
  kwCompiledWordWorkerWord,
  tfwStandardProcedure,
  kwCompiledWordPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwWordWorkerWordBase = {abstract} class(TtfwStandardProcedure)
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
   function CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord; virtual;
   function AddedParameters: Tl3CStringArray; virtual;
   function ParamModifiers(aParamIndex: Integer): TtfwWordModifiers; virtual;
 end;//TkwWordWorkerWordBase
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledPopToVar,
  kwCompiledVar,
  kwLeftParam,
  l3Base,
  kwCompiledFunction,
  kwCompiledProcedureWithStackChecking,
  kwCompiledImmediateWordWorkerWord,
  kwInlinedWord,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

const
   { Inner }
  cWordToWork = 'WordToWork';

// start class TkwWordWorkerWordBase

function TkwWordWorkerWordBase.CompiledWordWorkerWordClass(const aCtx: TtfwContext): RkwCompiledWordWorkerWord;
//#UC START# *4F3FA9670261_4F3FA7E30073_var*
//#UC END# *4F3FA9670261_4F3FA7E30073_var*
begin
//#UC START# *4F3FA9670261_4F3FA7E30073_impl*
 if (tfw_wmImmediate in aCtx.rTypeInfo.Modifiers) then
  Result := TkwCompiledImmediateWordWorkerWord
 else
  Result := TkwCompiledWordWorkerWord;
//#UC END# *4F3FA9670261_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.CompiledWordWorkerWordClass

function TkwWordWorkerWordBase.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F3FA7E30073_var*
//#UC END# *4F3FF55403AB_4F3FA7E30073_var*
begin
//#UC START# *4F3FF55403AB_4F3FA7E30073_impl*
 Result := l3CStringArrayFromS([cWordToWork]);
//#UC END# *4F3FF55403AB_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.AddedParameters

function TkwWordWorkerWordBase.ParamModifiers(aParamIndex: Integer): TtfwWordModifiers;
//#UC START# *4F4186D50048_4F3FA7E30073_var*
//#UC END# *4F4186D50048_4F3FA7E30073_var*
begin
//#UC START# *4F4186D50048_4F3FA7E30073_impl*
 Result := [tfw_wmObj, tfw_wmRightWordRef];
//#UC END# *4F4186D50048_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.ParamModifiers

function TkwWordWorkerWordBase.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F3FA7E30073_var*
var
 l_M : TtfwWordModifiers;
//#UC END# *4DBAEE0D028D_4F3FA7E30073_var*
begin
//#UC START# *4DBAEE0D028D_4F3FA7E30073_impl*
 l_M := aCtx.rTypeInfo.Modifiers;
 l_M := l_M - [tfw_wmImmediate];
 if (l_M = [tfw_wmInline]) then
  Result := TkwInlinedWord
 else
 if (l_M <> []) then
 begin
  if (tfw_wmVoid in l_M) then
   Result := TkwCompiledProcedureWithStackChecking
  else
   Result := TkwCompiledFunction;
 end//l_M <> []
 else
  Result := inherited CompiledWordClass(aCtx);
//#UC END# *4DBAEE0D028D_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.CompiledWordClass

procedure TkwWordWorkerWordBase.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
  aCompiled: TkwCompiledWordPrim;
  const aContext: TtfwContext);
//#UC START# *4F219629036A_4F3FA7E30073_var*
var
 l_Worker : TkwCompiledWordWorkerWord;
 l_S : Tl3CStringArray;
 l_Index : Integer;
//#UC END# *4F219629036A_4F3FA7E30073_var*
begin
//#UC START# *4F219629036A_4F3FA7E30073_impl*
 l_S := AddedParameters;
// for l_Index := Low(l_S) to High(l_S) do
//  aCompiled.DefineInParameter(aContext, l_S[l_Index], ParamModifiers(l_Index));
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.CompileInParameterPopCodeFromString(aContext, l_S[l_Index]);
 l_Worker := CompiledWordWorkerWordClass(aContext).Create(aCompiled);
 // - сюда ещё надо aCompiled подать
 try
  aWordToFinish.Word := l_Worker;
 finally
  FreeAndNil(l_Worker);
 end;//try..finally
 //inherited;
 // - не надо это звать
//#UC END# *4F219629036A_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.FinishDefinitionOfNewWord

procedure TkwWordWorkerWordBase.FillCompiledWord(aCompiled: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *4F21A4F60049_4F3FA7E30073_var*
var
 l_S : Tl3CStringArray;
 l_Index : Integer;
//#UC END# *4F21A4F60049_4F3FA7E30073_var*
begin
//#UC START# *4F21A4F60049_4F3FA7E30073_impl*
 inherited;
 l_S := AddedParameters;
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.DefineInParameter(aCtx, l_S[l_Index], ParamModifiers(l_Index));
//#UC END# *4F21A4F60049_4F3FA7E30073_impl*
end;//TkwWordWorkerWordBase.FillCompiledWord

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwWordWorkerWordBase
 TkwWordWorkerWordBase.RegisterClass;
{$IfEnd} //not NoScripts

end.