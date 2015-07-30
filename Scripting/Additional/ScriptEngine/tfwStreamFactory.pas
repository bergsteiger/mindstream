unit tfwStreamFactory;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$Core"
// Модуль: "tfwStreamFactory.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: SimpleClass::Class Shared Delphi Low Level::ScriptEngine$Core::Parser::TtfwStreamFactory
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  l3BaseStream,
  l3ProtoObject
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TtfwStreamFactory = {abstract} class(Tl3ProtoObject)
 private
 // private fields
   f_FileName : AnsiString;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* Функция очистки полей объекта. }
 protected
 // protected fields
   f_Stream : Tl3Stream;
 public
 // public methods
   function FileName: AnsiString;
   function Stream: Tl3Stream; virtual; abstract;
   constructor Create(const aFileName: AnsiString); reintroduce;
   procedure CloseStream;
 end;//TtfwStreamFactory
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TtfwStreamFactory

function TtfwStreamFactory.FileName: AnsiString;
//#UC START# *52F4E6D60067_52F4E6AA02BB_var*
//#UC END# *52F4E6D60067_52F4E6AA02BB_var*
begin
//#UC START# *52F4E6D60067_52F4E6AA02BB_impl*
 Result := f_FileName;
//#UC END# *52F4E6D60067_52F4E6AA02BB_impl*
end;//TtfwStreamFactory.FileName

constructor TtfwStreamFactory.Create(const aFileName: AnsiString);
//#UC START# *52F4E94802D6_52F4E6AA02BB_var*
//#UC END# *52F4E94802D6_52F4E6AA02BB_var*
begin
//#UC START# *52F4E94802D6_52F4E6AA02BB_impl*
 inherited Create;
 f_FileName := aFileName;
//#UC END# *52F4E94802D6_52F4E6AA02BB_impl*
end;//TtfwStreamFactory.Create

procedure TtfwStreamFactory.CloseStream;
//#UC START# *52F4F68C01E0_52F4E6AA02BB_var*
//#UC END# *52F4F68C01E0_52F4E6AA02BB_var*
begin
//#UC START# *52F4F68C01E0_52F4E6AA02BB_impl*
 FreeAndNil(f_Stream);
//#UC END# *52F4F68C01E0_52F4E6AA02BB_impl*
end;//TtfwStreamFactory.CloseStream

procedure TtfwStreamFactory.Cleanup;
//#UC START# *479731C50290_52F4E6AA02BB_var*
//#UC END# *479731C50290_52F4E6AA02BB_var*
begin
//#UC START# *479731C50290_52F4E6AA02BB_impl*
 FreeAndNil(f_Stream);
 inherited;
//#UC END# *479731C50290_52F4E6AA02BB_impl*
end;//TtfwStreamFactory.Cleanup

{$IfEnd} //not NoScripts

end.