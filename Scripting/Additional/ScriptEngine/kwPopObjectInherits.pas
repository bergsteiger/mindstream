unit kwPopObjectInherits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopObjectInherits.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::Object Info::pop_object_Inherits
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
 TkwPopObjectInherits = {scriptword} class(TkwObjectFromStackWord)
 protected
 // realized methods
   procedure DoObject(anObject: TObject;
     const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopObjectInherits
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopObjectInherits

procedure TkwPopObjectInherits.DoObject(anObject: TObject;
  const aCtx: TtfwContext);
//#UC START# *4F212BD5010E_4F2134BE011C_var*

 function IsInherits(anObject: TClass; const aClass: AnsiString): Boolean;
 begin//IsInherits
  if (anObject = nil) then
   Result := false
  else  
  if AnsiSameText(anObject.ClassName, aClass) then
   Result := true
  else
   Result := IsInherits(anObject.ClassParent, aClass);
 end;//IsInherits

var
 l_Class : AnsiString;
 l_ClassRef : TClass;
//#UC END# *4F212BD5010E_4F2134BE011C_var*
begin
//#UC START# *4F212BD5010E_4F2134BE011C_impl*
 if aCtx.rEngine.IsTopClass then
 begin
  l_ClassRef := aCtx.rEngine.PopClass;
  if (anObject = nil) then
   aCtx.rEngine.PushBool(false)
  else
   aCtx.rEngine.PushBool(anObject.ClassType.InheritsFrom(l_ClassRef));
 end//aCtx.rEngine.IsTopClass
 else
 begin
  l_Class := aCtx.rEngine.PopDelphiString;
  if (anObject = nil) then
   aCtx.rEngine.PushBool(false)
  else
   aCtx.rEngine.PushBool(IsInherits(anObject.ClassType, l_Class));
 end;//aCtx.rEngine.IsTopClass
//#UC END# *4F212BD5010E_4F2134BE011C_impl*
end;//TkwPopObjectInherits.DoObject

class function TkwPopObjectInherits.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:object:Inherits';
end;//TkwPopObjectInherits.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_object_Inherits
 TkwPopObjectInherits.RegisterInEngine;
{$IfEnd} //not NoScripts

end.