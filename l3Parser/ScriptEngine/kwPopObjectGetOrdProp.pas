unit kwPopObjectGetOrdProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectGetOrdProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_GetOrdProp
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
 TkwPopObjectGetOrdProp = {scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectGetOrdProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectGetOrdProp

procedure TkwPopObjectGetOrdProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F21342401A1_var*
//#UC END# *4F212BD5010E_4F21342401A1_var*
begin
//#UC START# *4F212BD5010E_4F21342401A1_impl*
 aCtx.rEngine.PushInt(GetOrdProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_4F21342401A1_impl*
end;//TkwPopObjectGetOrdProp.DoObject

class function TkwPopObjectGetOrdProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:GetOrdProp';
end;//TkwPopObjectGetOrdProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_GetOrdProp
 TkwPopObjectGetOrdProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.