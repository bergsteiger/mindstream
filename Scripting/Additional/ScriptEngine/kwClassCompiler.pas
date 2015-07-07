unit kwClassCompiler;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwClassCompiler.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi Scripting::ScriptEngine::Stereotyping::TkwClassCompiler
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
  kwCompiledProcedure,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwClassCompiler = class(TkwCompiledProcedure)
 protected
 // overridden protected methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
   function AllowNestedCalls: Boolean; override;
 public
 // overridden public methods
   function IsImmediate: Boolean; override;
 end;//TkwClassCompiler
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  kwCompiledClassProducerEx,
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwClassCompiler

procedure TkwClassCompiler.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F3961B4035D_var*
var
 l_W : TkwCompiledClassProducerEx;
//#UC END# *4DAEEDE10285_4F3961B4035D_var*
begin
//#UC START# *4DAEEDE10285_4F3961B4035D_impl*
 l_W := TkwCompiledClassProducerEx.Create(Self, Self);
 try
  l_W.Key := Self.Key;
  l_W.DoIt(aCtx);
 finally
  FreeAndNil(l_W);
 end;//try..finally
//#UC END# *4DAEEDE10285_4F3961B4035D_impl*
end;//TkwClassCompiler.DoDoIt

function TkwClassCompiler.IsImmediate: Boolean;
//#UC START# *4DB6D7F70155_4F3961B4035D_var*
//#UC END# *4DB6D7F70155_4F3961B4035D_var*
begin
//#UC START# *4DB6D7F70155_4F3961B4035D_impl*
 Result := true;
//#UC END# *4DB6D7F70155_4F3961B4035D_impl*
end;//TkwClassCompiler.IsImmediate

function TkwClassCompiler.AllowNestedCalls: Boolean;
//#UC START# *4F3C06550278_4F3961B4035D_var*
//#UC END# *4F3C06550278_4F3961B4035D_var*
begin
//#UC START# *4F3C06550278_4F3961B4035D_impl*
 Result := true;
//#UC END# *4F3C06550278_4F3961B4035D_impl*
end;//TkwClassCompiler.AllowNestedCalls

{$IfEnd} //not NoScripts

end.