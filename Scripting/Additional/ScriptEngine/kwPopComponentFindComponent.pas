unit kwPopComponentFindComponent;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComponentFindComponent.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_component_FindComponent
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
 TkwPopComponentFindComponent = class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComponentFindComponent
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

type _Instance_R_ = TkwPopComponentFindComponent;

{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

// start class TkwPopComponentFindComponent

procedure TkwPopComponentFindComponent.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_4F2148BE0371_var*
//#UC END# *4F21485E0184_4F2148BE0371_var*
begin
//#UC START# *4F21485E0184_4F2148BE0371_impl*
 aCtx.rEngine.PushObj(aComponent.FindComponent(aCtx.rEngine.PopDelphiString));
//#UC END# *4F21485E0184_4F2148BE0371_impl*
end;//TkwPopComponentFindComponent.DoComponent

class function TkwPopComponentFindComponent.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:component:FindComponent';
end;//TkwPopComponentFindComponent.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.