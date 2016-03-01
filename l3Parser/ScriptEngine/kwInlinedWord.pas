unit kwInlinedWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwInlinedWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwInlinedWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInlinedWord = class(TkwCompiledWord)
 protected
 // overridden property methods
   function pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo; override;
 public
 // overridden public methods
   procedure SetResultTypeInfo(aValue: TtfwWordInfo;
     const aCtx: TtfwContext); override;
 end;//TkwInlinedWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwInlinedWord

function TkwInlinedWord.pm_GetResultTypeInfo(const aCtx: TtfwContext): TtfwWordInfo;
//#UC START# *52CFC11603C8_53ED9C3B01F3get_var*
//#UC END# *52CFC11603C8_53ED9C3B01F3get_var*
begin
//#UC START# *52CFC11603C8_53ED9C3B01F3get_impl*
 Result := TtfwWordInfo.Make(nil, [tfw_wmInline], tfw_atNone, tfw_ltNone);
//#UC END# *52CFC11603C8_53ED9C3B01F3get_impl*
end;//TkwInlinedWord.pm_GetResultTypeInfo

procedure TkwInlinedWord.SetResultTypeInfo(aValue: TtfwWordInfo;
  const aCtx: TtfwContext);
//#UC START# *52EA6A2C0111_53ED9C3B01F3_var*
//#UC END# *52EA6A2C0111_53ED9C3B01F3_var*
begin
//#UC START# *52EA6A2C0111_53ED9C3B01F3_impl*
 CompilerAssert(aValue.EQwm([tfw_wmInline]), 'Неверный список модификаторов', aCtx);
//#UC END# *52EA6A2C0111_53ED9C3B01F3_impl*
end;//TkwInlinedWord.SetResultTypeInfo

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwInlinedWord
 TkwInlinedWord.RegisterClass;
{$IfEnd} //not NoScripts

end.