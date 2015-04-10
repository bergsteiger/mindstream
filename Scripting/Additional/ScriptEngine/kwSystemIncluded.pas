unit kwSystemIncluded;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Автор: Люлин А.В.
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwSystemIncluded.pas"
// Начат: 15.07.2011 21:36
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Scripting Axiomatics::TkwSystemIncluded
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwStreamFactory,
  tfwScriptingInterfaces,
  l3Interfaces,
  l3ParserInterfaces,
  kwCompiledWordPrim,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}
 TkwSystemIncluded = class(_kwIncludedPrim_)
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
  SysUtils,
  kwCompiledIncluded,
  tfwParser,
  tfwParserInterfaces,
  l3Parser,
  kwCompiledWord,
  kwInteger,
  kwString,
  TypInfo,
  l3Base,
  kwIntegerFactory,
  kwStringFactory,
  l3String,
  l3Chars,
  StrUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwSystemIncluded;

{$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}

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
 {$Include ..\ScriptEngine\kwIncludedPrim.imp.pas}
{$IfEnd} //not NoScripts

end.