unit kwCompiledWordPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledWordPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledWordPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwWordRefList,
  l3ParserInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordPrim = class of TkwCompiledWordPrim;

 TkwCompiledWordPrim = {abstract} class(TtfwWord)
 private
 // private fields
   f_WordProducer : TtfwWord;
    {* Слово, которое породило данное при компиляции}
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
   function pm_GetParentWord: TtfwWord; override;
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
   function GetCompiler(const aCtx: TtfwContext): ItfwCompiler; override;
   function GetInParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
   function GetEndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function AcceptMedianBracket(aBracket: TtfwWord;
     var aCtx: TtfwContext): Boolean; override;
 protected
 // protected fields
   f_PrevFinder : Pointer;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     const aPrevFinder: Il3KeywordFinder;
     const aTypeInfo: TtfwTypeInfo;
     const aCtx: TtfwContext;
     aKey: TtfwKeyWordPrim); reintroduce; virtual;
   function GetCode(const aCtx: TtfwContext): TtfwWordRefList; virtual;
 end;//TkwCompiledWordPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwCompiledWordPrim

constructor TkwCompiledWordPrim.Create(aWordProducer: TtfwWord;
  const aPrevFinder: Il3KeywordFinder;
  const aTypeInfo: TtfwTypeInfo;
  const aCtx: TtfwContext;
  aKey: TtfwKeyWordPrim);
//#UC START# *4DC9723702F5_52D3C5F90029_var*
//#UC END# *4DC9723702F5_52D3C5F90029_var*
begin
//#UC START# *4DC9723702F5_52D3C5F90029_impl*
 Self.Key := aKey;
 CompilerAssert(aPrevFinder <> nil, 'Не задан aPrevFinder', aCtx);
 inherited Create;
 f_PrevFinder := Pointer(aPrevFinder);
 f_WordProducer := aWordProducer;
 SetResultTypeInfo(aTypeInfo, aCtx);
 CompilerAssert(f_PrevFinder <> nil, 'Не передано родительское слово', aCtx);
//#UC END# *4DC9723702F5_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.Create

function TkwCompiledWordPrim.GetCode(const aCtx: TtfwContext): TtfwWordRefList;
//#UC START# *52D41C7F027B_52D3C5F90029_var*
//#UC END# *52D41C7F027B_52D3C5F90029_var*
begin
//#UC START# *52D41C7F027B_52D3C5F90029_impl*
 CompilerAssert(false, 'Слово не имеет скомпилированного кода', aCtx);
 Result := nil;
//#UC END# *52D41C7F027B_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.GetCode

procedure TkwCompiledWordPrim.Cleanup;
//#UC START# *479731C50290_52D3C5F90029_var*
//#UC END# *479731C50290_52D3C5F90029_var*
begin
//#UC START# *479731C50290_52D3C5F90029_impl*
 f_PrevFinder := nil;
 inherited;
//#UC END# *479731C50290_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TkwCompiledWordPrim.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_52D3C5F90029_var*
//#UC END# *47A6FEE600FC_52D3C5F90029_var*
begin
//#UC START# *47A6FEE600FC_52D3C5F90029_impl*
 Result := true;
//#UC END# *47A6FEE600FC_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function TkwCompiledWordPrim.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_52D3C5F90029get_var*
//#UC END# *4F43C9A10139_52D3C5F90029get_var*
begin
//#UC START# *4F43C9A10139_52D3C5F90029get_impl*
 Result := f_WordProducer;
//#UC END# *4F43C9A10139_52D3C5F90029get_impl*
end;//TkwCompiledWordPrim.pm_GetWordProducer

function TkwCompiledWordPrim.pm_GetParentWord: TtfwWord;
//#UC START# *52CFCF4B02C6_52D3C5F90029get_var*
var
 l_C : ItfwCompiler;
//#UC END# *52CFCF4B02C6_52D3C5F90029get_var*
begin
//#UC START# *52CFCF4B02C6_52D3C5F90029get_impl*
 if Supports(Il3KeywordFinder(f_PrevFinder), ItfwCompiler, l_C) then
  Result := l_C.GetWordCompilingNow
 else
  Result := nil; 
//#UC END# *52CFCF4B02C6_52D3C5F90029get_impl*
end;//TkwCompiledWordPrim.pm_GetParentWord

function TkwCompiledWordPrim.GetCompiler(const aCtx: TtfwContext): ItfwCompiler;
//#UC START# *52D523A40118_52D3C5F90029_var*
//#UC END# *52D523A40118_52D3C5F90029_var*
begin
//#UC START# *52D523A40118_52D3C5F90029_impl*
 Supports(Il3KeywordFinder(f_PrevFinder), ItfwCompiler, Result);
//#UC END# *52D523A40118_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.GetCompiler

function TkwCompiledWordPrim.GetInParam(const aCtx: TtfwContext;
  anIndex: Integer): TtfwWord;
//#UC START# *52D5425A037F_52D3C5F90029_var*
//#UC END# *52D5425A037F_52D3C5F90029_var*
begin
//#UC START# *52D5425A037F_52D3C5F90029_impl*
 CompilerAssert(ParentWord <> nil, 'Слово не имеет родителя', aCtx);
 Result := (ParentWord As TkwCompiledWordPrim).GetInParam(aCtx, anIndex);
//#UC END# *52D5425A037F_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.GetInParam

function TkwCompiledWordPrim.GetEndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *52D6B62E001B_52D3C5F90029_var*
//#UC END# *52D6B62E001B_52D3C5F90029_var*
begin
//#UC START# *52D6B62E001B_52D3C5F90029_impl*
 Result := Self.WordProducer.GetEndBracket(aContext, aSilent);
//#UC END# *52D6B62E001B_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.GetEndBracket

function TkwCompiledWordPrim.AcceptMedianBracket(aBracket: TtfwWord;
  var aCtx: TtfwContext): Boolean;
//#UC START# *52D7DC84019E_52D3C5F90029_var*
//#UC END# *52D7DC84019E_52D3C5F90029_var*
begin
//#UC START# *52D7DC84019E_52D3C5F90029_impl*
 Result := Self.WordProducer.AcceptMedianBracket(aBracket, aCtx);
//#UC END# *52D7DC84019E_52D3C5F90029_impl*
end;//TkwCompiledWordPrim.AcceptMedianBracket

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordPrim
 TkwCompiledWordPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.