unit tfwAnonimousWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Автор: Люлин А.В.
// Модуль: "tfwAnonimousWord.pas"
// Начат: 28.04.2011 23:09
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TtfwAnonimousWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwCompilingWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwAnonimousWord = {abstract} class(TtfwCompilingWord)
 public
 // overridden public methods
   function IsAnonimous: Boolean; override;
 protected
 // protected methods
   procedure DoCompiledWord(aWord: TtfwWord;
     const aContext: TtfwContext); virtual;
 public
 // public methods
   procedure DoRun(const aCtx: TtfwContext); virtual;
 end;//TtfwAnonimousWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TtfwAnonimousWord

procedure TtfwAnonimousWord.DoCompiledWord(aWord: TtfwWord;
  const aContext: TtfwContext);
//#UC START# *4DB9BBD6024F_4DB9BB43017B_var*
//#UC END# *4DB9BBD6024F_4DB9BB43017B_var*
begin
//#UC START# *4DB9BBD6024F_4DB9BB43017B_impl*
 if aWord.IsRunner then
 begin
  CompilerAssert((aWord.Key = nil) OR (aWord.Key = Self.Key), 'Неверное имя запускаемого слова', aContext);
  aWord.Key := Self.Key;
  // - чтобы легче было опознавать слова по их Runner'ам
  try
   aWord.DoIt(aContext);
  finally
   aWord.Key := nil;
  end;//try..finally
 end//aWord.IsRunner
 else
 begin
  CompilerAssert(aContext.rCompiler <> nil, 'Нет текущего компилируемого слова', aContext);
  aContext.rCompiler.AddCodePart(aWord, false, aContext);
 end;//aWord.IsRunner
//#UC END# *4DB9BBD6024F_4DB9BB43017B_impl*
end;//TtfwAnonimousWord.DoCompiledWord

procedure TtfwAnonimousWord.DoRun(const aCtx: TtfwContext);
//#UC START# *5512949D0048_4DB9BB43017B_var*
//#UC END# *5512949D0048_4DB9BB43017B_var*
begin
//#UC START# *5512949D0048_4DB9BB43017B_impl*
 RunnerError(ClassName + '.DoRun не реализован', aCtx);
//#UC END# *5512949D0048_4DB9BB43017B_impl*
end;//TtfwAnonimousWord.DoRun

function TtfwAnonimousWord.IsAnonimous: Boolean;
//#UC START# *4F3AB3600008_4DB9BB43017B_var*
//#UC END# *4F3AB3600008_4DB9BB43017B_var*
begin
//#UC START# *4F3AB3600008_4DB9BB43017B_impl*
 Result := true;
//#UC END# *4F3AB3600008_4DB9BB43017B_impl*
end;//TtfwAnonimousWord.IsAnonimous

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TtfwAnonimousWord
 TtfwAnonimousWord.RegisterClass;
{$IfEnd} //not NoScripts

end.