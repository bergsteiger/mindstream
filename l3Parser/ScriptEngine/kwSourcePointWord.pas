unit kwSourcePointWord;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "kwSourcePointWord.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::CompiledWords::TkwSourcePointWord
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3Interfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSourcePointWord = {abstract} class(TtfwWord)
 private
 // private fields
   f_SourceFileName : Il3CString;
   f_SourceLine : Integer;
 protected
 // overridden protected methods
   procedure ClearFields; override;
     {* Сигнатура метода ClearFields }
 public
 // overridden public methods
   function SourcePoint: TtfwSourcePoint; override;
 public
 // public methods
   constructor Create(const aCtx: TtfwContext); reintroduce;
 end;//TkwSourcePointWord
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSourcePointWord

constructor TkwSourcePointWord.Create(const aCtx: TtfwContext);
//#UC START# *556427DD0163_556427250160_var*
//#UC END# *556427DD0163_556427250160_var*
begin
//#UC START# *556427DD0163_556427250160_impl*
 if (aCtx.rParser = nil) then
 begin
  f_SourceLine := -1;
  f_SourceFileName := nil;
 end//aCtx.rParser = nil
 else
 begin
  f_SourceLine := aCtx.rParser.SourceLine;
  f_SourceFileName := TtfwCStringFactory.C(aCtx.rParser.FileName);
 end;//aCtx.rParser = nil
 inherited Create;
//#UC END# *556427DD0163_556427250160_impl*
end;//TkwSourcePointWord.Create

procedure TkwSourcePointWord.ClearFields;
 {-}
begin
 {$If not defined(NoScripts)}
 f_SourceFileName := nil;
 {$IfEnd} //not NoScripts
 inherited;
end;//TkwSourcePointWord.ClearFields

function TkwSourcePointWord.SourcePoint: TtfwSourcePoint;
//#UC START# *556317DE02B5_556427250160_var*
//#UC END# *556317DE02B5_556427250160_var*
begin
//#UC START# *556317DE02B5_556427250160_impl*
 Result := inherited SourcePoint;
 Result.rFileName := f_SourceFileName;
 Result.rLine := f_SourceLine;
//#UC END# *556317DE02B5_556427250160_impl*
end;//TkwSourcePointWord.SourcePoint

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSourcePointWord
 TkwSourcePointWord.RegisterClass;
{$IfEnd} //not NoScripts

end.