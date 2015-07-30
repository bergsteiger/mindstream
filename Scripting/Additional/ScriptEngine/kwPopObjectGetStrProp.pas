unit kwPopObjectGetStrProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectGetStrProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_GetStrProp
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
 TkwPopObjectGetStrProp = {scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetStrProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetStrProp

procedure TkwPopObjectGetStrProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F2134410364_var*
//#UC END# *4F212BD5010E_4F2134410364_var*
begin
//#UC START# *4F212BD5010E_4F2134410364_impl*
 aCtx.rEngine.PushString(GetStrProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_4F2134410364_impl*
end;//TkwPopObjectGetStrProp.DoObject

class function TkwPopObjectGetStrProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetStrProp';
end;//TkwPopObjectGetStrProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_GetStrProp
 TkwPopObjectGetStrProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.