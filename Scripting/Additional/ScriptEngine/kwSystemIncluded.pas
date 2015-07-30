unit kwSystemIncluded;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "kwSystemIncluded.pas"
// Начат: 15.07.2011 21:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine::Scripting Axiomatics::TkwSystemIncluded
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwIncludedPrim,
  tfwStreamFactory,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwSystemIncluded = class(TkwIncludedPrim)
 private
 // private fields
   f_Stream : TtfwStreamFactory;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // public methods
   constructor Create(aStream: TtfwStreamFactory); reintroduce;
 end;//TkwSystemIncluded
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwCOMStreamFactory,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwSystemIncluded

constructor TkwSystemIncluded.Create(aStream: TtfwStreamFactory);
//#UC START# *4E207B920217_4E207A9201A5_var*
//#UC END# *4E207B920217_4E207A9201A5_var*
begin
//#UC START# *4E207B920217_4E207A9201A5_impl*
 Assert(aStream <> nil);
 inherited Create;
 aStream.SetRefTo(f_Stream);
//#UC END# *4E207B920217_4E207A9201A5_impl*
end;//TkwSystemIncluded.Create

procedure TkwSystemIncluded.Cleanup;
//#UC START# *479731C50290_4E207A9201A5_var*
//#UC END# *479731C50290_4E207A9201A5_var*
begin
//#UC START# *479731C50290_4E207A9201A5_impl*
 FreeAndNil(f_Stream);
 inherited;
//#UC END# *479731C50290_4E207A9201A5_impl*
end;//TkwSystemIncluded.Cleanup

procedure TkwSystemIncluded.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4E207A9201A5_var*
//#UC END# *4DAEEDE10285_4E207A9201A5_var*
begin
//#UC START# *4DAEEDE10285_4E207A9201A5_impl*
 DoFiler(f_Stream, aCtx);
//#UC END# *4DAEEDE10285_4E207A9201A5_impl*
end;//TkwSystemIncluded.DoDoIt

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация TkwSystemIncluded
 TkwSystemIncluded.RegisterInEngine;
{$IfEnd} //not NoScripts

end.