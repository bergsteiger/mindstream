unit kwInnerIncludedInChildren;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "kwInnerIncludedInChildren.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::IncludesAndUses::TkwInnerIncludedInChildren
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwCompiledWord,
  kwInnerIncluded,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwInnerIncludedInChildren = class(TkwInnerIncluded)
 private
 // private fields
   f_WordToIncludeTo : TkwCompiledWord;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure FillContext(const anOldContext: TtfwContext;
     var theNewContext: TtfwContext); override;
 public
 // public methods
   constructor Create(const aFileName: AnsiString;
     aWordToIncludeTo: TkwCompiledWord); reintroduce;
 end;//TkwInnerIncludedInChildren
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwInnerIncludedInChildren

constructor TkwInnerIncludedInChildren.Create(const aFileName: AnsiString;
  aWordToIncludeTo: TkwCompiledWord);
//#UC START# *4F476C1500DF_4F476A6300C3_var*
//#UC END# *4F476C1500DF_4F476A6300C3_var*
begin
//#UC START# *4F476C1500DF_4F476A6300C3_impl*
 inherited Create(aFileName);
 aWordToIncludeTo.SetRefTo(f_WordToIncludeTo);
//#UC END# *4F476C1500DF_4F476A6300C3_impl*
end;//TkwInnerIncludedInChildren.Create

procedure TkwInnerIncludedInChildren.Cleanup;
//#UC START# *479731C50290_4F476A6300C3_var*
//#UC END# *479731C50290_4F476A6300C3_var*
begin
//#UC START# *479731C50290_4F476A6300C3_impl*
 FreeAndNil(f_WordToIncludeTo);
 inherited;
//#UC END# *479731C50290_4F476A6300C3_impl*
end;//TkwInnerIncludedInChildren.Cleanup

procedure TkwInnerIncludedInChildren.FillContext(const anOldContext: TtfwContext;
  var theNewContext: TtfwContext);
//#UC START# *4F3AA59B025A_4F476A6300C3_var*
//#UC END# *4F3AA59B025A_4F476A6300C3_var*
begin
//#UC START# *4F3AA59B025A_4F476A6300C3_impl*
 inherited;
 theNewContext.rParser.KeyWords := f_WordToIncludeTo;
 theNewContext.rCompiler := f_WordToIncludeTo;
//#UC END# *4F3AA59B025A_4F476A6300C3_impl*
end;//TkwInnerIncludedInChildren.FillContext

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwInnerIncludedInChildren
 TkwInnerIncludedInChildren.RegisterInEngine;
{$IfEnd} //not NoScripts

end.