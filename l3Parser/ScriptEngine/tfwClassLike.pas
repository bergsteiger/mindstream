unit tfwClassLike;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwClassLike.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::ClassLikeMapping::TtfwClassLike
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwRegisterableWord,
  kwCompiledWordPrimPrim,
  tfwTypeInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwClassLikeRunner = class(TkwCompiledWordPrimPrim)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetValue(const aValue: TtfwStackValue;
    const aCtx: TtfwContext;
    aNeedCheckType: Boolean = true); override;
   function GetValue(const aCtx: TtfwContext): PtfwStackValue; override;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     const aCtx: TtfwContext); reintroduce;
 end;//TtfwClassLikeRunner

 TtfwClassLike = {abstract} class(TtfwRegisterableWord)
 protected
 // overridden protected methods
   procedure PushAdditionalParams(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   function MakeRefForCompile(const aCtx: TtfwContext;
     aSNI: TtfwSuppressNextImmediate): TtfwWord; override;
 end;//TtfwClassLike
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwClassLikeRunner

constructor TtfwClassLikeRunner.Create(aWordProducer: TtfwWord;
  const aCtx: TtfwContext);
//#UC START# *55EEDC7E039C_55EEDC5001F3_var*
//#UC END# *55EEDC7E039C_55EEDC5001F3_var*
begin
//#UC START# *55EEDC7E039C_55EEDC5001F3_impl*
 inherited Create(aWordProducer, aCtx, aWordProducer.Key);
//#UC END# *55EEDC7E039C_55EEDC5001F3_impl*
end;//TtfwClassLikeRunner.Create

procedure TtfwClassLikeRunner.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_55EEDC5001F3_var*
//#UC END# *4DAEEDE10285_55EEDC5001F3_var*
begin
//#UC START# *4DAEEDE10285_55EEDC5001F3_impl*
 WordProducer.DoIt(aCtx);
//#UC END# *4DAEEDE10285_55EEDC5001F3_impl*
end;//TtfwClassLikeRunner.DoDoIt

function TtfwClassLikeRunner.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_55EEDC5001F3get_var*
//#UC END# *52CFC11603C8_55EEDC5001F3get_var*
begin
//#UC START# *52CFC11603C8_55EEDC5001F3get_impl*
 Result := WordProducer.ResultTypeInfo[aCtx];
//#UC END# *52CFC11603C8_55EEDC5001F3get_impl*
end;//TtfwClassLikeRunner.pm_GetResultTypeInfo

procedure TtfwClassLikeRunner.SetValue(const aValue: TtfwStackValue;
  const aCtx: TtfwContext;
  aNeedCheckType: Boolean = true);
//#UC START# *52D00B00031A_55EEDC5001F3_var*
//#UC END# *52D00B00031A_55EEDC5001F3_var*
begin
//#UC START# *52D00B00031A_55EEDC5001F3_impl*
 WordProducer.SetValue(aValue, aCtx, aNeedCheckType);
//#UC END# *52D00B00031A_55EEDC5001F3_impl*
end;//TtfwClassLikeRunner.SetValue

function TtfwClassLikeRunner.GetValue(const aCtx: TtfwContext): PtfwStackValue;
//#UC START# *52D399A00173_55EEDC5001F3_var*
//#UC END# *52D399A00173_55EEDC5001F3_var*
begin
//#UC START# *52D399A00173_55EEDC5001F3_impl*
 Result := WordProducer.GetValue(aCtx);
//#UC END# *52D399A00173_55EEDC5001F3_impl*
end;//TtfwClassLikeRunner.GetValue

function TtfwClassLike.MakeRefForCompile(const aCtx: TtfwContext;
  aSNI: TtfwSuppressNextImmediate): TtfwWord;
//#UC START# *55CB5B8C004E_55CCAE000335_var*
//#UC END# *55CB5B8C004E_55CCAE000335_var*
begin
//#UC START# *55CB5B8C004E_55CCAE000335_impl*
(* if (aSNI = tfw_sniNo) then
  Result := TtfwClassLikeRunner.Create(Self, aCtx)
 else*)
  Result := inherited MakeRefForCompile(aCtx, aSNI);
//#UC END# *55CB5B8C004E_55CCAE000335_impl*
end;//TtfwClassLike.MakeRefForCompile

procedure TtfwClassLike.PushAdditionalParams(const aCtx: TtfwContext);
//#UC START# *55EED3920052_55CCAE000335_var*
//#UC END# *55EED3920052_55CCAE000335_var*
begin
//#UC START# *55EED3920052_55CCAE000335_impl*
 inherited;
//#UC END# *55EED3920052_55CCAE000335_impl*
end;//TtfwClassLike.PushAdditionalParams

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwClassLikeRunner
 TtfwClassLikeRunner.RegisterClass;
{$IfEnd} //not NoScripts
{$If not defined(NoScripts)}
// Регистрация TtfwClassLike
 TtfwClassLike.RegisterClass;
{$IfEnd} //not NoScripts

end.