unit kwPopObjectSetStrProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectSetStrProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_SetStrProp
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
 TkwPopObjectSetStrProp = {scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectSetStrProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectSetStrProp

procedure TkwPopObjectSetStrProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F21343401BE_var*
var
 l_N : AnsiString;
 l_V : AnsiString;
//#UC END# *4F212BD5010E_4F21343401BE_var*
begin
//#UC START# *4F212BD5010E_4F21343401BE_impl*
 l_N := aCtx.rEngine.PopDelphiString;
 l_V := aCtx.rEngine.PopDelphiString;
 SetStrProp(anObject, l_N, l_V);
//#UC END# *4F212BD5010E_4F21343401BE_impl*
end;//TkwPopObjectSetStrProp.DoObject

class function TkwPopObjectSetStrProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:SetStrProp';
end;//TkwPopObjectSetStrProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_SetStrProp
 TkwPopObjectSetStrProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.