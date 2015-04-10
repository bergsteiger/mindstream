unit kwPopComponentComponentCount;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComponentComponentCount.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_component_ComponentCount
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
  Classes,
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
 TkwPopComponentComponentCount = class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComponentComponentCount
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopComponentComponentCount;

{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

// start class TkwPopComponentComponentCount

procedure TkwPopComponentComponentCount.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4F2148ED033C_var*
//#UC END# *4F21485E0184_4F2148ED033C_var*
begin
//#UC START# *4F21485E0184_4F2148ED033C_impl*
 aCtx.rEngine.PushInt(aComponent.ComponentCount);
//#UC END# *4F21485E0184_4F2148ED033C_impl*
end;//TkwPopComponentComponentCount.DoComponent

class function TkwPopComponentComponentCount.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:component:ComponentCount';
end;//TkwPopComponentComponentCount.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.