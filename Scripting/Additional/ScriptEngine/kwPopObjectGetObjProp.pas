unit kwPopObjectGetObjProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectGetObjProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_GetObjProp
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
 TkwPopObjectGetObjProp = {final scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetObjProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetObjProp

procedure TkwPopObjectGetObjProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_500BD4CA03A7_var*
//#UC END# *4F212BD5010E_500BD4CA03A7_var*
begin
//#UC START# *4F212BD5010E_500BD4CA03A7_impl*
 aCtx.rEngine.PushObj(GetObjectProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_500BD4CA03A7_impl*
end;//TkwPopObjectGetObjProp.DoObject

class function TkwPopObjectGetObjProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetObjProp';
end;//TkwPopObjectGetObjProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_GetObjProp
 TkwPopObjectGetObjProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.