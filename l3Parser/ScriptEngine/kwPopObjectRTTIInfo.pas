unit kwPopObjectRTTIInfo;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectRTTIInfo.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_RTTIInfo
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
 TkwPopObjectRTTIInfo = {final scriptword} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectRTTIInfo
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  l3RTTI
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopObjectRTTIInfo

procedure TkwPopObjectRTTIInfo.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_5012CB7D0204_var*
//#UC END# *4F212BD5010E_5012CB7D0204_var*
begin
//#UC START# *4F212BD5010E_5012CB7D0204_impl*
 aCtx.rEngine.PushString(L3FormatRTTIInfo(anObject));
//#UC END# *4F212BD5010E_5012CB7D0204_impl*
end;//TkwPopObjectRTTIInfo.DoObject

class function TkwPopObjectRTTIInfo.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:RTTIInfo';
end;//TkwPopObjectRTTIInfo.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_RTTIInfo
 TkwPopObjectRTTIInfo.RegisterInEngine;
{$IfEnd} //not NoScripts

end.