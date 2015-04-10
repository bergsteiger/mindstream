unit kwPopClassInherits;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// Библиотека "ScriptEngine"
// Модуль: "w:/common/components/rtl/Garant/ScriptEngine/kwPopClassInherits.pas"
// Родные Delphi интерфейсы (.pas)
// Generated from UML model, root element: <<ScriptKeyword::Class>> Shared Delphi Scripting::ScriptEngine::CommonObjectWords::pop_class_Inherits
//
//
// Все права принадлежат ООО НПП "Гарант-Сервис".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! Полностью генерируется с модели. Править руками - нельзя. !

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
 TkwPopClassInherits = {final} class(_tfwAutoregisteringWord_)
 protected
 // realized methods
   procedure DoDoIt(const aCtx: TtfwContext); override;
 public
 // overridden public methods
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwPopClassInherits
{$IfEnd} //not NoScripts

implementation

{$If not defined(NoScripts)}
uses
  SysUtils,
  tfwAutoregisteredDiction,
  tfwScriptEngine
  ;
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}

type _Instance_R_ = TkwPopClassInherits;

{$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}

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
 {$Include ..\ScriptEngine\tfwAutoregisteringWord.imp.pas}
{$IfEnd} //not NoScripts

end.