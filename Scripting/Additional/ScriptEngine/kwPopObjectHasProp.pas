unit kwPopObjectHasProp;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectHasProp.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::RTTI::pop_object_HasProp
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
 TkwPopObjectHasProp = {final scriptword} class(_kwRTTIWord_)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectHasProp
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  TypInfo
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

{$Include ..\ScriptEngine\kwRTTIWord.imp.pas}

// start class TkwPopObjectHasProp

procedure TkwPopObjectHasProp.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_51B99E050377_var*
//#UC END# *4F212BD5010E_51B99E050377_var*
begin
//#UC START# *4F212BD5010E_51B99E050377_impl*
 RunnerAssert(aCtx.rEngine.IsTopString, 'Не задано название свойства!', aCtx);
 aCtx.rEngine.PushBool(IsPublishedProp(anObject, aCtx.rEngine.PopDelphiString));
//#UC END# *4F212BD5010E_51B99E050377_impl*
end;//TkwPopObjectHasProp.DoObject

class function TkwPopObjectHasProp.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:HasProp';
end;//TkwPopObjectHasProp.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_HasProp
 TkwPopObjectHasProp.RegisterInEngine;
{$IfEnd} //not NoScripts

end.