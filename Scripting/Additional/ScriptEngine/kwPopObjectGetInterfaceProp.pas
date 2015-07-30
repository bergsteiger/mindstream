unit kwPopObjectGetInterfaceProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectGetInterfaceProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_GetInterfaceProp
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  kwObjectFromStackWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 {$Include ..\ScriptEngine\kwRTTIWord.imp.pas}
 TkwPopObjectGetInterfaceProp = {final scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetInterfaceProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

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
// Регистрация pop_object_GetInterfaceProp
 TkwPopObjectGetInterfaceProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.