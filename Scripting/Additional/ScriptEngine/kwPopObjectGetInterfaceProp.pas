unit kwPopObjectGetInterfaceProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopObjectGetInterfaceProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::RTTI::pop_object_GetInterfaceProp
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
  tfwScriptingInterfaces,
  tfwRegisterableWord
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
 TkwPopObjectGetInterfaceProp = {final} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetInterfaceProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo,
  tfwAutoregisteredDiction,
  tfwScriptEngine,
  Windows,
  Controls,
  afwFacade,
  Forms
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopObjectGetInterfaceProp;

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetInterfaceProp

procedure TkwPopObjectGetInterfaceProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_5138781D02AD_var*
//#UC END# *4F212BD5010E_5138781D02AD_var*
begin
//#UC START# *4F212BD5010E_5138781D02AD_impl*
 aCtx.rEngine.PushIntf(GetInterfaceProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_5138781D02AD_impl*
end;//TkwPopObjectGetInterfaceProp.DoObject

class function TkwPopObjectGetInterfaceProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetInterfaceProp';
end;//TkwPopObjectGetInterfaceProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
{$IfEnd} //not NoScripts

end.