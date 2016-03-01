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
  tfwKeyWordPrim,
  kwCompiledWordPrimPrim
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 RkwCompiledWordPrim = class of TkwCompiledWordPrim;

 TkwCompiledWordPrim = {abstract} class(TkwCompiledWordPrimPrim)
 protected
 // overridden property methods
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
   function GetCompiler(const aCtx: TtfwContext): TtfwWord; override;
   function GetInParam(const aCtx: TtfwContext;
     anIndex: Integer): TtfwWord; override;
 protected
 // protected fields
   f_PrevFinder : TtfwWord;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     aPrevFinder: TtfwWord;
     aTypeInfo: TtfwWordInfo;
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
  aPrevFinder: TtfwWord;
  aTypeInfo: TtfwWordInfo;
  const aCtx: TtfwContext;
  aKey: TtfwKeyWordPrim);
//#UC START# *4DC9723702F5_52D3C5F90029_var*
//#UC END# *4DC9723702F5_52D3C5F90029_var*
begin
//#UC START# *4DC9723702F5_52D3C5F90029_impl*
 Self.Key := aKey;
 CompilerAssert(aPrevFinder <> nil, 'Не задан aPrevFinder', aCtx);
 inherited Create(aWordProducer, aCtx, aKey);
 f_PrevFinder := Pointer(aPrevFinder);
 //WordProducer := aWordProducer;
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
 //f_WordProducer := nil;
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

function TkwCompiledWordPrim.pm_GetParentWord: TtfwWord;
//#UC START# *52CFCF4B02C6_52D3C5F90029get_var*
//#UC END# *52CFCF4B02C6_52D3C5F90029get_var*
begin
//#UC START# *52CFCF4B02C6_52D3C5F90029get_impl*
 if (f_PrevFinder <> nil) then
  Result := f_PrevFinder
 else
  Result := nil; 
//#UC END# *52CFCF4B02C6_52D3C5F90029get_impl*
end;//TkwCompiledWordPrim.pm_GetParentWord

function TkwCompiledWordPrim.GetCompiler(const aCtx: TtfwContext): TtfwWord;
//#UC START# *52D523A40118_52D3C5F90029_var*
//#UC END# *52D523A40118_52D3C5F90029_var*
begin
//#UC START# *52D523A40118_52D3C5F90029_impl*
 if (f_PrevFinder = nil) then
  Result := nil
 else
  Result := f_PrevFinder;
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

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordPrim
 TkwCompiledWordPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.