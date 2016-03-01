unit kwCompiledWordPrimPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwCompiledWordPrimPrim.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwCompiledWordPrimPrim
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwScriptingInterfaces,
  tfwKeyWordPrim,
  kwSourcePointWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwCompiledWordPrimPrim = class(TkwSourcePointWord)
 private
 // private fields
   f_WordProducer : TtfwWord;
    {* Слово, которое породило данное при компиляции}
 protected
 // overridden property methods
   function pm_GetWordProducer: TtfwWord; override;
   procedure pm_SetWordProducer(aValue: TtfwWord); override;
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
   function GetEndBracket(const aContext: TtfwContext;
     aSilent: Boolean): RtfwWord; override;
   function AcceptMedianBracket(aBracket: TtfwWord;
     var aCtx: TtfwContext): Boolean; override;
 public
 // public methods
   constructor Create(aWordProducer: TtfwWord;
     const aCtx: TtfwContext;
     aKey: TtfwKeyWordPrim); reintroduce;
 end;//TkwCompiledWordPrimPrim
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}

// start class TkwCompiledWordPrimPrim

constructor TkwCompiledWordPrimPrim.Create(aWordProducer: TtfwWord;
  const aCtx: TtfwContext;
  aKey: TtfwKeyWordPrim);
//#UC START# *55EEDB4E00B3_55EEDAFE018F_var*
//#UC END# *55EEDB4E00B3_55EEDAFE018F_var*
begin
//#UC START# *55EEDB4E00B3_55EEDAFE018F_impl*
 Self.Key := aKey;
 inherited Create(aCtx);
 WordProducer := aWordProducer;
//#UC END# *55EEDB4E00B3_55EEDAFE018F_impl*
end;//TkwCompiledWordPrimPrim.Create

procedure TkwCompiledWordPrimPrim.Cleanup;
//#UC START# *479731C50290_55EEDAFE018F_var*
//#UC END# *479731C50290_55EEDAFE018F_var*
begin
//#UC START# *479731C50290_55EEDAFE018F_impl*
 f_WordProducer := nil;
 inherited;
//#UC END# *479731C50290_55EEDAFE018F_impl*
end;//TkwCompiledWordPrimPrim.Cleanup

{$If not defined(DesignTimeLibrary)}
class function TkwCompiledWordPrimPrim.IsCacheable: Boolean;
//#UC START# *47A6FEE600FC_55EEDAFE018F_var*
//#UC END# *47A6FEE600FC_55EEDAFE018F_var*
begin
//#UC START# *47A6FEE600FC_55EEDAFE018F_impl*
 Result := true;
//#UC END# *47A6FEE600FC_55EEDAFE018F_impl*
end;//TkwCompiledWordPrimPrim.IsCacheable
{$IfEnd} //not DesignTimeLibrary

function TkwCompiledWordPrimPrim.pm_GetWordProducer: TtfwWord;
//#UC START# *4F43C9A10139_55EEDAFE018Fget_var*
//#UC END# *4F43C9A10139_55EEDAFE018Fget_var*
begin
//#UC START# *4F43C9A10139_55EEDAFE018Fget_impl*
 Result := f_WordProducer;
//#UC END# *4F43C9A10139_55EEDAFE018Fget_impl*
end;//TkwCompiledWordPrimPrim.pm_GetWordProducer

procedure TkwCompiledWordPrimPrim.pm_SetWordProducer(aValue: TtfwWord);
//#UC START# *4F43C9A10139_55EEDAFE018Fset_var*
//#UC END# *4F43C9A10139_55EEDAFE018Fset_var*
begin
//#UC START# *4F43C9A10139_55EEDAFE018Fset_impl*
 Assert(aValue <> Self);
 f_WordProducer := aValue;
//#UC END# *4F43C9A10139_55EEDAFE018Fset_impl*
end;//TkwCompiledWordPrimPrim.pm_SetWordProducer

function TkwCompiledWordPrimPrim.GetEndBracket(const aContext: TtfwContext;
  aSilent: Boolean): RtfwWord;
//#UC START# *52D6B62E001B_55EEDAFE018F_var*
//#UC END# *52D6B62E001B_55EEDAFE018F_var*
begin
//#UC START# *52D6B62E001B_55EEDAFE018F_impl*
 Result := Self.WordProducer.GetEndBracket(aContext, aSilent);
//#UC END# *52D6B62E001B_55EEDAFE018F_impl*
end;//TkwCompiledWordPrimPrim.GetEndBracket

function TkwCompiledWordPrimPrim.AcceptMedianBracket(aBracket: TtfwWord;
  var aCtx: TtfwContext): Boolean;
//#UC START# *52D7DC84019E_55EEDAFE018F_var*
//#UC END# *52D7DC84019E_55EEDAFE018F_var*
begin
//#UC START# *52D7DC84019E_55EEDAFE018F_impl*
 Result := Self.WordProducer.AcceptMedianBracket(aBracket, aCtx);
//#UC END# *52D7DC84019E_55EEDAFE018F_impl*
end;//TkwCompiledWordPrimPrim.AcceptMedianBracket

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwCompiledWordPrimPrim
 TkwCompiledWordPrimPrim.RegisterClass;
{$IfEnd} //not NoScripts

end.