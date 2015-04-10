unit kwPopComponentOwner;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopComponentOwner.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::ControlsProcessing::pop_component_Owner
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
 TkwPopComponentOwner = {final} class(_kwComponentFromStackWord_)
 protected
 // realized methods
   procedure DoComponent(aComponent: TComponent;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopComponentOwner
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

type _Instance_R_ = TkwPopComponentOwner;

{$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}

// start class TkwPopComponentOwner

procedure TkwPopComponentOwner.DoComponent(aComponent: TComponent;
  const aCtx: TtfwContext);
//#UC START# *4F21485E0184_53590FC301C9_var*
//#UC END# *4F21485E0184_53590FC301C9_var*
begin
//#UC START# *4F21485E0184_53590FC301C9_impl*
 aCtx.rEngine.PushObj(aComponent.Owner);
//#UC END# *4F21485E0184_53590FC301C9_impl*
end;//TkwPopComponentOwner.DoComponent

class function TkwPopComponentOwner.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:component:Owner';
end;//TkwPopComponentOwner.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwComponentFromStackWord.imp.pas}
{$IfEnd} //not NoScripts

end.