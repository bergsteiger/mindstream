unit kwRuntimeWordWithCode;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwRuntimeWordWithCode.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwRuntimeWordWithCode
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWordPrim,
  tfwScriptingInterfaces,
  tfwWordRefList
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 _tfwCodeCompiler_Parent_ = TkwCompiledWordPrim;
 {$Include ..\ScriptEngine\tfwCodeCompiler.imp.pas}
 TkwRuntimeWordWithCode = {abstract} class(_tfwCodeCompiler_)
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   function GetNewWordDefinitor: TtfwWord; override;
   function GetKeywordFinder(const aCtx: TtfwContext): TtfwWord; override;
   procedure DoCompileInParameterPopCode(const aContext: TtfwContext;
     aParameterToPop: TtfwWord;
     aCheckCode: Boolean); override;
 public
 // overridden public methods
   function GetCode(const aCtx: TtfwContext): TtfwWordRefList; override;
 end;//TkwRuntimeWordWithCode
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  kwForwardDeclarationHolder
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\tfwCodeCompiler.imp.pas}

// start class TkwRuntimeWordWithCode

procedure TkwRuntimeWordWithCode.Cleanup;
//#UC START# *479731C50290_52D55D7B0178_var*
//#UC END# *479731C50290_52D55D7B0178_var*
begin
//#UC START# *479731C50290_52D55D7B0178_impl*
 inherited;
//#UC END# *479731C50290_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.Cleanup

function TkwRuntimeWordWithCode.GetCode(const aCtx: TtfwContext): TtfwWordRefList;
//#UC START# *52D41C7F027B_52D55D7B0178_var*
//#UC END# *52D41C7F027B_52D55D7B0178_var*
begin
//#UC START# *52D41C7F027B_52D55D7B0178_impl*
 Result := Code;
//#UC END# *52D41C7F027B_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetCode

function TkwRuntimeWordWithCode.GetNewWordDefinitor: TtfwWord;
//#UC START# *52D56341033B_52D55D7B0178_var*
//#UC END# *52D56341033B_52D55D7B0178_var*
begin
//#UC START# *52D56341033B_52D55D7B0178_impl*
 if (f_PrevFinder = nil) then
  Result := nil
 else
  Result := f_PrevFinder.NewWordDefinitor;
//#UC END# *52D56341033B_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetNewWordDefinitor

function TkwRuntimeWordWithCode.GetKeywordFinder(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D5637A031E_52D55D7B0178_var*
//#UC END# *52D5637A031E_52D55D7B0178_var*
begin
//#UC START# *52D5637A031E_52D55D7B0178_impl*
 Result := f_PrevFinder;
//#UC END# *52D5637A031E_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.GetKeywordFinder

procedure TkwRuntimeWordWithCode.DoCompileInParameterPopCode(const aContext: TtfwContext;
  aParameterToPop: TtfwWord;
  aCheckCode: Boolean);
//#UC START# *52D56A980103_52D55D7B0178_var*
//#UC END# *52D56A980103_52D55D7B0178_var*
begin
//#UC START# *52D56A980103_52D55D7B0178_impl*
 CompilerAssert(false, 'Слово не может иметь входные параметры', aContext);
//#UC END# *52D56A980103_52D55D7B0178_impl*
end;//TkwRuntimeWordWithCode.DoCompileInParameterPopCode

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwRuntimeWordWithCode
 TkwRuntimeWordWithCode.RegisterClass;
{$IfEnd} //not NoScripts

end.