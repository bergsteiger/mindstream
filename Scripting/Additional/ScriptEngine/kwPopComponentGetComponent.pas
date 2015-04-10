unit kwPopComponentGetComponent;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComponentGetComponent.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_component_GetComponent
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
 TkwPopComponentGetComponent = class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComponentGetComponent
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

type _Instance_R_ = TkwPopComponentGetComponent;

{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

// start class TkwPopComponentGetComponent

procedure TkwPopComponentGetComponent.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4F2148FD0359_var*
//#UC END# *4F21485E0184_4F2148FD0359_var*
begin
//#UC START# *4F21485E0184_4F2148FD0359_impl*
 aCtx.rEngine.PushObj(aComponent.Components[aCtx.rEngine.PopInt]);
//#UC END# *4F21485E0184_4F2148FD0359_impl*
end;//TkwPopComponentGetComponent.DoComponent

class function TkwPopComponentGetComponent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:component:GetComponent';
end;//TkwPopComponentGetComponent.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.