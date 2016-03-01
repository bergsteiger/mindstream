unit kwPopClassInherits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine$RTLandVCL"
// Модуль: "kwPopClassInherits.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: ScriptKeyword::Class Shared Delphi Low Level::ScriptEngine$RTLandVCL::Object Info::pop_class_Inherits
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Include ..\ScriptEngine\seDefine.inc}

interface

{$If not defined(NoScripts)}
uses
  tfwRegisterableWord,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
type
 TkwPopClassInherits = {final scriptword} class(TtfwRegisterableWord)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 protected
 // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopClassInherits
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

// start class TkwPopClassInherits

procedure TkwPopClassInherits.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E0FC5E0100_var*

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
 l_A : TClass;
 l_B : TClass;
 l_C : ANSIString;
//#UC END# *4DAEEDE10285_53E0FC5E0100_var*
begin
//#UC START# *4DAEEDE10285_53E0FC5E0100_impl*
 l_A := aCtx.rEngine.PopClass;
 if aCtx.rEngine.IsTopClass then
 begin
  l_B := aCtx.rEngine.PopClass;
  if (l_A = nil) OR (l_B = nil) then
   aCtx.rEngine.PushBool(false)
  else
   aCtx.rEngine.PushBool(l_A.InheritsFrom(l_B));
 end//aCtx.rEngine.IsTopClass
 else
 begin
  l_C := aCtx.rEngine.PopDelphiString;
  if (l_A = nil) then
   aCtx.rEngine.PushBool(false)
  else
   aCtx.rEngine.PushBool(IsInherits(l_A, l_C));
 end;//aCtx.rEngine.IsTopClass
//#UC END# *4DAEEDE10285_53E0FC5E0100_impl*
end;//TkwPopClassInherits.DoDoIt

class function TkwPopClassInherits.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := 'pop:class:Inherits';
end;//TkwPopClassInherits.GetWordNameForRegister

{$IfEnd} //not NoScripts

initialization
{$If not defined(NoScripts)}
// Регистрация pop_class_Inherits
 TkwPopClassInherits.RegisterInEngine;
{$IfEnd} //not NoScripts

end.