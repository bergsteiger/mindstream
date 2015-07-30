unit kwPopObjectGetFloatProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectGetFloatProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_GetFloatProp
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
 TkwPopObjectGetFloatProp = {final scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetFloatProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetFloatProp

procedure TkwPopObjectGetFloatProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_51387690029A_var*
//#UC END# *4F212BD5010E_51387690029A_var*
begin
//#UC START# *4F212BD5010E_51387690029A_impl*
 aCtx.rEngine.PushInt(Trunc(GetFloatProp(anObject, aCtx.rEngine.PopDelphiString)));
//#UC END# *4F212BD5010E_51387690029A_impl*
end;//TkwPopObjectGetFloatProp.DoObject

class function TkwPopObjectGetFloatProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetFloatProp';
end;//TkwPopObjectGetFloatProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_GetFloatProp
 TkwPopObjectGetFloatProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.